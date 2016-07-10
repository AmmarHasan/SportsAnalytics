var casper = require('casper').create({
    //     'includes/jquery2.2.4.js'      // This script will be injected in remote DOM on every request
    pageSettings: {
        loadImages: false,        // The WebPage instance used by Casper will
        loadPlugins: false         // use these settings
    },
    logLevel: "debug",              // Only "info" level messages will be logged
    verbose: true                  // log messages will be printed out to the console
});
var fs = require('fs');

var playerStatisticLinks = fs.read('data/playerStatisticLinks.json');
playerStatisticLinks = JSON.parse(playerStatisticLinks);
// playerStatisticLinks = playerStatisticLinks.slice(309, 380);
var matches = [];

function getHomeAway() {
    var teams = document.querySelectorAll('a.team-link');
    return [teams[0].innerHTML, teams[1].innerHTML]
}
function getTables() {
    var PlayersData = [];
    var tables = document.querySelectorAll('#player-table-statistics-body');
    for (var i = 0; i < tables.length; i++) {
        var rows = tables[i].querySelectorAll('tr');
        var eachPlayerData = [];
        for (var j = 0; j < rows.length; j++) {
            var name = rows[j].querySelector("td.pn a").innerText;
            var passAccuracy = rows[j].querySelector("td:nth-child(7)").innerHTML;
            var rating = rows[j].querySelector("td:nth-child(10)").innerHTML;
            eachPlayerData.push({ PlayerName: name, PassAccuracy: parseFloat(passAccuracy), Rating: parseFloat(rating) });
        }
        PlayersData.push(eachPlayerData);
    }
    return { homePlayersData: PlayersData[0], awayPlayersData: PlayersData[1] };
}

var iter = -1;

// casper.on('navigation.requested', function (requestData, networkRequest) {
//     // your filter url or ... then
//     if(requestData.indexOf('www.whoscored.com')<0){
//         this.echo("/n"+"******* Aborting ****** " + "\n" + requestData + "\n");
//         networkRequest.abort();
//         page.navigationLocked = true; 
//     }
// });

casper.start().then(function () {
    this.each(playerStatisticLinks, function () {
        iter++; // change the link being opened (has to be here specifically)
        this.thenOpen(playerStatisticLinks[iter], function () {

            var homeAway = this.evaluate(getHomeAway);

            if (homeAway === null || homeAway === undefined) {
                // playerStatisticLinksError.push(playerStatisticLinks[iter]);
            }
            else {
                var PlayersData = this.evaluate(getTables);
                var match = {
                    home: homeAway[0],
                    away: homeAway[1],
                    homePlayersData: PlayersData.homePlayersData,
                    awayPlayersData: PlayersData.awayPlayersData
                };
                // this.echo(JSON.stringify(match));
                this.echo(match.home + " - " + match.away);
                matches.push(match);
            }
        });
    });
});
casper.on('error', function(err) {
    this.echo("************ERROR***********\n " + err);
    fs.write('data/playersDataCompleteWithFloatRating2.json', JSON.stringify(matches), 'w');
});
casper.run(function () {
    console.log(matches);
    fs.write('data/playersDataCompleteWithFloatRating2.json', JSON.stringify(matches), 'w');
    casper.done();
});
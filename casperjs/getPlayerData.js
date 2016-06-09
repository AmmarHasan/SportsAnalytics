var casper = require('casper').create({
    // clientScripts: [
    //     'includes/jquery2.2.4.js'      // This script will be injected in remote DOM on every request
    // ],
    // pageSettings: {
    //     loadImages: false,        // The WebPage instance used by Casper will
    //     loadPlugins: false         // use these settings
    // },
    logLevel: "debug",              // Only "info" level messages will be logged
    verbose: true                  // log messages will be printed out to the console
});
var fs = require('fs');

var playerStatisticLinks = fs.read('playerStatisticLinks.json');
playerStatisticLinks = JSON.parse(playerStatisticLinks);
// playerStatisticLinks = playerStatisticLinks.slice(0, 3);
var playerStatisticLinksError = [];
var matches = [];
/*  [
        {
            home: "Blackburn",
            away: "Wolverhampton Wanderers",
            homePlayersData: [{name:"Paul Robinson",rating:6.91,passAccuracy:39.1},{name:"Míchel Salgado",rating:6.10,passAccuracy:76.1}],
            awayPlayersData: [{name:"Wayne Hennessey",rating:6.74,passAccuracy:55.8},{name:"Richard Stearman",rating:6.46,passAccuracy:66.7}],
        },
    ]  */

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
            eachPlayerData.push({ PlayerName: name, PassAccuracy: parseInt(passAccuracy), Rating: parseInt(rating) });
        }
        PlayersData.push(eachPlayerData);
    }
    return { homePlayersData: PlayersData[0], awayPlayersData: PlayersData[1] };
}

var iter = -1;

casper.start().then(function () {
    this.each(playerStatisticLinks, function () {
        iter++; // change the link being opened (has to be here specifically)
        this.thenOpen(playerStatisticLinks[iter], function () {

            var homeAway = this.evaluate(getHomeAway);

            if (homeAway === null || homeAway === undefined) {
                playerStatisticLinksError.push(playerStatisticLinks[i]);
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
// casper.start().each(playerStatisticLinks, function (self, link) {
//     self.thenOpen(link, function () {
//         var homeAway = this.evaluate(getHomeAway);

//         if (homeAway === null || homeAway === undefined) {
//             playerStatisticLinksError.push(link);
//         }
//         else {
//             var PlayersData = this.evaluate(getTables);
//             var match = {
//                 home: homeAway[0],
//                 away: homeAway[1],
//                 homePlayersData: PlayersData.homePlayersData,
//                 awayPlayersData: PlayersData.awayPlayersData
//             };

//             // this.echo(JSON.stringify(match));
//             this.echo(match.home + " - " + match.away);
//             matches.push(match);
//         }

//     });
// });

casper.run(function () {
    console.log(matches);
    fs.write('playersData.json', JSON.stringify(matches), 'w');
    fs.write('playerStatisticLinksError.json', JSON.stringify(playerStatisticLinksError), 'w');
    casper.done();
});
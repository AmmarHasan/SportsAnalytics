var fs = require('fs');

var playerStatisticLinksError = [];
var playerStatisticLinks;
var playersData;
var homeAway;
var homeAwayLinks;


function getIds(matches) {
    return Array.prototype.map.call(matches, function (s) {
        return s.id;
    });
}
function getHomeAway(matches) {
    return Array.prototype.map.call(matches, function (e) {
        var id = e.home + e.away;
        id = id.toString().replace(/ /g, '').toLowerCase();
        e.id = id;
        return e;
    });
}
function getHomeAwayFromLinks(matchesLinks) {
    return Array.prototype.map.call(matchesLinks, function (s) {
        return s.substr(89, s.length).replace(/-/g, '').toLowerCase();
    });
}

function getNonDuplicatedArray(arr) {
    var arrResult = {};
    for (i = 0, n = arr.length; i < n; i++) {
        var item = arr[i];
        arrResult[item.home + item.away] = item;
    }
    var i = 0;
    var nonDuplicatedArray = [];
    for (var item in arrResult) {
        nonDuplicatedArray[i++] = arrResult[item];
    }
    return nonDuplicatedArray;
}
fs.readFile('data/playerStatisticLinks.json', function (err2, data) {
    fs.readFile('data/playersData.json', function (err, data1) {
        // Read Files
        playerStatisticLinks = JSON.parse(data);
        playersData = JSON.parse(data1);

        //Remove Duplicate objects in PlayersData and add an id e.g 'manchesterunitedswansea'
        homeAway = getNonDuplicatedArray(playersData);
        homeAway = getHomeAway(homeAway);
        
        var homeAwayIds = getIds(homeAway);
        homeAwayLinks = getHomeAwayFromLinks(playerStatisticLinks);

        for (var i = 0; i < homeAwayLinks.length; i++) {
            if (homeAwayIds.indexOf(homeAwayLinks[i]) < 0) {
                playerStatisticLinksError.push(playerStatisticLinks[i]);
            }
        }
        for (var index = 0; index < playerStatisticLinksError.length; index++) {
            var element = playerStatisticLinksError[index];
            console.log(index + ": " + element);
        }
        console.log(playerStatisticLinksError);
        console.log("homeAwayLinks.length: " + homeAwayLinks.length);
        console.log("homeAway.length: " + homeAway.length);
        console.log('Differnce: ' + eval(homeAwayLinks.length - homeAway.length));

        // fs.writeFile('data/playerStatisticLinksErrorAll.json', JSON.stringify(playerStatisticLinksError), function (err) {
        //     if (err) return console.log(err);
        // });
        fs.writeFile('playersDataComplete.json', JSON.stringify(homeAway), function (err) {
            if (err) return console.log(err);
        });
    });
});

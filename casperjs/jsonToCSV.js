var _ = require('lodash');
var fs = require('fs');
var converter = require('json-2-csv');

var transfomedData = [];

var json2csvCallback = function (err, csv) {
    if (err) throw err;
    console.log(csv);
    fs.writeFile('../data/PlayerRatings.csv',csv);
};

function getCompressed(s) {
    return s.replace(/[^a-zA-Z]/g,"").toLowerCase();
}

fs.readFile('data/playersDataComplete.json', function (err, data) {
    var matches = JSON.parse(data);
    for (var index = 0; index < matches.length; index++) {
        
        for (var j = 0; j < _.size(matches[index].homePlayersData); j++) {
            var player = {
                MatchId: matches[index].id + getCompressed(matches[index].homePlayersData[j].PlayerName),
                Venue: "Home",
                PlayerName: matches[index].homePlayersData[j].PlayerName,
                Rating: matches[index].homePlayersData[j].Rating,
                PassAccuracy: matches[index].homePlayersData[j].PassAccuracy,
            }
            transfomedData.push(player);
        }
        
        for (j = 0; j <_.size(matches[index].awayPlayersData); j++) {
            var player = {
                MatchId: matches[index].id + getCompressed(matches[index].awayPlayersData[j].PlayerName),
                Venue: "Away",
                PlayerName: matches[index].awayPlayersData[j].PlayerName,
                Rating: matches[index].awayPlayersData[j].Rating,
                PassAccuracy: matches[index].awayPlayersData[j].PassAccuracy,
            }
            transfomedData.push(player);
        }
    }

    converter.json2csv(transfomedData, json2csvCallback);
});


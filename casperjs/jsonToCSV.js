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
    if(s.toString().match(/[0-9]/g, ''))
        s= s.slice(0,-5);
    return s.slice(0,-1);
}
fs.readFile('data/playersDataComplete.json', function (err, data) {

    var matches = JSON.parse(data);
    
    // for(var j=0;j<matches.length;j++)
    //     for(var i=0;i<_.size(matches[j].homePlayersData);i++)   
    //         console.log(matches[j].homePlayersData[i].PlayerName);
    for (var index = 0; index < matches.length; index++) {
        // var match = matches[index];
        // var homePlayersData=match.homePlayersData;
        // console.log(matches[index].homePlayersData);
        
        
        for (var j = 0; j < _.size(matches[index].homePlayersData); j++) {
            var player = {
                MatchId: matches[index].id,
                Venue: "Home",
                Player.Name: getCompressed(matches[index].homePlayersData[j].PlayerName),
                Rating: matches[index].homePlayersData[j].Rating,
                PassAccuracy: matches[index].homePlayersData[j].PassAccuracy,
            }
            transfomedData.push(player);
        }
        // var awayPlayers = match.awayPlayersData;
        for (j = 0; j <_.size(matches[index].awayPlayersData); j++) {
            var player = {
                match: matches[index].id,
                venue: "Away",
                PlayerNameCompressed: getCompressed(matches[index].awayPlayersData[j].PlayerName),
                Rating: matches[index].awayPlayersData[j].Rating,
                PassAccuracy: matches[index].awayPlayersData[j].PassAccuracy,
            }
            transfomedData.push(player);
        }
    }
    console.log(transfomedData.length);

    converter.json2csv(transfomedData, json2csvCallback);

});


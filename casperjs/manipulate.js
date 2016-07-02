var fs = require('fs');
var something;
var something2;
fs.readFile('data/playersData.json', function (err, data) {
    something = JSON.parse(data);
    console.log(something.length);
    // for (var i = 0; i < something.length; i++) {
    //     console.log(something[i].home + "-" + something[i].away);
    // }
});
fs.readFile('data/playerStatisticLinks.json',function (err,data) {
    something2=JSON.parse(data);
    console.log(something2.length);
});
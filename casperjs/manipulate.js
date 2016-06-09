var fs=require('fs');
var something;
var something2;
fs.readFile('playersData.json',function (err,data) {
    something=JSON.parse(data);
    console.log(something);
});
fs.readFile('playerStatisticLinks1.json',function (err,data) {
    something2=JSON.parse(data);
    console.log(something2.length);
});
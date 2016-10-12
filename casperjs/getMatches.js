var jsonfile = require('jsonfile');
var fs = require('fs');
var casper = require('casper').create();

var matches;

function getMatches() {
  var links = document.querySelectorAll('.result-1');
  return Array.prototype.map.call(links, function (e) {
    return "https://www.whoscored.com" + e.getAttribute('href')
  });
}

casper.start("https://www.whoscored.com/Regions/252/Tournaments/2/Seasons/2935/Stages/5476/Fixtures/England-Premier-League-2011-2012");

casper.then(function () {
  matches = this.evaluate(getMatches); //May
});

for (var l = 0; l < 9; l++) {
  casper.wait(3000).then(function () {
    this.click('.previous');
    matches.unshift.apply(matches, this.evaluate(getMatches));
  })
}

casper.run(function () {
  fs.write('data/matchesList.json', JSON.stringify(matches),'w');
  console.log(matches);
  casper.done();
});

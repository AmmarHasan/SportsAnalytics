var casper = require('casper').create();
var fs = require('fs');
var playerStatisticLinks = [];
var matches = [];
var i=-1;
var matches = fs.read('matchesList.json');
matches = JSON.parse(matches);
// matches=matches.slice(364,matches.length-1);

function getLinks() {
    var links = document.querySelectorAll('#sub-sub-navigation>ul>li:nth-child(2)>a');
    return Array.prototype.map.call(links, function (e) {
        return e.getAttribute('href')
    });
}

casper.start("http://www.google.com");

casper.then(function() {
    this.each(matches, function() { 
        i++; // change the link being opened (has to be here specifically)
        this.thenOpen(matches[i], function() {
            this.echo(this.getTitle()); // display the title of page
             var asd="http://whoscored.com"+this.evaluate(getLinks);
            playerStatisticLinks.push(asd);
        });
    });
});

// casper.then(function () {
//     playerStatisticLinks = this.evaluate(getLinks);
// });


// for (var l = 1; l < 3; l++) {
//     casper.thenOpen(matches[l],function () {
//         playerStatisticLinks.unshift.apply(playerStatisticLinks, this.evaluate(getLinks));
//     });
// }


casper.run(function () {
    for(var i in playerStatisticLinks) {
        console.log(playerStatisticLinks[i]);
    }
    fs.write('playerStatisticLinks.json', JSON.stringify(playerStatisticLinks),'w');
    casper.done();
});

// //Player Statistics$("#sites>ul>li")[4]
// var casper = require('casper').create();
// var fs = require('fs');
// var playerStatisticUrls = [];
// var matches = [];

// var matches = fs.read('matchesList.json');
// matches = JSON.parse(matches);


// // casper.start().eachThen(matches.slice(0, 3), function (response) {
// //   this.thenOpen(response.data, function (response) {
// //     // console.log('Opened', Object.keys(response));
// //     // casper.page.injectJs('jquery.js');
// //     this.evaluate(function () {
// //       this.click('#sub-sub-navigation>ul>li:nth-child(2)>a');
// //       // playerStatisticUrls.push(this.getCurrentUrl());
// //     });
// //   });
// // });

// console.log(matches[0]);
// casper.start(matches[0]);
// casper.then(function () {
//   this.evaluate(function () {
//     console.log(document.querySelector('#sub-sub-navigation'));
//     playerStatisticUrls.push(document.querySelectorAll('#sub-sub-navigation>ul>li:nth-child(2)>a')['href']);
//   });
// });


// // for (var l = 1; l < 2; l++) {
// //     casper.open(matches[l]);
// //     casper.evaluate( function () {
// //       playerStatisticUrls.push(document.querySelector('#sub-sub-navigation>ul>li:nth-child(2)>a')['href']);
// //     });
// // }

// casper.run(function () {
//   console.log(playerStatisticUrls);
//   casper.done();
// });



// // casper.then(function(){
// //     casper.page.injectJs('jquery.js');
// //     this.evaluate(function (){
// //           $("#sites>ul>li")[4].click();
// //     });
// //     this.capture('screenshot.png');
// // });
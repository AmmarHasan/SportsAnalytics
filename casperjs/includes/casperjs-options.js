/**
 * Add a listener for the phantomjs resource request.
 *
 * This allows us to abort requests for external resources that we don't need
 * like Google adwords tracking.
 */
casper.options.onResourceRequested = function (casper, requestData, request) {
    // If any of these strings are found in the requested resource's URL, skip
    // this request. These are not required for running tests.
    if(requestData.url.indexOf('www.whoscored.com/Matches/')<0){
        this.echo("********************************Aborting: "+'\n'+
        requestData.url+'\n');
        networkRequest.abort();
    }
    // var skip = [
    //     'googleads.g.doubleclick.net',
    //     'cm.g.doubleclick.net',
    //     'www.googleadservices.com',
    //     'about:blank',
    //     'cm.g.doubleclick.net/push',
    //     'idsync.rlcdn.com',
    //     'sync.mathtag.com/sync',
    //     'image2.pubmatic.com',
    //     'cm.send.microad',
    //     'ib.adnxs.com',
    //     'https://fqtag.com/',
    //     'tpc.googlesyndication.com/',
    //     'ib.adnxs.com',
    //     'ads.pubmatic.com',
    //     'googleads.g.doubleclick.net/',
    //     'staticxx.facebook.com/connect/xd_arbiter.php'
    // ];

    // skip.forEach(function (needle) {
    //     if (requestData.url.indexOf(needle) > 0) {
    //         request.abort();
    //     }
    // })
};
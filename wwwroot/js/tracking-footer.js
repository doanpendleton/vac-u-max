//Async Event Code - START
jQuery(document).ready(function(){
	jQuery("a[href^='mailto:']").click(function(){
        if (ga) {
            var mAddress = jQuery(this).attr('href').replace('mailto:', '');
			ga('send', 'event', 'MailTo', 'click', mAddress);
        }
    });
    jQuery("a[href*='.doc'],a[href*='.docx'],a[href*='.dwg'],a[href*='.cad'],a[href*='.pdf'],a[href*='.xls'],a[href*='.xlsx'],a[href*='.ppt'],a[href*='.pptx'],a[href*='.zip'],a[href*='.txt'],a[href*='.vsd'],a[href*='.vxd'],a[href*='.js'],a[href*='.css'],a[href*='.rar'],a[href*='.exe'],a[href*='.wma'],a[href*='.mov'],a[href*='.avi'],a[href*='.wmv'],a[href*='.mp3']").click(function(e){
        if (ga) {            
			ga('send', 'event', 'Download', 'click', jQuery(this).attr('href'));
        }
    });    
	jQuery("a[href*='http']:not([href*='" + window.location.hostname + "'])").click(function(e){
		if (ga) {
			//The following block added 2-21-11
			var activeURL = window.location.href;
			if (jQuery(this).attr('rel') == 'print') {
				ga('send', 'event', 'Print', 'click', activeURL);
				return;
			}
			
			var socialSites = new Array(  //Array of Social Media Sites (Social Event)
				"linkedin.com",
				"www.linkedin.com",
				"twitter.com",
				"www.twitter.com",
				"facebook.com",
				"www.facebook.com",
				"www.google.com/bookmarks",
				"google.com/bookmarks",
				"youtube.com",
				"www.youtube.com"
			);
		
			var excludedSites = new Array(
				"sampleimanigarydomain.com"  //Array of Cross Domain Sites (Excluded from Outbound Event)
			);

			var linkHost = this.hostname;
           
			if(jQuery.inArray(linkHost, excludedSites) == -1){
				if(jQuery.inArray(linkHost, socialSites) >= 0){
					ga('send', 'event', 'Social', 'click', jQuery(this).attr('href'));
				} else {
					ga('send', 'event', 'Outbound', 'click', jQuery(this).attr('href'));
				}
	           
			} else {
				//alert("not tracked");
			}
		}
    });
});
//Async Event Code - END

//TopSpot InsiteMetrics Code - START
var imJsHost = (("https:" == document.location.protocol) ? "https://www." : "http://www.");
var imJsFile = (("https:" == document.location.protocol) ? "ujutilv2sll.js" : "ujutilv2.js");
document.write(unescape("%3Cscript language='JavaScript' src='" + imJsHost + "topfloortech.com/insitemetrics/uRMJ/" + imJsFile + "' type='text/javascript'%3E%3C/script%3E"));
//TopSpot InsiteMetrics Code - END

//TopSpot Call Tracking Code - START
vs_account_id = "CtjSZlO0Q2kpswA6";
var ctJsHost = (("https:" == document.location.protocol) ? "https://www.voicestar.com/" : "http://calls.topspotims.com/");
document.write(unescape("%3Cscript language='JavaScript' src='" + ctJsHost + "euinc/number-changer.js' type='text/javascript'%3E%3C/script%3E"));
//TopSpot Call Tracking Code - END

//Site Search Tracking - START
jQuery(document).ready(function(){
                jQuery('#go').on('click', function(event) { 
                                gcSearch = jQuery('#search').val(); 
                                ga('send', 'pageview', window.location.pathname+'?q='+gcSearch);      
                })
});
//Site Search Tracking - END
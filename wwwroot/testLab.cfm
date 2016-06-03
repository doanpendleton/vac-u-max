<cfprocessingdirective pageEncoding="utf-8">
<!DOCTYPE html>
<html>
<head>
	<title>VAC-U-MAX | Test Lab</title>
	<meta name="description" content="">
	<cfinclude template="inc/head.cfm">
	<link rel="stylesheet" href="css/jquery.fancybox.css?v=2.1.4" type="text/css" media="screen">
	<link rel="stylesheet" href="css/jquery.fancybox-buttons.css?v=1.0.5" type="text/css" media="screen">
</head>

<body>
	<cfinclude template="inc/top.cfm">

    <div id="homeCon" class="container">
		<div class="conIndent">
			<div class="row-fluid">
		    	<div id="inBan1" class="inBanner">
		    		<h1>Test Lab</h1>
		    		<div class="clearfix"></div>
		    	</div><!--- inBanner --->
			</div><!--- row-fluid --->

	    	<div class="row-fluid">
	    		<div id="prodCon" class="span9 well">
	    			<a href="contact.cfm?test" class="quoteBtn pull-right">Request a Material Test <span>&raquo;</span></a>
					<div class="clearfix"></div>

	    			<div class="colRight pull-right">
		    			<a class="fancybox-button disImg" rel="fancybox-button" href="img/testLab1.jpg" title="Test Lab 1">
	    					<div id="zoom" class="btn"><i class="icon-zoom-in"></i></div>
							<img src="img/testLab1.jpg" alt="Test Lab 1">
						</a>
						<a class="fancybox-button disImgSm" rel="fancybox-button" href="img/testLab2.jpg" title="Test Lab 2">
	    					<img src="img/testLab2.jpg" alt="Test Lab 2">
						</a>
						<a class="fancybox-button disImgSm" rel="fancybox-button" href="img/testLab3.jpg" title="Test Lab 3">
	    					<img src="img/testLab3.jpg" alt="Test Lab 3">
						</a>
						<div class="clearfix"></div>
	    			</div>
	    		</div>

	    		<cfinclude template="inc/sideNews.cfm">
	    	</div><!--- row-fluid--->
		</div><!--- conIndent --->
    </div><!--- container --->

    <cfinclude template="inc/footer.cfm">

	<cfinclude template="inc/scripts.cfm">
	<script type="text/javascript" src="js/jquery.mousewheel-3.0.6.pack.js"></script>
	<script type="text/javascript" src="js/jquery.fancybox.pack.js?v=2.1.4"></script>
	<script type="text/javascript" src="js/jquery.fancybox-buttons.js?v=1.0.5"></script>
	<script type="text/javascript" src="js/jquery.fancybox-media.js?v=1.0.5"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$(".fancybox-button").fancybox({
				prevEffect		: 'none',
				nextEffect		: 'none',
				closeBtn		: false,
				helpers		: {
					title	: { type : 'inside' },
					buttons	: {}
				}
			});
		});
	</script>
</body>
</html>
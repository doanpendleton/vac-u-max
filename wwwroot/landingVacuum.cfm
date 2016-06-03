<cfprocessingdirective pageEncoding="utf-8">
<cfinvoke 
	component="#application.components#.queryController" 
	method="vacLanding" 
	returnvariable="land">
</cfinvoke>
<cfinvoke 
	component="#application.components#.queryController" 
	method="landCases" 
	returnvariable="case">
	<cfinvokeargument name="section" value="Vacuum Cleaning">
</cfinvoke>
<!DOCTYPE html>
<html>
<head>
	<title>VAC-U-MAX | Industrial Vacuum Cleaners</title>
	<meta name="description" content="">
	<cfinclude template="inc/head.cfm">
	<link rel="stylesheet" href="css/jquery.fancybox.css?v=2.1.4" type="text/css" media="screen" />
	<link rel="stylesheet" href="css/jquery.fancybox-buttons.css?v=1.0.5" type="text/css" media="screen" />
</head>

<body>
	<cfinclude template="inc/top.cfm">
    
    <div id="homeCon" class="container">
		<div class="conIndent">
			<div class="row-fluid">
		    	<div id="inBan2" class="inBanner">
		    		<h1>Industrial Vacuum Cleaners</h1>
		    		<div class="clearfix"></div>
		    	</div><!--- inBanner --->
			</div><!--- row-fluid --->
	    	
	    	<div class="row-fluid">
	    		<cfinclude template="inc/sideVac.cfm">
	    		
	    		<div id="landCon" class="span9">
	    			<p>VAC-U-MAX is a premier manufacturer of industrial vacuum cleaning systems for production lines and other dust-intensive areas. With a VAC-U-MAX heavy-duty industrial vacuum cleaning system on site, both your capital equipment and your employees will be safer and cleaner. So put our field-proven industrial vacuum cleaning systems to work for you, and watch dust and other particulate contamination simply disappear.</p>
	    			
	    			<cfoutput query="land">
	    			<cfif land.c_url neq "">
		    			<a class="landBox gradient" href="vacView.cfm?cat=#land.c_url#">
		    				#land.c_title#
		    				<img src="img/#land.vl_img#" alt="#land.c_title#">
		    			</a>
	    			<cfelse>
	    				<a class="landBox gradient" href="vacView.cfm?subCat=#land.s_url#">
		    				#land.s_title#
		    				<img src="img/#land.vl_img#" alt="#land.s_title#">
		    			</a>
	    			</cfif>
	    			</cfoutput>
	    			
	    			<div id="landInfo" class="pull-left">
	    				<p>For more information on any of our products<br>
							and services, call toll free:<br>
							<strong>1-800-VAC-U-MAX</strong> (800-822-8629)</p>
						
						<a href="quoteVacuum.cfm" class="quoteBtn">Request For Quote <span>&raquo;</span></a>
	    			</div>
	    			
	    			<div class="clearfix"></div>
	    			<h3>Case Studies</h3>
    				<div class="bigLandBox">
    					<ul>
    						<cfoutput query="case">
								<li><a href="case_histories.cfm?case=#case.c_id#"><span>&raquo;</span> #case.c_title#</a></li>
							</cfoutput>
    					</ul>
    				</div>
	    		</div>
	    	</div><!--- row-fluid--->
		</div><!--- conIndent --->
    </div><!--- container --->
    
    <cfinclude template="inc/footer.cfm">
	
	<cfinclude template="inc/scripts.cfm">
</body>
</html>
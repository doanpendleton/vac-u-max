<cfprocessingdirective pageEncoding="utf-8">
<!DOCTYPE html>
<html>
<head>
	<title>VAC-U-MAX | Sales Reps</title>
	<meta name="description" content="">
	<cfinclude template="inc/head.cfm">
	<link href="css/chosen.min.css" rel="stylesheet" type="text/css">
</head>

<body>
	<cfinclude template="inc/top.cfm">

    <div id="homeCon" class="container">
		<div class="conIndent">
			<div class="row-fluid">
		    	<div id="inBan1" class="inBanner">
		    		<h1>Sales Reps</h1>
		    		<div class="clearfix"></div>
		    	</div><!--- inBanner --->
			</div><!--- row-fluid --->

	    	<div class="row-fluid">
	    		<div id="prodCon" class="span9 well">
		    		<cfoutput>
			    		<h3>Enter your zip code or select your country to find your sales rep.</h3>

						<cfparam name="form.zip" default="">
						<cfparam name="form.cou" default="">

						<div class="span4">
			    			<form action="#cgi.script_name#" method="post" id="form" class="left">
								<p>
									<label class="checkLabel">Zip Code</label>
									<input type="text" name="zip" id="zip" class="form2">
									<input type="hidden" name="cou" value="">
									<input type="submit" name="send" id="send" class="repSearch" value="Search">
								</p>
							</form>
						</div>

						<div class="span1"><p>or</p></div>

						<div class="span5">
			    			<form action="#cgi.script_name#" method="post" id="form" class="left">
				    			<p>
									<cfinvoke component="#application.components#.queryController"
										method="countryList"
										returnVariable="cl">
									</cfinvoke>
									<label class="checkLabel">Country</label>
									<select name="cou" id="cou" class="form chosen" onchange="this.form.submit()">
										<option value="">-- Select Country --</option>
										<cfloop query="cl">
											<cfif cl.code neq "US"><option value="#cl.code#">#cl.country#</option></cfif>
										</cfloop>
									</select>
									<input type="hidden" name="zip" value="">
								</p>
							</form>
						</div>

						<div class="clearfix"></div>

						<cfif form.zip neq "" || form.cou neq "">
							<cfif form.zip neq "">
								<cfinvoke component="#application.components#.formProcessing"
									method="getReps"
									returnVariable="r">
									<cfinvokeargument name="zip" value="#form.zip#">
								</cfinvoke>

							<cfelse>

								<cfinvoke component="#application.components#.formProcessing"
									method="getRepsInt"
									returnVariable="r">
									<cfinvokeargument name="cou" value="#form.cou#">
								</cfinvoke>
							</cfif>

							<cfif r.recordcount gt 0>
								<cfloop query="r">
									<div class="repBox span5 well well-small">
										<cfif r.section eq "pnue"><h4>Pneumatic Conveying Systems</h4><cfelse><h4>Industrial Vacuum Cleaners</h4></cfif>
										<span class="symLabel icon-briefcase pull-left"></span><strong>#r.company#</strong><br>
										<cfif r.name neq ""><span class="symLabel icon-user pull-left"></span>#r.name#<br></cfif>
										<a href="mailto:#r.email#"><span class="symLabel icon-envelope pull-left"></span>#r.email#</a>
									</div>

									<cfif form.cou neq "">
										<!--- exception for Canada where this rep only covers Ontario --->
										<cfif r.couID eq 7>
											<div class="repBox span5 well well-small">
												<span class="symLabel icon-briefcase pull-left"></span>Canada except Ontario<br><strong>VAC-U-MAX</strong><br>
												<a href="mailto:rsales@vac-u-max.net"><span class="symLabel icon-envelope pull-left"></span>sales@vac-u-max.net</a>
											</div>
										</cfif>
									</cfif>
								</cfloop>

							<cfelse>

								<div class="repBox span5 well well-small">
									<span class="symLabel icon-briefcase pull-left"></span><strong>VAC-U-MAX</strong><br>
									<a href="mailto:rsales@vac-u-max.net"><span class="symLabel icon-envelope pull-left"></span>sales@vac-u-max.net</a>
								</div>

							</cfif>
						</cfif>
					</cfoutput>
	    		</div>

	    		<cfinclude template="inc/sideNews.cfm">
	    	</div><!--- row-fluid--->
		</div><!--- conIndent --->
    </div><!--- container --->

    <cfinclude template="inc/footer.cfm">

	<cfinclude template="inc/scripts.cfm">
	<script src="js/chosen.jquery.min.js"></script>
	<script>
		$(document).ready(function() {
			$('.chosen').chosen();
		});
	</script>
</body>
</html>
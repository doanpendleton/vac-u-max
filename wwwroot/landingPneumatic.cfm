<cfprocessingdirective pageEncoding="utf-8">
<cfparam name="form.pass" default="false">
<cfscript>
	creds = {'siteKey'=application.reCaptchaSite, 'secret'=application.reCaptchaSecret};

	// ReCAPTCHA supports 40+ languages listed at: https://developers.google.com/recaptcha/docs/language
	lang = 'en';

	// The response from ReCAPTCHA
	if ( StructKeyExists(form, 'g-recaptcha-response') && not form.pass ) {
	  reCaptcha = new cfc.reCaptcha(creds.secret);
	  resp = reCaptcha.verifyResponse(response=form['g-recaptcha-response'], remoteip=cgi.remote_addr);
	}
</cfscript>
<!DOCTYPE html>
<html>
<head>
	<title>VAC-U-MAX | Pneumatic Conveying Systems</title>
	<meta name="description" content="A premier manufacturer of custom pneumatic conveying systems and support equipment for conveying, vacuum conveying, batching, and weighing materials">
	<cfinclude template="inc/head.cfm">
	<link rel="stylesheet" href="css/jquery.fancybox.css?v=2.1.4" type="text/css" media="screen" />
	<link rel="stylesheet" href="css/jquery.fancybox-buttons.css?v=1.0.5" type="text/css" media="screen" />
</head>

<body>
	<cfinclude template="inc/top.cfm">

    <div id="homeCon" class="container">
		<div class="conIndent">
	    	<div class="row-fluid">
	    		<cfinclude template="inc/sideNav.cfm">

	    		<div id="landCon" class="span9">
		    		<h1>Pneumatic Conveying Systems</h1>

					<div class="row-fluid">
						<div class="span5 ">
							<h1 class="specialText"><span class="s1">THE</span> <span class="s3 red">SMARTEST</span> <span class="s2">DISTANCE BETWEEN</span> <span class="s3">TWO POINTS</span></h1>
			    			<p>VAC-U-MAX is a premier manufacturer of custom pneumatic conveying systems and support equipment for conveying, vacuum conveying, batching, and weighing materials. With a <nobr>VAC-U-MAX</nobr> pneumatic conveying system on site, your company's product can move gently and quickly from point to point, with nothing in the way to impede the efficiency of its movement.</p>
						</div>
						<div class="span7">
							<img src="img/pneuLandGraphic.jpg" alt="Pneumatic Conveying Systems Diagram" width="100%">
						</div>
					</div>

					<div class="row-fluid">
		    			<div class="span3">
							<a class="landBox2 span12 well-small gradient" href="overview.cfm?cat=products-by-application">
			    				Pneumatic Conveying Systems<br>
			    				<img src="img/pneuSystems.png" alt="Pneumatic Conveying Systems and Air-Driven Conveying Systems">
			    			</a>
			    			<a class="landBox2 span12 well-small gradient" href="case_histories.cfm">
			    				Application Stories<br>
			    				<img src="img/pneuStories.png" alt="Application Stories">
			    			</a>
			    			<a class="landBox2 span12 well-small gradient" href="overview.cfm?cat=components-and-accessories">
			    				Components, Accessories and Related Equipment<br>
			    				<img src="img/pneuComponents.png" alt="Components, Accessories and Related Equipment">
			    			</a>
		    			</div>

		    			<div class="span9 bigLandBox2 well">
			    			<h3>Quick Quote</h3>

							<cfset showForm = true>
							<cfparam name="resp.success" default="false">
							<cfparam name="form.fn" default="">
							<cfparam name="form.ln" default="">
							<cfparam name="form.co" default="">
							<cfparam name="form.email" default="">
							<cfparam name="form.mat" default="">
							<cfparam name="form.bulk" default="">
							<cfparam name="form.dist" default="">
							<cfparam name="form.rate" default="">
							<cfparam name="form.90" default="">
							<cfparam name="form.elec" default="">
							<cfparam name="form.zip" default="">
							<cfparam name="form.cou" default="US">

							<cfif StructKeyExists(form, 'g-recaptcha-response')>
								<cfset errors = "">

								<cfif not len(trim(form.fn))>
									<cfset errors = errors & "Please enter your first name.<br>">
								</cfif>
								<cfif not len(trim(form.ln))>
									<cfset errors = errors & "Please enter your last name.<br>">
								</cfif>
								<cfif not len(trim(form.email))>
									<cfset errors = errors & "Please enter a vaild email address.<br>">
								</cfif>
								<cfif not len(trim(form.zip))>
									<cfset errors = errors & "Please enter your zip code.<br>">
								</cfif>
								<cfif isDefined("resp.errorCodes")>
									<cfif not resp.success && resp.errorCodes[1] eq "missing-input-response">
								        <cfset errors = errors & "Please complete the reCAPTCHA.<br>">
								    </cfif>
									<cfif not resp.success && resp.errorCodes[1] neq "missing-input-response">
								        <cfset errors = errors & "Sorry, your submission was blocked because it's most likely spam.<br>">
								    </cfif>
								</cfif>

								<cfif errors is "">
									<!--- do something here --->
									<cfset showForm = false>
								</cfif>
							</cfif>

							<cfif showForm>
								<cfoutput>

									<cfif isDefined("errors")>
										<div id="errors">
											<p><b>Correct these errors:<br></b>#errors#</p>
										</div>
									</cfif>

									<form action="#cgi.script_name#" method="post" id="form">
										<div class="row-fluid">
											<div class="span5">
												<p>
													<span class="ast">*</span>First Name
													<input type="text" name="fn" id="fn" class="form3">
												</p>
											</div>
											<div class="offset1 span5">
												<p>
													<span class="ast">*</span>Last Name
													<input type="text" name="ln" id="ln" class="form3">
												</p>
											</div>
										</div>
										<div class="row-fluid">
											<div class="span5">
												<p>
													Company
													<input type="text" name="co" id="co" class="form3">
												</p>
											</div>
											<div class="offset1 span5">
												<p>
													<span class="ast">*</span>Email
													<input type="text" name="email" id="email" class="form3">
												</p>
											</div>
										</div>
										<div class="row-fluid">
											<div class="span5">
												<p>
													<span class="ast">*</span>Zip/Postal Code
													<input type="text" name="zip" id="zip" class="form3">
												</p>
											</div>
											<div class="offset1 span5">
												<p>
													Material to be Conveyed
													<input type="text" name="mat" id="mat" class="form3">
												</p>
											</div>
										</div>
										<div class="row-fluid">
											<div class="span5">
												<p>
													Bulk Density
													<input type="text" name="bulk" id="bulk" class="form3">
												</p>
											</div>
											<div class="offset1 span5">
												<p>
													Convey Distance
													<input type="text" name="dist" id="dist" class="form3">
												</p>
											</div>
										</div>
										<div class="row-fluid">
											<div class="span5">
												<p>
													Convey Rate
													<input type="text" name="rate" id="rate" class="form3">
												</p>
											</div>
											<div class="offset1 span5">
												<p>
													No. of 90 Degree Sweeps
													<input type="text" name="90" id="90" class="form3">
												</p>
											</div>
										</div>
										<div class="row-fluid">
											<div class="span5">
												<p>
													Electrical Classification
													<input type="text" name="elec" id="elec" class="form3">
												</p>
											</div>
										</div>
										<p>
											<div class="g-recaptcha" data-sitekey="#creds.siteKey#"></div>
										</p>
										<p>
											<a href="quotePneumatic.cfm" class="btnLink">Get a Full Quote</a>
											<input type="hidden" name="pass" value="false">
											<input name="send" type="submit" id="send" value="Submit">
										</p>
									</form>
								</cfoutput>

							<cfelse>

								<cfoutput>
									<h3>Thanks for the message.</h3>
									<p>We've received your message and will get back to you as soon as we can.</p>

									<cfset date = DateFormat(Now(), 'yyyy-mm-dd')>
									<cfset time = TimeFormat(Now(), 'HH:mm:ss')>

									<cfsavecontent variable="message">
										#date#<br>
										<strong>Name</strong>: #form.fn# #form.ln#<br>
										<strong>Company</strong>: #form.co#<br>
										<strong>Email</strong>: #form.email#<br>
										<strong>Zip Code</strong>: #form.zip#<br>
										<strong>Material to be Conveyed</strong>: #form.mat#<br>
										<strong>Bulk Density</strong>: #form.bulk#<br>
										<strong>Convey Distance</strong>: #form.dist#<br>
										<strong>Convey Rate</strong>: #form.rate#<br>
										<strong>No. of 90 Degree Sweeps</strong>: #form.90#<br>
										<strong>Electrical Classification</strong>: #form.elec#<br>
									</cfsavecontent>

									<cfinvoke component="#application.components#.formProcessing" method="process">
										<cfinvokeargument name="subject" value="VAC-U-MAX Quick Quote Form">
										<cfinvokeargument name="formName" value="Quick Quote">
										<cfinvokeargument name="to" value="sales@vac-u-max.net ">
										<cfinvokeargument name="cc" value="Doan Pendleton <doanpendleton@vac-u-max.net>, David Kennedy <davidkennedy@vac-u-max.net>">
										<cfinvokeargument name="form" value="#form#">
										<cfinvokeargument name="message" value="#message#">
										<cfinvokeargument name="date" value="#date#">
										<cfinvokeargument name="time" value="#time#">
										<cfinvokeargument name="section" value="pnue">
									</cfinvoke>

									<cfhttp url="https://www.salesforce.com/servlet/servlet.WebToLead?encoding=UTF-8" method="post" result="objHttp">
										<cfhttpparam type="formField" name="company" value="#form.co#">
										<cfhttpparam type="formField" name="first_name" value="#form.fn#">
										<cfhttpparam type="formField" name="last_name" value="#form.ln#">
										<cfhttpparam type="formField" name="email" value="#form.email#">
										<cfhttpparam type="formField" name="zip" value="#form.zip#">
										<cfhttpparam type="formField" name="oid" value="00Do0000000IYWJ">
										<cfhttpparam type="formField" name="retURL" value="http://www.vac-u-max.com/">
										<cfhttpparam type="formField" name="lead_source" value="Web">
										<cfhttpparam type="formField" name="Division__c" value="Conveying-01">
										<cfhttpparam type="formField" name="rating" value="Unknown">
										<cfhttpparam type="formField" name="Campaign_ID" value="701o00000001BzT">
										<cfhttpparam type="formField" name="member_status" value="Submitted">
									</cfhttp>
								</cfoutput>
							</cfif>
			    		</div>
	    			</div>
	    		</div>
	    	</div><!--- row-fluid--->
		</div><!--- conIndent --->
    </div><!--- container --->

    <cfinclude template="inc/footer.cfm">

	<script type="text/javascript" src="https://www.google.com/recaptcha/api.js?hl=#lang#"></script>
	<cfinclude template="inc/scripts.cfm">
	<cfoutput>
		<script src="#application.js#jquery.validate.min.js"></script>
		<script src="#application.js#chosen.jquery.min.js"></script>
	</cfoutput>
	<script>
		$(document).ready(function() {
			$("#form").validate({
				errorPlacement: function(error, element) {
					 error.appendTo(element.parent());
				},
				rules: {
					fn: "required",
					ln: "required",
					email: {
						required: true,
						email: true
					},
					zip: "required"
				},
				messages: {
					fn: "Please enter your first name.",
					ln: "Please enter your last name.",
					email: "Please enter a valid email address.",
					zip: "Please enter your zip code."
				},
				submitHandler: function(form) {
					$.ajax({
		                type: 'POST',
		                data: $('form').serialize(),
		                url: 'inc/capCheck.cfm',
		                success: function (msg) {
		                    if (msg !== 'true') {
		                        $('.g-recaptcha').after(msg);
		                    } else {
			                    $('[name="pass"]').val('true');
			                    form.submit();
		                    }
		                }
		            });
		            return false;
				}
			});
		});
	</script>
</body>
</html>
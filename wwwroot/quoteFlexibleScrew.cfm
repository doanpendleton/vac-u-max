<cfprocessingdirective pageEncoding="utf-8">
<cfinvoke
	component="#application.components#.queryController"
	method="rfq"
	returnVariable="rfq">
	<cfinvokeargument name="section" value="pneumatic">
</cfinvoke>
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
	<title>VAC-U-MAX | Flexible Screw Conveyors RFQ</title>
	<meta name="description" content="">
	<cfinclude template="inc/head.cfm">
	<link href="css/chosen.min.css" rel="stylesheet" type="text/css">
</head>

<body>
	<cfinclude template="inc/top.cfm">

    <div id="homeCon" class="container">
		<div class="conIndent">
			<div class="row-fluid">
		    	<div id="inBan4" class="inBanner">
		    		<h1>Flexible Screw Conveyors RFQ</h1>
		    		<div class="clearfix"></div>
		    	</div><!--- inBanner --->
			</div><!--- row-fluid --->

	    	<div class="row-fluid">
	    		<cfinclude template="inc/sideNav.cfm">

	    		<div id="prodCon" class="span9 well">
	    			<cfset showForm = true>
	    			<cfparam name="resp.success" default="false">
	    			<cfparam name="url.prod" default="">
	    			<cfparam name="form.prod" default="">
					<cfparam name="form.co" default="">
					<cfparam name="form.fn" default="">
					<cfparam name="form.ln" default="">
					<cfparam name="form.email" default="">
					<cfparam name="form.ph" default="">
					<cfparam name="form.fax" default="">
					<cfparam name="form.ad1" default="">
					<cfparam name="form.ad2" default="">
					<cfparam name="form.ci" default="">
					<cfparam name="form.st" default="">
					<cfparam name="form.zip" default="">
					<cfparam name="form.cou" default="">
					<cfparam name="form.0_rep" default="">
					<cfparam name="form.0_mag_a" default="">
					<cfparam name="form.0_trade_a" default="">
					<cfparam name="form.0_int_a" default="">
					<cfparam name="form.0_oth_a" default="">
					<cfparam name="form.1_mat" default="">
					<cfparam name="form.1_density" default="">
					<cfparam name="form.1_units_a" default="">
					<cfparam name="form.1_rate" default="">
					<cfparam name="form.1_man" default="">
					<cfparam name="form.1_agg" default="">
					<cfparam name="form.1_gran" default="">
					<cfparam name="form.1_pow" default="">
					<cfparam name="form.1_fib" default="">
					<cfparam name="form.1_free" default="">
					<cfparam name="form.1_bridge" default="">
					<cfparam name="form.1_fri" default="">
					<cfparam name="form.1_abr" default="">
					<cfparam name="form.1_part" default="">
					<cfparam name="form.1_moist" default="">
					<cfparam name="form.1_temp" default="">
					<cfparam name="form.1_units_b" default="">
					<cfparam name="form.2_hor" default="">
					<cfparam name="form.2_ver" default="">
					<cfparam name="form.2_dia" default="">
					<cfparam name="form.2_matIn" default="">
					<cfparam name="form.2_matOut" default="">
					<cfparam name="form.2_inlets" default="">
					<cfparam name="form.2_dis" default="">
					<cfparam name="form.3_unload" default="">
					<cfparam name="form.3_dump" default="">
					<cfparam name="form.3_other" default="">
					<cfparam name="form.4_day" default="">
					<cfparam name="form.4_week" default="">
					<cfparam name="form.4_year" default="">
					<cfparam name="form.5_con" default="">
					<cfparam name="form.5_non" default="">
					<cfparam name="form.5_tube" default="">
					<cfparam name="form.5_cable" default="">
					<cfparam name="form.5_disc" default="">
					<cfparam name="form.5_wash" default="">
					<cfparam name="form.5_proof" default="">
					<cfparam name="form.6_volt" default="">
					<cfparam name="form.6_other" default="">
					<cfparam name="form.6_class" default="">
					<cfparam name="form.6_div" default="">
					<cfparam name="form.6_group" default="">
					<cfparam name="form.7_loc" default="">
					<cfparam name="form.com" default="">

					<cfif StructKeyExists(form, 'g-recaptcha-response')>
						<cfset errors = "">

						<cfif not len(trim(form.co))>
							<cfset errors = errors & "Please enter your company name.<br>">
						</cfif>
						<cfif not len(trim(form.fn))>
							<cfset errors = errors & "Please enter your first name.<br>">
						</cfif>
						<cfif not len(trim(form.ln))>
							<cfset errors = errors & "Please enter your last name.<br>">
						</cfif>
						<cfif not len(trim(form.ph))>
							<cfset errors = errors & "Please enter your phone number.<br>">
						</cfif>
						<cfif not len(trim(form.email))>
							<cfset errors = errors & "Please enter a vaild email address.<br>">
						</cfif>
						<cfif not len(trim(form.ad1))>
							<cfset errors = errors & "Please enter your address.<br>">
						</cfif>
						<cfif not len(trim(form.ci))>
							<cfset errors = errors & "Please enter your city.<br>">
						</cfif>
						<cfif not len(trim(form.zip))>
							<cfset errors = errors & "Please enter your zip code.<br>">
						</cfif>
						<cfif not len(trim(form.cou))>
							<cfset errors = errors & "Please enter your country.<br>">
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

							<h2>Request for Quote</h2>
							<p>Please fill-out the form and click on the submit button on the bottom of the form. Once we review your request for quote, we will contact you.</p>

							<form action="#cgi.script_name#" method="post" id="form" enctype="multipart/form-data">
								<p>Fields designated with an asterisk (<span class="ast">*</span>) are required.<br><br></p>
								<p>
									<label class="formLabel">Interested In</label>
									<select name="prod" id="prod" class="form chosen">
										<option value="">- Select Product -</option>
										<cfloop query="rfq">
										<option value="#rfq.p_title#"<cfif rfq.p_url eq url.prod> selected</cfif>>#rfq.p_title#</option>
										</cfloop>
									</select>
								</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Company</label>
									<input type="text" name="co" id="co" class="form" value="#form.co#">
								</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>First Name</label>
									<input type="text" name="fn" id="fn" class="form" value="#form.fn#">
								</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Last Name</label>
									<input type="text" name="ln" id="ln" class="form" value="#form.ln#">
								</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Phone</label>
									<input type="text" name="ph" id="ph" class="form" value="#form.ph#">
								</p>
								<p>
									<label class="formLabel">Fax</label>
									<input type="text" name="fax" id="fax" class="form" value="#form.fax#">
								</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Email</label>
									<input type="text" name="email" id="email" class="form" value="#form.email#">
								</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Address</label>
									<input type="text" name="ad1" id="ad1" class="form" value="#form.ad1#">
								</p>
								<p>
									<label class="formLabel">&nbsp;</label>
									<input type="text" name="ad2" id="ad2" class="form" value="#form.ad2#">
								</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>City</label>
									<input type="text" name="ci" id="ci" class="form" value="#form.ci#">
								</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Zip</label>
									<input type="text" name="zip" id="zip" class="form" size="10" value="#form.zip#">
								</p>
								<p>
									<cfinvoke component="#application.components#.queryController"
										method="countryList"
										returnVariable="cl">
									</cfinvoke>
									<label class="formLabel"><span class="ast">*</span>Country</label>
									<select name="cou" id="cou" class="form chosen">
										<option value="">-- Select Country --</option>
										<option value="US"<cfif form.cou eq "US"> selected</cfif>>United States</option>
										<cfloop query="cl">
											<cfif cl.code neq "US"><option value="#cl.code#"<cfif form.cou eq cl.code> selected</cfif>>#cl.country#</option></cfif>
										</cfloop>
									</select>
								</p>
								<p id="state" >
									<label class="formLabel"><span class="ast">*</span>State/Province</label>
									<select name="st" id="st" class="form chosen">
										<option value="">-- Select State --</option>
                                                                               <cfinclude template="states.cfm">
									</select>
								</p>

								<div class="line clearfix"></div>
								<h3>How did you learn about VAC-U-MAX?</h3>
								<p>
									<label class="checkLabel"><input type="checkbox" name="0_rep" id="0_rep" value="Rep Visit">
									Rep Visit</label>
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="0_mag_a" id="0_mag_a" value="Magazine Ad">
									Magazine Ad - What publication?</label> <input type="text" name="0_mag_b" id="0_mag_b">
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="0_trade_a" id="0_trade_b" value="Trade Show">
									Trade Show - What trade show?</label> <input type="text" name="0_trade_b" id="0_trade_b">
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="0_int_a" id="0_int_a" value="Internet">
									Internet - What did you search?</label> <input type="text" name="0_int_b" id="0_int_b">
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="0_oth_a" id="0_oth_a" value="Other">
									Other</label> <input type="text" name="0_oth_b" id="0_oth_b">
								</p>

								<div class="line clearfix"></div>
								<h3>Please answer as many of the following questions as possible.</h3>
								<p><strong>1.</strong> Product Information</p>
								<p>
									<label class="formLabel">Materials</label>
									<input type="text" name="1_mat" id="1_mat" class="form">
								</p>
								<p>
									<label class="formLabel">Bulk Density</label>
									<input type="text" name="1_density" id="1_density">
									<select name="1_units_a" id="1_units_a">
										<option value="lb/cubic ft" selected>lb/cubic ft</option>
										<option value="g/cc">g/cc</option>
									</select>
								</p>
								<p>
									<label class="formLabel">Requested Rate</label>
									<input type="text" name="1_rate" id="1_rate" class="form"> lbs./hr
								</p>
								<p>
									<label class="formLabel">Manufactured By</label>
									<input type="text" name="1_man" id="1_man" class="form">
								</p>
								<p>Characteristics (Check all that apply)</p>
								<p>
									<label class="checkLabel2"><input type="checkbox" name="1_agg" id="1_agg" value="Agglomerate"> Agglomerate</label>
									<label class="checkLabel2"><input type="checkbox" name="1_gran" id="1_gran" value="Granular"> Granular</label>
									<label class="checkLabel2"><input type="checkbox" name="1_pow" id="1_pow" value="Powder"> Powder</label>
									<label class="checkLabel2"><input type="checkbox" name="1_fib" id="1_fib" value="Stringy/Fibrous"> Stringy/Fibrous</label>
								</p>
								<p>
									<label class="checkLabel2"><input type="checkbox" name="1_free" id="1_free" value="Free Flowing"> Free Flowing</label>
									<label class="checkLabel2"><input type="checkbox" name="1_bridge" id="1_bridge" value="Bridges"> Bridges</label>
									<label class="checkLabel2"><input type="checkbox" name="1_fri" id="1_fri" value="Friable"> Friable</label>
									<label class="checkLabel2"><input type="checkbox" name="1_abr" id="1_abr" value="Abrasive"> Abrasive</label>
								</p>
								<p>
									<label class="formLabel">Particle Size (microns/mesh)</label>
									<input type="text" name="1_part" id="1_part">
								</p>
								<p>
									<label class="formLabel">Moisture Content (%)</label>
									<input type="text" name="1_moist" id="1_moist">
								</p>
								<p>
									<label class="formLabel">Temperature</label>
									<input type="text" name="1_temp" id="1_temp">
									<select name="1_units_b" id="1_units_b">
										<option value="&deg;F" selected>&deg;F</option>
										<option value="&deg;C">&deg;C</option>
									</select>
								</p>

								<div class="line clearfix"></div>
								<p><strong>2.</strong> Convey Information</p>
								<p>
									<label class="formLabel">Horizontal Distance</label>
									<input type="text" name="2_hor" id="2_hor"> ft.
								</p>
								<p>
									<label class="formLabel">Vertical Distance</label>
									<input type="text" name="2_ver" id="2_ver"> ft.
								</p>
								<p>
									<label class="formLabel">Diagonal Allowed?</label>
									<label class="checkLabel2"><input type="radio" name="2_dia" id="2_dia" value="Yes"> Yes</label>
									<label class="checkLabel2"><input type="radio" name="2_dia" id="2_dia" value="No"> No</label>
								</p>
								<p>
									Material in-feed to Conveyor
									<input type="text" name="2_matIn" id="2_matIn">
								</p>
								<p>
									Material discharge from Conveyor
									<input type="text" name="2_matOut" id="2_matOut">
								</p>
								<p>
									Number of inlets
									<input type="text" name="2_inlets" id="2_inlets">
								</p>
								<p>
									Number of discharge points
									<input type="text" name="2_dis" id="2_dis">
								</p>

								<div class="line clearfix"></div>
								<p><strong>3.</strong> Ancillary Equipment</p>
								<p>
									<label class="formLabel">Bulk Bag Unloader</label>
									<label class="checkLabel2"><input type="radio" name="3_unload" id="3_unload" value="Yes"> Yes</label>
									<label class="checkLabel2"><input type="radio" name="3_unload" id="3_unload" value="No"> No</label>
								</p>
								<p>
									<label class="formLabel">Bag Dump Station</label>
									<label class="checkLabel2"><input type="radio" name="3_dump" id="3_dump" value="Yes"> Yes</label>
									<label class="checkLabel2"><input type="radio" name="3_dump" id="3_dump" value="No"> No</label>
								</p>
								<p>
									Other<br>
									<textarea name="3_other" id="3_other" class="form"></textarea>
								</p>

								<div class="line clearfix"></div>
								<p><strong>4.</strong> Conveyor will Operate</p>
								<p>
									<label class="formLabel">Hours/Day</label>
									<input type="text" name="4_day" id="4_day">
								</p>
								<p>
									<label class="formLabel">Days/Week</label>
									<input type="text" name="4_week" id="4_week">
								</p>
								<p>
									<label class="formLabel">Weeks/Year</label>
									<input type="text" name="4_year" id="4_year">
								</p>

								<div class="line clearfix"></div>
								<p><strong>5.</strong> Materials of Construction</p>
								<p>
									<label class="formLabel">Product Contact</label>
									<input type="text" name="5_con" id="5_con">
								</p>
								<p>
									<label class="formLabel">Non-product Contact</label>
									<input type="text" name="5_non" id="5_non">
								</p>
								<p>
									Tube/Auger Material:
									<label class="checkLabel2"><input type="radio" name="5_tube" id="5_tube" value="Carbon Steel"> Carbon Steel</label>
									<label class="checkLabel2"><input type="radio" name="5_tube" id="5_tube" value="304SS"> 304SS</label>
									<label class="checkLabel2"><input type="radio" name="5_tube" id="5_tube" value="316SS"> 316SS</label>
								</p>
								<p>
									Cable/Auger Material:
									<label class="checkLabel2"><input type="radio" name="5_cable" id="5_cable" value="Carbon Steel"> Carbon Steel</label>
									<label class="checkLabel2"><input type="radio" name="5_cable" id="5_cable" value="304SS"> 304SS</label>
									<label class="checkLabel2"><input type="radio" name="5_cable" id="5_cable" value="316SS"> 316SS</label>
								</p>
								<p>
									Discs:
									<label class="checkLabel2"><input type="radio" name="5_disc" id="5_disc" value="Polyurethane"> Polyurethane</label>
									<label class="checkLabel2"><input type="radio" name="5_disc" id="5_disc" value="Nylon"> Nylon</label>
									<label class="checkLabel2"><input type="radio" name="5_disc" id="5_disc" value="Polycarbonate"> Polycarbonate</label>
								</p>
								<p>
									Wash down required?
									<label class="checkLabel2"><input type="radio" name="5_wash" id="5_wash" value="Yes"> Yes</label>
									<label class="checkLabel2"><input type="radio" name="5_wash" id="5_wash" value="No"> No</label>
								</p>
								<p>
									Water proofing needed?
									<label class="checkLabel2"><input type="radio" name="5_proof" id="5_proof" value="Yes"> Yes</label>
									<label class="checkLabel2"><input type="radio" name="5_proof" id="5_proof" value="No"> No</label>
								</p>

								<div class="line clearfix"></div>
								<p><strong>6.</strong> Electrical Information</p>
								<p>
									<label class="formLabel">Voltage</label>
									<label class="checkLabel2"><input type="radio" name="6_volt" id="6_volt" value="208"> 208</label>
									<label class="checkLabel2"><input type="radio" name="6_volt" id="6_volt" value="230"> 230</label>
									<label class="checkLabel2"><input type="radio" name="6_volt" id="6_volt" value="460"> 460</label>
									<label class="checkLabel2"><input type="radio" name="6_volt" id="6_volt" value="575"> 575</label>
									<label class="checkLabel2"><input type="radio" name="6_volt" id="6_volt" value="Other"> Other</label>
									<label class="inlineLabel"><input type="text" name="6_other" id="6_other" class="form2"></label>
								</p>
								<p>
									<label class="formLabel">Class</label>
									<input type="text" name="6_class" id="6_class">
								</p>
								<p>
									<label class="formLabel">Class</label>
									<input type="text" name="6_class" id="6_class">
								</p>
								<p>
									<label class="formLabel">Division</label>
									<input type="text" name="6_div" id="6_div">
								</p>
								<p>
									<label class="formLabel">Group</label>
									<input type="text" name="6_group" id="6_group">
								</p>

								<div class="line clearfix"></div>
								<p><strong>7.</strong> Equipment Location</p>
								<p>
									<label class="checkLabel"><input type="radio" name="7_loc" id="7_loc" value="Inside"> Inside</label>
									<label class="checkLabel"><input type="radio" name="7_loc" id="7_loc" value="Outside"> Outside</label>
									<label class="checkLabel"><input type="radio" name="7_loc" id="7_loc" value="Under Cover"> Under Cover</label>
								</p>

								<div class="line clearfix"></div>
								<p><strong>Equipment Layout</strong><br>
								Please provide dimensions under feed device, and dimensions over destination component.</p>
								<p><input type="file" name="upload" id="upload" class="form"></p>
								<p>
									Please advise any comments, measurements, or other relevant data below:<br>
									<textarea name="com" id="com" class="form"></textarea>
								</p>

								<p>
									<div class="g-recaptcha" data-sitekey="#creds.siteKey#"></div>
								</p>
								<p>
									<div class="clearfix"></div>
									<input type="hidden" name="pass" value="false">
									<input name="send" type="submit" id="send" value="Submit Quote">
								</p>
							</form>
						</cfoutput>

					<cfelse>

						<cfoutput>
							<h3>Thanks for the message.</h3>
							<p>We've received your message and will get back to you as soon as we can.</p>

							<cfset date = DateFormat(Now(), 'yyyy-mm-dd')>
							<cfset time = TimeFormat(Now(), 'HH:mm:ss')>
							<cfset destination = expandPath("./userfiles/flexible")>

							<cfif form.upload neq "">
								<cffile action="upload" filefield="upload" destination="#destination#" nameConflict="makeUnique" result="upload">
								<cfset diagram = "#upload.serverfile#">
								<cfset filedirectory = "#upload.serverdirectory#">
			                </cfif>

							<cfsavecontent variable="message">
								#date#<br>
								<strong>Interested In</strong>: #form.prod#<br>
								<strong>Company</strong>: #form.co#<br>
								<strong>Name</strong>: #form.fn# #form.ln#<br>
								<strong>Phone</strong>: #form.ph#<br>
								<cfif form.fax neq ""><strong>Fax</strong>: #form.fax#<br></cfif>
								<strong>Email</strong>: #form.email#<br>
								<strong>Address</strong>:<br>
								#form.ad1#<br>
								<cfif form.ad2 neq "">#form.ad2#<br></cfif>
								#form.ci#<cfif form.st neq "">, #form.st#</cfif> #form.zip#<br>
								#form.cou#<br>
								<br>
								<h3>How did you learn about VAC-U-MAX?</h3>
								<cfif form.0_rep neq "">#form.0_rep#<br></cfif>
								<cfif form.0_mag_a neq "">#form.0_mag_a# - #form.0_mag_b#<br></cfif>
								<cfif form.0_trade_a neq "">#form.0_trade_a# - #form.0_trade_b#<br></cfif>
								<cfif form.0_int_a neq "">#form.0_int_a# - #form.0_int_b#<br></cfif>
								<cfif form.0_oth_a neq "">#form.0_oth_a# - #form.0_oth_b#<br></cfif>
								<br>
								<h3>1 - Product Information</h3>
								<strong>Materials</strong>: #form.1_mat#<br>
								<strong>Bulk Density</strong>: <cfif form.1_density neq "">#form.1_density# #form.1_units_a#</cfif><br>
								<strong>Requested Rate</strong>: <cfif form.1_rate neq "">#form.1_rate# lbs./hr</cfif><br>
								<strong>Manufactured By</strong>: #form.1_man#<br>
								<strong>Characteristics</strong>:<cfif form.1_agg neq "">#form.1_agg#<br></cfif>
								<cfif form.1_gran neq "">#form.1_gran#<br></cfif>
								<cfif form.1_pow neq "">#form.1_pow#<br></cfif>
								<cfif form.1_fib neq "">#form.1_fib#<br></cfif>
								<cfif form.1_free neq "">#form.1_free#<br></cfif>
								<cfif form.1_bridge neq "">#form.1_bridge#<br></cfif>
								<cfif form.1_fri neq "">#form.1_fri#<br></cfif>
								<cfif form.1_abr neq "">#form.1_abr#<br></cfif>
								<strong>Particle Size</strong>: #form.1_part#<br>
								<strong>Moisture Content</strong>: #form.1_moist#<br>
								<strong>Temperature</strong>: <cfif form.1_temp neq "">#form.1_temp# #form.1_units_b#</cfif><br>
								<br>
								<h3>2 - Convey Information</h3>
								<strong>Horizontal Distance</strong>: #form.2_hor#<br>
								<strong>Vertical Distance</strong>: #form.2_ver#<br>
								<strong>Diagonal Allowed</strong>: <cfif form.2_dia neq "">#form.2_dia#</cfif><br>
								<strong>Material in-feed to Conveyor</strong>: #form.2_matIn#<br>
								<strong>Material discharge from Conveyor</strong>: #form.2_matOut#<br>
								<strong>Number of Inlets</strong>: #form.2_inlets#<br>
								<strong>Number of Discharge Points</strong>: #form.2_dis#<br>
								<br>
								<h3>3 - Ancillary Equipment</h3>
								<strong>Bulk Bag Unloader</strong>: <cfif form.3_unload neq "">#form.3_unload#</cfif><br>
								<strong>Bag Dump Station</strong>: <cfif form.3_dump neq "">#form.3_dump#</cfif><br>
								<strong>Other</strong>: #form.3_other#<br>
								<br>
								<h3>4 - Conveyor will Operate</h3>
								<strong>Hours/Day</strong>: #form.4_day#<br>
								<strong>Days/Week</strong>: #form.4_week#<br>
								<strong>Weeks/Year</strong>: #form.4_year#<br>
								<br>
								<h3>5 - Materials of Construction</h3>
								<strong>Product Contact</strong>: #form.5_con#<br>
								<strong>Non-product Contact</strong>: #form.5_non#<br>
								<strong>Tube/Auger Material</strong>: <cfif form.5_tube neq "">#form.5_tube#</cfif><br>
								<strong>Cable/Auger Material</strong>: <cfif form.5_cable neq "">#form.5_cable#</cfif><br>
								<strong>Discs</strong>: <cfif form.5_disc neq "">#form.5_disc#</cfif><br>
								<strong>Wash down required</strong>: <cfif form.5_wash neq "">#form.5_wash#</cfif><br>
								<strong>Water Proofing Needed</strong>: <cfif form.5_proof neq "">#form.5_proof#</cfif><br>
								<br>
								<h3>6 - Electrical Information</h3>
								<strong>Voltage</strong>: <cfif form.6_volt neq "">#form.6_volt#</cfif><br>
								<strong>Class</strong>: #form.6_class#<br>
								<strong>Division</strong>: #form.6_div#<br>
								<strong>Group</strong>: #form.6_group#<br>
								<br>
								<h3>Equipment Location</h3>
								<strong>Located</strong>: <cfif form.7_loc neq "">#form.7_loc#</cfif><br>
								<br>
								<h3>Equipment Layout</h3>
								<strong>Comments</strong>: #form.com#<br>
								<cfif isDefined("diagram")><a href="../userfiles/flexible/#diagram#" target="_blank">#diagram#</a></cfif>
							</cfsavecontent>

							<cfinvoke component="#application.components#.formProcessing" method="process">
								<cfinvokeargument name="subject" value="VAC-U-MAX Flexible Screw Conveyors RFQ Form">
								<cfinvokeargument name="formName" value="Flexible Screw Conveyors">
								<cfinvokeargument name="to" value="sales@vac-u-max.net">
								<cfinvokeargument name="cc" value="doanpendleton@vac-u-max.net, stevependleton@vac-u-max.net, davidkennedy@vac-u-max.net">
								<cfinvokeargument name="form" value="#form#">
								<cfinvokeargument name="message" value="#message#">
								<cfinvokeargument name="date" value="#date#">
								<cfinvokeargument name="time" value="#time#">
								<cfinvokeargument name="section" value="pnue">
								<cfif isDefined("diagram")><cfinvokeargument name="upload" value="#filedirectory#/#diagram#"></cfif>
							</cfinvoke>

							<cfhttp url="https://www.salesforce.com/servlet/servlet.WebToLead?encoding=UTF-8" method="post" result="objHttp">
								<cfhttpparam type="formField" name="company" value="#form.co#">
								<cfhttpparam type="formField" name="first_name" value="#form.fn#">
								<cfhttpparam type="formField" name="last_name" value="#form.ln#">
								<cfhttpparam type="formField" name="phone" value="#form.ph#">
								<cfhttpparam type="formField" name="fax" value="#form.fax#">
								<cfhttpparam type="formField" name="email" value="#form.email#">
								<cfhttpparam type="formField" name="street" value="#form.ad1#">
								<cfhttpparam type="formField" name="city" value="#form.ci#">
								<cfhttpparam type="formField" name="state_code" value="#form.st#">
								<cfhttpparam type="formField" name="zip" value="#form.zip#">
								<cfhttpparam type="formField" name="country_code" value="#form.cou#">
								<cfhttpparam type="formField" name="oid" value="00Do0000000IYWJ">
								<cfhttpparam type="formField" name="retURL" value="http://www.vac-u-max.com/">
								<cfhttpparam type="formField" name="lead_source" value="Web">
								<cfhttpparam type="formField" name="Division__c" value="Cleaning-04">
								<cfhttpparam type="formField" name="rating" value="Unknown">
								<cfhttpparam type="formField" name="Campaign_ID" value="701o00000001BzT">
								<cfhttpparam type="formField" name="member_status" value="Submitted">
							</cfhttp>
						</cfoutput>
					</cfif>
	    		</div>
	    	</div><!--- row-fluid--->
		</div><!--- conIndent --->
    </div><!--- container --->

    <cfinclude template="inc/footer.cfm">

	<script type="text/javascript" src="https://www.google.com/recaptcha/api.js?hl=#lang#"></script>
	<cfinclude template="inc/scripts.cfm">
	<script src="js/jquery.validate.min.js"></script>
	<script src="js/chosen.jquery.min.js"></script>
	<script>
		$(document).ready(function() {
			var prevC = "<cfoutput>#form.cou#</cfoutput>";
			var prevS = "<cfoutput>#form.st#</cfoutput>";

			function updateStates(s) {
				var c = $('#cou').val();

				$.ajax({
					type: 'POST',
					url: 'inc/getStates.cfm',
					data: { country: c },
					success: function(response){
						if (c !== null && $(response).find('list').text() === 'true') {
							$('#st').html('');
							$('#st').append('<option value="">-- Select State --</option>');
							$(response).find('state').each(function(){
								var abbr = $(this).find('abbr').text();
								var name = $(this).find('name').text();
								if (s == abbr) {
									$('#st').append('<option value="' + abbr + '" selected>' + name + '</option>');
								} else {
									$('#st').append('<option value="' + abbr + '">' + name + '</option>');
								}
							});
							$('#state').removeClass('hidden');
							$('#st').chosen();
							$('#st').trigger('chosen:updated');
							$('#st').rules('add', {
								required: true,
								messages: {
									required: 'Please enter your state/province.',
								}
							});
							if (c == 'US') {
								$('#zip').rules('add', {
									number: true,
									messages: {
										required: 'Your zip code must only contain numbers.',
									}
								});
							} else {
								$('#zip').rules('remove', 'number');
							}
						} else {
							$('#state').addClass('hidden');
							$('#st').rules('remove');
							$('#zip').rules('remove', 'number');
						}
					}
				});
			}

			$('#prod').chosen();
			if (prevC !== "") {
				$("#cou").val(prevC).trigger("liszt:updated");
			}
			$('#cou').chosen(updateStates(prevS));
			$('#cou').on('change', function(e, c) {
				updateStates(prevS);
			});

			$("#form").validate({
				errorPlacement: function(error, element) {
					 error.appendTo(element.parent());
				},
				rules: {
					co: "required",
					fn: "required",
					ln: "required",
					ph: "required",
					email: {
						required: true,
						email: true
					},
					ad1: "required",
					ci: "required",
					zip: "required",
					cou: "required"
				},
				messages: {
					co: "Please enter your company.",
					fn: "Please enter your first name.",
					ln: "Please enter your last name.",
					ph: "Please enter your phone number.",
					email: "Please enter a valid email address.",
					ad1: "Please enter your address.",
					ci: "Please enter your city.",
					zip: "Please enter your zip code.",
					cou: "Please enter your country."
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

			var validator = $('#form').data('validator');
			validator.settings.ignore = ':hidden:not(select)';

			$('.chosen').on('change', function(evt, params) {
			    $(evt.target).valid();
			});
		});
	</script>
</body>
</html>
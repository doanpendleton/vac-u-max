<cfprocessingdirective pageEncoding="utf-8">
<cfparam name="url.prod" default="">
<cfinvoke
	component="#application.components#.queryController"
	method="vacOver"
	returnvariable="rfq">
	<cfinvokeargument name="selectCat" value="central-vacuum-systems">
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
	<title>VAC-U-MAX | Central Vacuum Systems RFQ</title>
	<meta name="description" content="">
	<cfinclude template="inc/head.cfm">
	<link href="css/chosen.min.css" rel="stylesheet" type="text/css">
</head>

<body>
	<cfinclude template="inc/top.cfm">

    <div id="homeCon" class="container">
		<div class="conIndent">
			<div class="row-fluid">
		    	<div id="inBan2" class="inBanner">
		    		<h1>Central Vacuum Systems RFQ</h1>
		    		<div class="clearfix"></div>
		    	</div><!--- inBanner --->
			</div><!--- row-fluid --->

	    	<div class="row-fluid">
	    		<cfinclude template="inc/sideVac.cfm">

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
					<cfparam name="form.1_fac" default="">
					<cfparam name="form.1_fac_u" default="">
					<cfparam name="form.1_area" default="">
					<cfparam name="form.1_area1_area_u" default="">
					<cfparam name="form.1_type" default="">
					<cfparam name="form.1_avail" default="">
					<cfparam name="form.1_time" default="">
					<cfparam name="form.2_pick" default="">
					<cfparam name="form.2_sim" default="">
					<cfparam name="form.2_hose" default="">
					<cfparam name="form.2_hose_u" default="">
					<cfparam name="form.2_hor" default="">
					<cfparam name="form.2_hor_u" default="">
					<cfparam name="form.2_vert" default="">
					<cfparam name="form.2_vert_u" default="">
					<cfparam name="form.2_op" default="">
					<cfparam name="form.2_op_b" default="">
					<cfparam name="form.2_closed" default="">
					<cfparam name="form.2_desc" default="">
					<cfparam name="form.3_temp" default="">
					<cfparam name="form.3_temp_u" default="">
					<cfparam name="form.3_sound_a" default="">
					<cfparam name="form.3_sound_b" default="">
					<cfparam name="form.3_sound_c" default="">
					<cfparam name="form.3_sound_d" default="">
					<cfparam name="form.3_haz" default="">
					<cfparam name="form.3_class" default="">
					<cfparam name="form.3_group" default="">
					<cfparam name="form.3_hepa" default="">
					<cfparam name="form.3_mat" default="">
					<cfparam name="form.4_na" default="">
					<cfparam name="form.4_bulk" default="">
					<cfparam name="form.4_par_a" default="">
					<cfparam name="form.4_par_b" default="">
					<cfparam name="form.4_temp" default="">
					<cfparam name="form.4_temp_u" default="">
					<cfparam name="form.4_dry" default="">
					<cfparam name="form.4_dust" default="">
					<cfparam name="form.4_hyg" default="">
					<cfparam name="form.4_cor" default="">
					<cfparam name="form.4_oil" default="">
					<cfparam name="form.4_sti" default="">
					<cfparam name="form.4_tox" default="">
					<cfparam name="form.4_abr" default="">
					<cfparam name="form.4_exp" default="">
					<cfparam name="form.5_volt" default="">
					<cfparam name="form.5_ph" default="">
					<cfparam name="form.5_hz" default="">
					<cfparam name="form.5_air_a" default="">
					<cfparam name="form.5_air_b" default="">
					<cfparam name="form.6_dis" default="">
					<cfparam name="form.7_meth" default="">
					<cfparam name="form.7_equip" default="">

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

							<form action="#cgi.script_name#" method="post" id="form">
								<p>Fields designated with an asterisk (<span class="ast">*</span>) are required.<br><br></p>
								<p>
									<label class="formLabel">Interested In</label>
									<select name="prod" id="prod" class="form chosen">
										<option value="">-- Select Product --</option>
										<cfloop query="rfq">
										<option value="#rfq.v_item# - #rfq.v_title#"<cfif rfq.v_item eq url.prod> selected</cfif>>#rfq.v_item# - #rfq.v_title#</option>
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
								<h3>Please answer as many of the following questions as possible.</h3>
								<p><strong>1.</strong> Project Information</p>
								<p>
									<label class="formLabel">Total Facility Size</label>
									<input type="text" name="1_fac" id="1_fac">
									<select name="1_fac_u" id="1_fac_u">
										<option value="sq ft" selected>sq ft</option>
										<option value="sq m">sq m</option>
									</select>
								</p>
								<p>
									<label class="formLabel">Area Included in the System</label>
									<input type="text" name="1_area" id="1_area">
									<select name="1_area_u" id="1_area_u">
										<option value="sq ft" selected>sq ft</option>
										<option value="sq m">sq m</option>
									</select>
								</p>
								<p>
									<label class="formLabel">Type of Industry</label>
									<input type="text" name="1_type" id="1_type" class="form">
								</p>
								<p>
									<label class="formLabel">Available Budget</label>
									<input type="text" name="1_avail" id="1_avail" class="form">
								</p>
								<p>
									<label class="formLabel">Timing</label>
									<input type="text" name="1_time" id="1_time" class="form">
								</p>

								<div class="line clearfix"></div>
								<p><strong>2.</strong> Convey Information</p>
								<p>
									<label class="formLabel">## of Pick-up Points</label>
									<input type="text" name="2_pick" id="2_pick">
								</p>
								<p>
									<label class="formLabel">## of Points Used Simultaneously</label>
									<input type="text" name="2_sim" id="2_sim">
								</p>
								<p>
								<p>
									<label class="formLabel">Requested Hose Size</label>
									<input type="text" name="2_hose" id="2_hose">
									<select name="2_hose_u" id="2_hose_u">
										<option value="in" selected>in</option>
										<option value="cm">cm</option>
									</select>
								</p>
									<label class="formLabel">Longest Horizontal Tubing Run</label>
									<input type="text" name="2_hor" id="2_hor">
									<select name="2_hor_u" id="2_hor_u">
										<option value="ft" selected>ft</option>
										<option value="m">m</option>
									</select>
								</p>
								<p>
									<label class="formLabel">Longest Vertical Tubing Run</label>
									<input type="text" name="2_ver" id="2_ver">
									<select name="2_ver_u" id="2_ver_u">
										<option value="ft" selected>ft</option>
										<option value="m">m</option>
									</select>
								</p>
								<p>
									<label class="formLabel">Operation</label>
									<label class="checkLabel2"><input type="radio" name="2_op" id="2_op" value="Continuous"> Continuous</label>
									<label class="checkLabel2"><input type="radio" name="2_op" id="2_op" value="Intermittent"> Intermittent</label>
									<label class="checkLabel2"><input type="radio" name="2_op" id="2_op" value="Times per Day for"> Times per Day for</label>
									<label class="inlineLabel"> <input type="text" name="2_op_b" id="2_op_b" class="form2"> Hours</label>
								</p>
								<p>
									Will the vacuum system be operating even when all inlets are closed?
									<label class="checkLabel2"><input type="radio" name="2_closed" id="2_closed" value="Yes"> Yes</label>
									<label class="checkLabel2"><input type="radio" name="2_closed" id="2_closed" value="No"> No</label>
								</p>
								<p>
									Brief Description of Application<br>
									<textarea name="2_desc" id="2_desc" class="form"></textarea>
								</p>

								<div class="line clearfix"></div>
								<p><strong>3.</strong> Plant Conditions</p>
								<p>
									<label class="formLabel">Ambient Temp</label>
									<input type="text" name="3_temp" id="3_temp">
									<select name="3_temp_u" id="3_temp_u">
										<option value="&deg;F" selected>&deg;F</option>
										<option value="&deg;C">&deg;C</option>
									</select>
								</p>
								<p>
									<label class="formLabel">Maximum Sound Level</label>
									<label class="inlineLabel"> <input type="text" name="3_sound_a" id="3_sound_a" class="form2"> dBA</label>
									<label class="inlineLabel"> @ <input type="text" name="3_sound_b" id="3_sound_b" class="form2"></label>
									<label class="inlineLabel"> <select name="3_sound_c" id="3_sound_c"
										<option value="ft" selected>ft</option>
										<option value="m">m</option>
									</select></label>
									<label class="inlineLabel"> for <input type="text" name="3_sound_d" id="3_sound_d" class="form2"> hours</label>
								</p>
								<p>
									<label class="formLabel">Hazardous Conditions</label>
									<input type="text" name="3_haz" id="3_haz" class="form">
								</p>
								<p>NEMA Rating</p>
								<p>
									<label class="formLabel">Class</label>
									<input type="text" name="3_class" id="3_class">
								</p>
								<p>
									<label class="formLabel">Group</label>
									<input type="text" name="3_group" id="3_group">
								</p>
								<p>
									<label class="formLabel">Division</label>
									<input type="text" name="3_div" id="3_div">
								</p>
								<p>
									HEPA Filter Required
									<label class="checkLabel2"><input type="radio" name="3_hepa" id="3_hepa" value="Yes"> Yes</label>
									<label class="checkLabel2"><input type="radio" name="3_hepa" id="3_hepa" value="No"> No</label>
								</p>
								<p>
									Product Contact Material
									<label class="checkLabel2"><input type="radio" name="3_mat" id="3_mat" value="Carbon Steel with Powder Coat "> Carbon Steel with Powder Coat </label>
									<label class="checkLabel2"><input type="radio" name="3_mat" id="3_mat" value="304SS with Bead Blast Finish"> 304SS with Bead Blast Finish</label>
								</p>

								<div class="line clearfix"></div>
								<p><strong>4.</strong> Material Characteristics</p>
								<p>
									<label class="formLabel">Name</label>
									<input type="text" name="4_na" id="4_na">
								</p>
								<p>
									<label class="formLabel">Bulk Density</label>
									<input type="text" name="4_bulk" id="4_bulk">
								</p>
								<p>
									<label class="formLabel">Largest Particle Size</label>
									<input type="text" name="4_par_a" id="4_par_a"> micron
								</p>
								<p>
									<label class="formLabel">Smallest Particle Size</label>
									<input type="text" name="4_par_b" id="4_par_b"> micron
								</p>
								<p>
									<label class="formLabel">Max Temp</label>
									<input type="text" name="4_temp" id="4_temp">
									<select name="4_temp_u" id="4_temp_u">
										<option value="&deg;F" selected>&deg;F</option>
										<option value="&deg;C">&deg;C</option>
									</select>
								</p>
								<p>
									<label class="formLabel">Dry</label>
									<label class="checkLabel2"><input type="radio" name="4_dry" id="4_dry" value="Yes"> Yes</label>
									<label class="checkLabel2"><input type="radio" name="4_dry" id="4_dry" value="No"> No</label>
								</p>
								<p>
									<label class="formLabel">Dusty</label>
									<label class="checkLabel2"><input type="radio" name="4_dust" id="4_dust" value="Yes"> Yes</label>
									<label class="checkLabel2"><input type="radio" name="4_dust" id="4_dust" value="No"> No</label>
								</p>
								<p>
									<label class="formLabel">Hygroscopic</label>
									<label class="checkLabel2"><input type="radio" name="4_hyg" id="4_hyg" value="Yes"> Yes</label>
									<label class="checkLabel2"><input type="radio" name="4_hyg" id="4_hyg" value="No"> No</label>
								</p>
								<p>
									<label class="formLabel">Corrosive</label>
									<label class="checkLabel2"><input type="radio" name="4_cor" id="4_cor" value="Yes"> Yes</label>
									<label class="checkLabel2"><input type="radio" name="4_cor" id="4_cor" value="No"> No</label>
								</p>
								<p>
									<label class="formLabel">Oily</label>
									<label class="checkLabel2"><input type="radio" name="4_oil" id="4_oil" value="Yes"> Yes</label>
									<label class="checkLabel2"><input type="radio" name="4_oil" id="4_oil" value="No"> No</label>
								</p>
								<p>
									<label class="formLabel">Sticky</label>
									<label class="checkLabel2"><input type="radio" name="4_sti" id="4_sti" value="Yes"> Yes</label>
									<label class="checkLabel2"><input type="radio" name="4_sti" id="4_sti" value="No"> No</label>
								</p>
								<p>
									<label class="formLabel">Toxic</label>
									<label class="checkLabel2"><input type="radio" name="4_tox" id="4_tox" value="Yes"> Yes</label>
									<label class="checkLabel2"><input type="radio" name="4_tox" id="4_tox" value="No"> No</label>
								</p>
								<p>
									<label class="formLabel">Abrasive</label>
									<label class="checkLabel2"><input type="radio" name="4_abr" id="4_abr" value="Yes"> Yes</label>
									<label class="checkLabel2"><input type="radio" name="4_abr" id="4_abr" value="No"> No</label>
								</p>
								<p>
									<label class="formLabel">Explosive</label>
									<label class="checkLabel2"><input type="radio" name="4_exp" id="4_exp" value="Yes"> Yes</label>
									<label class="checkLabel2"><input type="radio" name="4_exp" id="4_exp" value="No"> No</label>
								</p>

								<div class="line clearfix"></div>
								<p><strong>5.</strong> Available Power</p>
								<p>Electric</p>
								<p>
									<label class="formLabel">Volts</label>
									<input type="text" name="5_volt" id="5_volt">
								</p>
								<p>
									<label class="formLabel">Phase</label>
									<input type="text" name="5_ph" id="5_ph">
								</p>
								<p>
									<label class="formLabel">Hertz</label>
									<input type="text" name="5_hz" id="5_hz">
								</p>
								<p>
									<label class="formLabel">Compressed Air</label>
									<label class="inlineLabel"><input type="text" name="5_air_a" id="5_air_a" class="form2"> CFM @</label>
									<label class="inlineLabel"> <input type="text" name="5_air_b" id="5_air_b" class="form2"> PSI</label>
								</p>

								<div class="line clearfix"></div>
								<p><strong>6.</strong> Disposition of Collected Material</p>
								<p>
									What will happen to material once it is collected? Please give a brief description:<br>
									<textarea name="6_dis" id="6_dis" class="form"></textarea>
								</p>

								<div class="line clearfix"></div>
								<p><strong>7.</strong> Current Cleaning System</p>
								<p>
									<label class="formLabel">Present Method</label>
									<input type="text" name="7_meth" id="7_meth">
								</p>
								<p>
									Manufacturer and Model ## of Present Cleaning Equipment
									<input type="text" name="7_equip" id="7_equip">
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
								<h3>1 - Project Information</h3>
								<strong>Total Facility Size</strong>: <cfif form.1_fac neq "">#form.1_fac# #form.1_fac_u#</cfif><br>
								<strong>Area Included in the System</strong>: <cfif form.1_area neq "">#form.1_area# #form.1_area_u#</cfif><br>
								<strong>Type of Industry</strong>: #form.1_type#<br>
								<strong>Available Budget</strong>: #form.1_avail#<br>
								<strong>Timing</strong>: #form.1_time#<br>
								<br>
								<h3>2 - Convey Information</h3>
								<strong>## of Pick-up Points</strong>: #form.2_pick#<br>
								<strong>## of Points Used Simultaneously</strong>: #form.2_sim#<br>
								<strong>Requested Hose Size</strong>: <cfif form.2_hose neq "">#form.2_hose# #form.2_hose_u#</cfif><br>
								<strong>Longest Horizontal Tubing Run</strong>: <cfif form.2_hor neq "">#form.2_hor# #form.2_hor_u#</cfif><br>
								<strong>Longest Vertical Tubing Run</strong>: <cfif form.2_ver neq "">#form.2_ver# #form.2_ver#</cfif><br>
								<strong>Operation</strong>: #form.2_op#<cfif form.2_op eq "Times per Day for"> #form.2_op_b# Hours</cfif><br>
								<strong>Will the vacuum system be operating even when all inlets are closed? </strong>: #form.2_closed#<br>
								<strong>Brief Description of Application</strong>: #form.2_desc#<br>
								<br>
								<h3>3 - Plant Conditions</h3>
								<strong>Ambient Temp</strong>: <cfif form.3_temp neq "">#form.3_temp# #form.3_temp_u#</cfif><br>
								<strong>Maximum Sound Level</strong>: <cfif form.3_sound_a neq "">#form.3_sound_a# dBA</cfif><cfif form.3_sound_b neq ""> @ #form.3_sound_b# #form.3_sound_c#</cfif><cfif form.3_sound_d neq ""> #form.3_sound_d# Hours</cfif><br>
								<strong>Hazardous Conditions</strong>: #form.3_haz#<br>
								<strong>NEMA Rating</strong>:<br>
								<strong>Class</strong>: #form.3_class#<br>
								<strong>Group</strong>: #form.3_group#<br>
								<strong>Division</strong>: #form.3_div#<br>
								<strong>HEPA Filter Required</strong>: #form.3_hepa#<br>
								<strong>Product Contact Material</strong>: #form.3_mat#<br>
								<br>
								<h3>4 - Material Characteristics</h3>
								<strong>Name</strong>: #form.4_na#<br>
								<strong>Bulk Density</strong>: #form.4_bulk#<br>
								<strong>Largest Particle Size</strong>: #form.4_par_a#<br>
								<strong>Smallest Particle Size</strong>: #form.4_par_b#<br>
								<strong>Max Temp</strong>: <cfif form.4_temp neq "">#form.4_temp# #form.4_temp_u#</cfif><br>
								<strong>Dry</strong>: #form.4_dry#<br>
								<strong>Dusty</strong>: #form.4_dust#<br>
								<strong>Hygroscopic</strong>: #form.4_hyg#<br>
								<strong>Corrosive</strong>: #form.4_cor#<br>
								<strong>Oily</strong>: #form.4_oil#<br>
								<strong>Sticky</strong>: #form.4_sti#<br>
								<strong>Toxic</strong>: #form.4_tox#<br>
								<strong>Abrasive</strong>: #form.4_abr#<br>
								<strong>Explosive</strong>: #form.4_exp#<br>
								<br>
								<h3>5 - Available Power</h3>
								<strong>Electric</strong>:<br>
								<strong>Volts</strong>: #form.5_volt#<br>
								<strong>Phase</strong>: #form.5_ph#<br>
								<strong>Hertz</strong>: #form.5_hz#<br>
								<strong>Compressed Air</strong>: #form.5_air_a# #form.5_air_b#<br>
								<br>
								<h3>6 - Disposition of Collected Material</h3>
								<strong>What will happen to material once it is collected? Please give a brief description:</strong>: #form.6_dis#<br>
								<br>
								<h3>7 - Current Cleaning System</h3>
								<strong>Present Method</strong>: #form.7_meth#<br>
								<strong>Manufacturer and Model ## of Present Cleaning Equipment</strong>: #form.7_equip#<br>
							</cfsavecontent>

							<cfinvoke component="#application.components#.formProcessing" method="process">
								<cfinvokeargument name="subject" value="VAC-U-MAX Vacuum Cleaning Systems RFQ Form">
								<cfinvokeargument name="formName" value="Central Vacuum Systems">
								<cfinvokeargument name="to" value="sales@vac-u-max.net">
								<cfinvokeargument name="cc" value="doanpendleton@vac-u-max.net, stevependleton@vac-u-max.net, davidkennedy@vac-u-max.net">
								<cfinvokeargument name="form" value="#form#">
								<cfinvokeargument name="message" value="#message#">
								<cfinvokeargument name="date" value="#date#">
								<cfinvokeargument name="time" value="#time#">
								<cfinvokeargument name="section" value="vac">
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
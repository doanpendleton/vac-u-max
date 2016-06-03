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
	<title>VAC-U-MAX | Pulsonic Bin Activator RFQ</title>
	<meta name="description" content="">
	<cfinclude template="inc/head.cfm">
	<link href="css/chosen.min.css" rel="stylesheet" type="text/css">
</head>

<body>
	<cfinclude template="inc/top.cfm">

    <div id="homeCon" class="container">
		<div class="conIndent">
			<div class="row-fluid">
		    	<div id="inBan5" class="inBanner">
		    		<h1>Pulsonic Bin Activator RFQ</h1>
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
					<cfparam name="form.1_cname" default="">
					<cfparam name="form.1_tname" default="">
					<cfparam name="form.1_chem" default="">
					<cfparam name="form.1_man" default="">
					<cfparam name="form.2_density" default="">
					<cfparam name="form.2_units" default="">
					<cfparam name="form.3a_pellet" default="">
					<cfparam name="form.3a_gran" default="">
					<cfparam name="form.3a_pow" default="">
					<cfparam name="form.3a_flake" default="">
					<cfparam name="form.3a_hygro" default="">
					<cfparam name="form.3a_coh" default="">
					<cfparam name="form.3a_aer" default="">
					<cfparam name="form.3a_com" default="">
					<cfparam name="form.3b_arch" default="">
					<cfparam name="form.3b_bridge" default="">
					<cfparam name="form.3b_cling" default="">
					<cfparam name="form.3b_rath" default="">
					<cfparam name="form.3b_walls" default="">
					<cfparam name="form.3b_only" default="">
					<cfparam name="form.3b_and" default="">
					<cfparam name="form.3b_ft" default="">
					<cfparam name="form.3c_closed" default="">
					<cfparam name="form.3c_for" default="">
					<cfparam name="form.3c_min" default="">
					<cfparam name="form.3c_core" default="">
					<cfparam name="form.3_other" default="">
					<cfparam name="form.4_max" default="">
					<cfparam name="form.4_min" default="">
					<cfparam name="form.5_temp" default="">
					<cfparam name="form.5_units" default="">
					<cfparam name="form.6_demand" default="">
					<cfparam name="form.6_con" default="">
					<cfparam name="form.6_bag" default="">
					<cfparam name="form.6_hopper" default="">
					<cfparam name="form.6_ft" default="">
					<cfparam name="form.6_height" default="">
					<cfparam name="form.6_vert" default="">
					<cfparam name="form.6_dis" default="">
					<cfparam name="form.6_shape" default="">
					<cfparam name="form.6_valve" default="">
					<cfparam name="form.6_vib" default="">
					<cfparam name="form.6_other_a" default="">
					<cfparam name="form.6_other_b" default="">
					<cfparam name="form.7_power" default="">
					<cfparam name="form.8_nema" default="">
					<cfparam name="form.9_air" default="">
					<cfparam name="form.10_mat" default="">

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
								<h3>Please answer as many of the following questions as possible.</h3>
								<p><strong>1.</strong> What is the product?</p>
								<p>
									<label class="formLabel">Common Name</label>
									<input type="text" name="1_cname" id="1_cname" class="form">
								</p>
								<p>
									<label class="formLabel">Trade Name</label>
									<input type="text" name="1_tname" id="1_tname" class="form">
								</p>
								<p>
									<label class="formLabel">Chemical Name</label>
									<input type="text" name="1_chem" id="1_chem" class="form">
								</p>
								<p>
									<label class="formLabel">Manufactured By</label>
									<input type="text" name="1_man" id="1_man" class="form">
								</p>

								<div class="line clearfix"></div>
								<p>
									<label class="formLabel"><strong>2.</strong> Bulk Density</label>
									<input type="text" name="2_density" id="2_density">
									<select name="2_units" id="2_units">
										<option value="lb/cubic ft" selected>lb/cubic ft</option>
										<option value="g/cc">g/cc</option>
									</select>
								</p>

								<div class="line clearfix"></div>
								<p><strong>3.</strong> What are the major material characteristics? (Check all that apply.)</p>
								<p><label class="checkLabel2"><input type="checkbox" name="3a_pellet" id="3a_pellet" value="Pellet"> Pellet</label>
									<label class="checkLabel2"><input type="checkbox" name="3a_gran" id="3a_gran" value="Granular"> Granular</label>
									<label class="checkLabel2"><input type="checkbox" name="3a_pow" id="3a_pow" value="Powder"> Powder</label>
									<label class="checkLabel2"><input type="checkbox" name="3a_flake" id="3a_flake" value="Flake"> Flake</label>
									<label class="checkLabel2"><input type="checkbox" name="3a_hygro" id="3a_hygro" value="Hygroscopic"> Hygroscopic</label>
									<label class="checkLabel2"><input type="checkbox" name="3a_coh" id="3a_coh" value="Cohesive"> Cohesive</label>
									<label class="checkLabel2"><input type="checkbox" name="3a_aer" id="3a_aer" value="Aerates"> Aerates</label>
									<label class="checkLabel2"><input type="checkbox" name="3a_com" id="3a_com" value="Compacts"> Compacts</label>
								</p>
								<p>Product tends to:<br>
									<label class="checkLabel2"><input type="checkbox" name="3b_arch" id="3b_arch" value="Arch"> Arch</label>
									<label class="checkLabel2"><input type="checkbox" name="3b_bridge" id="3b_bridge" value="Bridge"> Bridge</label>
									<label class="checkLabel2"><input type="checkbox" name="3b_cling" id="3b_cling" value="Cling"> Cling</label>
									<label class="checkLabel2"><input type="checkbox" name="3b_rath" id="3b_rath" value="Rathole"> Rathole</label>
								</p>
								<p><label class="checkLabel2"><input type="checkbox" name="3b_walls" id="3b_walls" value="On Hopper Walls"> On Hopper Walls</label>
									<label class="checkLabel2"><input type="checkbox" name="3b_only" id="3b_only" value="Fills Hopper Only"> Fills Hopper Only</label>
									<label class="checkLabel2"><input type="checkbox" name="3b_and" id="3b_and" value="Fills Hopper and"> Fills Hopper and </label>
									<label class="inlineLabel"><input type="text" name="3b_ft" id="3b_ft" class="form2"> ft. above</label>
								</p>
								<p>Once Flowing Continues:<br>
									<label class="checkLabel2"><input type="checkbox" name="3c_closed" id="3c_closed" value="Until Discharge Closed"> Until Discharge Closed</label><br>
									<label class="checkLabel2"><input type="checkbox" name="3c_for" id="3c_for" value="For"> For</label>
									<label class="inlineLabel"><input type="text" name="3c_min" id="3c_min" class="form2"> Minutes and then Bridges</label><br>
									<label class="checkLabel2"><input type="checkbox" name="3c_core" id="3c_core" value="Once Flowing Continues Until Core Area is Empty with Walls Compacted">
									Until Core Area is Empty with Walls Compacted</label>
								</p>
								<p>Other:<br>
								<textarea name="3_other" id="3_other" class="form"></textarea></p>

								<div class="line clearfix"></div>
								<p><strong>4.</strong> Particle size range of product (Micron/Mesh Size):</p>
								<p>
									<label class="formLabel">Maximum Size</label>
									<input type="text" name="4_max" id="4_max"> inches
								</p>
								<p>
									<label class="formLabel">Minimum Size</label>
									<input type="text" name="4_min" id="4_min"> inches
								</p>

								<div class="line clearfix"></div>
								<p>
									<strong>5.</strong> Product Temperature
									<input type="text" name="5_temp" id="5_temp">
									<select name="5_units" id="5_units">
										<option value="&deg;F" selected>&deg;F</option>
										<option value="&deg;C">&deg;C</option>
									</select>
								</p>

								<div class="line clearfix"></div>
								<p><strong>6.</strong> Discharge</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="6_demand" id="6_demand" value="On Demand"> On Demand</label>
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="6_con" id="6_con" value="Continuous"> Continuous</label>
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="6_bag" id="6_bag" value="Small Bag Sample Can be Supplied on Request">
									Small Bag Sample Can be Supplied on Request</label>
								</p>
								<p>
									Hopper Shape
									<select name="6_hopper" id="6_hopper">
										<option value="Square" selected>Square</option>
										<option value="Round">Round</option>
										<option value="Rectangular">Rectangular</option>
									</select>
								</p>
								<p>
									<label class="formLabel">Ft Wide</label>
									<input type="text" name="6_ft" id="6_ft">
								</p>
								<p>
									<label class="formLabel">Hopper Height</label>
									<input type="text" name="6_height" id="6_height">
								</p>
								<p>
									<label class="formLabel">Vertical Section Height</label>
									<input type="text" name="6_vert" id="6_vert">
								</p>
								<p>
									<label class="formLabel">Discharge Size</label>
									<input type="text" name="6_dis" id="6_dis">
								</p>
								<p>
									Discharge Shape
									<label class="checkLabel"><input type="radio" name="6_shape" id="6_shape" value="Round"> Round</label>
									<input type="radio" name="6_shape" id="6_shape" value="Square"> Square</label>
								</p>
								<p>
									Type of Discharge Valve<br>
									<textarea name="6_valve" id="6_valve" class="form"></textarea>
								</p>
								<p>
									Present Method:<br>
									<label class="checkLabel"><input type="checkbox" name="6_vib" id="6_vib" value="Vibrator"> Vibrator</label>
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="6_other_a" id="6_other_a" value="Other"> Other</label>
								</p>
								<p>
									Make/Modal, Description, or Comments:<br>
									<textarea name="6_other_b" id="6_other_b" class="form"></textarea>
								</p>

								<div class="line clearfix"></div>
								<p><strong>7.</strong> What power is available in plant?</p>
								<p>
									<textarea name="7_power" id="7_power" class="form"></textarea>
								</p>

								<div class="line clearfix"></div>
								<p><strong>8.</strong> NEMA Rating of Electrical Enclosure?</p>
								<p>
									<textarea name="8_nema" id="8_nema" class="form"></textarea>
								</p>

								<div class="line clearfix"></div>
								<p><strong>9.</strong> How much plant compressed air will be available? (CFM Required HP Compressor)</p>
								<p>
									<textarea name="9_air" id="9_air" class="form"></textarea>
								</p>

								<div class="line clearfix"></div>
								<p><strong>10.</strong> Do you require a specific construction material for components (Tanks & Injectors)?</p>
								<p>
									<textarea name="10_mat" id="10_mat" class="form"></textarea>
								</p>

								<div class="line clearfix"></div>
								<p><strong>Equipment Layout</strong><br>
								Upload a diagram of the relative position of equipment to be served by the conveying system.  Indicate material entry and exit points for each piece of equipment.  If familiar with pneumatic conveying, please add your concept of system components and their possible location.  Indicate distances and elevations between various pieces of equipment wherever possible.</p>
								<p><input type="file" name="upload" id="upload" class="form"></p>

								<p>
									<div class="g-recaptcha" data-sitekey="#creds.siteKey#"></div>
								</p>
								<p>
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
							<cfset destination = expandPath("./userfiles/pulsonics")>

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
								<h3>1 - The Product</h3>
								<strong>Common Name</strong>: #form.1_cname#<br>
								<strong>Trade Name</strong>: #form.1_tname#<br>
								<strong>Chemical Name</strong>: #form.1_chem#<br>
								<strong>Manufactured By</strong>: #form.1_man#<br>
								<br>
								<h3>2 - Bulk Density</h3>
								<cfif form.2_density neq "">#form.2_density# #form.2_units#<br></cfif>
								<br>
								<h3>3 - Major characteristics of the product.</h3>
								<cfif form.3a_pellet neq "">#form.3a_pellet#<br></cfif>
								<cfif form.3a_gran neq "">#form.3a_gran#<br></cfif>
								<cfif form.3a_pow neq "">#form.3a_pow#<br></cfif>
								<cfif form.3a_flake neq "">#form.3a_flake#<br></cfif>
								<cfif form.3a_hygro neq "">#form.3a_hygro#<br></cfif>
								<cfif form.3a_coh neq "">#form.3a_coh#<br></cfif>
								<cfif form.3a_aer neq "">#form.3a_aer#<br></cfif>
								<cfif form.3a_com neq "">#form.3a_com#<br></cfif>
								<strong>Product tends to</strong>:<br>
								<cfif form.3b_arch neq "">#form.3b_arch#<br></cfif>
								<cfif form.3b_bridge neq "">#form.3b_bridge#<br></cfif>
								<cfif form.3b_cling neq "">#form.3b_cling#<br></cfif>
								<cfif form.3b_rath neq "">#form.3b_rath#<br></cfif>
								<cfif form.3b_walls neq "">#form.3b_walls#<br></cfif>
								<cfif form.3b_only neq "">#form.3b_only#<br></cfif>
								<cfif form.3b_and neq "">#form.3b_and# #form.3b_ft# ft. above<br></cfif>
								<strong>Once flowing continues</strong>:<br>
								<cfif form.3c_closed neq "">#form.3c_closed#<br></cfif>
								<cfif form.3c_for neq "">#form.3c_for# #form.3c_min# Minutes and then Bridges<br></cfif>
								<cfif form.3c_core neq "">#form.3c_core#<br></cfif>
								<cfif form.3_other neq "">Other: #form.3_other#<br></cfif>
								<br>
								<h3>4 - Particle size range of product. (Micron/Mesh Size in inches)</h3>
								<strong>Maximum Size</strong>: #form.4_max#<br>
								<strong>Minimum Size</strong>: #form.4_min#<br>
								<br>
								<h3>5 - Product Temperature:</h3>
								<cfif form.5_temp neq "">#form.5_temp# #form.5_units#<br></cfif>
								<br>
								<h3>6 - Discharge</h3>
								<cfif form.6_demand neq "">#form.6_demand#<br></cfif>
								<cfif form.6_con neq "">#form.6_con#<br></cfif>
								<cfif form.6_bag neq "">#form.6_bag#<br></cfif>
								<strong>Hopper Shape</strong>: #form.6_hopper#<br>
								<strong>Feet Wide</strong>: #form.6_ft#<br>
								<strong>Hopper Height</strong>: #form.6_height#<br>
								<strong>Vertical Section Height</strong>: #form.6_vert#<br>
								<strong>Discharge Size</strong>: #form.6_dis#<br>
								<strong>Discharge Shape</strong>: #form.6_shape#<br>
								<strong>Discharge Valve</strong>: #form.6_valve#<br>
								<br>
								<strong>Present Method</strong>:<br>
								<cfif form.6_vib neq "">#form.6_vib#<br></cfif>
								<cfif form.6_other_a neq "">#form.6_other_b#<br></cfif>
								<strong>Make/Modal, Description, or Comments</strong>#form.6_other_b#<br>
								<br>
								<h3>7 - Available Power in Plant:</h3>
								<cfif form.7_power neq "">#form.7_power#<br></cfif>
								<br>
								<h3>8 - 8. NEMA Rating of Electrical Enclosure:</h3>
								<cfif form.8_nema neq "">#form.8_nema#<br></cfif>
								<br>
								<h3>9 - Available Compressed Air:</h3>
								<cfif form.9_air neq "">#form.9_air#<br></cfif>
								<br>
								<h3>10 - Specific Construction Material:</h3>
								<cfif form.10_mat neq "">#form.10_mat#<br></cfif>
								<br>
								<cfif isDefined("diagram")><a href="../userfiles/pulsonics/#diagram#" target="_blank">#diagram#</a></cfif>
							</cfsavecontent>

							<cfinvoke component="#application.components#.formProcessing" method="process">
								<cfinvokeargument name="subject" value="VAC-U-MAX Pulsonic Bin Activator RFQ Form">
								<cfinvokeargument name="formName" value="Pulsonic Bin Activators">
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
								<cfhttpparam type="formField" name="Division__c" value="Pulsonics-03">
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
<cfprocessingdirective pageEncoding="utf-8">
<cfinvoke
	component="#application.components#.queryController"
	method="rfq"
	returnVariable="rfq">
	<cfinvokeargument name="section" value="vacuum">
</cfinvoke>
<cfparam name="form.pass" default="false">
<cfscript>
	creds = {'siteKey'=application.reCaptchaSite, 'secret'=application.reCaptchaSecret};

	// ReCAPTCHA supports 40+ languages listed at: https://developers.google.com/recaptcha/docs/language
	lang = 'en';

	// The response from ReCAPTCHA
	if (StructKeyExists(form, 'g-recaptcha-response') && not form.pass) {
	  reCaptcha = new cfc.reCaptcha(creds.secret);
	  resp = reCaptcha.verifyResponse(response=form['g-recaptcha-response'], remoteip=cgi.remote_addr);
	}
</cfscript>
<!DOCTYPE html>
<html>
<head>
	<title>VAC-U-MAX | Vacuum Cleaning RFQ</title>
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
		    		<h1>Vacuum Cleaning RFQ</h1>
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
					<cfparam name="form.1_learn" default="">
					<cfparam name="form.2_floor" default="">
					<cfparam name="form.2_over" default="">
					<cfparam name="form.2_machine" default="">
					<cfparam name="form.2_sump" default="">
					<cfparam name="form.2_walls" default="">
					<cfparam name="form.3_broom" default="">
					<cfparam name="form.3_shop" default="">
					<cfparam name="form.3_oth" default="">
					<cfparam name="form.4_debris" default="">
					<cfparam name="form.4_density" default="">
					<cfparam name="form.4_unit" default="">
					<cfparam name="form.4_exp" default="">
					<cfparam name="form.4_abr" default="">
					<cfparam name="form.5_port" default="">
					<cfparam name="form.5_comp" default="">
					<cfparam name="form.5_three" default="">
					<cfparam name="form.5_single" default="">
					<cfparam name="form.5_stat" default="">
					<cfparam name="form.5_class" default="">
					<cfparam name="form.5_div" default="">
					<cfparam name="form.5_group" default="">
					<cfparam name="form.5_points" default="">
					<cfparam name="form.5_concur" default="">
					<cfparam name="form.5_hose" default="">
					<cfparam name="form.5_horiz" default="">
					<cfparam name="form.5_vert" default="">
					<cfparam name="form.6_drum" default="">
					<cfparam name="form.6_self" default="">
					<cfparam name="form.6_bulk" default="">
					<cfparam name="form.6_fib" default="">
					<cfparam name="form.6_review" default="">
					<cfparam name="form.7_details" default="">

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

							<cfif isDefined("errors")>
								<div id="errors">
									<p><b>Correct these errors:<br></b>#errors#</p>
								</div>
							</cfif>

							<form action="#cgi.script_name#" method="post" id="form">
								<p>Fields designated with an asterisk (<span class="ast">*</span>) are required.<br><br></p>
								<p>
									<label class="formLabel">Interested In</label>
									<select name="prod" id="prod" class="form chosen">
										<option value="">- Select Product -</option>
										<cfloop query="rfq">
										<option value="#rfq.v_item# - #rfq.v_title#"<cfif rfq.v_item eq url.prod> selected</cfif>>#rfq.v_title# (#rfq.v_item#)</option>
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
								<p><strong>1.</strong> How did you learn about VAC-U-MAX?</p>
								<p><textarea name="1_learn" id="1_learn" class="form"></textarea></p>

								<div class="line clearfix"></div>
								<p><strong>2.</strong> What do you want to clean?</p>
								<table class="rfqForm">
									<tr>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="2_floor" id="2_floor" value="Floors">
										Floors</label></td>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="2_over" id="2_over" value="Overhead Pipes, Cabletrays, Roof Supports">
										Overhead Pipes, Cabletrays, Roof Supports</label></td>
									</tr>
									<tr>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="2_machine" id="2_machine" value="Machinery">
										Machinery</label></td>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="2_sump" id="2_sump" value="Sumps or Tanks">
										Sumps or Tanks</label></td>
									</tr>
									<tr>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="2_walls" id="2_walls" value="Walls">
										Walls</label></td>
										<td valign="top">&nbsp;</td>
									</tr>
								</table>

								<div class="line clearfix"></div>
								<p><strong>3.</strong> How do you clean now?</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="3_broom" id="3_broom" value="Brooms / Shovels">
									Brooms / Shovels</label>
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="3_shop" id="3_shop" value="Shop Type Vacuums">
									Shop Type Vacuums</label>
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="3_oth" id="3_oth" value="Other">
									Other</label>
								</p>

								<div class="line clearfix"></div>
								<p><strong>4.</strong> Describe you debris:</p>
								<p>
									<label class="formLabel">Name of Debris</label>
									<input type="text" name="4_debris" id="4_debris">
								</p>
								<p>
									<label class="formLabel">Bulk Density</label>
									<input type="text" name="4_density" id="4_density">
									<select name="4_unit" id="4_unit">
										<option value="lbs/ft<sup>3</sup>" selected>lbs/ft<sup>3</sup></option>
										<option value="g/cc">g/cc</option>
									</select>
								</p>
								<p>
									Explosion Hazard
									<label class="checkLabel"><input type="radio" name="4_exp" id="4_exp" value="Yes"> Yes</label>
									<label class="checkLabel"><input type="radio" name="4_exp" id="4_exp" value="No"> No</label>
								</p>
								<p>
									Abrasive
									<label class="checkLabel"><input type="radio" name="4_abr" id="4_abr" value="Yes"> Yes</label>
									<label class="checkLabel"><input type="radio" name="4_abr" id="4_abr" value="No"> No</label>
								</p>

								<div class="line clearfix"></div>
								<p><strong>5.</strong> What type of cleaning system are you looking for?</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="5_port" id="5_port" value="Portable Systems">
									Portable Systems</label>
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="5_comp" id="5_comp" value="Compressed Air Powered">
									Compressed Air Powered</label>
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="5_three" id="5_three" value="Electric 3 Phase">
									Electric 3 Phase</label>
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="5_single" id="5_single" value="Electric Single Phase">
									Electric Single Phase</label>
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="5_stat" id="5_stat" value="Stationary / Central System">
									Stationary / Central System</label>
								</p>
								<p>Electric Area Classification</p>
								<p>
									<label class="formLabel">Class</label>
									<input type="text" name="5_class" id="5_class">
								</p>
								<p>
									<label class="formLabel">Division</label>
									<input type="text" name="5_div" id="5_div">
								</p>
								<p>
									<label class="formLabel">Group</label>
									<input type="text" name="5_group" id="5_group">
								</p>
								<p>
									## of Pick-up Points
									<input type="text" name="5_points" id="5_points" class="form2">
								</p>
								<p>
									## of Pick-up Points to be used at one time
									<input type="text" name="5_concur" id="5_concur" class="form2">
								</p>
								<p>
									Requested Hose Size
									<label class="checkLabel"><input type="radio" name="5_hose" id="5_hose" value="1.5&quot;"> 1.5&quot;</label>
									<label class="checkLabel"><input type="radio" name="5_hose" id="5_hose" value="2.0&quot;"> 2.0&quot;</label>
									<label class="checkLabel"><input type="radio" name="5_hose" id="5_hose" value="2.5&quot;"> 2.5&quot;</label>
								</p>
								<p>
									Longest Tubing Run from Vac
									<label class="inlineLabel"><input type="text" name="5_horiz" id="5_horiz" class="form2"> ft. horiz</label>
									<label class="inlineLabel"><input type="text" name="5_vert" id="5_vert" class="form2"> ft. vert</label>
								</p>

								<div class="line clearfix"></div>
								<p><strong>6.</strong> What is the best collection container for your facility?</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="6_drum" id="6_drum" value="50/55g Steel drum">
									50/55g Steel drum</label>
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="6_self" id="6_self" value="Self-Dump Forkliftable Hopper">
									Self-Dump Forklift-able Hopper</label>
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="6_bulk" id="6_bulk" value="Bulk Bag">
									Bulk Bag</label>
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="6_fib" id="6_fib" value="Fiber Drum or Customer-Supplied Container">
									Fiber Drum or Customer-Supplied Container</label>
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="6_review" id="6_review" value="Review Debris to My Process">
									Return Debris to My Process</label>
								</p>

								<div class="line clearfix"></div>
								<p><strong>7.</strong> Please add any other details that are not described above:</p>
								<p><textarea name="7_details" id="7_details" class="form"></textarea></p>

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
								<h3>1 - Learned about VAC-U-MAX</h3>
								#form.1_learn#<br>
								<br>
								<h3>2 - Wants to clean.</h3>
								<cfif form.2_floor neq "">#form.2_floor#<br></cfif>
								<cfif form.2_over neq "">#form.2_over#<br></cfif>
								<cfif form.2_machine neq "">#form.2_machine#<br></cfif>
								<cfif form.2_sump neq "">#form.2_sump#<br></cfif>
								<cfif form.2_walls neq "">#form.2_walls#<br></cfif>
								<br>
								<h3>3 - Currently cleans with:</h3>
								<cfif form.3_broom neq "">#form.3_broom#<br></cfif>
								<cfif form.3_shop neq "">#form.3_shop#<br></cfif>
								<cfif form.3_oth neq "">#form.3_oth#<br></cfif>
								<br>
								<h3>4 - Debris Description</h3>
								<strong>Name of Debris</strong>: #form.4_debris#<br>
								<strong>Bulk Density</strong>: <cfif form.4_density neq "">#form.4_density# #form.4_unit#</cfif><br>
								<strong>Explosion Hazard</strong>: <cfif form.4_exp neq "">#form.4_exp#<cfelse>No</cfif><br>
								<strong>Abrasive</strong>: <cfif form.4_abr neq "">#form.4_abr#<cfelse>No</cfif><br>
								<br>
								<h3>5 - Type of cleaning system:</h3>
								<cfif form.5_port neq "">#form.5_port#<br></cfif>
								<cfif form.5_comp neq "">#form.5_comp#<br></cfif>
								<cfif form.5_three neq "">#form.5_three#<br></cfif>
								<cfif form.5_single neq "">#form.5_single#<br></cfif>
								<cfif form.5_stat neq "">#form.5_stat#<br></cfif>
								<br>
								<strong>Electrical Classification</strong><br>
								<strong>Class</strong>: #form.5_class#<br>
								<strong>Division</strong>: #form.5_div#<br>
								<strong>Group</strong>: #form.5_group#<br>
								<strong>## of Pick-up Points</strong>: #form.5_points#<br>
								<strong>## of Pick-up Points to be used at one time</strong>: #form.5_concur#<br>
								<strong>Requested Hose Size</strong>: #form.5_hose#<br>
								<strong>Longest Tubing Run</strong>: <cfif form.5_horiz neq "">#form.5_horiz# ft. horiz</cfif> <cfif form.5_vert neq "">#form.5_vert# ft. vert</cfif><br>
								<br>
								<h3>6 - Best collection container for facility</h3>
								<cfif form.6_drum neq "">#form.6_drum#<br></cfif>
								<cfif form.6_self neq "">#form.6_self#<br></cfif>
								<cfif form.6_bulk neq "">#form.6_bulk#<br></cfif>
								<cfif form.6_fib neq "">#form.6_fib#<br></cfif>
								<cfif form.6_review neq "">#form.6_review#<br></cfif>
								<br>
								<h3>7 - Other Details</h3>
								#form.7_details#
							</cfsavecontent>

							<cfinvoke component="#application.components#.formProcessing" method="process">
								<cfinvokeargument name="subject" value="VAC-U-MAX Vacuum Cleaning RFQ Form">
								<cfinvokeargument name="formName" value="Vacuum Cleaning">
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
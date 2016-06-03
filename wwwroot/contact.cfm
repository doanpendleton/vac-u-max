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
	<title>VAC-U-MAX | Contact</title>
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
		    		<h1>Contact</h1>
		    		<div class="clearfix"></div>
		    	</div><!--- inBanner --->
			</div><!--- row-fluid --->

	    	<div class="row-fluid">
	    		<div id="prodCon" class="span9 well">
	    			<div class="span3">
		    			<h3>Location</h3>
		    			<p>69 William Street,<br>
		    			Belleville, NJ 07109</p>

		    			<h3>Phone</h3>
		    			<p>800-822-8629<br>
		    			973-759-4600</p>
	    			</div>

	    			<div class="span9">
	    				<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3020.976763097101!2d-74.152266!3d40.784524999999995!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c255b6bb555b23%3A0x7210047d571fc168!2sVac+U+Max!5e0!3m2!1sen!2sus!4v1402599057322" width="100%" height="300" frameborder="0" style="border:0"></iframe>
	    			</div>

	    			<cfset showForm = true>
	    			<cfparam name="resp.success" default="false">
	    			<cfparam name="form.prod" default="">
					<cfparam name="form.fn" default="">
					<cfparam name="form.ln" default="">
					<cfparam name="form.co" default="">
					<cfparam name="form.ph" default="">
					<cfparam name="form.fax" default="">
					<cfparam name="form.email" default="">
					<cfparam name="form.ad1" default="">
					<cfparam name="form.ad2" default="">
					<cfparam name="form.ci" default="">
					<cfparam name="form.st" default="">
					<cfparam name="form.zip" default="">
					<cfparam name="form.cou" default="">
					<cfparam name="form.com" default="">

					<cfif StructKeyExists(form, 'g-recaptcha-response')>
						<cfset errors = "">

						<cfif not len(trim(form.prod))>
							<cfset errors = errors & "Please select an interest.<br>">
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
							<cfset errors = errors & "Please select your country.<br>">
						</cfif>
                                                <cfif not len(trim(form.st))>
							<cfset errors = errors & "Please select your state.<br>">
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

							<h3>Fill out the form and we'll get back to you as soon as we can.</h3>

							<cfif isDefined("errors")>
							<div id="errors">
								<p><b>Correct these errors:<br></b>#errors#</p>
							</div>
							</cfif>

							<form action="#cgi.script_name#" method="post" id="form">
								<p>Fields designated with an asterisk (<span class="ast">*</span>) are required.</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Interested In</label>
									<select name="prod" id="prod" class="form chosen">
										<option value="">-- Select an Interest --</option>
										<option value="Vacuum Conveying Systems">Vacuum Conveying Systems</option>
										<option value="Industrial Vacuum Cleaners">Industrial Vacuum Cleaners</option>
										<option value="Flexible Screw Conveyors">Flexible Screw Conveyors</option>
										<option value="Central Vacuum Systems">Central Vacuum Cleaning Systems</option>
										<option value="Aeromechanical Conveyors">Aeromechanical Conveyors</option>
										<option value="Spare Parts">Spare Parts</option>
										<option value="Material Test"<cfif isDefined("url.test")> selected</cfif>>Material Test</option>
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
									<select name="st" id="st" class="form chosen" onchange="document.getElementById('send').disabled=false;">
										<option value="">-- Select State --</option>
                                                                                <cfinclude template="states.cfm">
									</select>
								</p>
								<p>
									<label class="formLabel">Comments</label>
									<textarea name="com" id="com" class="form">#form.com#</textarea>
								</p>
								<p>
									<div class="g-recaptcha" data-sitekey="#creds.siteKey#"></div>
								</p>
								<p>
									<input type="hidden" name="pass" value="false">
									<input name="send" type="submit" id="send" value="Submit" disabled="true" >
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
								<strong>Name</strong>: #form.fn# #form.ln#<br>
								<strong>Company</strong>: #form.co#<br>
								<strong>Phone</strong>: #form.ph#<br>
								<cfif form.fax neq ""><strong>Fax</strong>: #form.fax#<br></cfif>
								<strong>Email</strong>: #form.email#<br>
								<strong>Address</strong>:<br>
								#form.ad1#<br>
								<cfif form.ad2 neq "">#form.ad2#<br></cfif>
								#form.ci#<cfif form.st neq "">, #form.st#</cfif> #form.zip#<br>
								#form.cou#<br>
								<br>
								<strong>Comments</strong><br>
								#form.com#
							</cfsavecontent>

							<cfinvoke component="#application.components#.formProcessing" method="process">
								<cfinvokeargument name="subject" value="VAC-U-MAX General Contact Form">
								<cfinvokeargument name="formName" value="General Contact">
								<cfinvokeargument name="to" value="sales@vac-u-max.net">
								<cfinvokeargument name="cc" value="Doan Pendleton <doanpendleton@vac-u-max.net>, David Kennedy <davidkennedy@vac-u-max.net>">
								<cfinvokeargument name="form" value="#form#">
								<cfinvokeargument name="message" value="#message#">
								<cfinvokeargument name="date" value="#date#">
								<cfinvokeargument name="time" value="#time#">
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
								<cfhttpparam type="formField" name="description" value="#form.com#">
								<cfhttpparam type="formField" name="oid" value="00Do0000000IYWJ">
								<cfhttpparam type="formField" name="retURL" value="http://www.vac-u-max.com/">
								<cfhttpparam type="formField" name="lead_source" value="Web">
								<cfhttpparam type="formField" name="rating" value="Unknown">
								<cfhttpparam type="formField" name="Campaign_ID" value="701o00000001BzT">
								<cfhttpparam type="formField" name="member_status" value="Submitted">
							</cfhttp>
						</cfoutput>
					</cfif>
	    		</div>

	    		<cfinclude template="inc/sideNews.cfm">
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
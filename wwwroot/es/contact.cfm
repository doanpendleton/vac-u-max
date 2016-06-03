<cfprocessingdirective pageEncoding="utf-8">
<cfparam name="form.pass" default="false">
<cfscript>
	creds = {'siteKey'=application.reCaptchaSite, 'secret'=application.reCaptchaSecret};

	// ReCAPTCHA supports 40+ languages listed at: https://developers.google.com/recaptcha/docs/language
	lang = 'es';

	// The response from ReCAPTCHA
	if ( StructKeyExists(form, 'g-recaptcha-response') && not form.pass ) {
	  reCaptcha = new cfc.reCaptcha(creds.secret);
	  resp = reCaptcha.verifyResponse(response=form['g-recaptcha-response'], remoteip=cgi.remote_addr);
	}
</cfscript>
<!DOCTYPE html>
<html>
<head>
	<title>VAC-U-MAX | Contacto</title>
	<meta name="description" content="">
	<cfinclude template="../inc/head.cfm">
	<link href="<cfoutput>#application.css#</cfoutput>chosen.min.css" rel="stylesheet" type="text/css">
</head>

<body>
	<cfinclude template="inc/top.cfm">

    <div id="homeCon" class="container">
		<div class="conIndent">
			<div class="row-fluid">
		    	<div id="inBan1" class="inBanner">
		    		<h1>Contacto</h1>
		    		<div class="clearfix"></div>
		    	</div><!--- inBanner --->
			</div><!--- row-fluid --->

	    	<div class="row-fluid">
	    		<div id="prodCon" class="span9 well">
	    			<div class="span3">
		    			<h3>Dirección</h3>
		    			<p>69 William Street,<br>
		    			Belleville, NJ 07109</p>

		    			<h3>Teléfono</h3>
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

	    			<cfif isDefined("form.send")>
		    			<cfset errors = "">

		    			<cfif not len(trim(form.prod))>
			    			<cfset errors = errors & "Seleccione un interés.<br>">
			    		</cfif>
						<cfif not len(trim(form.fn))>
							<cfset errors = errors & "Ingrese su nombre.<br>">
						</cfif>
						<cfif not len(trim(form.ln))>
							<cfset errors = errors & "Ingrese su apellido.<br>">
						</cfif>
						<cfif not len(trim(form.ph))>
							<cfset errors = errors & "Ingrese su número de teléfono.<br>">
						</cfif>
						<cfif not len(trim(form.email))>
							<cfset errors = errors & "Ingrese una dirección de correo electrónico válida.<br>">
						</cfif>
						<cfif not len(trim(form.ad1))>
							<cfset errors = errors & "Ingrese su dirección postal.<br>">
						</cfif>
						<cfif not len(trim(form.ci))>
							<cfset errors = errors & "Ingrese su ciudad.<br>">
						</cfif>
						<cfif not len(trim(form.zip))>
							<cfset errors = errors & "Ingrese su código postal.<br>">
						</cfif>
						<cfif not len(trim(form.cou))>
							<cfset errors = errors & "Seleccione su país.<br>">
						</cfif>
						<cfif isDefined("resp.errorCodes")>
							<cfif not resp.success && resp.errorCodes[1] eq "missing-input-response">
						        <cfset errors = errors & "Por favor complete el reCAPTCHA.<br>">
						    </cfif>
							<cfif not resp.success && resp.errorCodes[1] neq "missing-input-response">
						        <cfset errors = errors & "Lo sentimos, su presentación fue bloqueada porque es más probable spam.<br>">
						    </cfif>
						</cfif>

						<cfif errors is "">
							<!--- do something here --->
							<cfset showForm = false>
						</cfif>
					</cfif>

					<cfif showForm>
						<cfoutput>

							<h3>Complete el formulario y nos pondremos en contacto con usted tan pronto como nos sea posible.</h3>

							<cfif isDefined("errors")>
								<div id="errors">
									<p><b>Corrija estos errores:<br></b>#errors#</p>
								</div>
							</cfif>

							<form action="#cgi.script_name#" method="post" id="form">
								<p>Los campos identificados con un asterisco (<span class="ast">*</span>) son obligatorios.</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Interesado en</label>
									<select name="prod" id="prod" class="form chosen">
										<option value="">-- Seleccione un interés --</option>
										<option value="Vacuum Conveying Systems">Sistemas de transporte mediante aspiración</option>
										<option value="Industrial Vacuum Cleaners">Aspiradoras industriales</option>
										<option value="Flexible Screw Conveyors">Transportadores de tornillos flexibles</option>
										<option value="Central Vacuum Systems">Sistemas de limpieza mediante aspiración centralizada</option>
										<option value="Aeromechanical Conveyors">Transportadores aeromecánicos</option>
										<option value="Spare Parts">Repuestos</option>
									</select>
								</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Nombre</label>
									<input type="text" name="fn" id="fn" class="form">
								</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Apellido</label>
									<input type="text" name="ln" id="ln" class="form">
								</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Nombre de la empresa</label>
									<input type="text" name="co" id="co" class="form">
								</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Teléfono</label>
									<input type="text" name="ph" id="ph" class="form">
								</p>
								<p>
									<label class="formLabel">Fax</label>
									<input type="text" name="fax" id="fax" class="form">
								</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Correo electrónico</label>
									<input type="text" name="email" id="email" class="form">
								</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Calle</label>
									<input type="text" name="ad1" id="ad1" class="form">
								</p>
								<p>
									<label class="formLabel">&nbsp;</label>
									<input type="text" name="ad2" id="ad2" class="form">
								</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Ciudad</label>
									<input type="text" name="ci" id="ci" class="form">
								</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Código postal</label>
									<input type="text" name="zip" id="zip" class="form" size="10">
								</p>
								<p>
									<cfinvoke component="#application.components#.queryController"
										method="countryList"
										returnVariable="cl">
									</cfinvoke>
									<label class="formLabel"><span class="ast">*</span>País</label>
									<select name="cou" id="cou" class="form chosen">
										<option value="">-- Seleccione un país --</option>
										<option value="US">Estados Unidos</option>
										<cfloop query="cl">
											<option value="#cl.code#">#cl.country#</option>
										</cfloop>
									</select>
								</p>
								<p id="state" >
									<label class="formLabel"><span class="ast">*</span>Estado/Provincia</label>
									<select name="st" id="st" class="form chosen">
										<option value="">-- Seleccione un estado --</option>
                                                                                <cfinclude template="../states.cfm">
									</select>
								</p>
								<p>
									<label class="formLabel">Comentarios</label> <textarea name="com" id="com" class="form"></textarea>
								</p>

								<p>
									<div class="g-recaptcha" data-sitekey="#creds.siteKey#"></div>
								</p>
								<p>
									<input name="send" type="submit" id="send" value="Enviar">
								</p>
							</form>
						</cfoutput>

					<cfelse>

						<cfoutput>
							<h3>Gracias por el mensaje.</h3>
							<p>Hemos recibido su mensaje y nos pondremos en contacto con usted tan pronto como nos sea posible.</p>

							<cfset date = DateFormat(Now(), 'yyyy-mm-dd')>
							<cfset time = TimeFormat(Now(), 'HH:mm:ss')>

							<cfsavecontent variable="message"> #date#<br>
								<strong>Interesado en</strong>: #form.prod#<br>
								<strong>Nombre</strong>: #form.fn# #form.ln#<br>
								<strong>Empresa</strong>: #form.co#<br>
								<strong>Teléfono</strong>: #form.ph#<br>
								<cfif form.fax neq ""><strong>Fax</strong>: #form.fax#<br></cfif> <strong>Correo electrónico</strong>: #form.email#<br>
								<strong>Dirección</strong>:<br>
								#form.ad1#<br>
								<cfif form.ad2 neq "">#form.ad2#<br></cfif> #form.ci#<cfif form.st neq "">, #form.st#</cfif> #form.zip#<br>
								#form.cou#<br>
								<br>
								<strong>Comentarios</strong><br>
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
								<cfhttpparam type="formField" name="retURL" value="http://www.vac-u-max.com/es/">
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
    <cfinclude template="../inc/scripts.cfm">
    <cfoutput>
		<script src="#application.js#jquery.validate.min.js"></script>
		<script src="#application.js#chosen.jquery.min.js"></script>
	</cfoutput>
	<script>
		$(document).ready(function() {
			function updateStates() {
				var c = $('#cou').val();

				$.ajax({
					type: 'POST',
					url: '../inc/getStates.cfm',
					data: { country: c },
					success: function(response){
						if (c !== null && $(response).find('list').text() === 'true') {
							$('#st').html('');
							$('#st').append('<option value="">-- Select State --</option>');
							$(response).find('state').each(function(){
								var abbr = $(this).find('abbr').text();
								var name = $(this).find('name').text();
								$('#st').append('<option value="' + abbr + '">' + name + '</option>');
							});
							$('#state').removeClass('hidden');
							$('#st').chosen();
							$('#st').trigger('chosen:updated');
							$('#st').rules('add', {
								required: true,
								messages: {
									required: 'Ingrese su estado/provincia.',
								}
							});
							if (c == 'US') {
								$('#zip').rules('add', {
									number: true,
									messages: {
										required: 'Su código postal debe contener sólo números.',
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
			$('#cou').chosen(updateStates());
			$('#cou').on('change', function(e, c) {
				updateStates();
			});

			$("#form").validate({
				ignore: [],
				errorPlacement: function(error, element) {
					 error.appendTo(element.parent());
				},
				rules: {
					prod: "required",
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
					cou: "required",
					captcha: {
						required: true,
						remote: {
							url: "../inc/capCheck.cfm",
							type: "post",
							data: {
								capCheck: function() {
								return $( "#captcha_check" ).val();
								}
							}
						}
					}
				},
				messages: {
					prod: "Seleccione un interés.",
					fn: "Ingrese su nombre.",
					ln: "Ingrese su apellido.",
					ph: "Ingrese su número de teléfono.",
					email: "Ingrese una dirección de correo electrónico válida.",
					ad1: "Ingrese su dirección postal.",
					ci: "Ingrese su ciudad.",
					zip: "Ingrese su código postal.",
					cou: "Seleccione su país.",
					captcha: "Ingrese o corrija el texto de la imagen."
				},
				submitHandler: function(form) {
					form.submit();
				}
			});

			var validator = $("#form").data('validator');
			validator.settings.ignore = ":hidden:not(select)";

			$('.chosen').on("change", function(evt, params) {
			    $(evt.target).valid();
			});
		});
	</script>
</body>
</html>
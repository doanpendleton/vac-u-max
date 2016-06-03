<cfprocessingdirective pageEncoding="utf-8">
<cfinvoke
	component="#application.components#.queryController"
	method="rfq"
	returnVariable="rfq">
	<cfinvokeargument name="section" value="vacuum">
	<cfinvokeargument name="spanish" value="true">
</cfinvoke>
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
	<title>VAC-U-MAX | Solicitud de cotización de aspiradoras</title>
	<meta name="description" content="">
	<cfinclude template="../inc/head.cfm">
	<link href="<cfoutput>#application.css#</cfoutput>chosen.min.css" rel="stylesheet" type="text/css">
</head>

<body>
	<cfinclude template="inc/top.cfm">

    <div id="homeCon" class="container">
		<div class="conIndent">
			<div class="row-fluid">
		    	<div id="inBan2" class="inBanner">
		    		<h1>Solicitud de cotización de aspiradoras</h1>
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
		    				<cfset errors = errors & "Ingrese el nombre de su empresa.<br>">
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
		    				<cfset errors = errors & "Ingrese su ciudad.<br>">
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

							<h2>Solicitud de cotización</h2>
							<p>Complete el formulario y haga clic en el botón Enviar en la parte inferior de este. Una vez que analicemos su solicitud de cotización, nos pondremos en contacto con usted.</p>

							<cfif isDefined("errors")>
								<div id="errors">
									<p><b>Corrija estos errores:<br></b>#errors#</p>
								</div>
							</cfif>

							<form action="#cgi.script_name#" method="post" id="form">
								<p>Los campos identificados con un asterisco (<span class="ast">*</span>) son obligatorios.<br><br></p>
								<p>
									<label class="formLabel">Interesado en</label>
									<select name="prod" id="prod" class="form chosen">
										<option value="">- Seleccione un producto -</option>
										<cfloop query="rfq">
											<option value="#rfq.v_item# - #rfq.v_title#"<cfif rfq.v_item eq url.prod> selected</cfif>>#rfq.v_title# (#rfq.v_item#)</option>
										</cfloop>
									</select>
								</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Empresa</label>
									<input type="text" name="co" id="co" class="form">
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
									<label class="formLabel"><span class="ast">*</span>Dirección</label>
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

								<div class="line clearfix"></div>
								<p><strong>1.</strong> ¿Cómo se enteró acerca de VAC-U-MAX?</p>
								<p><textarea name="1_learn" id="1_learn" class="form"></textarea></p>

								<div class="line clearfix"></div>
								<p><strong>2.</strong> ¿Qué es lo que quiere limpiar?</p>
								<table class="rfqForm">
									<tr>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="2_floor" id="2_floor" value="Floors"> Pisos</label></td>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="2_over" id="2_over" value="Overhead Pipes, Cabletrays, Roof Supports"> Tubos aéreos, bandejas portacables, soportes de techo</label></td>
									</tr>
									<tr>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="2_machine" id="2_machine" value="Machinery"> Maquinaria</label></td>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="2_sump" id="2_sump" value="Sumps or Tanks"> Sumideros o tanques</label></td>
									</tr>
									<tr>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="2_walls" id="2_walls" value="Walls"> Paredes</label></td>
										<td valign="top">&nbsp;</td>
									</tr>
								</table>

								<div class="line clearfix"></div>
								<p><strong>3.</strong> ¿Cómo limpia ahora?</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="3_broom" id="3_broom" value="Brooms / Shovels"> Escobas/palas</label>
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="3_shop" id="3_shop" value="Shop Type Vacuums"> Aspiradoras de tipo taller</label>
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="3_oth" id="3_oth" value="Other"> Otro medio</label>
								</p>

								<div class="line clearfix"></div>
								<p><strong>4.</strong> Describe su residuo:</p>
								<p>
									<label class="formLabel">Nombre del residuo</label>
									<input type="text" name="4_debris" id="4_debris">
								</p>
								<p>
									<label class="formLabel">Densidad a granel</label>
									<input type="text" name="4_density" id="4_density">
									<select name="4_unit" id="4_unit">
										<option value="lbs/ft<sup>3</sup>" selected>lb/pie<sup>3</sup></option>
										<option value="g/cc">g/cm3</option>
									</select>
								</p>
								<p>
									Riesgo de explosión <label class="checkLabel"><input type="radio" name="4_exp" id="4_exp" value="Yes"> Sí</label>
									<label class="checkLabel"><input type="radio" name="4_exp" id="4_exp" value="No"> No</label>
								</p>
								<p>
									Abrasivo <label class="checkLabel"><input type="radio" name="4_abr" id="4_abr" value="Yes"> Sí</label>
									<label class="checkLabel"><input type="radio" name="4_abr" id="4_abr" value="No"> No</label>
								</p>

								<div class="line clearfix"></div>
								<p><strong>5.</strong> ¿Qué tipo de sistema de limpieza busca?</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="5_port" id="5_port" value="Portable Systems"> Sistemas portátiles</label>
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="5_comp" id="5_comp" value="Compressed Air Powered"> Alimentado a aire comprimido</label>
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="5_three" id="5_three" value="Electric 3 Phase"> Sistema eléctrico trifásico</label>
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="5_single" id="5_single" value="Electric Single Phase"> Sistema eléctrico monofásico</label>
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="5_stat" id="5_stat" value="Stationary / Central System"> Sistema fijo/centralizado</label>
								</p>
								<p>Clasificación eléctrica del área</p>
								<p>
									<label class="formLabel">Clase</label>
									<input type="text" name="5_class" id="5_class">
								</p>
								<p>
									<label class="formLabel">División</label>
									<input type="text" name="5_div" id="5_div">
								</p>
								<p>
									<label class="formLabel">Grupo</label>
									<input type="text" name="5_group" id="5_group">
								</p>
								<p>
									Cantidad de puntos de recogida <input type="text" name="5_points" id="5_points" class="form2">
								</p>
								<p>
									Cantidad de puntos de recogida que van a usarse al mismo tiempo <input type="text" name="5_concur" id="5_concur" class="form2">
								</p>
								<p>
									Tamaño de manguera solicitado <label class="checkLabel"><input type="radio" name="5_hose" id="5_hose" value="1.5&quot;"> 1,5 in</label>
									<label class="checkLabel"><input type="radio" name="5_hose" id="5_hose" value="2.0&quot;"> 2,0 in</label>
									<label class="checkLabel"><input type="radio" name="5_hose" id="5_hose" value="2.5&quot;"> 2,5 in</label>
								</p>
								<p>
									Tendido de tubería más largo desde la aspiradora <label class="inlineLabel"><input type="text" name="5_horiz" id="5_horiz" class="form2"> pies horizontales</label>
									<label class="inlineLabel"><input type="text" name="5_vert" id="5_vert" class="form2"> pies verticales</label>
								</p>

								<div class="line clearfix"></div>
								<p><strong>6.</strong> ¿Cuál es el mejor envase de recogida para su instalación?</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="6_drum" id="6_drum" value="50/55g Steel drum"> Tambor de acero de 50/55 g</label>
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="6_self" id="6_self" value="Self-Dump Forkliftable Hopper"> Tolva elevable mediante carretilla de auto volcado</label>
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="6_bulk" id="6_bulk" value="Bulk Bag"> Bolsa a granel</label>
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="6_fib" id="6_fib" value="Fiber Drum or Customer-Supplied Container"> Tambor de fibra o envase suministrado por el cliente</label>
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="6_review" id="6_review" value="Review Debris to My Process"> Retornar el residuo a mi proceso</label>
								</p>

								<div class="line clearfix"></div>
								<p><strong>7.</strong> Agregue cualquier otro detalle que no haya descrito anteriormente:</p>
								<p><textarea name="7_details" id="7_details" class="form"></textarea></p>

								<p>
									<div class="g-recaptcha" data-sitekey="#creds.siteKey#"></div>
								</p>
								<p>
									<input name="send" type="submit" id="send" value="Enviar pedido de cotización">
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
								<strong>Empresa</strong>: #form.co#<br>
								<strong>Nombre</strong>: #form.fn# #form.ln#<br>
								<strong>Teléfono</strong>: #form.ph#<br>
								<cfif form.fax neq ""><strong>Fax</strong>: #form.fax#<br></cfif>
								<strong>Correo electrónico</strong>: #form.email#<br>
								<strong>Dirección</strong>:<br>
								#form.ad1#<br>
								<cfif form.ad2 neq "">#form.ad2#<br></cfif> #form.ci#<cfif form.st neq "">, #form.st#</cfif> #form.zip#<br>
								#form.cou#<br>
								<br>
								<h3>1- Información recibida acerca de VAC-U-MAX</h3>
								#form.1_learn#<br>
								<br>
								<h3>2- Desea limpiar.</h3>
								<cfif form.2_floor neq "">#form.2_floor#<br></cfif>
								<cfif form.2_over neq "">#form.2_over#<br></cfif>
								<cfif form.2_machine neq "">#form.2_machine#<br></cfif>
								<cfif form.2_sump neq "">#form.2_sump#<br></cfif>
								<cfif form.2_walls neq "">#form.2_walls#<br></cfif>
								<br>
								<h3>3- Actualmente limpia mediante:</h3>
								<cfif form.3_broom neq "">#form.3_broom#<br></cfif>
								<cfif form.3_shop neq "">#form.3_shop#<br></cfif>
								<cfif form.3_oth neq "">#form.3_oth#<br></cfif>
								<br>
								<h3>4- Descripción del residuo</h3>
								<strong>Nombre del residuo</strong>: #form.4_debris#<br>
								<strong>Densidad a granel</strong>: <cfif form.4_density neq "">#form.4_density# #form.4_unit#</cfif><br>
								<strong>Riesgo de explosión</strong>: <cfif form.4_exp neq "">#form.4_exp#<cfelse>No</cfif><br>
								<strong>Abrasivo</strong>: <cfif form.4_abr neq "">#form.4_abr#<cfelse>No</cfif><br>
								<br>
								<h3>5- Tipo de sistema de limpieza:</h3>
								<cfif form.5_port neq "">#form.5_port#<br></cfif>
								<cfif form.5_comp neq "">#form.5_comp#<br></cfif>
								<cfif form.5_three neq "">#form.5_three#<br></cfif>
								<cfif form.5_single neq "">#form.5_single#<br></cfif>
								<cfif form.5_stat neq "">#form.5_stat#<br></cfif>
								<br>
								<strong>Clasificación eléctrica</strong><br>
								<strong>Clase</strong>: #form.5_class#<br>
								<strong>División</strong>: #form.5_div#<br>
								<strong>Grupo</strong>: #form.5_group#<br>
								<strong>Cantidad de puntos de recogida</strong>: #form.5_points#<br>
								<strong>Cantidad de puntos de recogida que van a usarse al mismo tiempo</strong>: #form.5_concur#<br>
								<strong>Tamaño de manguera solicitado</strong>: #form.5_hose#<br>
								<strong>Tendido de tubería más largo desde la aspiradora</strong>: <cfif form.5_horiz neq "">#form.5_horiz# pies horizontales</cfif>
								<cfif form.5_vert neq "">#form.5_vert# pies verticales</cfif><br>
								<br>
								<h3>6- Mejor envase de recogida para la instalación</h3>
								<cfif form.6_drum neq "">#form.6_drum#<br></cfif>
								<cfif form.6_self neq "">#form.6_self#<br></cfif>
								<cfif form.6_bulk neq "">#form.6_bulk#<br></cfif>
								<cfif form.6_fib neq "">#form.6_fib#<br></cfif>
								<cfif form.6_review neq "">#form.6_review#<br></cfif>
								<br>
								<h3>7- Otros detalles</h3>
								#form.7_details#<br>
							</cfsavecontent>

			    			<cfinvoke component="#application.components#.formProcessing" method="process">
			    				<cfinvokeargument name="subject" value="VAC-U-MAX Vacuum Cleaning RFQ Form">
			    				<cfinvokeargument name="formName" value="Vacuum Cleaning">
			    				<cfinvokeargument name="to" value="sales@vac-u-max.net">
			    				<cfinvokeargument name="cc" value="mcoia@smsmktg.com, kpyles@smsmktg.com, doanpendleton@vac-u-max.net, stevependleton@vac-u-max.net, davidkennedy@vac-u-max.net">
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

	<cfoutput>
    	<script type="text/javascript" src="https://www.google.com/recaptcha/api.js?hl=#lang#"></script>
		<cfinclude template="../inc/scripts.cfm">
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
					co: "Ingrese el nombre de su empresa.",
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
					$.ajax({
		                type: 'POST',
		                data: $('form').serialize(),
		                url: '../inc/capCheck.cfm',
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

			var validator = $("#form").data('validator');
			validator.settings.ignore = ":hidden:not(select)";

			$('.chosen').on("change", function(evt, params) {
			    $(evt.target).valid();
			});
		});
	</script>
</body>
</html>
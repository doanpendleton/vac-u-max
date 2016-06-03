<cfprocessingdirective pageEncoding="utf-8">
<cfinvoke
	component="#application.components#.queryController"
	method="rfq"
	returnVariable="rfq">
	<cfinvokeargument name="section" value="pneumatic">
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
	<title>VAC-U-MAX | Solicitud de cotización de transportador aeromecánico</title>
	<meta name="description" content="">
	<cfinclude template="../inc/head.cfm">
	<link href="<cfoutput>#application.css#</cfoutput>chosen.min.css" rel="stylesheet" type="text/css">
</head>

<body>
	<cfinclude template="inc/top.cfm">

    <div id="homeCon" class="container">
		<div class="conIndent">
			<div class="row-fluid">
		    	<div id="inBan3" class="inBanner">
		    		<h1>Solicitud de cotización de transportador aeromecánico</h1>
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

							<form action="#cgi.script_name#" method="post" id="form" enctype="multipart/form-data">
								<p>Los campos identificados con un asterisco (<span class="ast">*</span>) son obligatorios.<br><br></p>
								<p>
									<label class="formLabel">Interesado en</label>
									<select name="prod" id="prod" class="form chosen">
										<option value="">-- Seleccione un producto --</option>
										<cfloop query="rfq">
											<option value="#rfq.p_title#"<cfif rfq.p_url eq url.prod> selected</cfif>>#rfq.p_title#</option>
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
								<h3>Responda la mayor cantidad de las preguntas a continuación como sea posible.</h3>
								<p><strong>1.</strong> Información del producto</p>
								<p>
									<label class="formLabel">Materiales</label>
									<input type="text" name="1_mat" id="1_mat" class="form">
								</p>
								<p>
									<label class="formLabel">Densidad a granel</label>
									<input type="text" name="1_density" id="1_density">
									<select name="1_units_a" id="1_units_a">
										<option value="lb/cubic ft" selected>lb/pies cúbicos</option>
										<option value="g/cc">g/cm3</option>
									</select>
								</p>
								<p>
									<label class="formLabel">Velocidad solicitada</label>
									<input type="text" name="1_rate" id="1_rate" class="form"> lb/h
								</p>
								<p>
									<label class="formLabel">Fabricado por</label>
									<input type="text" name="1_man" id="1_man" class="form">
								</p>
								<p>Características (marque todas las que correspondan)</p>
								<p>
									<label class="checkLabel2"><input type="checkbox" name="1_agg" id="1_agg" value="Agglomerate"> Aglomerado</label>
									<label class="checkLabel2"><input type="checkbox" name="1_gran" id="1_gran" value="Granular"> Granular</label>
									<label class="checkLabel2"><input type="checkbox" name="1_pow" id="1_pow" value="Powder"> Polvo</label>
									<label class="checkLabel2"><input type="checkbox" name="1_fib" id="1_fib" value="Stringy/Fibrous"> Filamentoso/fibroso</label>
								</p>
								<p>
									<label class="checkLabel2"><input type="checkbox" name="1_free" id="1_free" value="Free Flowing"> De flujo libre</label>
									<label class="checkLabel2"><input type="checkbox" name="1_bridge" id="1_bridge" value="Bridges"> Puentes</label>
									<label class="checkLabel2"><input type="checkbox" name="1_fri" id="1_fri" value="Friable"> Friable</label>
									<label class="checkLabel2"><input type="checkbox" name="1_abr" id="1_abr" value="Abrasive"> Abrasivo</label>
								</p>
								<p>
									<label class="formLabel">Tamaño de partícula (micrones/malla)</label>
									<input type="text" name="1_part" id="1_part">
								</p>
								<p>
									<label class="formLabel">Contenido de humedad (%)</label>
									<input type="text" name="1_moist" id="1_moist">
								</p>
								<p>
									<label class="formLabel">Temperatura</label>
									<input type="text" name="1_temp" id="1_temp">
									<select name="1_units_b" id="1_units_b">
										<option value="&deg;F" selected>°F</option>
										<option value="&deg;C">°C</option>
									</select>
								</p>

								<div class="line clearfix"></div>
								<p><strong>2.</strong> Información sobre el transporte</p>
								<p>
									<label class="formLabel">Distancia horizontal</label>
									<input type="text" name="2_hor" id="2_hor"> pies
								</p>
								<p>
									<label class="formLabel">Distancia vertical</label>
									<input type="text" name="2_ver" id="2_ver"> pies
								</p>
								<p>
									<label class="formLabel">¿Se permite el transporte diagonal?</label>
									<label class="checkLabel2"><input type="radio" name="2_dia" id="2_dia" value="Yes"> Sí</label>
									<label class="checkLabel2"><input type="radio" name="2_dia" id="2_dia" value="No"> No</label>
								</p>
								<p>
									Alimentación del material al transportador <input type="text" name="2_matIn" id="2_matIn">
								</p>
								<p>
									Descarga del material del transportador <input type="text" name="2_matOut" id="2_matOut">
								</p>
								<p>
									Cantidad de entradas <input type="text" name="2_inlets" id="2_inlets">
								</p>
								<p>
									Cantidad de puntos de descarga <input type="text" name="2_dis" id="2_dis">
								</p>

								<div class="line clearfix"></div>
								<p><strong>3.</strong> Equipos auxiliares</p>
								<p>
									<label class="formLabel">Descargador de bolsas a granel</label>
									<label class="checkLabel2"><input type="radio" name="3_unload" id="3_unload" value="Yes"> Sí</label>
									<label class="checkLabel2"><input type="radio" name="3_unload" id="3_unload" value="No"> No</label>
								</p>
								<p>
									<label class="formLabel">Estación de descarga de bolsas</label>
									<label class="checkLabel2"><input type="radio" name="3_dump" id="3_dump" value="Yes"> Sí</label>
									<label class="checkLabel2"><input type="radio" name="3_dump" id="3_dump" value="No"> No</label>
								</p>
								<p>
									Otro<br>
									<textarea name="3_other" id="3_other" class="form"></textarea>
								</p>

								<div class="line clearfix"></div>
								<p><strong>4.</strong> El transportador funcionará</p>
								<p>
									<label class="formLabel">horas/día</label>
									<input type="text" name="4_day" id="4_day">
								</p>
								<p>
									<label class="formLabel">días/semana</label>
									<input type="text" name="4_week" id="4_week">
								</p>
								<p>
									<label class="formLabel">semanas/año</label>
									<input type="text" name="4_year" id="4_year">
								</p>

								<div class="line clearfix"></div>
								<p><strong>5.</strong> Materiales de la estructura</p>
								<p>
									<label class="formLabel">Contacto con el producto</label>
									<input type="text" name="5_con" id="5_con">
								</p>
								<p>
									<label class="formLabel">Sin contacto con el producto</label>
									<input type="text" name="5_non" id="5_non">
								</p>
								<p>
									Material del tubo/barrena: <label class="checkLabel2"><input type="radio" name="5_tube" id="5_tube" value="Carbon Steel"> Acero al carbono</label>
									<label class="checkLabel2"><input type="radio" name="5_tube" id="5_tube" value="304SS"> 304SS</label>
									<label class="checkLabel2"><input type="radio" name="5_tube" id="5_tube" value="316SS"> 316SS</label>
								</p>
								<p>
									Material del cable/barrena: <label class="checkLabel2"><input type="radio" name="5_cable" id="5_cable" value="Carbon Steel"> Acero al carbono</label>
									<label class="checkLabel2"><input type="radio" name="5_cable" id="5_cable" value="304SS"> 304SS</label>
									<label class="checkLabel2"><input type="radio" name="5_cable" id="5_cable" value="316SS"> 316SS</label>
								</p>
								<p>
									Discos: <label class="checkLabel2"><input type="radio" name="5_disc" id="5_disc" value="Polyurethane"> Poliuretano</label>
									<label class="checkLabel2"><input type="radio" name="5_disc" id="5_disc" value="Nylon"> Nailon</label>
									<label class="checkLabel2"><input type="radio" name="5_disc" id="5_disc" value="Polycarbonate"> Policarbonato</label>
								</p>
								<p>
									¿Es necesario el lavado del equipo? <label class="checkLabel2"><input type="radio" name="5_wash" id="5_wash" value="Yes"> Sí</label>
									<label class="checkLabel2"><input type="radio" name="5_wash" id="5_wash" value="No"> No</label>
								</p>
								<p>
									¿Es necesaria la impermeabilización del equipo? <label class="checkLabel2"><input type="radio" name="5_proof" id="5_proof" value="Yes"> Sí</label>
									<label class="checkLabel2"><input type="radio" name="5_proof" id="5_proof" value="No"> No</label>
								</p>

								<div class="line clearfix"></div>
								<p><strong>6.</strong> Información eléctrica</p>
								<p>
									<label class="formLabel">Tensión</label>
									<label class="checkLabel2"><input type="radio" name="6_volt" id="6_volt" value="208"> 208</label>
									<label class="checkLabel2"><input type="radio" name="6_volt" id="6_volt" value="230"> 230</label>
									<label class="checkLabel2"><input type="radio" name="6_volt" id="6_volt" value="460"> 460</label>
									<label class="checkLabel2"><input type="radio" name="6_volt" id="6_volt" value="575"> 575</label>
									<label class="checkLabel2"><input type="radio" name="6_volt" id="6_volt" value="Other"> Otra</label>
									<label class="inlineLabel"><input type="text" name="6_other" id="6_other" class="form2"></label>
								</p>
								<p>
									<label class="formLabel">Clase</label>
									<input type="text" name="6_class" id="6_class">
								</p>
								<p>
									<label class="formLabel">Clase</label>
									<input type="text" name="6_class" id="6_class">
								</p>
								<p>
									<label class="formLabel">División</label>
									<input type="text" name="6_div" id="6_div">
								</p>
								<p>
									<label class="formLabel">Grupo</label>
									<input type="text" name="6_group" id="6_group">
								</p>

								<div class="line clearfix"></div>
								<p><strong>7.</strong> Ubicación del equipo</p>
								<p>
									<label class="checkLabel"><input type="radio" name="7_loc" id="7_loc" value="Inside"> Bajo techo</label>
									<label class="checkLabel"><input type="radio" name="7_loc" id="7_loc" value="Outside"> Al aire libre</label>
									<label class="checkLabel"><input type="radio" name="7_loc" id="7_loc" value="Under Cover"> Bajo una cubierta</label>
								</p>

								<div class="line clearfix"></div>
								<p><strong>Disposición del equipo</strong><br>
								Proporcione las dimensiones debajo del dispositivo de alimentación, y las dimensiones sobre el componente de destino.</p>
								<p><input type="file" name="upload" id="upload" class="form"></p>
								<p>
									Informe cualquier comentario, mediciones u otros datos relevantes a continuación:<br>
									<textarea name="com" id="com" class="form"></textarea>
								</p>

								<p>
									<div class="g-recaptcha" data-sitekey="#creds.siteKey#"></div>
								</p>
								<p>
									<div class="clearfix"></div>
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
							<cfset destination = expandPath("./userfiles/aerocon")>
							<cfif form.upload neq "">
								<cffile action="upload" filefield="upload" destination="#destination#" nameConflict="makeUnique" result="upload">
								<cfset diagram = "#upload.serverfile#">
								<cfset filedirectory = "#upload.serverdirectory#">
							</cfif>

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
								<h3>1- Información del producto</h3>
								<strong>Materiales</strong>: #form.1_mat#<br>
								<strong>Densidad a granel</strong>: <cfif form.1_density neq "">#form.1_density# #form.1_units_a#</cfif><br>
								<strong>Velocidad solicitada</strong>: <cfif form.1_rate neq "">#form.1_rate# lb/h</cfif><br>
								<strong>Fabricado por</strong>: #form.1_man#<br>
								<strong>Características</strong>:<cfif form.1_agg neq "">#form.1_agg#<br></cfif>
								<cfif form.1_gran neq "">#form.1_gran#<br></cfif>
								<cfif form.1_pow neq "">#form.1_pow#<br></cfif>
								<cfif form.1_fib neq "">#form.1_fib#<br></cfif>
								<cfif form.1_free neq "">#form.1_free#<br></cfif>
								<cfif form.1_bridge neq "">#form.1_bridge#<br></cfif>
								<cfif form.1_fri neq "">#form.1_fri#<br></cfif>
								<cfif form.1_abr neq "">#form.1_abr#<br></cfif>
								<strong>Tamaño de partícula</strong>: #form.1_part#<br>
								<strong>Contenido de humedad</strong>: #form.1_moist#<br>
								<strong>Temperatura</strong>: <cfif form.1_temp neq "">#form.1_temp# #form.1_units_b#</cfif><br>
								<br>
								<h3>2- Información sobre el transporte</h3>
								<strong>Distancia horizontal</strong>: #form.2_hor#<br>
								<strong>Distancia vertical</strong>: #form.2_ver#<br>
								<strong>Se permite el transporte diagonal</strong>: <cfif form.2_dia neq "">#form.2_dia#</cfif><br>
								<strong>Alimentación del material al transportador</strong>: #form.2_matIn#<br>
								<strong>Descarga del material del transportador</strong>: #form.2_matOut# <br>
								<strong>Cantidad de entradas</strong>: #form.2_inlets#<br>
								<strong>Cantidad de puntos de descarga</strong>: #form.2_dis#<br>
								<br>
								<h3>3- Equipos auxiliares</h3>
								<strong>Descargador de bolsas a granel</strong>: <cfif form.3_unload neq "">#form.3_unload#</cfif><br>
								<strong>Estación de descarga de bolsas</strong>: <cfif form.3_dump neq "">#form.3_dump#</cfif><br>
								<strong>Otros</strong>: #form.3_other#<br>
								<br>
								<h3>4- El transportador funcionará</h3>
								<strong>horas/día</strong>: #form.4_day#<br>
								<strong>días/semana</strong>: #form.4_week#<br>
								<strong>semanas/año</strong>: #form.4_year#<br>
								<br>
								<h3>5- Materiales de la estructura</h3>
								<strong>Contacto con el producto</strong>: #form.5_con#<br>
								<strong>Sin contacto con el producto</strong>: #form.5_non#<br>
								<strong>Material del tubo/barrena</strong>: <cfif form.5_tube neq "">#form.5_tube#</cfif><br>
								<strong>Material del cable/barrena</strong>: <cfif form.5_cable neq "">#form.5_cable#</cfif><br>
								<strong>Discos</strong>: <cfif form.5_disc neq "">#form.5_disc#</cfif><br>
								<strong>Es necesario el lavado del equipo</strong>: <cfif form.5_wash neq "">#form.5_wash#</cfif><br>
								<strong>Es necesaria la impermeabilización del equipo</strong>: <cfif form.5_proof neq "">#form.5_proof#</cfif><br>
								<br>
								<h3>6- Información eléctrica</h3>
								<strong>Tensión</strong>: <cfif form.6_volt neq "">#form.6_volt#</cfif><br>
								<strong>Clase</strong>: #form.6_class#<br>
								<strong>División</strong>: #form.6_div#<br>
								<strong>Grupo</strong>: #form.6_group#<br>
								<br>
								<h3>Ubicación del equipo</h3>
								<strong>Ubicación</strong>: <cfif form.7_loc neq "">#form.7_loc#</cfif><br>
								<br>
								<h3>Disposición del equipo</h3>
								<strong>Comentarios</strong>: #form.com#<br>
								<cfif isDefined("diagram")><a href="../userfiles/aerocon/#diagram#" target="_blank">#diagram#</a></cfif>
				    		</cfsavecontent>

			    			<cfinvoke component="#application.components#.formProcessing" method="process">
				    			<cfinvokeargument name="subject" value="VAC-U-MAX Aero-Mechanical Conveyor RFQ Form">
				    			<cfinvokeargument name="formName" value="Aero-Mechanical Conveyors">
				    			<cfinvokeargument name="to" value="sales@vac-u-max.net">
				    			<cfinvokeargument name="cc" value="doanpendleton@vac-u-max.net, stevependleton@vac-u-max.net, davidkennedy@vac-u-max.net">
				    			<cfinvokeargument name="form" value="#form#">
				    			<cfinvokeargument name="message" value="#message#">
				    			<cfinvokeargument name="date" value="#date#">
				    			<cfinvokeargument name="time" value="#time#">
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
				    			<cfhttpparam type="formField" name="Division__c" value="Aerocon-06">
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
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
	<title>VAC-U-MAX | Solicitud de cotización de activador de recipiente Pulsonic</title>
	<meta name="description" content="">
	<cfinclude template="../inc/head.cfm">
	<link href="<cfoutput>#application.css#</cfoutput>chosen.min.css" rel="stylesheet" type="text/css">
</head>

<body>
	<cfinclude template="inc/top.cfm">

    <div id="homeCon" class="container">
		<div class="conIndent">
			<div class="row-fluid">
		    	<div id="inBan5" class="inBanner">
		    		<h1>Solicitud de cotización de activador de recipiente Pulsonic</h1>
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

							<form action="#cgi.script_name#" method="post" id="form" enctype="multipart/form-data">
								<p>Los campos identificados con un asterisco (<span class="ast">*</span>) son obligatorios.<br><br></p>
								<p>
									<label class="formLabel">Interesado en</label>
									<select name="prod" id="prod" class="form chosen">
										<option value="">- Seleccione un producto -</option>
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
								<p><strong>1.</strong> ¿Cuál es el producto?</p>
								<p>
									<label class="formLabel">Nombre genérico</label>
									<input type="text" name="1_cname" id="1_cname" class="form">
								</p>
								<p>
									<label class="formLabel">Nombre comercial</label>
									<input type="text" name="1_tname" id="1_tname" class="form">
								</p>
								<p>
									<label class="formLabel">Denominación química</label>
									<input type="text" name="1_chem" id="1_chem" class="form">
								</p>
								<p>
									<label class="formLabel">Fabricado por</label>
									<input type="text" name="1_man" id="1_man" class="form">
								</p>

								<div class="line clearfix"></div>
								<p>
									<label class="formLabel"><strong>2.</strong> Densidad a granel</label>
									<input type="text" name="2_density" id="2_density">
									<select name="2_units" id="2_units">
										<option value="lb/cubic ft" selected>lb/pies cúbicos</option>
										<option value="g/cc">g/cm3</option>
									</select>
								</p>

								<div class="line clearfix"></div>
								<p><strong>3.</strong> ¿Cuáles son las principales características del material? (Marque todas las que correspondan).</p>
								<p><label class="checkLabel2"><input type="checkbox" name="3a_pellet" id="3a_pellet" value="Pellet"> Pellet</label>
									<label class="checkLabel2"><input type="checkbox" name="3a_gran" id="3a_gran" value="Granular"> Granular</label>
									<label class="checkLabel2"><input type="checkbox" name="3a_pow" id="3a_pow" value="Powder"> Polvo</label>
									<label class="checkLabel2"><input type="checkbox" name="3a_flake" id="3a_flake" value="Flake"> Escama</label>
									<label class="checkLabel2"><input type="checkbox" name="3a_hygro" id="3a_hygro" value="Hygroscopic"> Higroscópico</label>
									<label class="checkLabel2"><input type="checkbox" name="3a_coh" id="3a_coh" value="Cohesive"> Cohesivo</label>
									<label class="checkLabel2"><input type="checkbox" name="3a_aer" id="3a_aer" value="Aerates"> Oxigenados</label>
									<label class="checkLabel2"><input type="checkbox" name="3a_com" id="3a_com" value="Compacts"> Compactos</label>
								</p>
								<p>El producto tiende a<br>
									<label class="checkLabel2"><input type="checkbox" name="3b_arch" id="3b_arch" value="Arch"> Arquearse</label>
									<label class="checkLabel2"><input type="checkbox" name="3b_bridge" id="3b_bridge" value="Bridge"> Formar puentes</label>
									<label class="checkLabel2"><input type="checkbox" name="3b_cling" id="3b_cling" value="Cling"> Adherirse</label>
									<label class="checkLabel2"><input type="checkbox" name="3b_rath" id="3b_rath" value="Rathole"> Desviarse</label>
								</p>
								<p><label class="checkLabel2"><input type="checkbox" name="3b_walls" id="3b_walls" value="On Hopper Walls"> Sobre las paredes de la tolva</label>
									<label class="checkLabel2"><input type="checkbox" name="3b_only" id="3b_only" value="Fills Hopper Only"> Llena la tolva solamente</label>
									<label class="checkLabel2"><input type="checkbox" name="3b_and" id="3b_and" value="Fills Hopper and"> Llena la tolva y </label>
									<label class="inlineLabel"><input type="text" name="3b_ft" id="3b_ft" class="form2"> pies por encima</label>
								</p>
								<p>Una vez que el flujo continúa:<br>
									<label class="checkLabel2"><input type="checkbox" name="3c_closed" id="3c_closed" value="Until Discharge Closed"> Hasta que la descarga se cierra</label><br>
									<label class="checkLabel2"><input type="checkbox" name="3c_for" id="3c_for" value="For"> Durante</label>
									<label class="inlineLabel"><input type="text" name="3c_min" id="3c_min" class="form2"> minutos y luego forma puentes</label><br>
									<label class="checkLabel2"><input type="checkbox" name="3c_core" id="3c_core" value="Once Flowing Continues Until Core Area is Empty with Walls Compacted"> Hasta que el área central esté vacía con las paredes compactadas</label>
								</p>
								<p>Otro:<br>
								<textarea name="3_other" id="3_other" class="form"></textarea></p>

								<div class="line clearfix"></div>
								<p><strong>4.</strong> Rango de tamaño de partícula del producto (micrones/tamaño de malla):</p>
								<p>
									<label class="formLabel">Tamaño máximo</label>
									<input type="text" name="4_max" id="4_max"> pulgadas
								</p>
								<p>
									<label class="formLabel">Tamaño mínimo</label>
									<input type="text" name="4_min" id="4_min"> pulgadas
								</p>

								<div class="line clearfix"></div>
								<p>
									<strong>5.</strong> Temperatura del producto <input type="text" name="5_temp" id="5_temp">
									<select name="5_units" id="5_units">
										<option value="&deg;F" selected>°F</option>
										<option value="&deg;C">°C</option>
									</select>
								</p>

								<div class="line clearfix"></div>
								<p><strong>6.</strong> Descarga</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="6_demand" id="6_demand" value="On Demand"> A demanda</label>
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="6_con" id="6_con" value="Continuous"> Continua</label>
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="6_bag" id="6_bag" value="Small Bag Sample Can be Supplied on Request"> Se puede suministrar una pequeña muestra de la bolsa a pedido</label>
								</p>
								<p>
									Forma de la tolva
									<select name="6_hopper" id="6_hopper">
										<option value="Square" selected>Cuadrada</option>
										<option value="Round">Redonda</option>
										<option value="Rectangular">Rectangular</option>
									</select>
								</p>
								<p>
									<label class="formLabel">Pies de ancho</label>
									<input type="text" name="6_ft" id="6_ft">
								</p>
								<p>
									<label class="formLabel">Altura de la tolva</label>
									<input type="text" name="6_height" id="6_height">
								</p>
								<p>
									<label class="formLabel">Altura de la sección vertical</label>
									<input type="text" name="6_vert" id="6_vert">
								</p>
								<p>
									<label class="formLabel">Tamaño de descarga</label>
									<input type="text" name="6_dis" id="6_dis">
								</p>
								<p>
									Forma de la descarga <label class="checkLabel"><input type="radio" name="6_shape" id="6_shape" value="Round"> Redonda</label>
									<input type="radio" name="6_shape" id="6_shape" value="Square"> Cuadrada</label>
								</p>
								<p>
									Tipo de válvula de descarga<br>
									<textarea name="6_valve" id="6_valve" class="form"></textarea>
								</p>
								<p>
									Método presente:<br>
									<label class="checkLabel"><input type="checkbox" name="6_vib" id="6_vib" value="Vibrator"> Vibrador</label>
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="6_other_a" id="6_other_a" value="Other"> Otro</label>
								</p>
								<p>
									Marca/modelo, descripción o comentarios:<br>
									<textarea name="6_other_b" id="6_other_b" class="form"></textarea>
								</p>

								<div class="line clearfix"></div>
								<p><strong>7.</strong> ¿Qué alimentación está disponible en la planta?</p>
								<p>
									<textarea name="7_power" id="7_power" class="form"></textarea>
								</p>

								<div class="line clearfix"></div>
								<p><strong>8.</strong> ¿Clasificación NEMA de gabinete eléctrico?</p>
								<p>
									<textarea name="8_nema" id="8_nema" class="form"></textarea>
								</p>

								<div class="line clearfix"></div>
								<p><strong>9.</strong> ¿Cuál es el suministro de aire comprimido disponible en la planta? (Potencia del compresor que suministre los pies cúbicos/minuto necesarios)</p>
								<p>
									<textarea name="9_air" id="9_air" class="form"></textarea>
								</p>

								<div class="line clearfix"></div>
								<p><strong>10.</strong> ¿Necesita un material de fabricación específico para los componentes (tanques e inyectores)?</p>
								<p>
									<textarea name="10_mat" id="10_mat" class="form"></textarea>
								</p>

								<div class="line clearfix"></div>
								<p><strong>Disposición del equipo</strong><br>
								Cargue un diagrama de la posición relativa de los equipos a los cuales les prestará servicio el sistema de transporte. Indique los puntos de entrada y salida de material para cada equipo individual. Si está familiarizado con el transporte neumático, agregue su concepto de los componentes del sistema y su ubicación posible. Indique distancias y elevaciones entre los diversos equipos siempre que sea posible.</p>
								<p><input type="file" name="upload" id="upload" class="form"></p>

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
							<cfset destination = expandPath("./userfiles/pulsonics")>
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
								<h3>1- El producto</h3>
								<strong>Nombre genérico</strong>: #form.1_cname#<br>
								<strong>Nombre comercial</strong>: #form.1_tname#<br>
								<strong>Denominación química</strong>: #form.1_chem#<br>
								<strong>Fabricado por</strong>: #form.1_man#<br>
								<br>
								<h3>2- Densidad a granel</h3>
								<cfif form.2_density neq "">#form.2_density# #form.2_units#<br></cfif>
								<br>
								<h3>3- Características más importantes del producto</h3>
								<cfif form.3a_pellet neq "">#form.3a_pellet#<br></cfif>
								<cfif form.3a_gran neq "">#form.3a_gran#<br></cfif>
								<cfif form.3a_pow neq "">#form.3a_pow#<br></cfif>
								<cfif form.3a_flake neq "">#form.3a_flake#<br></cfif>
								<cfif form.3a_hygro neq "">#form.3a_hygro#<br></cfif>
								<cfif form.3a_coh neq "">#form.3a_coh#<br></cfif>
								<cfif form.3a_aer neq "">#form.3a_aer#<br></cfif>
								<cfif form.3a_com neq "">#form.3a_com#<br></cfif>
								<strong>El producto tiende a</strong>:<br>
								<cfif form.3b_arch neq "">#form.3b_arch#<br></cfif>
								<cfif form.3b_bridge neq "">#form.3b_bridge#<br></cfif>
								<cfif form.3b_cling neq "">#form.3b_cling#<br></cfif>
								<cfif form.3b_rath neq "">#form.3b_rath#<br></cfif>
								<cfif form.3b_walls neq "">#form.3b_walls#<br></cfif>
								<cfif form.3b_only neq "">#form.3b_only#<br></cfif>
								<cfif form.3b_and neq "">#form.3b_and# #form.3b_ft# pies por encima<br></cfif>
								<strong>Una vez que el flujo continúa</strong>:<br>
								<cfif form.3c_closed neq "">#form.3c_closed#<br></cfif>
								<cfif form.3c_for neq "">#form.3c_for# #form.3c_min# minutos y luego forma puentes<br></cfif>
								<cfif form.3c_core neq "">#form.3c_core#<br></cfif>
								<cfif form.3_other neq "">Otro: #form.3_other#<br></cfif>
								<br>
								<h3>4- Rango de tamaño de partícula del producto. (micrones/tamaño de malla en pulgadas)</h3>
								<strong>Tamaño máximo</strong>: #form.4_max#<br>
								<strong>Tamaño mínimo</strong>: #form.4_min#<br>
								<br>
								<h3>5- Temperatura del producto:</h3>
								<cfif form.5_temp neq "">#form.5_temp# #form.5_units#<br></cfif>
								<br>
								<h3>6- Descarga</h3>
								<cfif form.6_demand neq "">#form.6_demand#<br></cfif>
								<cfif form.6_con neq "">#form.6_con#<br></cfif>
								<cfif form.6_bag neq "">#form.6_bag#<br></cfif>
								<strong>Forma de la tolva</strong>: #form.6_hopper#<br>
								<strong>Pies de ancho</strong>: #form.6_ft#<br>
								<strong>Altura de la tolva: #form.6_height#<br>
								<strong>Altura de la sección vertical</strong>: #form.6_vert#<br>
								<strong>Tamaño de descarga</strong>: #form.6_dis#<br>
								<strong>Forma de descarga</strong>: #form.6_shape#<br>
								<strong>Válvula de descarga</strong>: #form.6_valve#<br>
								<br>
								<strong>Método presente</strong>:<br>
								<cfif form.6_vib neq "">#form.6_vib#<br></cfif>
								<cfif form.6_other_a neq "">#form.6_other_b#<br></cfif>
								<strong>Marca/modelo, descripción o comentarios</strong>: #form.6_other_b#<br>
								<br>
								<h3>7- Alimentación disponible en la planta:</h3>
								<cfif form.7_power neq "">#form.7_power#<br></cfif>
								<br>
								<h3>8- 8. Clasificación NEMA de gabinete eléctrico:</h3>
								<cfif form.8_nema neq "">#form.8_nema#<br></cfif>
								<br>
								<h3>9- Aire comprimido disponible:</h3>
								<cfif form.9_air neq "">#form.9_air#<br></cfif>
								<br>
								<h3>10- Material específico de fabricación:</h3>
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
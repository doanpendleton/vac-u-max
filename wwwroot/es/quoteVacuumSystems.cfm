<cfprocessingdirective pageEncoding="utf-8">
<cfinvoke
	component="#application.components#.queryController"
	method="rfq"
	returnVariable="rfq">
	<cfinvokeargument name="section" value="central-vacuum-systems">
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
	<title>VAC-U-MAX | Solicitud de cotización de sistemas de limpieza mediante aspiración centralizada</title>
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
		    		<h1>Solicitud de cotización de sistemas de limpieza mediante aspiración centralizada</h1>
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
										<option value="">-- Seleccione un producto --</option>
										<cfloop query="rfq">
											<option value="#rfq.v_item# - #rfq.v_title#"<cfif rfq.v_item eq url.prod> seleccionado</cfif>>#rfq.v_item# - #rfq.v_title#</option>
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
								<p><strong>1.</strong> Información del proyecto</p>
								<p>
									<label class="formLabel">Tamaño total de la instalación</label>
									<input type="text" name="1_fac" id="1_fac">
									<select name="1_fac_u" id="1_fac_u">
										<option value="sq ft" selected>pies cuadrados</option>
										<option value="sq m">metros cuadrados</option>
									</select>
								</p>
								<p>
									<label class="formLabel">Área incluida en el sistema</label>
									<input type="text" name="1_area" id="1_area">
									<select name="1_area_u" id="1_area_u">
										<option value="sq ft" selected>pies cuadrados</option>
										<option value="sq m">metros cuadrados</option>
									</select>
								</p>
								<p>
									<label class="formLabel">Tipo de industria</label>
									<input type="text" name="1_type" id="1_type" class="form">
								</p>
								<p>
									<label class="formLabel">Presupuesto disponible</label>
									<input type="text" name="1_avail" id="1_avail" class="form">
								</p>
								<p>
									<label class="formLabel">Programación</label>
									<input type="text" name="1_time" id="1_time" class="form">
								</p>

								<div class="line clearfix"></div>
								<p><strong>2.</strong> Información sobre el transporte</p>
								<p>
									<label class="formLabel">Cantidad de puntos de recogida</label>
									<input type="text" name="2_pick" id="2_pick">
								</p>
								<p>
									<label class="formLabel">Cantidad de puntos utilizados simultáneamente</label>
									<input type="text" name="2_sim" id="2_sim">
								</p>
								<p>
								<p>
									<label class="formLabel">Tamaño de manguera solicitado</label>
									<select name="2_hose_u" id="2_hose_u">
										<option value="in" selected>in</option>
										<option value="cm">cm</option>
									</select>
								</p>
									<label class="formLabel">Tendido de tuberías horizontales más extenso</label>
									<input type="text" name="2_hor" id="2_hor">
									<select name="2_hor_u" id="2_hor_u">
										<option value="ft" selected>pies</option>
										<option value="m">m</option>
									</select>
								</p>
								<p>
									<label class="formLabel">Tendido de tuberías verticales más extenso</label>
									<input type="text" name="2_ver" id="2_ver">
									<select name="2_ver_u" id="2_ver_u">
										<option value="ft" selected>pies</option>
										<option value="m">m</option>
									</select>
								</p>
								<p>
									<label class="formLabel">Funcionamiento</label>
									<label class="checkLabel2"><input type="radio" name="2_op" id="2_op" value="Continuous"> Continuo</label>
									<label class="checkLabel2"><input type="radio" name="2_op" id="2_op" value="Intermittent"> Intermitente</label>
									<label class="checkLabel2"><input type="radio" name="2_op" id="2_op" value="Times per Day for"> Veces por día durante</label>
									<label class="inlineLabel">
									<input type="text" name="2_op_b" id="2_op_b" class="form2"> horas</label>
								</p>
								<p>
									¿El sistema de aspiración funcionará incluso cuando todas las entradas están cerradas? <label class="checkLabel2"><input type="radio" name="2_closed" id="2_closed" value="Yes"> Sí</label>
									<label class="checkLabel2"><input type="radio" name="2_closed" id="2_closed" value="No"> No</label>
								</p>
								<p>
									Descripción breve de la aplicación<br>
									<textarea name="2_desc" id="2_desc" class="form"></textarea>
								</p>

								<div class="line clearfix"></div>
								<p><strong>3.</strong> Condiciones de la planta</p>
								<p>
									<label class="formLabel">Temp. ambiente</label>
									<input type="text" name="3_temp" id="3_temp">
									<select name="3_temp_u" id="3_temp_u">
										<option value="&deg;F" selected>°F</option>
										<option value="&deg;C">°C</option>
									</select>
								</p>
								<p>
									<label class="formLabel">Nivel máximo de sonido</label>
									<label class="inlineLabel">
									<input type="text" name="3_sound_a" id="3_sound_a" class="form2"> dBA</label>
									<label class="inlineLabel"> en <input type="text" name="3_sound_b" id="3_sound_b" class="form2"></label>
									<label class="inlineLabel"> &lt;select name="3_sound_c" id="3_sound_c"
										<option value="ft" selected>pies</option>
										<option value="m">m</option>
									</select></label>
									<label class="inlineLabel"> durante <input type="text" name="3_sound_d" id="3_sound_d" class="form2"> horas</label>
								</p>
								<p>
									<label class="formLabel">Condiciones peligrosas</label>
									<input type="text" name="3_haz" id="3_haz" class="form">
								</p>
								<p>Clasificación NEMA</p>
								<p>
									<label class="formLabel">Clase</label>
									<input type="text" name="3_class" id="3_class">
								</p>
								<p>
									<label class="formLabel">Grupo</label>
									<input type="text" name="3_group" id="3_group">
								</p>
								<p>
									<label class="formLabel">División</label>
									<input type="text" name="3_div" id="3_div">
								</p>
								<p>
									Filtro HEPA necesario <label class="checkLabel2"><input type="radio" name="3_hepa" id="3_hepa" value="Yes"> Sí</label>
									<label class="checkLabel2"><input type="radio" name="3_hepa" id="3_hepa" value="No"> No</label>
								</p>
								<p>
									Material en contacto con el producto <label class="checkLabel2"><input type="radio" name="3_mat" id="3_mat" value="Carbon Steel with Powder Coat "> Acero al carbono con revestimiento de pintura en polvo </label>
									<label class="checkLabel2"><input type="radio" name="3_mat" id="3_mat" value="304SS with Bead Blast Finish"> 304SS con acabado de granallado</label>
								</p>

								<div class="line clearfix"></div>
								<p><strong>4.</strong> Características del material</p>
								<p>
									<label class="formLabel">Nombre</label>
									<input type="text" name="4_na" id="4_na">
								</p>
								<p>
									<label class="formLabel">Densidad a granel</label>
									<input type="text" name="4_bulk" id="4_bulk">
								</p>
								<p>
									<label class="formLabel">Tamaño máximo de partícula</label>
									<input type="text" name="4_par_a" id="4_par_a"> micrones
								</p>
								<p>
									<label class="formLabel">Tamaño mínimo de partícula</label>
									<input type="text" name="4_par_b" id="4_par_b"> micrones
								</p>
								<p>
									<label class="formLabel">Temp. máx.</label>
									<input type="text" name="4_temp" id="4_temp">
									<select name="4_temp_u" id="4_temp_u">
										<option value="&deg;F" selected>°F</option>
										<option value="&deg;C">°C</option>
									</select>
								</p>
								<p>
									<label class="formLabel">Seco</label>
									<label class="checkLabel2"><input type="radio" name="4_dry" id="4_dry" value="Yes"> Sí</label>
									<label class="checkLabel2"><input type="radio" name="4_dry" id="4_dry" value="No"> No</label>
								</p>
								<p>
									<label class="formLabel">Polvoroso</label>
									<label class="checkLabel2"><input type="radio" name="4_dust" id="4_dust" value="Yes"> Sí</label>
									<label class="checkLabel2"><input type="radio" name="4_dust" id="4_dust" value="No"> No</label>
								</p>
								<p>
									<label class="formLabel">Higroscópico</label>
									<label class="checkLabel2"><input type="radio" name="4_hyg" id="4_hyg" value="Yes"> Sí</label>
									<label class="checkLabel2"><input type="radio" name="4_hyg" id="4_hyg" value="No"> No</label>
								</p>
								<p>
									<label class="formLabel">Corrosivo</label>
									<label class="checkLabel2"><input type="radio" name="4_cor" id="4_cor" value="Yes"> Sí</label>
									<label class="checkLabel2"><input type="radio" name="4_cor" id="4_cor" value="No"> No</label>
								</p>
								<p>
									<label class="formLabel">Aceitoso</label>
									<label class="checkLabel2"><input type="radio" name="4_oil" id="4_oil" value="Yes"> Sí</label>
									<label class="checkLabel2"><input type="radio" name="4_oil" id="4_oil" value="No"> No</label>
								</p>
								<p>
									<label class="formLabel">Pegajoso</label>
									<label class="checkLabel2"><input type="radio" name="4_sti" id="4_sti" value="Yes"> Sí</label>
									<label class="checkLabel2"><input type="radio" name="4_sti" id="4_sti" value="No"> No</label>
								</p>
								<p>
									<label class="formLabel">Tóxico</label>
									<label class="checkLabel2"><input type="radio" name="4_tox" id="4_tox" value="Yes"> Sí</label>
									<label class="checkLabel2"><input type="radio" name="4_tox" id="4_tox" value="No"> No</label>
								</p>
								<p>
									<label class="formLabel">Abrasivo</label>
									<label class="checkLabel2"><input type="radio" name="4_abr" id="4_abr" value="Yes"> Sí</label>
									<label class="checkLabel2"><input type="radio" name="4_abr" id="4_abr" value="No"> No</label>
								</p>
								<p>
									<label class="formLabel">Explosivo</label>
									<label class="checkLabel2"><input type="radio" name="4_exp" id="4_exp" value="Yes"> Sí</label>
									<label class="checkLabel2"><input type="radio" name="4_exp" id="4_exp" value="No"> No</label>
								</p>

								<div class="line clearfix"></div>
								<p><strong>5.</strong> Alimentación disponible</p>
								<p>Eléctrica</p>
								<p>
									<label class="formLabel">Voltios</label>
									<input type="text" name="5_volt" id="5_volt">
								</p>
								<p>
									<label class="formLabel">Fase</label>
									<input type="text" name="5_ph" id="5_ph">
								</p>
								<p>
									<label class="formLabel">Hercios</label>
									<input type="text" name="5_hz" id="5_hz">
								</p>
								<p>
									<label class="formLabel">Aire comprimido</label>
									<label class="inlineLabel"><input type="text" name="5_air_a" id="5_air_a" class="form2"> pies cúbicos/minuto a</label>
									<label class="inlineLabel">
									<input type="text" name="5_air_b" id="5_air_b" class="form2"> PSI</label>
								</p>

								<div class="line clearfix"></div>
								<p><strong>6.</strong> Disposición de material recogido</p>
								<p>
									¿Qué pasará con el material una vez que se recoge? Detalle una descripción breve:<br>
									<textarea name="6_dis" id="6_dis" class="form"></textarea>
								</p>

								<div class="line clearfix"></div>
								<p><strong>7.</strong> Sistema de limpieza actual</p>
								<p>
									<label class="formLabel">Método presente</label>
									<input type="text" name="7_meth" id="7_meth">
								</p>
								<p>
									Fabricante y n.° de modelo del equipo de limpieza presente <input type="text" name="7_equip" id="7_equip">
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
								<h3>1- Información del proyecto</h3>
								<strong>Tamaño total de la instalación</strong>: <cfif form.1_fac neq "">#form.1_fac# #form.1_fac_u#</cfif><br>
								<strong>Área incluida en el sistema</strong>: <cfif form.1_area neq "">#form.1_area# #form.1_area_u#</cfif><br>
								<strong>Tipo de industria</strong>: #form.1_type#<br>
								<strong>Presupuesto disponible</strong>: #form.1_avail#<br>
								<strong>Programación</strong>: #form.1_time#<br>
								<br>
								<h3>2- Información sobre el transporte</h3>
								<strong>Cantidad de puntos de recogida</strong>: #form.2_pick#<br>
								<strong>Cantidad de puntos utilizados simultáneamente</strong>: #form.2_sim#<br>
								<strong>Tamaño de manguera solicitado</strong>: <cfif form.2_hose neq "">#form.2_hose# #form.2_hose_u#</cfif><br>
								<strong>Tendido de tuberías horizontales más extenso</strong>: <cfif form.2_hor neq "">#form.2_hor# #form.2_hor_u#</cfif><br>
								<strong>Tendido de tuberías verticales más extenso</strong>: <cfif form.2_ver neq "">#form.2_ver# #form.2_ver#</cfif><br>
								<strong>Funcionamiento</strong>: #form.2_op#<cfif form.2_op eq "Times per Day for"> #form.2_op_b# horas</cfif><br>
								<strong>¿El sistema de aspiración funcionará incluso cuando todas las entradas están cerradas?</strong>: #form.2_closed#<br>
								<strong>Descripción breve de la aplicación</strong>: #form.2_desc#<br>
								<br>
								<h3>3- Condiciones de la planta</h3>
								<strong>Temp. ambiente</strong>: <cfif form.3_temp neq "">#form.3_temp# #form.3_temp_u#</cfif><br>
								<strong>Nivel máximo de sonido</strong>: <cfif form.3_sound_a neq "">#form.3_sound_a# dBA</cfif><cfif form.3_sound_b neq ""> a #form.3_sound_b# #form.3_sound_c#</cfif><cfif form.3_sound_d neq ""> #form.3_sound_d# horas</cfif><br>
								<strong>Condiciones peligrosas</strong>: #form.3_haz#<br>
								<strong>Clasificación NEMA</strong>:<br>
								<strong>Clase</strong>: #form.3_class#<br>
								<strong>Grupo</strong>: #form.3_group#<br>
								<strong>División</strong>: #form.3_div#<br>
								<strong>Filtro HEPA necesario</strong>: #form.3_hepa#<br>
								<strong>Material en contacto con el producto</strong>: #form.3_mat#<br>
								<br>
								<h3>4- Características del material</h3>
								<strong>Nombre</strong>: #form.4_na#<br>
								<strong>Densidad a granel</strong>: #form.4_bulk#<br>
								<strong>Tamaño máximo de partícula</strong>: #form.4_par_a#<br>
								<strong>Tamaño mínimo de partícula</strong>: #form.4_par_b#<br>
								<strong>Temp. máx.</strong>: <cfif form.4_temp neq "">##form.4_temp# #form.4_temp_u#</cfif><br>
								<strong>Seco</strong>: #form.4_dry#<br>
								<strong>Polvoroso</strong>: #form.4_dust#<br>
								<strong>Higroscópico</strong>: #form.4_hyg#<br>
								<strong>Corrosivo</strong>: #form.4_cor#<br>
								<strong>Aceitoso</strong>: #form.4_oil#<br>
								<strong>Pegajoso</strong>: #form.4_sti#<br>
								<strong>Tóxico</strong>: #form.4_tox#<br>
								<strong>Abrasivo</strong>: #form.4_abr#<br>
								<strong>Explosivo</strong>: #form.4_exp#<br>
								<br>
								<h3>5- Alimentación disponible</h3>
								<strong>Eléctrica</strong>:<br>
								<strong>Voltios</strong>: #form.5_volt#<br>
								<strong>Fase</strong>: #form.5_ph#<br>
								<strong>Hercios</strong>: #form.5_hz#<br>
								<strong>Aire comprimido</strong>: #form.5_air_a# #form.5_air_b#<br>
								<br>
								<h3>6- Disposición de material recogido</h3>
								<strong>¿Qué pasará con el material una vez que se recoge? Detalle una descripción breve</strong>: #form.6_dis#<br>
								<br>
								<h3>7- Sistema de limpieza actual</h3>
								<strong>Método presente</strong>: #form.7_meth#<br>
								<strong>Fabricante y n.° de modelo del equipo de limpieza presente</strong>: #form.7_equip#<br>
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
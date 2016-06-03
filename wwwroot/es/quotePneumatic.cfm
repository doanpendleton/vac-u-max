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
	<title>VAC-U-MAX | Solicitud de cotización de sistemas de transporte neumático</title>
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
		    		<h1>Solicitud de cotización de sistemas de transporte neumático</h1>
		    		<div class="clearfix"></div>
		    	</div><!--- inBanner --->
			</div><!--- row-fluid --->

	    	<div class="row-fluid">
	    		<cfinclude template="inc/sideNav.cfm">

	    		<div id="prodCon" class="span9 well">
	    			<cfset showForm = true>
	    			<cfparam name="resp.success" default="false">
	    			<cfparam name="url.prod" default="vacuum-conveying-systems">
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
	    			<cfparam name="form.com" default="">
	    			<cfparam name="form.3a_pellet" default="">
	    			<cfparam name="form.3a_flake" default="">
	    			<cfparam name="form.3a_gran" default="">
	    			<cfparam name="form.3a_fib" default="">
	    			<cfparam name="form.3a_pow" default="">
	    			<cfparam name="form.3a_object_a" default="">
	    			<cfparam name="form.3c_dust" default="">
	    			<cfparam name="form.3c_hyg" default="">
	    			<cfparam name="form.3c_noDust" default="">
	    			<cfparam name="form.3c_frag" default="">
	    			<cfparam name="form.3c_abr" default="">
	    			<cfparam name="form.3c_oth_a" default="">
	    			<cfparam name="form.3d_coh" default="">
	    			<cfparam name="form.3d_acid" default="">
	    			<cfparam name="form.3d_rad" default="">
	    			<cfparam name="form.3d_adh" default="">
	    			<cfparam name="form.3d_cau" default="">
	    			<cfparam name="form.3e_cor_a" default="">
	    			<cfparam name="form.3f_tox_a" default="">
	    			<cfparam name="form.3g_exp_a" default="">
	    			<cfparam name="form.4_free" default="">
	    			<cfparam name="form.4_fluid" default="">
	    			<cfparam name="form.4_slug" default="">
	    			<cfparam name="form.4_notFluid" default="">
	    			<cfparam name="form.4_notFree" default="">
	    			<cfparam name="form.4_flood" default="">
	    			<cfparam name="form.4_comp_a" default="">
	    			<cfparam name="form.5_seg" default="">
	    			<cfparam name="form.5_break" default="">
	    			<cfparam name="form.11_fib_a" default="">
	    			<cfparam name="form.11_box_a" default="">
	    			<cfparam name="form.11_ibc_a" default="">
	    			<cfparam name="form.11_bag_a" default="">
	    			<cfparam name="form.11_gay_a" default="">
	    			<cfparam name="form.11_silo_a" default="">
	    			<cfparam name="form.12_mix" default="">
	    			<cfparam name="form.12_blend" default="">
	    			<cfparam name="form.12_react" default="">
	    			<cfparam name="form.12_fill" default="">
	    			<cfparam name="form.12_silo" default="">
	    			<cfparam name="form.12_tank" default="">
	    			<cfparam name="form.12_mill" default="">
	    			<cfparam name="form.12_screen" default="">
	    			<cfparam name="form.12_dry" default="">
	    			<cfparam name="form.12_tab" default="">
	    			<cfparam name="form.12_vol" default="">
	    			<cfparam name="form.12_loss" default="">
	    			<cfparam name="form.14_min" default="">
	    			<cfparam name="form.22_heat" default="">
	    			<cfparam name="form.22_load" default="">
	    			<cfparam name="form.25_steel" default="">
	    			<cfparam name="form.25_304" default="">
	    			<cfparam name="form.25_316" default="">
	    			<cfparam name="form.26_sing_a" default="">
	    			<cfparam name="form.26_three_a" default="">
	    			<cfparam name="form.18_comp" default="">
	    			<cfparam name="form.18_hp" default="">
	    			<cfparam name="form.18_cfm" default="">

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
								<p>
									<label class="formLabel">Explique la aplicación</label>
									<textarea name="com" id="com" class="form"></textarea>
								</p>

								<div class="line clearfix"></div>
								<h3>Responda la mayor cantidad de las preguntas a continuación como sea posible.</h3>
								<p><strong>1.</strong> ¿Cuál es el producto que se desea transportar?</p>
								<p>
									<input type="text" name="1_cname" id="1_cname" class="form">
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
								<table class="rfqForm">
									<tr>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="3a_pellet" id="3a_pellet" value="Pellet/Granule"> Pellet/Gránulo</label></td>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="3a_pow" id="3a_pow" value="Powder"> Polvo</label></td>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="3a_flake" id="3a_flake" value="Flake"> Escama</label></td>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="3c_dust" id="3c_dust" value="Dusty"> Polvoroso</label></td>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="3c_noDust" id="3c_noDust" value="Non Dusty"> No polvoroso</label></td>
									</tr>
									<tr>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="3c_hyg" id="3c_hyg" value="Hygroscopic"> Higroscópico</label></td>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="3e_cor_a" id="3e_cor_a" value="Corrosive"> Corrosivo</label></td>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="3d_cau" id="3d_cau" value="Caustic"> Cáustico</label></td>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="3c_abr" id="3c_abr" value="Abrasive"> Abrasivo</label></td>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="3d_acid" id="3d_acid" value="Acidic"> Ácido</label></td>
									</tr>
									<tr>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="3d_coh" id="3d_coh" value="Cohesive"> Cohesivo</label></td>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="3c_frag" id="3c_frag" value="Fragile"> Frágil</label></td>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="3d_rad" id="3d_rad" value="Radioactive"> Radioactivo</label></td>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="3f_tox_a" id="3f_tox_a" value="Toxic"> Tóxico</label></td>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="3g_exp_a" id="3g_exp_a" value="Explosive"> Explosivo</label></td>
									</tr>
									<tr>
										<td valign="top" colspan="3"><p><label class="checkLabel"><input type="checkbox" name="3c_oth_a" id="3c_oth_a" value="Other"> Otro</label>
									<input type="text" name="3c_oth_b" id="3c_oth_b"></td>
									</tr>
								</table>

								<div class="line clearfix"></div>
								<p><strong>4.</strong> ¿Cuáles son las propiedades de flujo del material?</p>
								<table class="rfqForm">
									<tr>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="4_free" id="4_free" value="Yes"> Flujo libre</label></td>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="4_notFree" id="4_notFree" value="Yes"> Sin flujo libre</label></td>
									</tr>
								</table>

								<div class="line clearfix"></div>
								<p><strong>5.</strong> ¿Cuál es su inquietud?</p>
								<table class="rfqForm">
									<tr>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="5_seg" id="5_seg" value="Yes"> Segregación</label></td>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="5_break" id="5_break" value="Yes"> Rotura</label></td>
									</tr>
								</table>

								<div class="line clearfix"></div>
								<p><strong>6.</strong> ¿Cuáles son las distancias de transporte?</p>
								<p>
									<label class="formLabel">Vertical (pies)</label>
									<input type="text" name="7_vert" id="7_vert">
								</p>
								<p>
									<label class="formLabel">Horizontal (pies)</label>
									<input type="text" name="7_hor" id="7_hor">
								</p>

								<div class="line clearfix"></div>
								<p><strong>7.</strong> ¿Cuántos codos de 90° son necesarios? <input type="text" name="8_bends" id="8_bends"></p>

								<div class="line clearfix"></div>
								<p><strong>8.</strong> ¿Desde cuántas posiciones se transportará el material? ¿Una o más?<br>
								<input type="text" name="9_pick" id="9_pick" class="form"></p>

								<div class="line clearfix"></div>
								<p><strong>9.</strong> El material que se va a transferir se encuentra en:</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="11_silo_a" id="11_silo_a" value="Storage Hopper/Silo"> Tolva de almacenamiento/silo</label>
									<label class="checkLabel"><input type="checkbox" name="11_fib_a" id="11_fib_a" value="Drums"> Tambores</label>
									<label class="checkLabel"><input type="checkbox" name="11_bag_a" id="11_bag_a" value="Bags"> Bolsas</label>
									<label class="checkLabel"><input type="checkbox" name="11_box_a" id="11_box_a" value="Boxes"> Cajas</label>
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="11_gay_a" id="11_gay_a" value="Other"> Otro</label>
									<label class="inlineLabel"><label class="inlineLabel"><input type="text" name="11_gay_b" id="11_gay_b">
								</p>

								<div class="line clearfix"></div>
								<p><strong>10.</strong> ¿Cuál es la velocidad de transporte instantáneo del sistema en libras por hora?<br>
								<input type="text" name="14_min" id="14_min" class="form"></label></p>

								<div class="line clearfix"></div>
								<p><strong>11.</strong> ¿A cuántos puntos de entrega se entregará el material? ¿Uno, dos o más?<br>
								<input type="text" name="18_points" id="18_points"></p>

								<div class="line clearfix"></div>
								<p><strong>12.</strong> ¿Cuál es el equipo al cual se entregará el material?</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="12_mix" id="12_mix" value="Mixer"> Mezcladora</label>
									<label class="checkLabel"><input type="checkbox" name="12_blend" id="12_blend" value="Blender"> Homogeneizador</label>
									<label class="checkLabel"><input type="checkbox" name="12_react" id="12_react" value="Reactor"> Reactor</label>
									<label class="checkLabel"><input type="checkbox" name="12_fill" id="12_fill" value="Filling Machine"> Equipo de llenado</label>
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="12_silo" id="12_silo" value="Silo"> Silo</label>
									<label class="checkLabel"><input type="checkbox" name="12_tank" id="12_tank" value="Tank"> Tanque</label>
									<label class="checkLabel"><input type="checkbox" name="12_mill" id="12_mill" value="Mill"> Molino</label>
									<label class="checkLabel"><input type="checkbox" name="12_screen" id="12_screen" value="Screen"> Tamiz</label>
									<label class="checkLabel"><input type="checkbox" name="12_dry" id="12_dry" value="Dryer"> Secadora</label>
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="12_tab" id="12_tab" value="Tablet Press"> Compresora de tabletas</label>
									<label class="checkLabel"><input type="checkbox" name="12_vol" id="12_vol" value="Volumetric Feed"> Alimentación volumétrica</label>
									<label class="checkLabel"><input type="checkbox" name="12_loss" id="12_loss" value="Loss-In-Wt Feeder"> Alimentador de pérdida en peso</label>
								</p>
								<p>
									<label class="formLabel">Otro</label>
									<input type="text" name="12_other" id="12_other" class="form">
								</p>

								<div class="line clearfix"></div>
								<p>
									<strong>13.</strong> ¿Cuál es el tamaño de la abertura del equipo que se va a alimentar? <input type="text" name="19_size" id="19_size">
								</p>

								<div class="line clearfix"></div>
								<p>
									<strong>14.</strong> ¿Cuánto espacio libre tiene sobre el equipo que se va a alimentar? <input type="text" name="20_room" id="20_room">
								</p>

								<div class="line clearfix"></div>
								<p>
									<strong>15.</strong> ¿Nuestro equipo se verá sometido a gases, calor o vapor emitido por el equipo que se alimenta?<br>
									<label class="checkLabel"><input type="radio" name="22_heat" id="22_heat" value="Yes"> Sí</label>
									<label class="checkLabel"><input type="radio" name="22_heat" id="22_heat" value="No"> No</label>
								</p>
								<p>
									¿Solamente durante la operación de carga o de forma continua? <label class="checkLabel"><input type="radio" name="22_load" id="22_load" value="Only during loading"> Solamente durante la carga</label>
									<label class="checkLabel"><input type="radio" name="22_load" id="22_load" value="Continuously">De forma continua</label>
								</p>

								<div class="line clearfix"></div>
								<p><strong>16.</strong> ¿Material de estructura de los componentes del sistema en contacto con el material?</p>
								<table class="rfqForm">
									<tr>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="25_steel" id="25_steel" value="Carbon Steel"> Acero dulce</label></td>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="25_304" id="25_304" value="304 SS"> Acero inoxidable 304</label></td>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="25_316" id="25_316" value="316 SS"> Acero inoxidable 316</label></td>
									</tr>
								</table>

								<div class="line clearfix"></div>
								<p><strong>17.</strong> ¿Alimentación eléctrica disponible?</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="26_sing_a" id="26_sing_a" value="Single Phase"> Monofásica</label>
									<label class="inlineLabel"><input type="text" name="26_sing_b" id="26_sing_b" class="form2"> voltios</label>
									<label class="inlineLabel"><input type="text" name="26_sing_c" id="26_sing_c" class="form2"> Hz</label>
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="26_three_a" id="26_three_a" value="Three Phase"> Trifásica</label>
									<label class="inlineLabel"><input type="text" name="26_three_b" id="26_three_b" class="form2"> voltios</label>
									<label class="inlineLabel"><input type="text" name="26_three_c" id="26_three_c" class="form2"> Hz</label>
								</p>

								<div class="line clearfix"></div>
								<p><strong>18.</strong> ¿Aire comprimido disponible en la planta? <label class="checkLabel"><input type="radio" name="18_comp" id="18_comp" value="Yes"> Sí</label>
									<label class="checkLabel"><input type="radio" name="18_comp" id="18_comp" value="No"> No</label>
								</p>
								<p>Potencia del compresor: <label class="inlineLabel"><input type="text" name="18_hp" id="18_hp"></label></p>
								<p>Indique el número de pies cúbicos/minuto disponibles: <label class="inlineLabel"><input type="text" name="18_cfm" id="18_cfm"></label></p>

								<p>
									<div class="g-recaptcha" data-sitekey="#creds.siteKey#"></div>
								</p>
								<p>
									<input type="hidden" name="oid" value="00Do0000000IYWJ">
									<input type="hidden" name="retURL" value="http://www.vac-u-max.com/">
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
								<strong>Explicación de la aplicación</strong><br>
								#form.com#<br>
								<br>
								<h3>1</h3>
								<strong>Producto que se va a transportar</strong>: #form.1_cname#<br>
								<br>
								<h3>2</h3>
								<strong>Densidad a granel</strong>: <cfif form.2_density neq "">#form.2_density# #form.2_units#</cfif><br>
								<br>
								<h3>3- Características del material</h3>
								#form.3a_pellet#, #form.3a_pow#, #form.3a_flake#, #form.3c_dust#, #form.3c_noDust#, #form.3c_abr#, #form.3c_hyg#, #form.3e_cor_a#, #form.3d_cau#, #form.3d_acid#, #form.3d_coh#, #form.3c_frag#, #form.3d_rad#, #form.3f_tox_a#, #form.3g_exp_a#, <cfif form.3c_oth_a neq "">#form.3c_oth_a# - #form.3c_oth_b# </cfif><br>
								<br>
								<h3>4- Propiedades de flujo</h3>
								<strong>Flujo libre</strong>: #form.4_free#<br>
								<strong>Sin flujo libre</strong>: #form.4_notFree#<br>
								<br>
								<h3>5- Inquietud</h3>
								<strong>Segregación</strong>: #form.5_seg#<br>
								<strong>Rotura</strong>: #form.5_break#<br>
								<br>
								<h3>6- Distancias de transporte</h3>
								<strong>Vertical</strong>: #form.7_vert#<br>
								<strong>Horizontal</strong>: #form.7_hor#<br>
								<br>
								<h3>7</h3>
								<strong>Codos de 90° necesarios</strong>: #form.8_bends#<br>
								<br>
								<h3>9</h3>
								<strong>Envase del material</strong>:<br>
								#form.11_silo_a#, #form.11_fib_a#, #form.11_bag_a#, #form.11_box_a#, #form.11_gay_a#<cfif form.11_gay_a neq "">: #form.11_gay_b#</cfif><br>
								<br>
								<h3>10</h3>
								<strong>Velocidad de transporte inmediato</strong>: #form.14_min#<br>
								<br>
								<h3>11</h3>
								<strong>Puntos de entrega</strong>: #form.18_points#<br>
								<br>
								<h3>12- Equipo que se va a alimentar</h3>
								#form.12_mix#, #form.12_blend#, #form.12_react#, #form.12_fill#, #form.12_silo#, #form.12_tank#, #form.12_mill#, #form.12_screen#, #form.12_dry#, #form.12_tab#, #form.12_vol#, #form.12_loss#<br>
								<strong>Otro</strong>: #form.12_other#<br>
								<br>
								<h3>13</h3>
								<strong>Tamaño de la abertura</strong>: #form.19_size#<br>
								<br>
								<h3>14</h3>
								<strong>Espacio libre</strong>: #form.20_room#<br>
								<br>
								<h3>15</h3>
								<strong>Sometido a gases, calor o vapor</strong>: #form.22_heat#<br>
								<strong>Durante la carga/de forma continua</strong>: #form.22_load#<br>
								<br>
								<h3>16</h3>
								<strong>Material específico necesario</strong>: #form.25_steel#, #form.25_304#, #form.25_316#<br>
								<br>
								<h3>17- Alimentación eléctrica disponible</h3>
								#form.26_sing_a# #form.26_sing_b# voltios #form.26_sing_c# Hz<br>
								#form.26_three_a# #form.26_three_b# voltios #form.26_three_c# Hz<br>
								<br>
								<h3>18- Aire comprimido</h3>
								<strong>Disponible</strong>: #form.18_comp#<br>
								<strong>Potencia del compresor</strong>: #form.18_hp# <br>
								<strong>Pies cúbicos/minuto disponibles</strong>: #form.18_comp#<br>
							</cfsavecontent>

			    			<cfinvoke component="#application.components#.formProcessing" method="process">
			    				<cfinvokeargument name="subject" value="VAC-U-MAX Pneumatic Conveying RFQ Form">
			    				<cfinvokeargument name="formName" value="Pneumatic Conveying">
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
			    				<cfhttpparam type="formField" name="description" value="#form.com#">
			    				<cfhttpparam type="formField" name="oid" value="00Do0000000IYWJ">
			    				<cfhttpparam type="formField" name="retURL" value="http://www.vac-u-max.com/">
			    				<cfhttpparam type="formField" name="lead_source" value="Web">
			    				<cfhttpparam type="formField" name="Division__c" value="Conveying-01">
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
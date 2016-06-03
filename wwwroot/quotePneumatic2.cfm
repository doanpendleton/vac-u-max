<cfprocessingdirective pageEncoding="utf-8">
<cfinvoke
	component="#application.components#.queryController"
	method="rfq"
	returnVariable="rfq">
	<cfinvokeargument name="section" value="pneumatic">
</cfinvoke>
<!DOCTYPE html>
<html>
<head>
	<title>VAC-U-MAX | Pneumatic Conveying RFQ</title>
	<meta name="description" content="">
	<cfinclude template="inc/head.cfm">
	<link href="css/chosen.min.css" rel="stylesheet" type="text/css">
	<link href="css/formValidation.min.css" rel="stylesheet" type="text/css">
</head>

<body>
	<cfinclude template="inc/top.cfm">

    <div id="homeCon" class="container">
		<div class="conIndent">
			<div class="row-fluid">
		    	<div id="inBan1" class="inBanner">
		    		<h1>Pneumatic Conveying RFQ</h1>
		    		<div class="clearfix"></div>
		    	</div><!--- inBanner --->
			</div><!--- row-fluid --->

	    	<div class="row-fluid">
	    		<cfinclude template="inc/sideNav.cfm">

	    		<div id="prodCon" class="span9 well">
	    			<cfset showForm = true>
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

					<cfif isDefined("form.send")>
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
								<p class="conField">
									<label class="formLabel">Interested In</label>
									<select name="prod" id="prod" class="form chosen">
										<option value="">-- Select Product --</option>
										<cfloop query="rfq">
											<option value="#rfq.p_title#"<cfif rfq.p_url eq url.prod> selected</cfif>>#rfq.p_title#</option>
										</cfloop>
									</select>
								</p>
								<p class="conField">
									<label class="formLabel"><span class="ast">*</span>Company</label>
									<input type="text" name="co" id="co" class="form" value="#form.co#">
								</p>
								<p class="conField">
									<label class="formLabel"><span class="ast">*</span>First Name</label>
									<input type="text" name="fn" id="fn" class="form" value="#form.fn#">
								</p>
								<p class="conField">
									<label class="formLabel"><span class="ast">*</span>Last Name</label>
									<input type="text" name="ln" id="ln" class="form" value="#form.ln#">
								</p>
								<p class="conField">
									<label class="formLabel"><span class="ast">*</span>Phone</label>
									<input type="text" name="ph" id="ph" class="form" value="#form.ph#">
								</p>
								<p class="conField">
									<label class="formLabel">Fax</label>
									<input type="text" name="fax" id="fax" class="form" value="#form.fax#">
								</p>
								<p class="conField">
									<label class="formLabel"><span class="ast">*</span>Email</label>
									<input type="text" name="email" id="email" class="form" value="#form.email#">
								</p>
								<p class="conField">
									<label class="formLabel"><span class="ast">*</span>Address</label>
									<input type="text" name="ad1" id="ad1" class="form" value="#form.ad1#">
								</p>
								<p class="conField">
									<label class="formLabel">&nbsp;</label>
									<input type="text" name="ad2" id="ad2" class="form" value="#form.ad2#">
								</p>
								<p class="conField">
									<label class="formLabel"><span class="ast">*</span>City</label>
									<input type="text" name="ci" id="ci" class="form" value="#form.ci#">
								</p>
								<p class="conField">
									<label class="formLabel"><span class="ast">*</span>Zip</label>
									<input type="text" name="zip" id="zip" class="form" size="10" value="#form.zip#">
								</p>
								<p class="conField">
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
								<p>
									<label class="formLabel">Explain the Application</label>
									<textarea name="com" id="com" class="form">#form.com#</textarea>
								</p>

								<div class="line clearfix"></div>
								<h3>Please answer as many of the following questions as possible.</h3>
								<p><strong>1.</strong> What is the product is to be conveyed?</p>
								<p>
									<input type="text" name="1_cname" id="1_cname" class="form">
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
								<table class="rfqForm">
									<tr>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="3a_pellet" id="3a_pellet" value="Pellet/Granule">
										Pellet/Granule</label></td>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="3a_pow" id="3a_pow" value="Powder">
										Powder</label></td>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="3a_flake" id="3a_flake" value="Flake">
										Flake</label></td>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="3c_dust" id="3c_dust" value="Dusty">
										Dusty</label></td>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="3c_noDust" id="3c_noDust" value="Non Dusty">
										Non Dusty</label></td>
									</tr>
									<tr>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="3c_hyg" id="3c_hyg" value="Hygroscopic">
										Hygroscopic</label></td>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="3e_cor_a" id="3e_cor_a" value="Corrosive">
										Corrosive</label></td>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="3d_cau" id="3d_cau" value="Caustic">
										Caustic</label></td>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="3c_abr" id="3c_abr" value="Abrasive">
										Abrasive</label></td>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="3d_acid" id="3d_acid" value="Acidic">
										Acidic</label></td>
									</tr>

									<tr>

										<td valign="top"><label class="checkLabel"><input type="checkbox" name="3d_coh" id="3d_coh" value="Cohesive">
										Cohesive</label></td>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="3c_frag" id="3c_frag" value="Fragile">
										Fragile</label></td>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="3d_rad" id="3d_rad" value="Radioactive">
										Radioactive</label></td>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="3f_tox_a" id="3f_tox_a" value="Toxic">
										Toxic</label></td>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="3g_exp_a" id="3g_exp_a" value="Explosive">
										Explosive</label></td>
									</tr>
									<tr>
										<td valign="top" colspan="3"><p><label class="checkLabel"><input type="checkbox" name="3c_oth_a" id="3c_oth_a" value="Other">
										Other</label> <input type="text" name="3c_oth_b" id="3c_oth_b"></td>
									</tr>
								</table>

								<div class="line clearfix"></div>
								<p><strong>4.</strong> What are the material flow properties?</p>
								<table class="rfqForm">
									<tr>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="4_free" id="4_free" value="Yes">
										Free Flowing</label></td>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="4_notFree" id="4_notFree" value="Yes">
										Not Free Flowing</label></td>
									</tr>
								</table>

								<div class="line clearfix"></div>
								<p><strong>5.</strong> Are you concerned about?</p>
								<table class="rfqForm">
									<tr>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="5_seg" id="5_seg" value="Yes">
										Segregation</label></td>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="5_break" id="5_break" value="Yes">
										Breakage</label></td>
									</tr>
								</table>

								<div class="line clearfix"></div>
								<p><strong>6.</strong> What are the conveying distances?</p>
								<p>
									<label class="formLabel">Vertical (feet)</label>
									<input type="text" name="7_vert" id="7_vert">
								</p>
								<p>
									<label class="formLabel">Horizontal (feet)</label>
									<input type="text" name="7_hor" id="7_hor">
								</p>

								<div class="line clearfix"></div>
								<p><strong>7.</strong> How many 90&deg; bends are required? <input type="text" name="8_bends" id="8_bends"></p>

								<div class="line clearfix"></div>
								<p><strong>8.</strong> From how many locations will material be transferred from? One or More?<br>
								<input type="text" name="9_pick" id="9_pick" class="form"></p>

								<div class="line clearfix"></div>
								<p><strong>9.</strong> Material to be transferred is in:</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="11_silo_a" id="11_silo_a" value="Storage Hopper/Silo">
									Storage Hopper/Silo</label>
									<label class="checkLabel"><input type="checkbox" name="11_fib_a" id="11_fib_a" value="Drums">
									Drums</label>
									<label class="checkLabel"><input type="checkbox" name="11_bag_a" id="11_bag_a" value="Bags">
									Bags</label>
									<label class="checkLabel"><input type="checkbox" name="11_box_a" id="11_box_a" value="Boxes">
									Boxes</label>
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="11_gay_a" id="11_gay_a" value="Other">
									Other</label>
									<label class="inlineLabel"><input type="text" name="11_gay_b" id="11_gay_b"></label>
								</p>

								<div class="line clearfix"></div>
								<p><strong>10.</strong> What is the Instantaneous Conveying Rate of the system in pounds per hour?<br>
								<input type="text" name="14_min" id="14_min" class="form"></label></p>

								<div class="line clearfix"></div>
								<p><strong>11.</strong> How many delivery points will material be delivered to? One, two, or more?<br>
								<input type="text" name="18_points" id="18_points"></p>

								<div class="line clearfix"></div>
								<p><strong>12.</strong> What is the equipment in to which the material will be delivered?</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="12_mix" id="12_mix" value="Mixer"> Mixer</label>
									<label class="checkLabel"><input type="checkbox" name="12_blend" id="12_blend" value="Blender"> Blender</label>
									<label class="checkLabel"><input type="checkbox" name="12_react" id="12_react" value="Reactor"> Reactor</label>
									<label class="checkLabel"><input type="checkbox" name="12_fill" id="12_fill" value="Filling Machine"> Filling Machine</label>
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="12_silo" id="12_silo" value="Silo"> Silo</label>
									<label class="checkLabel"><input type="checkbox" name="12_tank" id="12_tank" value="Tank"> Tank</label>
									<label class="checkLabel"><input type="checkbox" name="12_mill" id="12_mill" value="Mill"> Mill</label>
									<label class="checkLabel"><input type="checkbox" name="12_screen" id="12_screen" value="Screen"> Screen</label>
									<label class="checkLabel"><input type="checkbox" name="12_dry" id="12_dry" value="Dryer"> Dryer</label>
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="12_tab" id="12_tab" value="Tablet Press"> Tablet Press</label>
									<label class="checkLabel"><input type="checkbox" name="12_vol" id="12_vol" value="Volumetric Feed"> Volumetric Feed</label>
									<label class="checkLabel"><input type="checkbox" name="12_loss" id="12_loss" value="Loss-In-Wt Feeder"> Loss-In-Wt Feeder</label>
								</p>
								<p>
									<label class="formLabel">Other</label>
									<input type="text" name="12_other" id="12_other" class="form">
								</p>

								<div class="line clearfix"></div>
								<p>
									<strong>13.</strong> What is the size of the opening on the equipment to be fed?
									<input type="text" name="19_size" id="19_size">
								</p>

								<div class="line clearfix"></div>
								<p>
									<strong>14.</strong> How much headroom do you have over equipment to be fed?
									<input type="text" name="20_room" id="20_room">
								</p>

								<div class="line clearfix"></div>
								<p>
									<strong>15.</strong> Will our equipment be subjected to fumes, heat or vapor emitted from the equipment being fed?<br>
									<label class="checkLabel"><input type="radio" name="22_heat" id="22_heat" value="Yes"> Yes</label>
									<label class="checkLabel"><input type="radio" name="22_heat" id="22_heat" value="No"> No</label>
								</p>
								<p>
									Only during loading operation or continuously?
									<label class="checkLabel"><input type="radio" name="22_load" id="22_load" value="Only during loading"> Only during loading</label>
									<label class="checkLabel"><input type="radio" name="22_load" id="22_load" value="Continuously"> Continuously</label>
								</p>

								<div class="line clearfix"></div>
								<p><strong>16.</strong> Construction material for system components in contact with material?</p>
								<table class="rfqForm">
									<tr>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="25_steel" id="25_steel" value="Carbon Steel">
										Mild Steel</label></td>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="25_304" id="25_304" value="304 SS">
										304 Stainless Steel</label></td>
										<td valign="top"><label class="checkLabel"><input type="checkbox" name="25_316" id="25_316" value="316 SS">
										316 Stainless Steel</label></td>
									</tr>
								</table>

								<div class="line clearfix"></div>
								<p><strong>17.</strong> Electrical power available?</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="26_sing_a" id="26_sing_a" value="Single Phase">
									Single Phase</label>
									<label class="inlineLabel"><input type="text" name="26_sing_b" id="26_sing_b" class="form2"> volts</label>
									<label class="inlineLabel"><input type="text" name="26_sing_c" id="26_sing_c" class="form2"> Hz</label>
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="26_three_a" id="26_three_a" value="Three Phase">
									Three Phase</label>
									<label class="inlineLabel"><input type="text" name="26_three_b" id="26_three_b" class="form2"> volts</label>
									<label class="inlineLabel"><input type="text" name="26_three_c" id="26_three_c" class="form2"> Hz</label>
								</p>

								<div class="line clearfix"></div>
								<p><strong>18.</strong> Plant compressed air available?
									<label class="checkLabel"><input type="radio" name="18_comp" id="18_comp" value="Yes"> Yes</label>
									<label class="checkLabel"><input type="radio" name="18_comp" id="18_comp" value="No"> No</label>
								</p>
								<p>Compressor HP: <label class="inlineLabel"><input type="text" name="18_hp" id="18_hp"></label></p>
								<p>Indicate number of CFM available: <label class="inlineLabel"><input type="text" name="18_cfm" id="18_cfm"></label></p>

								<p class="conField">
									<div id="captchaContainer"></div>
								</p>
								<p class="conField">
									<input type="hidden" name="oid" value="00Do0000000IYWJ">
									<input type="hidden" name="retURL" value="http://www.vac-u-max.com/">
									<input name="send" type="submit" id="send" value="Submit Quote">
									<button type="button" id="reset" class="btn">Reset Captcha</button>
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
								<strong>Application Explanation</strong><br>
								#form.com#<br>
								<br>
								<h3>1</h3>
								<strong>Product being conveyed</strong>: #form.1_cname#<br>
								<br>
								<h3>2</h3>
								<strong>Bulk Density</strong>: <cfif form.2_density neq "">#form.2_density# #form.2_units#</cfif><br>
								<br>
								<h3>3 - Material Characteristics</h3>
								#form.3a_pellet#, #form.3a_pow#, #form.3a_flake#, #form.3c_dust#, #form.3c_noDust#, #form.3c_abr#, #form.3c_hyg#, #form.3e_cor_a#, #form.3d_cau#, #form.3d_acid#, #form.3d_coh#, #form.3c_frag#, #form.3d_rad#, #form.3f_tox_a#, #form.3g_exp_a#, <cfif form.3c_oth_a neq "">#form.3c_oth_a# - #form.3c_oth_b# </cfif><br>
								<br>
								<h3>4- Flow Properties</h3>
								<strong>Free Flowing</strong>: #form.4_free#<br>
								<strong>Not Free Flowing</strong>: #form.4_notFree#<br>
								<br>
								<h3>5 - Concerned About</h3>
								<strong>Segregation</strong>: #form.5_seg#<br>
								<strong>Breakage</strong>: #form.5_break#<br>
								<br>
								<h3>6 - Conveying Distances</h3>
								<strong>Vertical</strong>: #form.7_vert#<br>
								<strong>Horizontal</strong>: #form.7_hor#<br>
								<br>
								<h3>7</h3>
								<strong>90&deg; Bends Required</strong>: #form.8_bends#<br>
								<br>
								<h3>9</h3>
								<strong>Material Container</strong>:<br>
								#form.11_silo_a#, #form.11_fib_a#, #form.11_bag_a#, #form.11_box_a#, #form.11_gay_a#<cfif form.11_gay_a neq "">: #form.11_gay_b#</cfif><br>
								<br>
								<h3>10</h3>
								<strong>Instantaneous Conveying Rate</strong>: #form.14_min#<br>
								<br>
								<h3>11</h3>
								<strong>Delivery Points</strong>: #form.18_points#<br>
								<br>
								<h3>12 - Equipment to be Fed</h3>
								#form.12_mix#, #form.12_blend#, #form.12_react#, #form.12_fill#, #form.12_silo#, #form.12_tank#, #form.12_mill#, #form.12_screen#, #form.12_dry#, #form.12_tab#, #form.12_vol#, #form.12_loss#<br>
								<strong>Other</strong>: #form.12_other#<br>
								<br>
								<h3>13</h3>
								<strong>Opening Size</strong>: #form.19_size#<br>
								<br>
								<h3>14</h3>
								<strong>Head Room</strong>: #form.20_room#<br>
								<br>
								<h3>15</h3>
								<strong>Subjected to Fumes, Heat or Vapor</strong>: #form.22_heat#<br>
								<strong>During Loading/Continuously</strong>: #form.22_load#<br>
								<br>
								<h3>16</h3>
								<strong>Specific Material Required</strong>: #form.25_steel#, #form.25_304#, #form.25_316#<br>
								<br>
								<h3>17 - Power Available</h3>
								#form.26_sing_a# #form.26_sing_b# volts #form.26_sing_c# Hz<br>
								#form.26_three_a# #form.26_three_b# volts #form.26_three_c# Hz<br>
								<br>
								<h3>18 - Compressed Air</h3>
								<strong>Available</strong>: #form.18_comp#<br>
								<strong>Compressor HP</strong>: #form.18_hp#<br>
								<strong>CFM available</strong>: #form.18_cfm#<br>
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
								<cfinvokeargument name="section" value="pnue">
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

	<cfinclude template="inc/scripts.cfm">
	<script src="js/chosen.jquery.min.js"></script>
	<script src="js/formValidation.min.js"></script>
	<script src="js/framework/bootstrap.min.js"></script>
	<script src="js/reCaptcha2.min.js"></script>
	<script>
		$(document).ready(function() {
			var prevC = '<cfoutput>#form.cou#</cfoutput>';

			function updateStates() {
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
								$('#st').append('<option value="' + abbr + '">' + name + '</option>');
							});
							$('#state').removeClass('hidden');
							$('#st').chosen();
							$('#st').trigger('chosen:updated');
							$('#form').formValidation('addField', 'st', {
					            validators: {
					                notEmpty: {
					                    message: 'Please select your state'
					                }
					            }
					        });
						} else {
							$('#state').addClass('hidden');
							$('#form').formValidation('removeField', 'st');
						}
					}
				});
			}

			$('#prod').chosen();
			if (prevC !== "") {
				$("#cou").val(prevC).trigger("liszt:updated");
			}
			$('#cou').chosen(updateStates());
			$('#cou').on('change', function(e, c) {
				updateStates();
			});

			$('#form')
				.find('#cou')
		            // Revalidate the color when it is changed
		            .change(function(e) {
		                $('#form').formValidation('revalidateField', 'cou');
		            })
		            .end()
				.formValidation({
			        addOns: {
				        reCaptcha2: {
				            element: 'captchaContainer',
				            language: 'en',
				            theme: 'light',
				            siteKey: '6Lf90wkTAAAAAGIQRkuk3RGUoz8BjYa2AKl50E8j',
				            timeout: 120,
				            message: 'The captcha is not valid'
				        }
				    },
			        excluded: ':disabled',
			        framework: 'bootstrap',
			        icon: {
			            valid: 'glyphicon glyphicon-ok',
			            invalid: 'glyphicon glyphicon-remove',
			            validating: 'glyphicon glyphicon-refresh'
			        },
			        row: {
			            selector: '.conField',
			            valid: 'has-success',
			            invalid: 'has-error'
			        },
			        fields: {
			            co: {
			                validators: {
			                    notEmpty: {
			                        message: 'Please enter your company name.'
			                    }
			                }
			            },
			            fn: {
			                validators: {
			                    notEmpty: {
			                        message: 'Please enter your first name.'
			                    }
			                }
			            },
			            ln: {
			                validators: {
			                    notEmpty: {
			                        message: 'Please enter your last name.'
			                    }
			                }
			            },
			            ph: {
			                validators: {
			                    notEmpty: {
			                        message: 'Please enter your phone number.'
			                    }
			                }
			            },
			            email: {
			                validators: {
			                    notEmpty: {
			                        message: 'Please enter your email address.'
			                    },
			                    emailAddress: {
			                        message: 'You have not entered a valid email address.'
			                    }
			                }
			            },
			            ad1: {
			                validators: {
			                    notEmpty: {
			                        message: 'Please enter your address.'
			                    }
			                }
			            },
			            city: {
			                validators: {
			                    notEmpty: {
			                        message: 'Please enter your city.'
			                    }
			                }
			            },
			            cou: {
		                    validators: {
		                        callback: {
		                            message: 'Please select your country.',
		                            callback: function(value, validator, $field) {
		                                // Get the selected options
		                                var options = validator.getFieldElements('cou').val();
		                                return;
		                            }
		                        }
		                    }
		                },
			            zip: {
			                validators: {
			                    notEmpty: {
			                        message: 'Please enter your zip code.'
			                    }
			                }
			            }
			        }
			    });

			$('#reset').on('click', function() {
		        FormValidation.AddOn.reCaptcha2.reset('captchaContainer');
		    });
		});
	</script>
</body>
</html>
<cfinvoke
	component="#application.components#.queryController"
	method="vacCat"
	returnvariable="own">
</cfinvoke>
<cfinvoke
	component="#application.components#.queryController"
	method="vacAccAdmin"
	returnvariable="allAcc">
</cfinvoke>
<cfprocessingdirective pageEncoding="utf-8">
<!DOCTYPE html>
<html>
<head>
	<cfinclude template="inc/head.cfm">
	<link href="../css/chosen.min.css" rel="stylesheet" type="text/css">
</head>

<body>
	<cfinclude template="inc/top.cfm">

    <div class="container">
		<div class="conIndent">
	    	<div class="row-fluid">
	    		<div id="prodCon" class="span12 well">
	    			<cfset showForm = true>
	    			<cfparam name="url.prod" default="">
					<cfparam name="form.vacID" default="">
					<cfparam name="form.cat" default="">
					<cfparam name="form.subCat" default="">
					<cfparam name="form.acc" default="">
					<cfparam name="form.ti" default="">
					<cfparam name="form.item" default="">
					<cfparam name="form.img" default="">
					<cfparam name="form.desc" default="">
					<cfparam name="form.dShort" default="">
					<cfparam name="form.stan" default="">
					<cfparam name="form.tech" default="">
					<cfparam name="form.desc2" default="">
					<cfparam name="form.meta" default="">
					<cfparam name="form.hide" default="1">

					<cfif isDefined("form.send")>
						<cfset errors = "">

						<cfif errors is "">
							<!--- do something here --->
							<cfset showForm = false>
						</cfif>
					</cfif>

					<!---<a href="addProducts.cfm" class="quoteBtn">Add Products to Category</a>--->
					<cfif showForm>
						<cfif url.prod eq "">
		    				<h1>Add Product</h1>

							<cfoutput>
							<form action="#cgi.script_name#" method="post" id="form" enctype="multipart/form-data">
								<p>Fields designated with an asterisk (<span class="ast">*</span>) are required.</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Category(s)</label>
									<select name="cat" id="cat" class="form chosen" data-placeholder="- Select at least one category -" multiple>
										<cfloop query="own">
											<cfif own.l_switch eq 1>
												<option value="#own.c_id#">#own.c_title#</option>
											</cfif>
										</cfloop>
									</select>
								</p>
								<p id="subCatField">
									<label class="formLabel">Subcategory(s)</label>
									<select name="subCat" id="subCat" class="form chosenSub" data-placeholder="- Select at least one subcategory -" multiple>

									</select>
								</p>
								<p>
									<label class="formLabel">Accessories</label>
									<select name="acc" id="acc" class="form chosen" data-placeholder="- Select related accessories -" multiple>
										<cfloop query="allAcc">
											<option value="#allAcc.a_id#">#allAcc.a_title# (#allAcc.a_item#)</option>
										</cfloop>
									</select>
								</p>
								<div class="clearfix"></div>
								<p>
									<label class="formLabel"><span class="ast">*</span>Title</label>
									<input type="text" name="ti" id="ti" class="form">
								</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Item Number</label>
									<input type="text" name="item" id="item" class="form">
								</p>
								<p>
									<label class="formLabel">Image</label>
									<input type="file" name="img" id="img" class="form">
								</p>
								<p>
									Short Description (<em>Displayed on overview page</em>)<br>
									<textarea name="descS" id="descS" class="form" cols="80"></textarea>
								</p>
								<p>
									Description<br>
									<textarea name="desc" id="desc" class="ckeditor" cols="80"></textarea>
								</p>
								<p>
									<br>Standard Equipment<br>
									<textarea name="stan" id="stan" class="ckeditor" cols="80"></textarea>
								</p>
								<p>
									<br>Technical Data<br>
									<textarea name="tech" id="tech" class="ckeditor" cols="80"></textarea>
								</p>
								<p>
									<br>Sales Info/Disclaimers<br>
									<textarea name="desc2" id="desc2" class="ckeditor" cols="80"></textarea>
									<br>
								</p>
								<p>
									<br>Meta<br>
									<textarea name="meta" id="meta" class="form" cols="80"></textarea>
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="hide" id="hide" value="0"> Hidden</label>
								</p>
								<p>
									<input type="hidden" name="vacID" id="vacID" value="">
									<input name="send" type="submit" id="submit" value="Submit">
								</p>
							</form>
							</cfoutput>

						<cfelse>
							<cfinvoke
								component="#application.components#.queryController"
								method="vacProd"
								returnvariable="prod">
								<cfinvokeargument name="selectProd" value="#url.prod#">
							</cfinvoke>

							<h1>Edit Product</h1>

							<cfoutput query="prod" group="v_id">
							<form action="#cgi.script_name#" method="post" id="form" enctype="multipart/form-data">
								<p>Fields designated with an asterisk (<span class="ast">*</span>) are required.</p>
								<p>
									<cfquery name="cats" datasource="#application.datasource#">
										SELECT c_title
										FROM prodCat
										LEFT JOIN link
										ON c_id = ownerID
										WHERE vacID = <cfqueryparam value="#prod.v_id#" CFSQLType="cf_sql_integer">
											AND ownerID > 0
										ORDER BY c_title
									</cfquery>
									<label class="formLabel"><span class="ast">*</span>Category(s)</label>
									<select name="cat" id="cat" class="form chosen" data-placeholder="- Select at least one category -" multiple>
										<cfloop query="own">
											<cfif own.l_switch eq 1>
												<option value="#own.c_id#"<cfloop query="cats"><cfif own.c_title eq cats.c_title> selected</cfif></cfloop>>#own.c_title#</option>
											</cfif>
										</cfloop>
									</select>
								</p>
								<p id="subCatField">
									<label class="formLabel">Subcategory(s)</label>
									<select name="subCat" id="subCat" class="form chosenSub" data-placeholder="- Select at least one subcategory -" multiple>

									</select>
								</p>
								<p>
									<cfinvoke
										component="#application.components#.queryController"
										method="vacAcc"
										returnvariable="acc">
										<cfinvokeargument name="selectAcc" value="#prod.v_id#">
									</cfinvoke>
									<label class="formLabel">Accessories</label>
									<select name="acc" id="acc" class="form chosen" data-placeholder="- Select related accessories -" multiple>
										<cfloop query="allAcc">
											<option value="#allAcc.a_id#"<cfloop query="acc"><cfif acc.a_id eq allAcc.a_id> selected</cfif></cfloop>>#allAcc.a_title# (#allAcc.a_item#)</option>
										</cfloop>
									</select>
								</p>
								<div class="clearfix"></div>
								<p>
									<label class="formLabel"><span class="ast">*</span>Title</label>
									<input type="text" name="ti" id="ti" class="form" value="#prod.v_title#">
								</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Item Number</label>
									<input type="text" name="item" id="item" class="form" value="#prod.v_item#">
								</p>
								<p id="prodImg">
									<cfif prod.v_imgFile eq "">
										<label class="formLabel">Image</label>
										<input type="file" name="img" id="img" class="form">
										<input type="hidden" name="hasImg" id="hasImg" value="">
									<cfelse>
										<input type="hidden" name="hasImg" id="hasImg" value="#prod.v_imgFile#">
										<label class="formLabel">Image</label> <img src="#application.root#prodImg/#prod.v_imgFile#" width="100"> [<a href="##" id="delete" rel="#prod.v_id#">Delete</a>]
									</cfif>
								</p>
								<p>
									Short Description (<em>Displayed on overview page</em>)<br>
									<textarea name="descS" id="descS" class="shortD">#prod.v_descShort#</textarea>
								</p>
								<p>
									Description<br>
									<textarea name="desc" id="desc" class="ckeditor" cols="80">#prod.v_desc#</textarea>
								</p>
								<p>
									<br>Standard Equipment<br>
									<textarea name="stan" id="stan" class="ckeditor" cols="80">#prod.v_stan#</textarea>
								</p>
								<p>
									<br>Technical Data<br>
									<textarea name="tech" id="tech" class="ckeditor" cols="80">#prod.v_tech#</textarea>
								</p>
								<p>
									<br>Sales Info/Disclaimers<br>
									<textarea name="desc2" id="desc2" class="ckeditor" cols="80">#prod.v_desc2#</textarea>
								</p>
								<p>
									<br>Meta<br>
									<textarea name="meta" id="meta" class="ckeditor" cols="80">#prod.v_meta#</textarea>
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="hide" id="hide" value="0"<cfif prod.v_switch eq 0> checked</cfif>> Hidden</label>
								</p>
								<p>
									<input type="hidden" name="vacID" id="vacID" value="#url.prod#">
									<input name="send" type="submit" id="submit" value="Submit">
								</p>
							</form>
							</cfoutput>
						</cfif>

					<cfelse>

						<cfif form.vacID eq "">
							<!--- Add new product to db. --->
							<cfoutput>
							<cfset destination = expandPath("../prodImg")>

							<cfif form.img neq "">
								<cffile action="upload" filefield="img" destination="#destination#" nameConflict="makeUnique" result="upload">
								<cfset img = "#upload.serverfile#">
			                </cfif>

							<cfquery name="addProd" dataSource="#application.datasource#" result="added">
								INSERT INTO vacuum
								(v_title, v_item, v_desc, v_descShort, v_stan, v_tech, v_desc2, v_imgFile, v_meta, v_switch)
								VALUES (
									<cfqueryparam value="#Trim(form.ti)#" cfsqltype="cf_sql_varchar">,
									<cfqueryparam value="#Trim(form.item)#" cfsqltype="cf_sql_varchar">,
									<cfqueryparam value="#Trim(form.desc)#" cfsqltype="cf_sql_text">,
									<cfqueryparam value="#Trim(form.descS)#" cfsqltype="cf_sql_varchar">,
									<cfqueryparam value="#Trim(form.stan)#" cfsqltype="cf_sql_text">,
									<cfqueryparam value="#Trim(form.tech)#" cfsqltype="cf_sql_text">,
									<cfqueryparam value="#Trim(form.desc2)#" cfsqltype="cf_sql_text">,
									<cfqueryparam value="#Trim(img)#" cfsqltype="cf_sql_varchar">,
									<cfqueryparam value="#Trim(form.meta)#" cfsqltype="cf_sql_text">,
									<cfqueryparam value="#form.hide#" cfsqltype="cf_sql_varchar">)
							</cfquery>

							<cfset newID = added.generatedkey>

							<!--- Add the category links --->
							<cfloop list="#form.cat#" index="i">
								<!--- Gets the next order value --->
								<cfquery name="getOrder" dataSource="#application.datasource#">
									SELECT ownerID, catID, sOwnerID, sCatID, l_order, l_switch
									FROM link
									WHERE ownerID = <cfqueryparam value="#i#" CFSQLType="cf_sql_integer">
									AND l_switch = <cfqueryparam value="1" CFSQLType="cf_sql_integer">
									ORDER BY l_order desc
									LIMIT 1
								</cfquery>

								<cfif getOrder.recordcount gt 0>
									<cfset order = "">
									<cfloop query="getOrder">
										<cfset order = getOrder.l_order+1>
									</cfloop>
								<cfelse>
									<cfset order = 1>
								</cfif>

								<cfquery name="addLink" dataSource="#application.datasource#">
									INSERT INTO link
									(ownerID, catID, sOwnerID, sCatID, prodID, vacID, accID, l_order, l_switch)
									VALUES (
										<cfqueryparam value="#i#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#newID#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#order#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#Trim(form.hide)#" cfsqltype="cf_sql_integer">)
								</cfquery>
							</cfloop>

							<!--- Add the subcateory links --->
							<cfloop list="#form.subCat#" index="i">
								<!--- Gets the next order value --->
								<cfquery name="getOrder" dataSource="#application.datasource#">
									SELECT ownerID, catID, sOwnerID, sCatID, l_order, l_switch
									FROM link
									WHERE sOwnerID = <cfqueryparam value="#i#" CFSQLType="cf_sql_integer">
									AND l_switch = <cfqueryparam value="1" CFSQLType="cf_sql_integer">
									ORDER BY l_order desc
									LIMIT 1
								</cfquery>

								<cfif getOrder.recordcount gt 0>
									<cfset order = "">
									<cfloop query="getOrder">
										<cfset order = getOrder.l_order+1>
									</cfloop>
								<cfelse>
									<cfset order = 1>
								</cfif>

								<cfquery name="addLink" dataSource="#application.datasource#">
									INSERT INTO link
									(ownerID, catID, sOwnerID, sCatID, prodID, vacID, accID, l_order, l_switch)
									VALUES (
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#i#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#newID#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#order#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#Trim(form.hide)#" cfsqltype="cf_sql_integer">)
								</cfquery>
							</cfloop>

							<!--- Add the accessories links --->
							<cfloop list="#form.acc#" index="i">
								<!--- Gets the next order value --->
								<cfquery name="getOrder" dataSource="#application.datasource#">
									SELECT vacID, accID, al_order, al_switch
									FROM accLink
									WHERE vacID = <cfqueryparam value="#newID#" CFSQLType="cf_sql_integer">
									AND al_switch = <cfqueryparam value="1" CFSQLType="cf_sql_integer">
									ORDER BY al_order desc
									LIMIT 1
								</cfquery>

								<cfif getOrder.recordcount gt 0>
									<cfset order = "">
									<cfloop query="getOrder">
										<cfset order = getOrder.al_order+1>
									</cfloop>
								<cfelse>
									<cfset order = 1>
								</cfif>

								<cfquery name="addLink" dataSource="#application.datasource#">
									INSERT INTO accLink
									(vacID, accID, al_order, al_switch)
									VALUES (
										<cfqueryparam value="#newID#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#i#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#order#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="1" cfsqltype="cf_sql_integer">)
								</cfquery>
							</cfloop>

							<cflocation url="vacuum.cfm?add" addToken="no">
							</cfoutput>

						<cfelse>

							<!--- Edit product --->
							<cfoutput>
							<cfif form.hasImg eq "">
								<cfset destination = expandPath("../prodImg")>

								<cfif form.img neq "">
									<cffile action="upload" filefield="img" destination="#destination#" nameConflict="makeUnique" result="upload">
									<cfset img = "#upload.serverfile#">
				                </cfif>
				            <cfelse>
				            	<cfset img = form.hasImg>
							</cfif>

							<cfquery name="editProd" dataSource="#application.datasource#">
								UPDATE vacuum
								SET v_title = <cfqueryparam value="#Trim(form.ti)#" cfsqltype="cf_sql_varchar">,
									v_item = <cfqueryparam value="#Trim(form.item)#" cfsqltype="cf_sql_varchar">,
									v_desc = <cfqueryparam value="#Trim(form.desc)#" cfsqltype="cf_sql_text">,
									v_descShort = <cfqueryparam value="#Trim(form.descS)#" cfsqltype="cf_sql_varchar">,
									v_stan = <cfqueryparam value="#Trim(form.stan)#" cfsqltype="cf_sql_text">,
									v_tech = <cfqueryparam value="#Trim(form.tech)#" cfsqltype="cf_sql_text">,
									v_desc2 = <cfqueryparam value="#Trim(form.desc2)#" cfsqltype="cf_sql_text">,
									v_imgFile = <cfqueryparam value="#Trim(img)#" cfsqltype="cf_sql_varchar">,
									v_meta = <cfqueryparam value="#Trim(form.meta)#" cfsqltype="cf_sql_text">,
									v_switch = <cfqueryparam value="#form.hide#" cfsqltype="cf_sql_varchar">
								WHERE v_id = <cfqueryparam value="#form.vacID#" cfsqltype="cf_sql_integer">
							</cfquery>

							<!--- Clear the link tables --->
							<cfquery name="deleteLinkProd" dataSource="#application.datasource#">
								DELETE FROM link
								WHERE vacID = <cfqueryparam value="#form.vacID#" cfsqltype="cf_sql_integer">
							</cfquery>

							<cfquery name="deleteAccLink" dataSource="#application.datasource#">
								DELETE FROM accLink
								WHERE vacID = <cfqueryparam value="#form.vacID#" cfsqltype="cf_sql_integer">
							</cfquery>

							<!--- Add the category links --->
							<cfloop list="#form.cat#" index="i">
								<cfquery name="getOrder" dataSource="#application.datasource#">
									SELECT ownerID, catID, sOwnerID, sCatID, l_order, l_switch
									FROM link
									WHERE ownerID = <cfqueryparam value="#i#" CFSQLType="cf_sql_integer">
									AND l_switch = <cfqueryparam value="1" CFSQLType="cf_sql_integer">
									ORDER BY l_order desc
									LIMIT 1
								</cfquery>

								<cfif getOrder.recordcount gt 0>
									<cfset order = "">
									<cfloop query="getOrder">
										<cfset order = getOrder.l_order+1>
									</cfloop>
								<cfelse>
									<cfset order = 1>
								</cfif>

								<cfquery name="addLink" dataSource="#application.datasource#">
									INSERT INTO link
									(ownerID, catID, sOwnerID, sCatID, prodID, vacID, accID, l_order, l_switch)
									VALUES (
										<cfqueryparam value="#i#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#form.vacID#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#order#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#Trim(form.hide)#" cfsqltype="cf_sql_integer">)
								</cfquery>
							</cfloop>

							<!--- Add the subcategory links --->
							<cfloop list="#form.subCat#" index="i">
								<cfquery name="getOrder" dataSource="#application.datasource#">
									SELECT ownerID, catID, sOwnerID, sCatID, l_order, l_switch
									FROM link
									WHERE sOwnerID = <cfqueryparam value="#i#" CFSQLType="cf_sql_integer">
									AND l_switch = <cfqueryparam value="1" CFSQLType="cf_sql_integer">
									ORDER BY l_order desc
									LIMIT 1
								</cfquery>

								<cfif getOrder.recordcount gt 0>
									<cfset order = "">
									<cfloop query="getOrder">
										<cfset order = getOrder.l_order+1>
									</cfloop>
								<cfelse>
									<cfset order = 1>
								</cfif>

								<cfquery name="addLink" dataSource="#application.datasource#">
									INSERT INTO link
									(ownerID, catID, sOwnerID, sCatID, prodID, vacID, accID, l_order, l_switch)
									VALUES (
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#i#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#form.vacID#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#order#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#Trim(form.hide)#" cfsqltype="cf_sql_integer">)
								</cfquery>
							</cfloop>

							<!--- Add the accessories links --->
							<cfloop list="#form.acc#" index="i">
								<!--- Gets the next order value --->
								<cfquery name="getOrder" dataSource="#application.datasource#">
									SELECT vacID, accID, al_order
									FROM accLink
									WHERE vacID = <cfqueryparam value="#form.vacID#" CFSQLType="cf_sql_integer">
									AND al_switch = <cfqueryparam value="1" CFSQLType="cf_sql_integer">
									ORDER BY al_order desc
									LIMIT 1
								</cfquery>

								<cfif getOrder.recordcount gt 0>
									<cfset order = "">
									<cfloop query="getOrder">
										<cfset order = getOrder.al_order+1>
									</cfloop>
								<cfelse>
									<cfset order = 1>
								</cfif>

								<cfquery name="addLink" dataSource="#application.datasource#">
									INSERT INTO accLink
									(vacID, accID, al_order, al_switch)
									VALUES (
										<cfqueryparam value="#form.vacID#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#i#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#order#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="1" cfsqltype="cf_sql_integer">)
								</cfquery>
							</cfloop>

							<cflocation url="vacuum.cfm?edit" addToken="no">
							</cfoutput>
						</cfif>
					</cfif>
	    		</div>
	    	</div><!--- row-fluid--->
		</div><!--- conIndent --->
    </div><!--- container --->

    <cfinclude template="inc/footer.cfm">

	<cfinclude template="inc/scripts.cfm">
	<script src="<cfoutput>#application.root#</cfoutput>js/jquery.validate.min.js"></script>
	<script src="<cfoutput>#application.root#</cfoutput>js/additional-methods.min.js"></script>
	<script src="<cfoutput>#application.root#</cfoutput>js/ckeditor/ckeditor.js"></script>
	<script src="<cfoutput>#application.root#</cfoutput>js/ckeditor/adapters/jquery.js"></script>
	<script src="<cfoutput>#application.root#</cfoutput>js/chosen.jquery.min.js"></script>
	<script>
		$(document).ready(function() {
			function updateSubs() {
				var c = $('#cat').val();
				var p = '<cfoutput>#url.prod#</cfoutput>';
				if (c !== null) {
					c = c.join(',');
				}
				$.ajax({
					type: 'POST',
					url: 'getStuff.cfm',
					data: { section: 'subCatsVac', cat: c, prod: p },
					success: function(response){
						if (c !== null && $(response).find('list').text() === 'true') {
							$('#subCat').html('');
							$(response).find('subcat').each(function(){
								var sID = $(this).find('id').text();
								var sTitle = $(this).find('title').text();
								var sSel = $(this).find('selected').text();
								if (sSel === 'true') {
									$('#subCat').append('<option value="' + sID + '" selected>' + sTitle + "</option>");
								} else {
									$('#subCat').append('<option value="' + sID + '">' + sTitle + "</option>");
								}
							});
							$('#subCatField').css('display', 'block');
							$('#subCat').chosen();
							$('#subCat').trigger('chosen:updated');
						} else {
							$('#subCatField').css('display', 'none');
						}
					}
				});
			}

			$('#cat').chosen(updateSubs());
			$('#acc').chosen();
			$('#cat').on('change', function(e, c) {
				updateSubs();
			});

			$('.ckeditor').ckeditor({
				toolbar : 'Default',
	     		customConfig : 'config.js.cfm',
	     		filebrowserImageUploadUrl : '../js/ckfinder/core/connector/cfm/connector.cfm?command=QuickUpload&type=Images'
			});

			$.validator.addMethod("noSpaces", function(value, element) {
				return value.indexOf(" ") < 0 && value != "";
			}, "Spaces are not allowed.")

			$("#form").validate({
				errorPlacement: function(error, element) {
					 error.appendTo(element.parent());
				},
				rules: {
					cat: "required",
					ti: "required",
					item: {
						required: true,
						noSpaces: true
					},
					img: {
						required: false,
						accept: "image/*"
					},
					descS: {
						required: false,
						maxlength: 110
					}
				},
				messages: {
					cat: "Please select a category.",
					ti: "Please enter a title.",
					item: {
						required: "Please enter an item number.",
						noSpaces: "Spaces are not allowed."
					},
					img: "Only images are allowed.",
					descS: "Please shorten your entry."
				}
			});

			var validator = $("#form").data('validator');
			validator.settings.ignore = ":hidden:not(select)";

			$('.chosen').on("change", function(evt, params) {
			    $(evt.target).valid();
			});

			$('#delete').click(function() {
				var prodImg = $(this).attr('rel');

				if (confirm('Are you sure you want to delete this image?')) {
					$.ajax({
						type: 'GET',
						url: 'delete.cfm',
						data: { section: 'vacImg', prodImg: prodImg},
						success: function(response){
							$('#prodImg').html('<label class="formLabel">Image</label><input type="file" name="img" id="img" class="form">');
						}
					});
				}

				return false;
			});
		});
	</script>
</body>
</html>
<cfinvoke
	component="#application.components#.queryController"
	method="vacCat"
	returnvariable="own">
</cfinvoke>
<cfinvoke
	component="#application.components#.queryController"
	method="vacProd"
	returnvariable="allProd">
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
	    			<cfparam name="url.acc" default="">
					<cfparam name="form.accID" default="">
					<cfparam name="form.cat" default="">
					<cfparam name="form.subCat" default="">
					<cfparam name="form.prod" default="">
					<cfparam name="form.ti" default="">
					<cfparam name="form.item" default="">
					<cfparam name="form.img" default="">
					<cfparam name="form.desc" default="">
					<cfparam name="form.dShort" default="">
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
						<cfif url.acc eq "">
		    				<h1>Add Accessory</h1>

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
									<label class="formLabel">Products</label>
									<select name="prod" id="prod" class="form chosen" data-placeholder="- Select products -" multiple>
										<cfloop query="allProd">
											<option value="#allProd.v_id#">#allProd.v_title# (#allProd.v_item#)</option>
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
									<br>Meta<br>
									<textarea name="meta" id="meta" class="form" cols="80"></textarea>
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="hide" id="hide" value="0"> Hidden</label>
								</p>
								<p>
									<input type="hidden" name="accID" id="accID" value="">
									<input name="send" type="submit" id="submit" value="Submit">
								</p>
							</form>
							</cfoutput>

						<cfelse>
							<cfinvoke
								component="#application.components#.queryController"
								method="vacAccSel"
								returnvariable="acc">
								<cfinvokeargument name="selectAcc" value="#url.acc#">
							</cfinvoke>

							<h1>Edit Accessory</h1>

							<cfoutput query="acc" group="a_id">
							<form action="#cgi.script_name#" method="post" id="form" enctype="multipart/form-data">
								<p>Fields designated with an asterisk (<span class="ast">*</span>) are required.</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Category(s)</label>
									<select name="cat" id="cat" class="form chosen" data-placeholder="- Select at least one category -" multiple>
										<cfloop query="own">
											<cfif own.l_switch eq 1>
												<option value="#own.c_id#"<cfoutput><cfif own.c_id eq acc.ownerID> selected</cfif></cfoutput>>#own.c_title#</option>
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
									<cfquery name="prod" datasource="#application.datasource#">
										SELECT vacID
										FROM accLink
										WHERE accID = <cfqueryparam value="#acc.a_id#" CFSQLType="cf_sql_integer">
									</cfquery>
									<label class="formLabel">Products</label>
									<select name="prod" id="prod" class="form chosen" data-placeholder="- Select products -" multiple>
										<cfloop query="allProd">
											<option value="#allProd.v_id#"<cfloop query="prod"><cfif prod.vacID eq allProd.v_id> selected</cfif></cfloop>>#allProd.v_title# (#allProd.v_item#)</option>
										</cfloop>
									</select>
								</p>
								<div class="clearfix"></div>
								<p>
									<label class="formLabel"><span class="ast">*</span>Title</label>
									<input type="text" name="ti" id="ti" class="form" value="#acc.a_title#">
								</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Item Number</label>
									<input type="text" name="item" id="item" class="form" value="#acc.a_item#">
								</p>
								<p id="prodImg">
									<cfif acc.a_imgFile eq "">
										<label class="formLabel">Image</label>
										<input type="file" name="img" id="img" class="form">
									<cfelse>
										<input type="hidden" name="hasImg" id="hasImg" value="#acc.a_imgFile#">
										<label class="formLabel">Image</label> <img src="#application.root#prodImg/#acc.a_imgFile#" width="100"> [<a href="##" id="delete" rel="#acc.a_id#">Delete</a>]
									</cfif>
								</p>
								<p>
									Short Description (<em>Displayed on overview page</em>)<br>
									<textarea name="descS" id="descS" class="form" cols="80">#acc.a_descShort#</textarea>
								</p>
								<p>
									Description<br>
									<textarea name="desc" id="desc" class="ckeditor" cols="80">#acc.a_desc#</textarea>
								</p>
								<p>
									<br>Meta<br>
									<textarea name="meta" id="meta" class="form" cols="80">#acc.a_meta#</textarea>
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="hide" id="hide" value="0"<cfif acc.a_switch eq 0> checked</cfif>> Hidden</label>
								</p>
								<p>
									<input type="hidden" name="accID" id="accID" value="#url.acc#">
									<input name="send" type="submit" id="submit" value="Submit">
								</p>
							</form>
							</cfoutput>
						</cfif>

					<cfelse>

						<cfif form.accID eq "">
							<!--- Add new product to db. --->
							<cfoutput>
							<cfset destination = expandPath("../prodImg")>

							<cfif form.img neq "">
								<cffile action="upload" filefield="img" destination="#destination#" nameConflict="makeUnique" result="upload">
								<cffile action="rename" source="#destination#/#upload.serverfile#" destination="#destination#/acc_#upload.serverfile#">
								<cfset img = "acc_#upload.serverfile#">
			                </cfif>

							<cfquery name="addAcc" dataSource="#application.datasource#" result="added">
								INSERT INTO accessories
								(a_title, a_item, a_desc, a_descShort, a_imgFile, a_meta, a_switch)
								VALUES (
									<cfqueryparam value="#Trim(form.ti)#" cfsqltype="cf_sql_varchar">,
									<cfqueryparam value="#Trim(form.item)#" cfsqltype="cf_sql_varchar">,
									<cfqueryparam value="#Trim(form.desc)#" cfsqltype="cf_sql_text">,
									<cfqueryparam value="#Trim(form.descS)#" cfsqltype="cf_sql_varchar">,
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
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#newID#" cfsqltype="cf_sql_integer">,
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
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#newID#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#order#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#Trim(form.hide)#" cfsqltype="cf_sql_integer">)
								</cfquery>
							</cfloop>

							<!--- Add the product links --->
							<cfloop list="#form.prod#" index="i">
								<!--- Gets the next order value --->
								<cfquery name="getOrder" dataSource="#application.datasource#">
									SELECT vacID, accID, al_order
									FROM accLink
									WHERE accID = <cfqueryparam value="#newID#" CFSQLType="cf_sql_integer">
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
										<cfqueryparam value="#i#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#newID#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#order#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="1" cfsqltype="cf_sql_integer">)
								</cfquery>
							</cfloop>

							<cflocation url="vacAcc.cfm?add" addToken="no">
							</cfoutput>

						<cfelse>

							<!--- Edit product --->
							<cfoutput>
							<cfif not isDefined("form.hasImg")>
								<cfset destination = expandPath("../prodImg")>

								<cfif form.img neq "">
									<cffile action="upload" filefield="img" destination="#destination#" nameConflict="makeUnique" result="upload">
									<cfset img = "acc_#upload.serverfile#">
				                </cfif>
				            <cfelse>
				            	<cfset img = form.hasImg>
							</cfif>

							<cfquery name="editAcc" dataSource="#application.datasource#">
								UPDATE accessories
								SET a_title = <cfqueryparam value="#Trim(form.ti)#" cfsqltype="cf_sql_varchar">,
									a_item = <cfqueryparam value="#Trim(form.item)#" cfsqltype="cf_sql_varchar">,
									a_desc = <cfqueryparam value="#Trim(form.desc)#" cfsqltype="cf_sql_text">,
									a_descShort = <cfqueryparam value="#Trim(form.descS)#" cfsqltype="cf_sql_varchar">,
									a_imgFile = <cfqueryparam value="#Trim(img)#" cfsqltype="cf_sql_varchar">,
									a_meta = <cfqueryparam value="#Trim(form.meta)#" cfsqltype="cf_sql_text">,
									a_switch = <cfqueryparam value="#form.hide#" cfsqltype="cf_sql_varchar">
								WHERE a_id = <cfqueryparam value="#form.accID#" cfsqltype="cf_sql_integer">
							</cfquery>

							<!--- Clear the link tables --->
							<cfquery name="deleteLinkAcc" dataSource="#application.datasource#">
								DELETE FROM link
								WHERE accID = <cfqueryparam value="#form.accID#" cfsqltype="cf_sql_integer">
							</cfquery>

							<cfquery name="deleteAccLink" dataSource="#application.datasource#">
								DELETE FROM accLink
								WHERE accID = <cfqueryparam value="#form.accID#" cfsqltype="cf_sql_integer">
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
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#form.accID#" cfsqltype="cf_sql_integer">,
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
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#form.accID#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#order#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#Trim(form.hide)#" cfsqltype="cf_sql_integer">)
								</cfquery>
							</cfloop>

							<!--- Add the product links --->
							<cfloop list="#form.prod#" index="i">
								<!--- Gets the next order value --->
								<cfquery name="getOrder" dataSource="#application.datasource#">
									SELECT vacID, accID, al_order
									FROM accLink
									WHERE accID = <cfqueryparam value="#form.accID#" CFSQLType="cf_sql_integer">
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
										<cfqueryparam value="#i#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#form.accID#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#order#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="1" cfsqltype="cf_sql_integer">)
								</cfquery>
							</cfloop>

							<cflocation url="vacAcc.cfm?edit" addToken="no">
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
				var a = '<cfoutput>#url.acc#</cfoutput>';
				if (c !== null) {
					c = c.join(',');
				}
				$.ajax({
					type: 'POST',
					url: 'getStuff.cfm',
					data: { section: 'subCatsAcc', cat: c, acc: a },
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
			$('#prod').chosen();
			$('#cat').on('change', function(e, c) {
				updateSubs();
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
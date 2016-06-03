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
	    			<cfparam name="url.subCat" default="">
					<cfparam name="form.sCatID" default="">
	    			<cfparam name="form.cat" default="">
					<cfparam name="form.ti" default="">
					<cfparam name="form.prod" default="">
					<cfparam name="form.acc" default="">
					<cfparam name="form.desc" default="">
					<cfparam name="form.meta" default="">
					<cfparam name="form.hide" default="1">
					
					<cfif isDefined("form.send")>
						<cfset errors = "">
						
						<cfif errors is "">
							<!--- do something here --->
							<cfset showForm = false>
						</cfif>
					</cfif>
					
					<cfif showForm>
						<cfif url.subCat eq "">
		    				<h1>Add Subcategory</h1>
		    			
							<cfoutput>
							<form action="#cgi.script_name#" method="post" id="form">
								<p>Fields designated with an asterisk (<span class="ast">*</span>) are required.</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Category</label>
									<select name="cat" id="cat" class="form chosen">
										<option value="">- Select a Category -</option>
										<cfloop query="own">
											<cfif own.l_switch eq 1>
												<option value="#own.c_id#">#own.c_title#</option>
											</cfif>
										</cfloop>
									</select>
								</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Title</label>
									<input type="text" name="ti" id="ti" class="form">
								</p>
								<p>
									<label class="formLabel">Products</label>
									<select name="prod" id="prod" class="form chosen" data-placeholder="- Select products -" multiple>
										<cfloop query="allProd">
											<option value="#allProd.v_id#">#allProd.v_title# (#allProd.v_item#)</option>
										</cfloop>
									</select>
								</p>
								<p>
									<label class="formLabel">Accessories</label>
									<select name="acc" id="acc" class="form chosen" data-placeholder="- Select accessories -" multiple>
										<cfloop query="allAcc">
											<option value="#allAcc.a_id#">#allAcc.a_title# (#allAcc.a_item#)</option>
										</cfloop>
									</select>
								</p>
								<div class="clearfix"></div>
								<p>
									Description<br>
									<textarea name="desc" id="desc" class="ckeditor" cols="80"></textarea>
								</p>
								<div class="clearfix"></div>
								<p>
									Meta<br>
									<textarea name="meta" id="meta" class="form" cols="80"></textarea>
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="hide" id="hide" value="0"> Hidden</label>
								</p>
								<p>
									<input type="hidden" name="sCatID" id="sCatID" value="">
									<input name="send" type="submit" id="submit" value="Submit">
								</p>
							</form>
							</cfoutput>
						  
						<cfelse>
							<cfinvoke 
								component="#application.components#.queryController" 
								method="vacSubCat" 
								returnvariable="cat">
								<cfinvokeargument name="selectSubCat" value="#url.subCat#">
							</cfinvoke>
							
							<h1>Edit Subcategory</h1>
		    			
							<cfoutput query="cat">
							<form action="#cgi.script_name#" method="post" id="form">
								<p>Fields designated with an asterisk (<span class="ast">*</span>) are required.</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Category</label>
									<select name="cat" id="cat" class="form chosen">
										<option value="">- Select a Category -</option>
										<cfloop query="own">
											<cfif own.l_switch eq 1>
												<option value="#own.c_id#"<cfif cat.ownerID eq own.c_id> selected</cfif>>#own.c_title#</option>
											</cfif>
										</cfloop>
									</select>
								</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Title</label>
									<input type="text" name="ti" id="ti" class="form" value="#cat.s_title#">
								</p>
								<p>
									<cfquery name="prod" datasource="#application.datasource#">
										SELECT vacID
										FROM link
										WHERE sOwnerID = <cfqueryparam value="#cat.s_id#" CFSQLType="cf_sql_integer">
									</cfquery>
									<label class="formLabel">Products</label>
									<select name="prod" id="prod" class="form chosen" data-placeholder="- Select products -" multiple>
										<cfloop query="allProd">
											<option value="#allProd.v_id#"<cfloop query="prod"><cfif prod.vacID eq allProd.v_id> selected</cfif></cfloop>>#allProd.v_title# (#allProd.v_item#)</option>
										</cfloop>
									</select>
								</p>
								<p>
									<cfquery name="acc" datasource="#application.datasource#">
										SELECT accID
										FROM link
										WHERE sOwnerID = <cfqueryparam value="#cat.s_id#" CFSQLType="cf_sql_integer">
									</cfquery>
									<label class="formLabel">Accessories</label>
									<select name="acc" id="acc" class="form chosen" data-placeholder="- Select accessories -" multiple>
										<cfloop query="allAcc">
											<option value="#allAcc.a_id#"<cfloop query="acc"><cfif acc.accID eq allAcc.a_id> selected</cfif></cfloop>>#allAcc.a_title# (#allAcc.a_item#)</option>
										</cfloop>
									</select>
								</p>
								<div class="clearfix"></div>
								<p>
									Description<br>
									<textarea name="desc" id="desc" class="ckeditor" cols="80">#cat.s_desc#</textarea>
								</p>
								<div class="clearfix"></div>
								<p>
									Meta<br>
									<textarea name="meta" id="meta" class="form" cols="80">#cat.s_meta#</textarea>
								</p>
								<p>
									<cfset act = 0>
									<cfloop query="cat"><cfif cat.l_switch eq 1><cfset act = act+1></cfif></cfloop>
									<label class="checkLabel"><input type="checkbox" name="hide" id="hide" value="0"<cfif act eq 0> checked</cfif>> Hidden</label>
								</p>
								<p>
									<input type="hidden" name="sCatID" id="sCatID" value="#url.subCat#">
									<input name="send" type="submit" id="submit" value="Submit">
								</p>
							</form>
							</cfoutput>
						</cfif>
							
					<cfelse>
						
						<cfif form.sCatID eq "">
							<!--- Add new subcategory to db. --->
							<cfoutput>
							
							<cfquery name="addSubCat" dataSource="#application.datasource#" result="added">
								INSERT INTO prodSubCat
								(s_title, s_url, s_desc, s_meta, s_header, s_direct)
								VALUES (
									<cfqueryparam value="#Trim(form.ti)#" cfsqltype="cf_sql_varchar">,
									<cfqueryparam value="#Trim(LCase(Replace(ReReplace(form.ti, '[^A-Za-z0-9\-]', '', 'All'), ' ', '-', 'All')))#" cfsqltype="cf_sql_varchar">,
									<cfqueryparam value="#Trim(form.desc)#" cfsqltype="cf_sql_text">,
									<cfqueryparam value="#Trim(form.meta)#" cfsqltype="cf_sql_text">,
									<cfqueryparam value="2" cfsqltype="cf_sql_varchar">,
									<cfqueryparam value="0" cfsqltype="cf_sql_integer">)
							</cfquery>
							
							<cfset newID = added.generatedkey>
							<cfquery name="getOrder" dataSource="#application.datasource#">
								SELECT ownerID, sCatID, l_order, l_switch
								FROM link
								WHERE ownerID = <cfqueryparam value="#form.cat#" CFSQLType="cf_sql_integer">
								AND sCatID = <cfqueryparam value="#newID#" CFSQLType="cf_sql_integer">
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
									<cfqueryparam value="#form.cat#" cfsqltype="cf_sql_integer">,
									<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
									<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
									<cfqueryparam value="#newID#" cfsqltype="cf_sql_integer">,
									<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
									<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
									<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
									<cfqueryparam value="#order#" cfsqltype="cf_sql_integer">,
									<cfqueryparam value="#Trim(form.hide)#" cfsqltype="cf_sql_integer">)
							</cfquery>
							
							<!--- Add the product links --->
							<cfloop list="#form.prod#" index="i">
								<!--- Gets the next order value --->
								<cfquery name="getOrder" dataSource="#application.datasource#">
									SELECT ownerID, catID, sOwnerID, sCatID, vacID, accID, l_order, l_switch
									FROM link
									WHERE vacID = <cfqueryparam value="#i#" CFSQLType="cf_sql_integer">
									AND sOwnerID = <cfqueryparam value="#newID#" cfsqltype="cf_sql_integer">
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
										<cfqueryparam value="#newID#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#i#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#order#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#Trim(form.hide)#" cfsqltype="cf_sql_integer">)
								</cfquery>
							</cfloop>
							
							<!--- Add the accessory links --->
							<cfloop list="#form.acc#" index="i">
								<!--- Gets the next order value --->
								<cfquery name="getOrder" dataSource="#application.datasource#">
									SELECT ownerID, catID, sOwnerID, sCatID, vacID, accID, l_order, l_switch
									FROM link
									WHERE accID = <cfqueryparam value="#i#" CFSQLType="cf_sql_integer">
									AND sOwnerID = <cfqueryparam value="#newID#" cfsqltype="cf_sql_integer">
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
										<cfqueryparam value="#newID#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#i#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#order#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#Trim(form.hide)#" cfsqltype="cf_sql_integer">)
								</cfquery>
							</cfloop>
							
							<cflocation url="vacSubCat.cfm?add" addToken="no">
							</cfoutput>
							
						<cfelse>
			                
							<!--- Edit subcategory --->
							<cfoutput>
							
							<cfquery name="editSubCat" dataSource="#application.datasource#">
								UPDATE prodSubCat
								SET s_title = <cfqueryparam value="#Trim(form.ti)#" cfsqltype="cf_sql_varchar">,
									s_desc = <cfqueryparam value="#Trim(form.desc)#" cfsqltype="cf_sql_text">,
									s_meta = <cfqueryparam value="#Trim(form.meta)#" cfsqltype="cf_sql_text">,
									s_header = <cfqueryparam value="2" cfsqltype="cf_sql_varchar">,
									s_direct = <cfqueryparam value="0" cfsqltype="cf_sql_integer">
								WHERE s_id = <cfqueryparam value="#Trim(form.sCatID)#" cfsqltype="cf_sql_integer">
							</cfquery>
							
							<cfquery name="getOrder" dataSource="#application.datasource#">
								SELECT ownerID, sCatID, l_order, l_switch
								FROM link
								WHERE ownerID = <cfqueryparam value="#form.cat#" CFSQLType="cf_sql_integer">
								AND sCatID = <cfqueryparam value="#form.sCatID#" CFSQLType="cf_sql_integer">
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
							
							<cfquery name="editLink" dataSource="#application.datasource#">
								UPDATE link
								SET ownerID = <cfqueryparam value="#form.cat#" cfsqltype="cf_sql_integer">,
									catID = <cfqueryparam value="0" cfsqltype="cf_sql_integer">,
									sOwnerID = <cfqueryparam value="0" cfsqltype="cf_sql_integer">,
									prodID = <cfqueryparam value="0" cfsqltype="cf_sql_integer">,
									vacID = <cfqueryparam value="0" cfsqltype="cf_sql_integer">,
									accID = <cfqueryparam value="0" cfsqltype="cf_sql_integer">,
									l_order = <cfqueryparam value="#order#" cfsqltype="cf_sql_integer">,
									l_switch = <cfqueryparam value="#Trim(form.hide)#" cfsqltype="cf_sql_integer">
								WHERE sCatID = <cfqueryparam value="#Trim(form.sCatID)#" cfsqltype="cf_sql_integer">
							</cfquery>
							
							<!--- Clear the link table --->
							<cfquery name="deleteLinkProd" dataSource="#application.datasource#">
								DELETE FROM link
								WHERE sOwnerID = <cfqueryparam value="#form.sCatID#" cfsqltype="cf_sql_integer">
							</cfquery>
							
							<!--- Add the product links --->
							<cfloop list="#form.prod#" index="i">
								<!--- Gets the next order value --->
								<cfquery name="getOrder" dataSource="#application.datasource#">
									SELECT ownerID, catID, sOwnerID, sCatID, vacID, accID, l_order, l_switch
									FROM link
									WHERE vacID = <cfqueryparam value="#i#" CFSQLType="cf_sql_integer">
									AND sOwnerID = <cfqueryparam value="#form.sCatID#" cfsqltype="cf_sql_integer">
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
										<cfqueryparam value="#form.sCatID#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#i#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#order#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#Trim(form.hide)#" cfsqltype="cf_sql_integer">)
								</cfquery>
							</cfloop>
							
							<!--- Add the accessory links --->
							<cfloop list="#form.acc#" index="i">
								<!--- Gets the next order value --->
								<cfquery name="getOrder" dataSource="#application.datasource#">
									SELECT ownerID, catID, sOwnerID, sCatID, vacID, accID, l_order, l_switch
									FROM link
									WHERE accID = <cfqueryparam value="#i#" CFSQLType="cf_sql_integer">
									AND sOwnerID = <cfqueryparam value="#form.sCatID#" cfsqltype="cf_sql_integer">
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
										<cfqueryparam value="#form.sCatID#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#i#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#order#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#Trim(form.hide)#" cfsqltype="cf_sql_integer">)
								</cfquery>
							</cfloop>
							
							<cflocation url="vacSubCat.cfm?edit" addToken="no">
							</cfoutput>
						</cfif>
					</cfif>
	    		</div>
	    	</div><!--- row-fluid--->
		</div><!--- conIndent --->
    </div><!--- container --->
    
    <cfinclude template="inc/footer.cfm">
	
	<cfinclude template="../inc/scripts.cfm">
	<script src="<cfoutput>#application.root#</cfoutput>js/jquery.validate.min.js"></script>
	<script src="<cfoutput>#application.root#</cfoutput>js/ckeditor/ckeditor.js"></script>
	<script src="<cfoutput>#application.root#</cfoutput>js/ckeditor/adapters/jquery.js"></script>
	<script src="<cfoutput>#application.root#</cfoutput>js/chosen.jquery.min.js"></script>
	<script>
		$(document).ready(function() {
			$('.chosen').chosen();
			
			$('#desc').ckeditor({
				toolbar : 'Default',
	     		customConfig : 'config.js.cfm',
	     		filebrowserImageUploadUrl : '../js/ckfinder/core/connector/cfm/connector.cfm?command=QuickUpload&type=Images'
			});
			
			$("#form").validate({
				errorPlacement: function(error, element) {
					 error.appendTo(element.parent());
				},
				rules: {
					cat: "required",
					ti: "required"
				},
				messages: {
					cat: "Please select a category.",
					ti: "Please enter a title."
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
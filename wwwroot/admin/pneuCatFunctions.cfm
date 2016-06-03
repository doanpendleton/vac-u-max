<cfinvoke 
	component="#application.components#.queryController" 
	method="pneuProd" 
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
	    			<cfparam name="url.cat" default="">
					<cfparam name="form.catID" default="">
					<cfparam name="form.ti" default="">
					<cfparam name="form.head" default="">
					<cfparam name="form.prod" default="">
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
					
					<!---<a href="addProducts.cfm" class="quoteBtn">Add Products to Category</a>--->
					<cfif showForm>
						<cfif url.cat eq "">
		    				<h1>Add Pneumatic Category</h1>
		    			
							<cfoutput>
							<form action="#cgi.script_name#" method="post" id="form">
								<p>Fields designated with an asterisk (<span class="ast">*</span>) are required.</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Title</label>
									<input type="text" name="ti" id="ti" class="form">
								</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Header Image</label>
									<select name="head" id="head" class="form chosen">
										<option value="1" selected>Pneumatic</option>
										<option value="3">Aero-Mechanical</option>
										<option value="4">Flexible Screw</option>
										<option value="5">Pulsonic</option>
									</select>
								<p>
									<label class="formLabel">Products</label>
									<select name="prod" id="prod" class="form chosen" data-placeholder="- Select products -" multiple>
										<cfloop query="allProd">
											<option value="#allProd.id#">#allProd.p_title#</option>
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
									<input type="hidden" name="catID" id="catID" value="">
									<input name="send" type="submit" id="submit" value="Submit">
								</p>
							</form>
							</cfoutput>
						  
						<cfelse>
							<cfinvoke 
								component="#application.components#.queryController" 
								method="pneuCat" 
								returnvariable="cat">
								<cfinvokeargument name="selectCat" value="#url.cat#">
							</cfinvoke>
							
							<h1>Edit Pneumatic Category</h1>
		    			
							<cfoutput query="cat">
							<form action="#cgi.script_name#" method="post" id="form">
								<p>Fields designated with an asterisk (<span class="ast">*</span>) are required.</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Title</label>
									<input type="text" name="ti" id="ti" class="form" value="#cat.c_title#">
								</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Header Image</label>
									<select name="head" id="head" class="form chosen">
										<option value="1"<cfif cat.c_header eq 1> selected</cfif>>Pneumatic</option>
										<option value="3"<cfif cat.c_header eq 3> selected</cfif>>Aero-Mechanical</option>
										<option value="4"<cfif cat.c_header eq 4> selected</cfif>>Flexible Screw</option>
										<option value="5"<cfif cat.c_header eq 5> selected</cfif>>Pulsonic</option>
									</select>
								<p>
								<p>
									<cfquery name="prod" datasource="#application.datasource#">
										SELECT prodID
										FROM link
										WHERE ownerID = <cfqueryparam value="#cat.c_id#" CFSQLType="cf_sql_integer">
									</cfquery>
									<label class="formLabel">Products</label>
									<select name="prod" id="prod" class="form chosen" data-placeholder="- Select products -" multiple>
										<cfloop query="allProd">
											<option value="#allProd.id#"<cfloop query="prod"><cfif prod.prodID eq allProd.id> selected</cfif></cfloop>>#allProd.p_title#</option>
										</cfloop>
									</select>
								</p>
								<div class="clearfix"></div>
								<p>
									Description<br>
									<textarea name="desc" id="desc" class="ckeditor" cols="80">#cat.c_desc#</textarea>
								</p>
								<div class="clearfix"></div>
								<p>
									Meta<br>
									<textarea name="meta" id="meta" class="form" cols="80">#cat.c_meta#</textarea>
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="hide" id="hide" value="0"<cfif cat.l_switch eq 0> checked</cfif>> Hidden</label>
								</p>
								<p>
									<input type="hidden" name="catID" id="catID" value="#url.cat#">
									<input name="send" type="submit" id="submit" value="Submit">
								</p>
							</form>
							</cfoutput>
						</cfif>
							
					<cfelse>
						
						<cfif form.catID eq "">
							<!--- Add new category to db. --->
							<cfoutput>
							
							<cfquery name="addCat" dataSource="#application.datasource#" result="added">
								INSERT INTO prodCat
								(c_title, c_url, c_desc, c_meta, c_header, c_direct)
								VALUES (
									<cfqueryparam value="#Trim(form.ti)#" cfsqltype="cf_sql_varchar">,
									<cfqueryparam value="#Trim(LCase(Replace(ReReplace(form.ti, '[^A-Za-z0-9\-]', '', 'All'), ' ', '-', 'All')))#" cfsqltype="cf_sql_varchar">,
									<cfqueryparam value="#Trim(form.desc)#" cfsqltype="cf_sql_text">,
									<cfqueryparam value="#Trim(form.meta)#" cfsqltype="cf_sql_text">,
									<cfqueryparam value="#form.head#" cfsqltype="cf_sql_varchar">,
									<cfqueryparam value="0" cfsqltype="cf_sql_integer">)
							</cfquery>
							
							<cfset newID = added.generatedkey>
							<cfquery name="getOrder" dataSource="#application.datasource#">
								SELECT ownerID, catID, l_order
								FROM link
								WHERE ownerID = <cfqueryparam value="1" CFSQLType="cf_sql_integer">
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
									<cfqueryparam value="1" cfsqltype="cf_sql_integer">,
									<cfqueryparam value="#newID#" cfsqltype="cf_sql_integer">,
									<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
									<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
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
									SELECT ownerID, catID, sOwnerID, sCatID, prodID, l_order, l_switch
									FROM link
									WHERE prodID = <cfqueryparam value="#i#" CFSQLType="cf_sql_integer">
									AND ownerID = <cfqueryparam value="#newID#" cfsqltype="cf_sql_integer">
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
										<cfqueryparam value="#newID#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#i#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#order#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#Trim(form.hide)#" cfsqltype="cf_sql_integer">)
								</cfquery>
							</cfloop>
							
							<cflocation url="pneuCat.cfm?add" addToken="no">
							</cfoutput>
							
						<cfelse>
			                
							<!--- Edit category --->
							<cfoutput>
							
							<cfquery name="editCat" dataSource="#application.datasource#">
								UPDATE prodCat
								SET c_title = <cfqueryparam value="#Trim(form.ti)#" cfsqltype="cf_sql_varchar">,
									c_desc = <cfqueryparam value="#Trim(form.desc)#" cfsqltype="cf_sql_text">,
									c_meta = <cfqueryparam value="#Trim(form.meta)#" cfsqltype="cf_sql_text">,
									c_header = <cfqueryparam value="#form.head#" cfsqltype="cf_sql_varchar">,
									c_direct = <cfqueryparam value="0" cfsqltype="cf_sql_integer">
								WHERE c_id = <cfqueryparam value="#Trim(form.catID)#" cfsqltype="cf_sql_integer">
							</cfquery>
							
							<cfquery name="editLink" dataSource="#application.datasource#">
								UPDATE link
								SET l_switch = <cfqueryparam value="#Trim(form.hide)#" cfsqltype="cf_sql_integer">
								WHERE catID = <cfqueryparam value="#Trim(form.catID)#" cfsqltype="cf_sql_integer">
							</cfquery>
							
							<!--- Clear the link table --->
							<cfquery name="deleteLinkProd" dataSource="#application.datasource#">
								DELETE FROM link
								WHERE ownerID = <cfqueryparam value="#form.catID#" cfsqltype="cf_sql_integer">
									AND sCatID = <cfqueryparam value="0" cfsqltype="cf_sql_integer">
							</cfquery>
							
							<!--- Add the product links --->
							<cfloop list="#form.prod#" index="i">
								<!--- Gets the next order value --->
								<cfquery name="getOrder" dataSource="#application.datasource#">
									SELECT ownerID, catID, sOwnerID, sCatID, prodID, l_order, l_switch
									FROM link
									WHERE prodID = <cfqueryparam value="#i#" CFSQLType="cf_sql_integer">
										AND ownerID = <cfqueryparam value="#form.catID#" cfsqltype="cf_sql_integer">
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
										<cfqueryparam value="#form.catID#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#i#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#order#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#Trim(form.hide)#" cfsqltype="cf_sql_integer">)
								</cfquery>
							</cfloop>
							
							<cflocation url="pneuCat.cfm?edit" addToken="no">
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
					ti: "required",
					head: "required"
				},
				messages: {
					ti: "Please enter a title.",
					head: "Please select a header image."
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
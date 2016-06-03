<cfinvoke 
	component="#application.components#.queryController" 
	method="pneuCat" 
	returnvariable="own">
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
					<cfparam name="form.prodID" default="">
					<cfparam name="form.cat" default="">
					<cfparam name="form.subCat" default="">
					<cfparam name="form.ti" default="">
					<cfparam name="form.sti" default="">
					<cfparam name="form.img1" default="">
					<cfparam name="form.cap1" default="">
					<cfparam name="form.dia1" default="0">
					<cfparam name="form.imgHide1" default="1">
					<cfparam name="form.desc" default="">
					<cfparam name="form.dShort" default="">
					<cfparam name="form.feat" default="">
					<cfparam name="form.specs" default="">
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
		    				<h1>Add Pneumatic Product</h1>
							
							<cfoutput>
							
							<li class="caseBox hidden" id="imgTemp">
								<div class="pull-left">
									<label class="formLabel">Image File</label>
									<input type="file" class="img" name="img" id="img">
								</div>
								<div class="pull-left">
									<label class="formLabel">Caption</label>
									<textarea class="cap" name="cap" id="cap" class="form" cols="45"></textarea>
								</div>
								<div class="pull-left">
									<label class="checkLabel"><input type="checkbox" class="dia" name="dia" id="dia" value="1"> Diagram</label><br>
									<label class="checkLabel"><input type="checkbox" class="imgHide" name="imgHide" id="imgHide" value="0"> Hidden</label>
								</div>
								<div class="clearfix"></div>
								<a href="##" class="removeImg">Remove</a>
							</li>
							
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
								<div class="clearfix"></div>
								<p>
									<label class="formLabel"><span class="ast">*</span>Title</label>
									<input type="text" name="ti" id="ti" class="form">
								</p>
								<p>
									<label class="formLabel">Subtitle</label>
									<input type="text" name="sti" id="sti" class="form">
								</p>
								<p>
									Images (Drag to reorder.)<br>
									<ul id="sortImg" class="sortable">
										<li class="caseBox">
											<div class="pull-left">
												<label class="formLabel">Image File</label>
												<input type="file" class="img" name="img1" id="img1">
											</div>
											<div class="pull-left">
												<label class="formLabel">Caption</label>
												<textarea class="cap" name="cap1" id="cap1" class="form" cols="45"></textarea>
											</div>
											<div class="pull-left">
												<label class="checkLabel"><input type="checkbox" class="dia" name="dia1" id="dia1" value="1"> Diagram</label><br>
												<label class="checkLabel"><input type="checkbox" class="imgHide" name="imgHide1" id="imgHide1" value="0"> Hidden</label>
											</div>
										</li>
									</ul>
									<cfset count = 1>
									<input type="hidden" name="count" id="count" value="1">
									<a href="##" id="addImg" class="btnLink pull-left">Add Another Image</a>
									<div class="clearfix"></div>
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
									<br>Features<br>
									<textarea name="feat" id="feat" class="ckeditor" cols="80"></textarea>
								</p>
								<p>
									<br>Specifications<br>
									<textarea name="specs" id="specs" class="ckeditor" cols="80"></textarea>
								</p>
								<p>
									<br>Meta<br>
									<textarea name="meta" id="meta" class="form" cols="80"></textarea>
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="hide" id="hide" value="0"> Hidden</label>
								</p>
								<p>
									<input type="hidden" name="prodID" id="prodID" value="">
									<input name="send" type="submit" id="submit" value="Submit">
								</p>
							</form>
							</cfoutput>
						  
						<cfelse>
							<cfinvoke 
								component="#application.components#.queryController" 
								method="pneuProd" 
								returnvariable="prod">
								<cfinvokeargument name="selectProd" value="#url.prod#">
							</cfinvoke>
							
							<h1>Edit Pneumatic Product</h1>
		    			
							<cfoutput query="prod">
							
							<li class="caseBox hidden" id="imgTemp">
								<div class="pull-left">
									<label class="formLabel">Image File</label>
									<input type="file" class="img" name="img" id="img">
								</div>
								<div class="pull-left">
									<label class="formLabel">Caption</label>
									<textarea class="cap" name="cap" id="cap" class="form" cols="45"></textarea>
								</div>
								<div class="pull-left">
									<label class="checkLabel"><input type="checkbox" class="dia" name="dia" id="dia" value="1"> Diagram</label><br>
									<label class="checkLabel"><input type="checkbox" class="imgHide" name="imgHide" id="imgHide" value="0"> Hidden</label>
								</div>
								<div class="clearfix"></div>
								<a href="##" class="removeImg">Remove</a>
							</li>
							
							<form action="#cgi.script_name#" method="post" id="form" enctype="multipart/form-data">
								<p>Fields designated with an asterisk (<span class="ast">*</span>) are required.</p>
								<p>
									<cfquery name="cats" datasource="#application.datasource#">
										SELECT c_id, c_title, c_direct
										FROM prodCat
										LEFT JOIN link
										ON c_id = ownerID
										WHERE prodID = <cfqueryparam value="#prod.id#" CFSQLType="cf_sql_integer">
											AND ownerID > <cfqueryparam value="0" CFSQLType="cf_sql_integer">
										ORDER BY c_title
									</cfquery>
									<label class="formLabel"><span class="ast">*</span>Category(s)</label>
									<select name="cat" id="cat" class="form chosen" data-placeholder="- Select at least one category -" multiple>
										<cfloop query="own">
											<cfif own.l_switch eq 1>
												<option value="#own.c_id#"<cfloop query="cats"><cfif own.c_title eq cats.c_title> selected</cfif></cfloop>>#own.c_title#</option>
											</cfif>
										</cfloop>
										<cfloop query="cats">
											<cfif cats.c_direct>
												<option value="#cats.c_id#" selected hidden></option>
											</cfif>
										</cfloop>
									</select>
								</p>
								<p id="subCatField">
									<label class="formLabel">Subcategory(s)</label>
									<select name="subCat" id="subCat" class="form chosenSub" data-placeholder="- Select at least one subcategory -" multiple>
										
									</select>
								</p>
								<div class="clearfix"></div>
								<p>
									<label class="formLabel"><span class="ast">*</span>Title</label>
									<input type="text" name="ti" id="ti" class="form" value="#prod.p_title#">
								</p>
								<p>
									<label class="formLabel">Subtitle</label>
									<input type="text" name="sti" id="sti" class="form" value="#prod.p_subTitle#">
								</p>
								<p>
									Images (Drag to reorder.)<br>
									<ul id="sortImg" class="sortable">
										<!--- Get current images --->
										<cfquery name="img" dataSource="#application.datasource#">
											SELECT i_id, p_id, i_diagram, i_file, i_alt, i_cap, i_order, i_switch
											FROM images
											WHERE p_id = <cfqueryparam value="#url.prod#" CFSQLType="cf_sql_integer">
											ORDER BY i_order
										</cfquery>
										
										<!--- Display current images --->
										<cfset count = 1>
										<cfloop query="img">
										<li class="caseBox">
											<a href="##" class="delete icon-trash pull-right" rel="#img.i_id#" title="Delete"></a>
											<div class="pull-left" style="width: 370px;">
												<img src="../prodImg/#img.i_file#" class="pull-left" style="height: 80px;margin-right:15px;">
												<input type="hidden" class="img" name="img#count#" id="img#count#" value="#img.i_file#">
												<input type="hidden" class="curImg" name="curImg#count#" id="curImg#count#" value="#img.i_file#">
											</div>
											<div class="pull-left">
												<label class="formLabel">Caption</label>
												<textarea class="cap" name="cap#count#" id="cap#count#" class="form" cols="45">#img.i_cap#</textarea>
											</div>
											<div class="pull-left">
												<label class="checkLabel"><input type="checkbox" class="dia" name="dia#count#" id="dia#count#" value="1"<cfif img.i_diagram eq 1> checked</cfif>> Diagram</label><br>
												<label class="checkLabel"><input type="checkbox" class="imgHide" name="imgHide#count#" id="imgHide#count#" value="0"<cfif img.i_switch eq 0> checked</cfif>> Hidden</label>
											</div>
										</li>
										<cfset count++>
										</cfloop>
										
										<!--- Allow new images to be added --->
										<li class="caseBox">
											<div class="pull-left">
												<label class="formLabel">Image File</label>
												<input type="file" class="img" name="img#count#" id="img#count#">
											</div>
											<div class="pull-left">
												<label class="formLabel">Caption</label>
												<textarea class="cap" name="cap#count#" id="cap#count#" class="form" cols="45"></textarea>
											</div>
											<div class="pull-left">
												<label class="checkLabel"><input type="checkbox" class="dia" name="dia#count#" id="dia#count#" value="1"> Diagram</label><br>
												<label class="checkLabel"><input type="checkbox" class="imgHide" name="imgHide#count#" id="imgHide#count#" value="0"> Hidden</label>
											</div>
										</li>
									</ul>
									<input type="hidden" name="count" id="count" value="#count#">
									<a href="##" id="addImg" class="btnLink pull-left">Add Another Image</a>
									<div class="clearfix"></div>
								</p>
								<p>
									Short Description (<em>Displayed on overview page</em>)<br>
									<textarea name="descS" id="descS" class="form" cols="80">#prod.p_descShort#</textarea>
								</p>
								<p>
									Description<br>
									<textarea name="desc" id="desc" class="ckeditor" cols="80">#prod.p_desc#</textarea>
								</p>
								<p>
									<br>Features<br>
									<textarea name="feat" id="feat" class="ckeditor" cols="80">#prod.p_feat#</textarea>
								</p>
								<p>
									<br>Specifications<br>
									<textarea name="specs" id="specs" class="ckeditor" cols="80">#prod.p_specs#</textarea>
								</p>
								<p>
									<br>Meta<br>
									<textarea name="meta" id="meta" class="form" cols="80">#prod.p_meta#</textarea>
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="hide" id="hide" value="0"<cfif prod.p_switch eq 0> checked</cfif>> Hidden</label>
								</p>
								<p>
									<input type="hidden" name="prodID" id="prodID" value="#url.prod#">
									<input name="send" type="submit" id="submit" value="Submit">
								</p>
							</form>
							</cfoutput>
						</cfif>
							
					<cfelse>
						
						<cfif form.prodID eq "">
							<!--- Add new product to db. --->
							<cfoutput>
							
							<cfquery name="addProd" dataSource="#application.datasource#" result="added">
								INSERT INTO products
								(p_title, p_url, p_subTitle, p_desc, p_descShort, p_feat, p_specs, p_meta, p_switch)
								VALUES ( <cfqueryparam value="#Trim(form.ti)#" cfsqltype="cf_sql_varchar">,
									<cfqueryparam value="#Trim(LCase(Replace(ReReplace(form.ti, '[^A-Za-z0-9\-]', '', 'All'), ' ', '-', 'All')))#" cfsqltype="cf_sql_varchar">,
									<cfqueryparam value="#Trim(form.sti)#" cfsqltype="cf_sql_varchar">,
									<cfqueryparam value="#Trim(form.desc)#" cfsqltype="cf_sql_text">,
									<cfqueryparam value="#Trim(form.descS)#" cfsqltype="cf_sql_varchar">,
									<cfqueryparam value="#Trim(form.feat)#" cfsqltype="cf_sql_text">,
									<cfqueryparam value="#Trim(form.specs)#" cfsqltype="cf_sql_text">,
									<cfqueryparam value="#Trim(form.meta)#" cfsqltype="cf_sql_text">,
									<cfqueryparam value="#form.hide#" cfsqltype="cf_sql_varchar">)
							</cfquery>
							
							<cfset newID = added.generatedkey>
							
							<cfset destination = expandPath("../prodImg")>
							<cfloop from="1" to="#form.count#" index="i">
								<cfif form['img#i#'] neq "">
									<cffile action="upload" filefield="img#i#" destination="#destination#" nameConflict="makeUnique" result="upload">
									<cfset img = "#upload.serverfile#">
									
									<cfquery name="addImages" dataSource="#application.datasource#">
										INSERT INTO images
										(p_id, i_diagram, i_file, i_alt, i_cap, i_order, i_switch)
										VALUES (<cfqueryparam value="#newID#" cfsqltype="cf_sql_integer">,
											<cfif isDefined('form.dia#i#')>
												<cfqueryparam value="#form['dia#i#']#" cfsqltype="cf_sql_integer">
											<cfelse>
												<cfqueryparam value="0" cfsqltype="cf_sql_integer">
											</cfif>,
											<cfqueryparam value="#img#" cfsqltype="cf_sql_varchar">,
											<cfqueryparam value="#Trim(form.ti)#" cfsqltype="cf_sql_varchar">,
											<cfqueryparam value="#Trim(form['cap#i#'])#" cfsqltype="cf_sql_varchar">,
											<cfqueryparam value="#i#" cfsqltype="cf_sql_integer">,
											<cfif isDefined('form.imgHide#i#')>
												<cfqueryparam value="#form['imgHide#i#']#" cfsqltype="cf_sql_integer">
											<cfelse>
												<cfqueryparam value="1" cfsqltype="cf_sql_integer">
											</cfif>)
									</cfquery>
								</cfif>
							</cfloop>
												
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
										<cfqueryparam value="#newID#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
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
										<cfqueryparam value="#newID#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#order#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#Trim(form.hide)#" cfsqltype="cf_sql_integer">)
								</cfquery>
							</cfloop>
							
							<cflocation url="pneumatic.cfm?add" addToken="no">
							</cfoutput>
							
						<cfelse>
			                
							<!--- Edit product --->
							<cfoutput>
							
							<cfquery name="editProd" dataSource="#application.datasource#">
								UPDATE products
								SET p_title = <cfqueryparam value="#Trim(form.ti)#" cfsqltype="cf_sql_varchar">,
									p_subTitle = <cfqueryparam value="#Trim(form.sti)#" cfsqltype="cf_sql_varchar">,
									p_desc = <cfqueryparam value="#Trim(form.desc)#" cfsqltype="cf_sql_text">,
									p_descShort = <cfqueryparam value="#Trim(form.descS)#" cfsqltype="cf_sql_varchar">,
									p_feat = <cfqueryparam value="#Trim(form.feat)#" cfsqltype="cf_sql_text">,
									p_specs = <cfqueryparam value="#Trim(form.specs)#" cfsqltype="cf_sql_text">,
									p_meta = <cfqueryparam value="#Trim(form.meta)#" cfsqltype="cf_sql_text">,
									p_switch = <cfqueryparam value="#form.hide#" cfsqltype="cf_sql_varchar">
								WHERE id = <cfqueryparam value="#form.prodID#" cfsqltype="cf_sql_integer">
							</cfquery>
							
							<!--- Clear the link table --->
							<cfquery name="deleteLinkProd" dataSource="#application.datasource#">
								DELETE FROM link
								WHERE prodID = <cfqueryparam value="#form.prodID#" cfsqltype="cf_sql_integer">
							</cfquery>
							
							<!--- Clear the images table --->
							<cfquery name="deleteImages" dataSource="#application.datasource#">
								DELETE FROM images
								WHERE p_id = <cfqueryparam value="#form.prodID#" cfsqltype="cf_sql_integer">
							</cfquery>
							
							<cfset destination = expandPath("../prodImg")>
							<cfloop from="1" to="#form.count#" index="i">
								<cfif form['img#i#'] neq "">
									<cfif isDefined('form.curImg#i#')>
										<cfset img = form['curImg#i#']>
									<cfelse>
										<cffile action="upload" filefield="img#i#" destination="#destination#" nameConflict="makeUnique" result="upload">
										<cfset img = "#upload.serverfile#">
									</cfif>
									
									<cfquery name="addImages" dataSource="#application.datasource#">
										INSERT INTO images
										(p_id, i_diagram, i_file, i_alt, i_cap, i_order, i_switch)
										VALUES (<cfqueryparam value="#form.prodID#" cfsqltype="cf_sql_integer">,
											<cfif isDefined('form.dia#i#')>
												<cfqueryparam value="#form['dia#i#']#" cfsqltype="cf_sql_integer">
											<cfelse>
												<cfqueryparam value="0" cfsqltype="cf_sql_integer">
											</cfif>,
											<cfqueryparam value="#img#" cfsqltype="cf_sql_varchar">,
											<cfqueryparam value="#Trim(form.ti)#" cfsqltype="cf_sql_varchar">,
											<cfqueryparam value="#Trim(form['cap#i#'])#" cfsqltype="cf_sql_varchar">,
											<cfqueryparam value="#i#" cfsqltype="cf_sql_integer">,
											<cfif isDefined('form.imgHide#i#')>
												<cfqueryparam value="#form['imgHide#i#']#" cfsqltype="cf_sql_integer">
											<cfelse>
												<cfqueryparam value="1" cfsqltype="cf_sql_integer">
											</cfif>)
									</cfquery>
								</cfif>
							</cfloop>
							
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
										<cfqueryparam value="#form.prodID#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
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
										<cfqueryparam value="#form.prodID#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#order#" cfsqltype="cf_sql_integer">,
										<cfqueryparam value="#Trim(form.hide)#" cfsqltype="cf_sql_integer">)
								</cfquery>
							</cfloop>
							
							<cflocation url="pneumatic.cfm?edit" addToken="no">
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
			var count = <cfoutput>#count#</cfoutput>;
			
			function updateSubs() {
				var c = $('#cat').val();
				var p = '<cfoutput>#url.prod#</cfoutput>';
				if (c !== null) {
					c = c.join(',');
				}
				$.ajax({
					type: 'POST',
					url: 'getStuff.cfm',
					data: { section: 'subCatsPneu', cat: c, prod: p },
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
			
			function updateImgOrder() {
				var reorder = 0;
				
				$('#sortImg').children('li').each(function(){
					reorder++;
					$(this).find('.img').attr('name', 'img'+reorder);
					$(this).find('.img').attr('id', 'img'+reorder);
					$(this).find('.curImg').attr('name', 'curImg'+reorder);
					$(this).find('.curImg').attr('id', 'curImg'+reorder);
					$(this).find('.cap').attr('name', 'cap'+reorder);
					$(this).find('.cap').attr('id', 'cap'+reorder);
					$(this).find('.dia').attr('name', 'dia'+reorder);
					$(this).find('.dia').attr('id', 'dia'+reorder);
					$(this).find('.imgHide').attr('name', 'imgHide'+reorder);
					$(this).find('.imgHide').attr('id', 'imgHide'+reorder);
				});
				
				$('#count').val(reorder);
				count = reorder;
			}
			
			$('#addImg').click(function() {
				count++;
				var newImg = $('#imgTemp').clone(true);
				$(newImg).removeAttr('id');
				$(newImg).find('.img').attr('name', $(newImg).find('.img').attr('name')+count);
				$(newImg).find('.img').attr('id', $(newImg).find('.img').attr('id')+count);
				$(newImg).find('.cap').attr('name', $(newImg).find('.cap').attr('name')+count);
				$(newImg).find('.cap').attr('id', $(newImg).find('.cap').attr('id')+count);
				$(newImg).find('.dia').attr('name', $(newImg).find('.dia').attr('name')+count);
				$(newImg).find('.dia').attr('id', $(newImg).find('.dia').attr('id')+count);
				$(newImg).find('.imgHide').attr('name', $(newImg).find('.imgHide').attr('name')+count);
				$(newImg).find('.imgHide').attr('id', $(newImg).find('.imgHide').attr('id')+count);
				$(newImg).appendTo('#sortImg');
				$(newImg).removeClass('hidden');
				$('#count').val(count);
				
				return false;
			});
			
			$('.caseBox').on('click', 'a.removeImg', function() {
				count--;
				$(this).parent().remove();
				$('#count').val(count);
				
				return false;
			});
			
			$('#sortImg').sortable({
				cursor: 'move',
				opacity: 0.6,
				placeholder: 'placeholder',
				start: function(e, ui){
			        ui.placeholder.height(ui.item.height());
			    },
			    tolerance: 'pointer',
				update: function() {
					updateImgOrder();
				}
			});
			
			$('#cat').chosen(updateSubs());
			$('#cat').on('change', function(e, c) {
				updateSubs();
			});
			
			$('.ckeditor').ckeditor({
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
					ti: "required",
					descS: {
						required: false,
						maxlength: 110
					}
				},
				messages: {
					cat: "Please select a category.",
					ti: "Please enter a title.",
					descS: "Please shorten your entry."
				}
			});
			
			var validator = $("#form").data('validator');
			validator.settings.ignore = ":hidden:not(select)";
			
			$('.chosen').on("change", function(evt, params) {
			    $(evt.target).valid();
			});
			
			$('.delete').click(function() {
				var prodImg = $(this).attr('rel');
				var img = $(this).parent('li');
				
				if (confirm('Are you sure you want to delete this image?')) {
					$.ajax({
						type: 'GET',
						url: 'delete.cfm',
						data: { section: 'pneuImg', prodImg: prodImg, prod: '<cfoutput>#url.prod#</cfoutput>'},
						success: function(response){
							$(img).remove();
							updateImgOrder();
						}
					});
				}
			
				return false;
			});
		});
	</script>
</body>
</html>
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
	    			<cfparam name="url.case" default="">
					<cfparam name="form.cat" default="">
					<cfparam name="form.ti" default="">
					<cfparam name="form.sub" default="">
					<cfparam name="form.sum" default="">
					<cfparam name="form.bod" default="">
					<cfparam name="form.pdf" default="">
					<cfparam name="form.hasPDF" default="">
					<cfparam name="form.feat" default="0">
					<cfparam name="form.hide" default="1">

					<cfif isDefined("form.send")>
						<cfset errors = "">

						<cfif errors is "">
							<!--- do something here --->
							<cfset showForm = false>
						</cfif>
					</cfif>

					<cfif showForm>
						<cfif url.case eq "">
		    				<h1>Add Application Story</h1>

							<cfoutput>
							<form action="#cgi.script_name#" method="post" id="form" enctype="multipart/form-data">
								<p>Fields designated with an asterisk (<span class="ast">*</span>) are required.</p>
								<p>
									<label class="formLabel">Category</label>
									<select name="cat" id="cat" class="form chosen">
										<option value="Pneumatic Conveying">Pneumatic Conveying</option>
										<option value="Vacuum Cleaning">Vacuum Cleaning</option>
										<option value="Aero-Mechanical Conveyors">Aero-Mechanical Conveyors</option>
										<option value="Flexible Screw Conveyors">Flexible Screw Conveyors</option>
										<option value="Pulsonic Bin Activators">Pulsonic Bin Activators</option>
										<option value="Mechanical Conveying">Mechanical Conveying</option>
									</select>
								</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Title</label>
									<input type="text" name="ti" id="ti" class="form">
								</p>
								<p>
									<label class="formLabel">Subtitle</label>
									<input type="text" name="sub" id="sub" class="form">
								</p>
								<p>
									<span class="ast">*</span>Summary (This is the preview text that will display on the home page and side bars.)<br>
									<textarea name="sum" id="sum" class="ckeditor" cols="80"></textarea>
								</p>
								<p>
									<span class="ast">*</span>Content<br>
									<textarea name="bod" id="bod" class="ckeditor" cols="80"></textarea>
								</p>
								<p>
									<label class="formLabel">PDF</label>
									<input type="file" name="pdf" id="pdf" class="form">
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="feat" id="feat" value="1"> Featured</label><br>
									<label class="checkLabel"><input type="checkbox" name="hide" id="hide" value="0"> Hidden</label>
								</p>
								<p>
									<input type="hidden" name="caseID" id="caseID" value="">
									<input name="send" type="submit" id="submit" value="Submit">
								</p>
							</form>
							</cfoutput>

						<cfelse>
							<cfinvoke
								component="#application.components#.queryController"
								method="adminCases"
								returnvariable="cases">
								<cfinvokeargument name="case" value="#url.case#">
							</cfinvoke>

							<h1>Edit Application Story</h1>

							<cfoutput query="cases">
							<form action="#cgi.script_name#" method="post" id="form" enctype="multipart/form-data">
								<p>Fields designated with an asterisk (<span class="ast">*</span>) are required.</p>
								<p>
									<label class="formLabel">Category</label>
									<select name="cat" id="cat" class="form chosen">
										<option value="Pneumatic Conveying"<cfif cases.c_cat eq "Pneumatic Conveying"> selected</cfif>>Pneumatic Conveying</option>
										<option value="Vacuum Cleaning"<cfif cases.c_cat eq "Vacuum Cleaning"> selected</cfif>>Vacuum Cleaning</option>
										<option value="Aero-Mechanical Conveyors"<cfif cases.c_cat eq "Aero-Mechanical Conveyors"> selected</cfif>>Aero-Mechanical Conveyors</option>
										<option value="Flexible Screw Conveyors"<cfif cases.c_cat eq "Flexible Screw Conveyors"> selected</cfif>>Flexible Screw Conveyors</option>
										<option value="Pulsonic Bin Activators"<cfif cases.c_cat eq "Pulsonic Bin Activators"> selected</cfif>>Pulsonic Bin Activators</option>
										<option value="Mechanical Conveying"<cfif cases.c_cat eq "Mechanical Conveying"> selected</cfif>>Mechanical Conveying</option>
									</select>
								</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Title</label>
									<input type="text" name="ti" id="ti" class="form" value="#cases.c_title#">
								</p>
								<p>
									<label class="formLabel">Subtitle</label>
									<input type="text" name="sub" id="sub" class="form" value="#cases.c_subTitle#">
								</p>
								<p>
									<span class="ast">*</span>Summary (This is the preview text that will display on the home page and side bars.)<br>
									<textarea name="sum" id="sum" class="ckeditor" cols="80">#cases.c_summary#</textarea>
								</p>
								<p>
									<span class="ast">*</span>Content<br>
									<textarea name="bod" id="bod" class="ckeditor" cols="80">#cases.c_body#</textarea>
								</p>
								<p id="casePDF">
									<cfif cases.c_pdf eq "">
										<label class="formLabel">PDF</label>
										<input type="file" name="pdf" id="pdf" class="form">
									<cfelse>
										<input type="hidden" name="hasPDF" id="hasPDF" value="#cases.c_pdf#">
										<a href="#application.root#userfiles/cases/#cases.c_pdf#" target="_blank">#cases.c_pdf#</a> [<a href="##" id="delete" rel="#cases.c_id#">Delete</a>]
									</cfif>
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="feat" id="feat" value="1"<cfif cases.c_featured eq 1> checked</cfif>> Featured</label><br>
									<label class="checkLabel"><input type="checkbox" name="hide" id="hide" value="0"<cfif cases.c_switch eq 0> checked</cfif>> Hidden</label>
								</p>
								<p>
									<input type="hidden" name="caseID" id="caseID" value="#url.case#">
									<input name="send" type="submit" id="submit" value="Submit">
								</p>
							</form>
							</cfoutput>
						</cfif>

					<cfelse>

						<cfif form.caseID eq "">
							<!--- Add new case to db. --->
							<cfoutput>
							<cfset destination = expandPath("../userfiles/cases")>

							<cfif form.pdf neq "">
								<cffile action="upload" filefield="pdf" destination="#destination#" nameConflict="makeUnique" result="upload">
								<cfset pdf = "#upload.serverfile#">
			                </cfif>

							<cfquery name="addCase" dataSource="#application.datasource#">
								INSERT INTO cases
								(c_cat, c_title, c_subTitle, c_summary, c_body, c_pdf, c_featured, c_switch)
								VALUES (
									<cfqueryparam value="#Trim(form.cat)#" cfsqltype="CF_SQL_VARCHAR">,
									<cfqueryparam value="#Trim(form.ti)#" cfsqltype="CF_SQL_TEXT">,
									<cfqueryparam value="#Trim(form.sub)#" cfsqltype="CF_SQL_TEXT">,
									<cfqueryparam value="#Trim(form.sum)#" cfsqltype="CF_SQL_TEXT">,
									<cfqueryparam value="#Trim(form.bod)#" cfsqltype="CF_SQL_LONGTEXT">,
									<cfqueryparam value="#Trim(pdf)#" cfsqltype="CF_SQL_VARCHAR">,
									<cfqueryparam value="#Trim(form.feat)#" cfsqltype="CF_SQL_INTEGER">,
									<cfqueryparam value="#Trim(form.hide)#" cfsqltype="CF_SQL_INTEGER">)
							</cfquery>
							<cflocation url="cases.cfm?add" addToken="no">
							</cfoutput>

						<cfelse>

							<!--- Edit case --->
							<cfoutput>
							<cfif form.hasPDF eq "">
								<cfset destination = expandPath("../userfiles/cases")>

								<cfif form.pdf neq "">
									<cffile action="upload" filefield="pdf" destination="#destination#" nameConflict="makeUnique" result="upload">
									<cfset pdf = "#upload.serverfile#">
				                </cfif>
				            <cfelse>
				            	<cfset pdf = form.hasPDF>
							</cfif>

							<cfquery name="editCase" dataSource="#application.datasource#">
								UPDATE cases
								SET c_cat = <cfqueryparam value="#Trim(form.cat)#" cfsqltype="CF_SQL_VARCHAR">,
									c_title = <cfqueryparam value="#Trim(form.ti)#" cfsqltype="CF_SQL_TEXT">,
									c_subTitle = <cfqueryparam value="#Trim(form.sub)#" cfsqltype="CF_SQL_TEXT">,
									c_summary = <cfqueryparam value="#Trim(form.sum)#" cfsqltype="CF_SQL_TEXT">,
									c_body = <cfqueryparam value="#Trim(form.bod)#" cfsqltype="CF_SQL_LONGTEXT">,
									c_pdf = <cfqueryparam value="#Trim(pdf)#" cfsqltype="CF_SQL_VARCHAR">,
									c_featured = <cfqueryparam value="#Trim(form.feat)#" cfsqltype="CF_SQL_INTEGER">,
									c_switch = <cfqueryparam value="#Trim(form.hide)#" cfsqltype="CF_SQL_INTEGER">
								WHERE c_id = <cfqueryparam value="#Trim(form.caseID)#" cfsqltype="CF_SQL_INTEGER">
							</cfquery>
							<cflocation url="cases.cfm?edit" addToken="no">
							</cfoutput>
						</cfif>
					</cfif>
	    		</div>
	    	</div><!--- row-fluid--->
		</div><!--- conIndent --->
    </div><!--- container --->

    <cfinclude template="inc/footer.cfm">

	<cfinclude template="../inc/scripts.cfm">
	<cfoutput>
		<script src="#application.root#js/jquery.validate.min.js"></script>
		<script src="#application.root#js/ckeditor/ckeditor.js"></script>
		<script src="#application.root#js/ckeditor/adapters/jquery.js"></script>
		<script src="#application.root#js/chosen.jquery.min.js"></script>
	</cfoutput>
	<script>
		$(document).ready(function() {
			$('.chosen').chosen();

			$('#sum').ckeditor({
				toolbar : 'Default',
	     		customConfig : 'config.js.cfm',
	     		filebrowserImageUploadUrl : '../js/ckfinder/core/connector/cfm/connector.cfm?command=QuickUpload&type=Images'
			});

			$('#bod').ckeditor({
				toolbar : 'Default',
	     		customConfig : 'config.js.cfm',
	     		filebrowserImageUploadUrl : '../js/ckfinder/core/connector/cfm/connector.cfm?command=QuickUpload&type=Images'
			});

			$("#form").validate({
				ignore: [],
				errorPlacement: function(error, element) {
					if ((element.attr('name') == 'sum') || (element.attr('name') == 'bod')) {
						error.insertBefore(element);
					} else {
						error.appendTo(element.parent());
					}
				},
				rules: {
					ti: "required",
					sum: {
						required: function() {
	                    	CKEDITOR.instances.sum.updateElement();
	                    }
					},
					bod: {
						required: function() {
	                    	CKEDITOR.instances.bod.updateElement();
	                    }
					}
				},
				messages: {
					ti: "Please enter a title.",
					sum: "Please enter a summary",
					bod: "Please add content."
				}
			});

			$('#delete').click(function() {
				var casePDF = $(this).attr('rel');

				if (confirm('Are you sure you want to delete this file?')) {
					$.ajax({
						type: 'GET',
						url: 'delete.cfm',
						data: { section: 'casePDF', casePDF: casePDF},
						success: function(response){
							$('#casePDF').html('<label class="formLabel">PDF</label><input type="file" name="pdf" id="pdf" class="form">');
						}
					});
				}
			});
		});
	</script>
</body>
</html>
<cfsetting requestTimeout="400">
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
	    			<cfparam name="url.bro" default="">
					<cfparam name="form.cat" default="">
					<cfparam name="form.ti" default="">
					<cfparam name="form.pdf" default="">
					<cfparam name="form.hasPDF" default="">
					<cfparam name="form.hasImg" default="">
					<cfparam name="form.hide" default="1">
					
					<cfif isDefined("form.send")>
						<cfset errors = "">
						
						<cfif errors is "">
							<!--- do something here --->
							<cfset showForm = false>
						</cfif>
					</cfif>
					
					<cfif showForm>
						<cfif url.bro eq "">
		    				<h1>Add Brochure</h1>
		    			
							<cfoutput>
							<form action="#cgi.script_name#" method="post" id="form" enctype="multipart/form-data">
								<p>Fields designated with an asterisk (<span class="ast">*</span>) are required.</p>
								<p>
									<label class="formLabel">Category</label>
									<select name="cat" id="cat" class="form chosen">
										<option value="1 Pneumatic<br>Conveying Systems">Pneumatic Conveying</option>
										<option value="2 Industrial<br>Vacuum Cleaners">Vacuum Cleaning</option>
										<option value="3 Aero-Mechanical<br>Conveyors">Aero-Mechanical Conveyors</option>
										<option value="4 Flexible Screw<br>Conveyors">Flexible Screw Conveyors</option>
										<option value="5 Pulsonic<br>Bin Activators">Pulsonic Bin Activators</option>
									</select>
								</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Title</label>
									<input type="text" name="ti" id="ti" class="form">
								</p>
								<p>
									<label class="formLabel">PDF</label>
									<input type="file" name="pdf" id="pdf" class="form">
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="hide" id="hide" value="0"> Hidden</label>
								</p>
								<p>
									<input type="hidden" name="broID" id="broID" value="">
									<input name="send" type="submit" id="submit" value="Submit">
								</p>
							</form>
							</cfoutput>
						  
						<cfelse>
							<cfinvoke 
								component="#application.components#.queryController" 
								method="adminBrochures" 
								returnvariable="bro">
								<cfinvokeargument name="bro" value="#url.bro#">
							</cfinvoke>
							
							<h1>Edit Brochure</h1>
		    			
							<cfoutput query="bro">
							<form action="#cgi.script_name#" method="post" id="form" enctype="multipart/form-data">
								<p>Fields designated with an asterisk (<span class="ast">*</span>) are required.</p>
								<p>
									<label class="formLabel">Category</label>
									<select name="cat" id="cat" class="form chosen">
										<option value="1 Pneumatic<br>Conveying Systems"<cfif bro.section eq "1 Pneumatic<br>Conveying Systems"> selected</cfif>>Pneumatic Conveying</option>
										<option value="2 Industrial<br>Vacuum Cleaners"<cfif bro.section eq "2 Industrial<br>Vacuum Cleaners"> selected</cfif>>Vacuum Cleaning</option>
										<option value="3 Aero-Mechanical<br>Conveyors"<cfif bro.section eq "3 Aero-Mechanical<br>Conveyors"> selected</cfif>>Aero-Mechanical Conveyors</option>
										<option value="4 Flexible Screw<br>Conveyors"<cfif bro.section eq "4 Flexible Screw<br>Conveyors"> selected</cfif>>Flexible Screw Conveyors</option>
										<option value="5 Pulsonic<br>Bin Activators"<cfif bro.section eq "5 Pulsonic<br>Bin Activators"> selected</cfif>>Pulsonic Bin Activators</option>
									</select>
								</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Title</label>
									<input type="text" name="ti" id="ti" class="form" value="#bro.title#">
								</p>
								<p id="broPDF">
									<cfif bro.file eq "">
										<label class="formLabel">PDF</label>
										<input type="file" name="pdf" id="pdf" class="form">
									<cfelse>
										<input type="hidden" name="hasPDF" id="hasPDF" value="#bro.file#">
										<input type="hidden" name="hasImg" id="hasImg" value="#bro.img#">
										<a href="#application.root#userfiles/brochures/#bro.file#" target="_blank"><img src="#application.root#userfiles/brochures/#bro.img#"></a> [<a href="##" id="delete" rel="#bro.id#">Delete</a>]
									</cfif>
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="hide" id="hide" value="0"<cfif bro.switch eq 0> checked</cfif>> Hidden</label>
								</p>
								<p>
									<input type="hidden" name="broID" id="broID" value="#url.bro#">
									<input name="send" type="submit" id="submit" value="Submit">
								</p>
							</form>
							</cfoutput>
						</cfif>
							
					<cfelse>
						
						<cfif form.broID eq "">
							<!--- Add brochure to db. --->
							<cfoutput>
							<cfset destination = expandPath("../userfiles/brochures")>
					
							<cfif form.pdf neq "">
								<cffile action="upload" filefield="pdf" destination="#destination#" nameConflict="makeUnique" result="upload">
								<cfset pdf = "#upload.serverfile#">
								<cfset img = Replace(upload.serverfile, ".pdf", "") & "_page_1.jpg">
								<cfpdf action="thumbnail" source="#destination#/#upload.serverfile#" destination="#destination#" format="jpg" pages="1" overwrite="yes" scale="25">
			                </cfif>
							
							<cfquery name="addBro" dataSource="#application.datasource#">
								INSERT INTO brochures
								(section, title, file, img, switch)
								VALUES (
									<cfqueryparam value="#Trim(form.cat)#" cfsqltype="cf_sql_varchar">,
									<cfqueryparam value="#Trim(form.ti)#" cfsqltype="cf_sql_text">,
									<cfqueryparam value="#Trim(pdf)#" cfsqltype="cf_sql_varchar">,
									<cfqueryparam value="#Trim(img)#" cfsqltype="cf_sql_varchar">,
									<cfqueryparam value="#Trim(form.hide)#" cfsqltype="cf_sql_integer">)
							</cfquery>
							
							<cflocation url="brochures.cfm?add" addToken="no">
							</cfoutput>
							
						<cfelse>
			                
							<!--- Edit brochure --->
							<cfoutput>
							<cfif form.hasPDF eq "">
								<cfset destination = expandPath("../userfiles/brochures")>
								
								<cfif form.pdf neq "">
									<cffile action="upload" filefield="pdf" destination="#destination#" nameConflict="makeUnique" result="upload">
									<cfset pdf = "#upload.serverfile#">
									<cfset img = Replace(upload.serverfile, ".pdf", "") & "_page_1.jpg">
									<cfpdf action="thumbnail" source="#destination#/#upload.serverfile#" destination="#destination#" format="jpg" pages="1" overwrite="yes" scale="25">
				                </cfif>
				            <cfelse>
				            	<cfset pdf = form.hasPDF>
				            	<cfset img = form.hasImg>
							</cfif>
							
							<cfquery name="editCase" dataSource="#application.datasource#">
								UPDATE brochures
								SET section = <cfqueryparam value="#Trim(form.cat)#" cfsqltype="cf_sql_varchar">,
									title = <cfqueryparam value="#Trim(form.ti)#" cfsqltype="cf_sql_text">,
									file = <cfqueryparam value="#Trim(pdf)#" cfsqltype="cf_sql_varchar">,
									img = <cfqueryparam value="#Trim(img)#" cfsqltype="cf_sql_varchar">,
									switch = <cfqueryparam value="#Trim(form.hide)#" cfsqltype="cf_sql_integer">
								WHERE id = <cfqueryparam value="#Trim(form.broID)#" cfsqltype="cf_sql_integer">
							</cfquery>
							
							<cflocation url="brochures.cfm?edit" addToken="no">
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
			
			$("#form").validate({
				errorPlacement: function(error, element) {
					 error.insertAfter(element);
				},
				rules: {
					ti: "required",
					pdf: "required"
				},
				messages: {
					ti: "Please enter a title.",
					pdf: "Please add a PDF."
				}
			});
			
			$('#delete').click(function() {
				var broPDF = $(this).attr('rel');
				
				if (confirm('Are you sure you want to delete this PDF?')) {
					$.ajax({
						type: 'GET',
						url: 'delete.cfm',
						data: { section: 'broPDF', broPDF: broPDF},
						success: function(response){
							$('#broPDF').html('<label class="formLabel">PDF</label><input type="file" name="pdf" id="pdf" class="form">');
						}
					});
				}
			});
		});
	</script>
</body>
</html>
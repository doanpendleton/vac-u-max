<cfprocessingdirective pageEncoding="utf-8">
<!DOCTYPE html>
<html>
<head>
	<cfinclude template="inc/head.cfm">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
</head>

<body>
	<cfinclude template="inc/top.cfm">

    <div class="container">
		<div class="conIndent">
	    	<div class="row-fluid">
	    		<div id="prodCon" class="span12 well">
	    			<cfset showForm = true>
	    			<cfparam name="url.news" default="">
					<cfparam name="form.date" default="">
					<cfparam name="form.ti" default="">
					<cfparam name="form.bod" default="">
					<cfparam name="form.img" default="">
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
						<cfif url.news eq "">
		    				<h1>Add News</h1>

							<cfoutput>
							<form action="#cgi.script_name#" method="post" id="form" enctype="multipart/form-data">
								<p>Fields designated with an asterisk (<span class="ast">*</span>) are required.</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Date</label>
									<input type="text" name="date" id="date">
								</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Title</label>
									<input type="text" name="ti" id="ti" class="form">
								</p>
								<p>
									<span class="ast">*</span>Content<br>
									<textarea name="bod" id="bod" class="ckeditor" cols="80"></textarea>
								</p>
								<p>
									<label class="formLabel">Image</label>
									<input type="file" name="img" id="img" class="form">
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="hide" id="hide" value="0"> Hidden</label>
								</p>
								<p>
									<input type="hidden" name="newsID" id="newsID" value="">
									<input name="send" type="submit" id="submit" value="Submit">
								</p>
							</form>
							</cfoutput>

						<cfelse>
							<cfinvoke
								component="#application.components#.queryController"
								method="news"
								returnvariable="news">
								<cfinvokeargument name="article" value="#url.news#">
							</cfinvoke>

							<h1>Edit News</h1>

							<cfoutput query="news">
							<form action="#cgi.script_name#" method="post" id="form" enctype="multipart/form-data">
								<p>Fields designated with an asterisk (<span class="ast">*</span>) are required.</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Date</label>
									<input type="text" name="date" id="date" value="#DateFormat(news.n_date, 'mm/dd/yyyy')#">
								</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Title</label>
									<input type="text" name="ti" id="ti" class="form" value="#news.n_title#">
								</p>
								<p>
									<span class="ast">*</span>Content<br>
									<textarea name="bod" id="bod" class="ckeditor" cols="80">#news.n_desc#</textarea>
								</p>
								<p id="casePDF">
									<cfif news.n_img eq "">
										<label class="formLabel">Image</label>
										<input type="file" name="img" id="img" class="form">
									<cfelse>
										<input type="hidden" name="hasImg" id="hasImg" value="#news.n_img#">
										<img src="#application.root#img/news/#news.n_img#" width="200"><br>
										[<a href="##" id="delete" rel="#news.n_id#">Delete</a>]
									</cfif>
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="hide" id="hide" value="0"<cfif news.n_switch eq 0> checked</cfif>> Hidden</label>
								</p>
								<p>
									<input type="hidden" name="newsID" id="newsID" value="#url.news#">
									<input name="send" type="submit" id="submit" value="Submit">
								</p>
							</form>
							</cfoutput>
						</cfif>

					<cfelse>

						<cfif form.newsID eq "">
							<!--- Add new case to db. --->
							<cfoutput>
							<cfset destination = expandPath("../img/news")>

							<cfif form.img neq "">
								<cffile action="upload" filefield="img" destination="#destination#" nameConflict="makeUnique" result="upload">
								<cfset form.img = "#upload.serverfile#">
								<cfimage action="resize" width="175" height="" source="#destination#/#form.img#" destination="#destination#/#form.img#" quality="0.5" overwrite="yes">
			                </cfif>

							<cfquery name="addNews" dataSource="#application.datasource#">
								INSERT INTO news
								(n_date, n_title, n_desc, n_img, n_switch)
								VALUES (
									<cfqueryparam value="#DateFormat(form.date, 'yyyy-mm-dd')#" CFSQLType="cf_sql_timestamp">,
									<cfqueryparam value="#Trim(form.ti)#" cfsqltype="cf_sql_text">,
									<cfqueryparam value="#Trim(form.bod)#" cfsqltype="cf_sql_longtext">,
									<cfqueryparam value="#form.img#" cfsqltype="cf_sql_varchar">,
									<cfqueryparam value="#Trim(form.hide)#" cfsqltype="cf_sql_integer">)
							</cfquery>
							<cflocation url="news.cfm?add" addToken="no">
							</cfoutput>

						<cfelse>

							<!--- Edit case --->
							<cfoutput>
							<cfif form.hasImg eq "">
								<cfset destination = expandPath("../img/news")>

								<cfif form.img neq "">
									<cffile action="upload" filefield="img" destination="#destination#" nameConflict="makeUnique" result="upload">
									<cfset form.img = "#upload.serverfile#">
									<cfimage action="resize" width="175" height="" source="#destination#/#form.img#" destination="#destination#/#form.img#" quality="0.5" overwrite="yes">
				                </cfif>
				            <cfelse>
				            	<cfset form.img = form.hasImg>
							</cfif>

							<cfquery name="editCase" dataSource="#application.datasource#">
								UPDATE news
								SET n_date = <cfqueryparam value="#DateFormat(form.date, 'yyyy-mm-dd')#" CFSQLType="cf_sql_timestamp">,
									n_title = <cfqueryparam value="#Trim(form.ti)#" cfsqltype="cf_sql_text">,
									n_desc = <cfqueryparam value="#Trim(form.bod)#" cfsqltype="cf_sql_longtext">,
									n_img = <cfqueryparam value="#form.img#" cfsqltype="cf_sql_varchar">,
									n_switch = <cfqueryparam value="#Trim(form.hide)#" cfsqltype="cf_sql_integer">
								WHERE n_id = <cfqueryparam value="#Trim(form.newsID)#" cfsqltype="cf_sql_integer">
							</cfquery>
							<cflocation url="news.cfm?edit" addToken="no">
							</cfoutput>
						</cfif>
					</cfif>
	    		</div>
	    	</div><!--- row-fluid--->
		</div><!--- conIndent --->
    </div><!--- container --->

    <cfinclude template="inc/footer.cfm">

	<cfinclude template="inc/scripts.cfm">
	<cfoutput>
		<script src="#application.root#js/jquery.validate.min.js"></script>
		<script src="#application.root#js/ckeditor/ckeditor.js"></script>
		<script src="#application.root#js/ckeditor/adapters/jquery.js"></script>
	</cfoutput>
	<script>
		$(document).ready(function() {
			$( "#date" ).datepicker({
				changeMonth: true,
				changeYear: true,
				numberOfMonths: 1,
				showButtonPanel: true
			});

			$('#bod').ckeditor({
				toolbar : 'Default',
	     		customConfig : 'config.js.cfm',
	     		filebrowserImageUploadUrl : '../js/ckfinder/core/connector/cfm/connector.cfm?command=QuickUpload&type=Images'
			});

			$("#form").validate({
				ignore: [],
				errorPlacement: function(error, element) {
					 if (element.attr('name') == 'bod') {
						error.insertBefore(element);
					} else {
						error.appendTo(element.parent());
					}
				},
				rules: {
					date: "required",
					ti: "required",
					bod: {
						required: function() {
	                    	CKEDITOR.instances.bod.updateElement();
	                    }
					}
				},
				messages: {
					date: "Please enter a date.",
					ti: "Please enter a title.",
					bod: "Please add content."
				}
			});

			$('#delete').click(function() {
				var newsImg = $(this).attr('rel');

				if (confirm('Are you sure you want to delete this image?')) {
					$.ajax({
						type: 'GET',
						url: 'delete.cfm',
						data: { section: 'newsImg', newsImg: newsImg},
						success: function(response){
							$('#casePDF').html('<label class="formLabel">Image</label><input type="file" name="img" id="img" class="form">');
						}
					});
				}
			});
		});
	</script>
</body>
</html>
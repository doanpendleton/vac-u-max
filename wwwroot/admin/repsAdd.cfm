<cfprocessingdirective pageEncoding="utf-8">
<cfquery name="getVReps" dataSource="#application.datasource#">
	SELECT id, name
	FROM repsVUM
	ORDER BY name
</cfquery>
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
	    			<h1>Reps: Add</h1>

	    			<cfset showForm = true>
	    			<cfparam name="form.vum" default="">
					<cfparam name="form.co" default="">
					<cfparam name="form.na" default="">
					<cfparam name="form.email" default="">
					<cfparam name="form.pnue" default="">
					<cfparam name="form.vac" default="">
					<cfparam name="form.zips" default="">

					<cfif isDefined("form.send")>
						<cfset errors = "">

						<cfif errors is "">
							<!--- do something here --->
							<cfset showForm = false>
						</cfif>
					</cfif>

					<cfif showForm>
						<cfoutput>
							<p id="tempRow" class="zipRow hidden">
								<label class="formLabel">&nbsp;</label>
								<input type="text" name="zA" class="form2 zA"> -
								<input type="text" name="zB" class="form2 zB">
								<a href="##" id="#getVReps.id#" class="delete icon-trash" title="Delete"></a>
							</p>

							<form action="#cgi.script_name#" method="post" id="form">
								<p>Fields designated with an asterisk (<span class="ast">*</span>) are required.</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Regional Manager</label>
									<select name="vum" id="vum" class="form chosen">
										<option value="">-- Select Regional Manager --</option>
										<cfloop query="getVReps">
											<option value="#getVReps.id#">#getVReps.name#</option>
										</cfloop>
									</select>
								</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Company</label>
									<input type="text" name="co" id="co" class="form">
								</p>
								<p>
									<label class="formLabel">Name</label>
									<input type="text" name="na" id="na" class="form">
								</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Email</label>
									<input type="text" name="email" id="email" class="form">
								</p>
								<div id="zipArea">
									<p class="zipRow">
										<label class="formLabel">Zip Codes</label>
										<input type="text" name="zA1" class="form2 zA"> -
										<input type="text" name="zB1" class="form2 zB">
										<a href="##" id="#getVReps.id#" class="delete icon-trash" title="Delete"></a>
									</p>
								</div>
								<p>
									<input type="hidden" name="count" id="count" value="1">
									<a href="##" id="addRow" class="btnLink pull-left">Add Zip Range</a>
									<input name="send" type="submit" id="submit" value="Add Rep">
								</p>
							</form>
						</cfoutput>

					<cfelse>

						<!--- Edit user --->
						<cfoutput>
							<cfset sec = Ucase(Left(form.ln, 1))>
							<cfquery name="tableName" dataSource="#application.datasource#">
								UPDATE users
								SET username = <cfqueryparam value="#Trim(form.user)#" cfsqltype="CF_SQL_VARCHAR">,
									password = <cfqueryparam value="#Trim(form.pass)#" cfsqltype="CF_SQL_VARCHAR">,
									access = <cfqueryparam value="#Trim(form.level)#" cfsqltype="CF_SQL_VARCHAR">,
									accNumber = <cfqueryparam value="#Trim(form.acc)#" cfsqltype="CF_SQL_VARCHAR">,
									fname = <cfqueryparam value="#Trim(form.fn)#" cfsqltype="CF_SQL_VARCHAR">,
									lname = <cfqueryparam value="#Trim(form.ln)#" cfsqltype="CF_SQL_VARCHAR">,
									cname = <cfqueryparam value="#Trim(form.co)#" cfsqltype="CF_SQL_VARCHAR">,
									phone = <cfqueryparam value="#Trim(form.ph)#" cfsqltype="CF_SQL_VARCHAR">,
									fax = <cfqueryparam value="#Trim(form.fax)#" cfsqltype="CF_SQL_VARCHAR">,
									email = <cfqueryparam value="#Trim(form.email)#" cfsqltype="CF_SQL_VARCHAR">,
									street = <cfqueryparam value="#Trim(form.ad)#" cfsqltype="CF_SQL_VARCHAR">,
									street2 = <cfqueryparam value="#Trim(form.ad2)#" cfsqltype="CF_SQL_VARCHAR">,
									city = <cfqueryparam value="#Trim(form.ci)#" cfsqltype="CF_SQL_VARCHAR">,
									state = <cfqueryparam value="#Trim(form.st)#" cfsqltype="CF_SQL_VARCHAR">,
									zip = <cfqueryparam value="#Trim(form.zip)#" cfsqltype="CF_SQL_VARCHAR">,
									memo = <cfqueryparam value="#Trim(form.memo)#" cfsqltype="CF_SQL_TEXT">,
									alphaSec = <cfqueryparam value="#Trim(sec)#" cfsqltype="CF_SQL_VARCHAR">
								WHERE id = <cfqueryparam value="#Trim(form.userID)#" cfsqltype="CF_SQL_INTEGER">
							</cfquery>

							<cflocation url="reps.cfm?add" addToken="no">
						</cfoutput>
					</cfif>
	    		</div>
	    	</div><!--- row-fluid--->
		</div><!--- conIndent --->
    </div><!--- container --->

    <cfinclude template="inc/footer.cfm">

	<cfinclude template="inc/scripts.cfm">
	<cfoutput>
		<script src="#application.root#js/jquery.validate.min.js"></script>
		<script src="#application.root#js/chosen.jquery.min.js"></script>
	</cfoutput>
	<script>
		$(document).ready(function() {
			var count = 1;

			$('.chosen').chosen();

			$("#form").validate({
				ignore: [],
				errorPlacement: function(error, element) {
					 error.appendTo(element.parent());
				},
				rules: {
					vum: "required",
					co: "required",
					email: {
						required: true,
						email: true
					},
					zA1: "required",
					zB1: "required"
				},
				messages: {
					vum: "Please select a regional manager.",
					co: "Please enter the company name.",
					email: "Please enter a valid email.",
					zA1: "Please enter a beginning zip code range.",
					zB1: "Please enter a ending zip code range."
				}
			});

			$('#addRow').click(function() {
				if (count < 92) {
					count++;
					var newRow = $('#tempRow').clone(true);
					$(newRow).removeAttr('id');
					$(newRow).find('.zA').attr('name', 'zA'+count);
					$(newRow).find('.zB').attr('name', 'zB'+count);
					$(newRow).appendTo('#zipArea');
					$(newRow).removeClass('hidden');

					$(newRow).find('.zA').rules('add', {
						required: true,
						messages: {
							required: 'Please enter a beginning zip code range.'
						}
					});
					$(newRow).find('.zB').rules('add', {
						required: true,
						messages: {
							required: 'Please enter a ending zip code range.'
						}
					});

					$('html, body').animate({scrollTop:$(document).height()}, 'fast');
				} else {
					alert('You\'ve reached the maximum number of fields allowed.');
				}

				return false;
			});

			$('.zipRow').on('click', 'a.delete', function() {
				$(this).parent().find('.zA').rules('remove');
				$(this).parent().find('.zB').rules('remove');
				$(this).parent().remove();

				if ($('#zipArea').html() === '') {
					var newRow = $('#tempRow').clone(true);
					$(newRow).removeAttr('id');
					$(newRow).find('.zA').attr('name', 'zA1');
					$(newRow).find('.zB').attr('name', 'zB1');
					$(newRow).appendTo('#zipArea');
					$(newRow).removeClass('hidden');
					count = 1;
				} else {
					var reorder = 0;
					$('#zipArea').children('.zipRow').each(function(){
						reorder++;
						$(this).find('.zA').attr('name', 'zA'+reorder);
						$(this).find('.zB').attr('name', 'zB'+reorder);
					});

					$('#count').val(reorder);
					count = reorder;
					console.log(count);
				}

				return false;
			});
		});
	</script>
</body>
</html>
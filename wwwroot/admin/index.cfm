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
					<a href="userAdd.cfm" class="quoteBtn">Add User</a>
	    			<h1>Users</h1>
	    			<ul>
	    				<cfif isDefined('url.add')><li class="success">New user created.</li></cfif>
	    				<cfif isDefined('url.edit')><li class="success">User edit successful.</li></cfif>
	    				<cfif isDefined('url.delete')><li class="success">User deletion successful.</li></cfif>
	    			</ul>

	    			<div class="span7">
		    			<cfset showForm = true>
		    			<cfparam name="url.user" default="">
						<cfparam name="form.user" default="">
						<cfparam name="form.pass" default="">
						<cfparam name="form.level" default="">
						<cfparam name="form.acc" default="">
						<cfparam name="form.fn" default="">
						<cfparam name="form.fn" default="">
						<cfparam name="form.ln" default="">
						<cfparam name="form.co" default="">
						<cfparam name="form.ph" default="">
						<cfparam name="form.fax" default="">
						<cfparam name="form.email" default="">
						<cfparam name="form.ad" default="">
						<cfparam name="form.ad2" default="">
						<cfparam name="form.ci" default="">
						<cfparam name="form.st" default="">
						<cfparam name="form.zip" default="">
						<cfparam name="form.memo" default="">

						<cfif isDefined("form.send")>
							<cfset errors = "">

							<cfif errors is "">
								<!--- do something here --->
								<cfset showForm = false>
							</cfif>
						</cfif>

						<cfif showForm>
							<cfoutput>
							<form action="#cgi.script_name#" method="post" id="form">
								<p>Fields designated with an asterisk (<span class="ast">*</span>) are required.</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>User ID</label>
									<input type="text" name="user" id="user" class="form">
								</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Password</label>
									<input type="password" name="pass" id="pass" class="form">
								</p>
								<p>
									<label class="formLabel">Access Level</label>
									<select name="level" id="level" class="form chosen">
										<option value="0">No Access</option>
										<option value="2">Pneumatic</option>
										<option value="3">Vacuum</option>
										<option value="4">Pneumatic &amp; Vacuum</option>
										<option value="5">Admin</option>
									</select>
								</p>
								<p>
									<label class="formLabel">Account Number</label>
									<input type="text" name="acc" id="acc" class="form">
								</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>First Name</label>
									<input type="text" name="fn" id="fn" class="form">
								</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Last Name</label>
									<input type="text" name="ln" id="ln" class="form">
								</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Company Name</label>
									<input type="text" name="co" id="co" class="form">
								</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Phone</label>
									<input type="text" name="ph" id="ph" class="form">
								</p>
								<p>
									<label class="formLabel">Fax</label>
									<input type="text" name="fax" id="fax" class="form">
								</p>
								<p>
									<label class="formLabel">Email</label>
									<input type="text" name="email" id="email" class="form">
								</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Street</label>
									<input type="text" name="ad" id="ad" class="form">
								</p>
								<p>
									<label class="formLabel">Street 2</label>
									<input type="text" name="ad2" id="ad2" class="form">
								</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>City</label>
									<input type="text" name="ci" id="ci" class="form">
								</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>State</label>
									<input type="text" name="st" id="st" class="form">
								</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Zip</label>
									<input type="text" name="zip" id="zip" class="form" size="10">
								</p>
								<p>
									<label class="formLabel">Memo</label>
									<textarea name="memo" id="memo" class="form"></textarea>
								</p>
								<p>
									<input type="hidden" name="userID" id="userID" value="">
									<input name="send" type="submit" id="submit" value="Edit User">
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
							<cflocation url="#cgi.script_name#?edit" addToken="no">
							</cfoutput>
						</cfif>
	    			</div>

	    			<div class="span5">
	    				<cfinvoke
							component="#application.components#.queryController"
							method="users"
							returnvariable="users">
						</cfinvoke>
						<div id="letters">
	    					<cfoutput query="users" group="alphaSec">
	    					<a href="###users.alphaSec#">#users.alphaSec#</a>
							</cfoutput>
						</div>

	    				<cfoutput query="users" group="alphaSec">
    						<a name="#users.alphaSec#"></a>
							<h3 class="letTitle">#users.alphaSec#</h3>
    						<cfoutput>
	    						<div class="userBox">
	    							#users.lname#, #users.fname# <a href="##" id="#users.id#" class="delete icon-trash pull-right" title="Delete"></a>
	    							<a href="mailto:#users.email#" class="edit icon-envelope pull-right" title="Email" id="#users.id#"></a>
	    							<a href="##" class="edit icon-edit pull-right" title="Edit" id="#users.id#"></a>
	    						</div>
    						</cfoutput>
	    				</cfoutput>
	    			</div>
	    		</div>
	    	</div><!--- row-fluid--->
		</div><!--- conIndent --->
    </div><!--- container --->

    <cfinclude template="inc/footer.cfm">

	<cfinclude template="inc/scripts.cfm">
	<script src="<cfoutput>#application.root#</cfoutput>js/jquery.validate.min.js"></script>
	<script src="<cfoutput>#application.root#</cfoutput>js/chosen.jquery.min.js"></script>
	<script>
		$(document).ready(function() {
			$('.chosen').chosen({
				disable_search: true
			});

			$(".edit").click(function() {
				var user = $(this).attr('id');
		        $.ajax({
		            type: 'POST',
		            url: "getStuff.cfm",
		            data: { section: 'users', user: user },
		            success: function(xml){
		                $('#userID').val($("id",xml).text());
		                $('#user').val($("username",xml).text());
		                $('#pass').val($("password",xml).text());
		                $('#level').val($("access",xml).text());
		                $('.chosen').trigger('chosen:updated');
		                $('#acc').val($("accNumber",xml).text());
		                $('#fn').val($("fname",xml).text());
		                $('#ln').val($("lname",xml).text());
		                $('#co').val($("cname",xml).text());
		                $('#ph').val($("phone",xml).text());
		                $('#fax').val($("fax",xml).text());
		                $('#email').val($("email",xml).text());
		                $('#ad').val($("street",xml).text());
		                $('#ad2').val($("street2",xml).text());
		                $('#ci').val($("city",xml).text());
		                $('#st').val($("state",xml).text());
		                $('#zip').val($("zip",xml).text());
		                $('#memo').val($("memo",xml).text());
		            }
		        });
		    });

			$("#form").validate({
				errorPlacement: function(error, element) {
					 error.insertAfter(element);
				},
				rules: {
					user: "required",
					pass: "required",
					fn: "required",
					ln: "required",
					co: "required",
					ph: "required",
					ad: "required",
					ci: "required",
					st: "required",
					zip: "required"
				},
				messages: {
					user: "Please enter a user id.",
					pass: "Please enter a password.",
					fn: "Please enter your first name.",
					ln: "Please enter your last name.",
					co: "Please enter your company name.",
					ph: "Please enter your phone number.",
					ad: "Please enter your street address.",
					ci: "Please enter your city.",
					st: "Please enter your state.",
					zip: "Please enter your zip code."
				}
			});

			$('.delete').click(function() {
				var user = $(this).attr('id');
				var destination = 'delete.cfm?section=user&user=' + user;

				if (confirm('Are you sure you want to delete this user?')) {
					window.location.replace(destination);
				}

				return false;
			});
		});
	</script>
</body>
</html>
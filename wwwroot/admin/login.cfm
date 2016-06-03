<cfprocessingdirective pageEncoding="utf-8">
<!--- Param the form values. --->
<cfparam name="form.user" type="string" default="">
<cfparam name="form.pass" type="string" default="">
<cfparam name="form.remember" type="boolean" default="false">
 
<!---
Check to see if the form has been submitted. Since we
are trying to keep this low-level, just check to see
if both values match up.
--->
<cfif isDefined("form.send")>
	<cfif ((FORM.user EQ "") OR (FORM.pass EQ ""))>
	
		<cfset errors = "You must enter both a User Name and Password.">
		
	<cfelse>
		
		<cfquery name="verifyUser" dataSource="#application.datasource#">
			SELECT id, username, `access`
			FROM users
			WHERE username = <cfqueryparam value="#form.user#" CFSQLType="cf_sql_varchar">
				AND password = <cfqueryparam value="#form.pass#" CFSQLType="cf_sql_varchar">
		</cfquery>
		
		<cfif verifyUser.recordcount gt 0>
			<!--- Check if user is allowed access --->
			<cfif verifyUser.access eq 5>
				<!---
				The user has logged in. This is where we would do the
				authorization; however, since we are just running a very
				simple demo app, simply give the user an ID of "1" to
				signify that they have logged in.
				--->
				<cfset SESSION.User.ID = verifyUser.id>
				<cfset SESSION.User.Access = verifyUser.access>
				 
				<!--- Check to see if the user want to be remembered. --->
				<cfif FORM.remember>
				 
					<!---Build the obfuscated value. This will be a list in which the user ID is the middle value.--->
					<cfset strRememberMe = (CreateUUID() & ":" & SESSION.User.ID & ":" & SESSION.User.Access & ":" & CreateUUID())>
					 
					<!--- Encrypt the value. --->
					<cfset strRememberMe = Encrypt(strRememberMe, APPLICATION.EncryptionKey, "cfmx_compat", "hex")>
					 
					<!--- Store the cookie such that it never expires. --->
					<cfcookie name="RememberMeAdmin" value="#strRememberMe#" expires="never">
				</cfif>
				 
				<!--- Redirect to root. --->
				<cflocation url="./" addtoken="false">
			<cfelse>
				<cfset errors = "You do not have permission to access this area.<br>">
			</cfif>
		<cfelse>
			<cfset errors = "Your User Name or Password are invalid.<br>">
		</cfif>
	</cfif>
</cfif>

<cfoutput>
<!DOCTYPE html>
<html>
<head>
	<cfinclude template="inc/head.cfm">
</head>

<body>
    <div class="container">
	    	<div class="row-fluid">
	    		<div id="loginBox" class="offset3 span6">
	    			<div id="logLogo">
	    				<img src="../img/logo.png" alt="logo" width="364" height="36">
	    			</div>
					
	    			<form action="#cgi.script_name#" method="post" id="form" class="well">
		    			<cfif isDefined("errors")>
						<div id="errors">
							<p><strong>#errors#</strong></p>
						</div>
						</cfif>
						<p>
							<label class="formLabel">User Name</label>
							<input type="text" name="user" id="user" class="form">
						</p>
						<p>
							<label class="formLabel">Password</label>
							<input type="password" name="pass" id="pass" class="form">
						</p>
						<p>
							<label><input type="checkbox" name="remember" value="1"> 
							Remember My User Name &amp; Password</label>
						</p>
						<p>
							<input name="send" type="submit" id="submit" value="Submit" validate="SubmitOnce">
						</p>
					</form>
	    		</div>
	    	</div><!--- row-fluid--->
		</div><!--- conIndent --->
    </div><!--- container --->
	
	<cfinclude template="../inc/scripts.cfm">
	<script src="<cfoutput>#application.root#</cfoutput>js/jquery.validate.min.js"></script>
	<script>
		$(document).ready(function() {
			$("##form").validate({
				errorPlacement: function(error, element) {
					 error.insertAfter(element);
				},
				rules: {
					user: "required",
					pass: "required"
				},
				messages: {
					user: "Please enter your user name.",
					pass: "Please enter your password."
				}
			});
		});
	</script>
</body>
</html>
</cfoutput>
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
			<cfif verifyUser.access neq 0>
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
					<cfcookie name="RememberMe" value="#strRememberMe#" expires="never">
				</cfif>
				 
				<!--- Redirect to root. --->
				<cflocation url="./" addtoken="false">
			<cfelse>
				<cfset errors = "You do not have permission to access this area.">
			</cfif>
		<cfelse>
			<cfset errors = "Your User Name or Password are invalid.">
		</cfif>
	</cfif>
</cfif>

<cfoutput>
<!DOCTYPE html>
<html>
<head>
	<title>VAC-U-MAX | Login</title>
	<meta name="description" content="">
	<cfinclude template="../inc/head.cfm">
</head>

<body>
	<cfinclude template="../inc/top.cfm">
    
    <div id="homeCon" class="container">
		<div class="conIndent">
			<div class="row-fluid">
		    	<div id="inBan1" class="inBanner">
		    		<h1>Login</h1>
		    		<div class="clearfix"></div>
		    	</div><!--- inBanner --->
			</div><!--- row-fluid --->
	    	
	    	<div class="row-fluid">
	    		<div id="prodCon" class="span9 well">
	    			<cfif isDefined("errors")>
					<div id="errors">
						<p><strong>#errors#</strong></p>
					</div>
					</cfif>
					
	    			<cfform action="#CGI.script_name#" method="post" id="form">
						<p>
							<label class="formLabel">User Name</label>
							<cfinput type="text" name="user" id="user" class="form">
						</p>
						<p>
							<label class="formLabel">Password</label>
							<cfinput type="password" name="pass" id="pass" class="form">
						</p>
						<p>
							<label><cfinput type="checkbox" name="remember" value="1"> 
							Remember My User Name &amp; Password</label>
						</p>
						<p>
							<cfinput name="send" type="submit" id="submit" value="Submit" validate="SubmitOnce">
						</p>
					</cfform>
	    		</div>
	    		
	    		<cfinclude template="../inc/sideNews.cfm">
	    	</div><!--- row-fluid--->
		</div><!--- conIndent --->
    </div><!--- container --->
    
    <cfinclude template="../inc/footer.cfm">
	
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
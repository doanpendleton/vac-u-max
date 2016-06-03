<cfcomponent displayname="VaccumMax" output="false" hint="Handles all global variables">

	<!--- Set up the application. --->
	<cfset this.Name = "VacUMax">
	<cfset this.applicationTimeout = createTimeSpan( 0, 2, 0, 0 )>
	<cfset this.sessionManagement = true>
	<cfset this.sessionTimeout = createTimeSpan(0,0,30,0)>
	<cfset this.setClientCookies = true>

	<cffunction name="onApplicationStart" output="false" returnType="boolean" hint="Handles setting of all application variables.">

		<!--- Directory path configuration --->
		<cfset application.datasource = "Vac-U-Max">
        <cfset application.prefix = "">
		<cfset application.components = "/cfc">
		<cfset application.root = "/">
		<cfset application.esRoot = "/es/">
		<cfset application.img = "#application.root#img/">
		<cfset application.css = "#application.root#css/">
		<cfset application.js = "#application.root#js/">
		<!--- make sure to set this if using captchas on a form. --->
		<cfset application.cryptKey = "xD5!MmGbVwQ7$5D7TbMBz$hsAgVg*65kt*x6">
		<cfset application.secretKey = "ioWsCxvE7rnnaqazpkBLbQ==">
                <!-- previous captcha entry 
		<cfset application.reCaptchaSite = "6Lf90wkTAAAAAGIQRkuk3RGUoz8BjYa2AKl50E8j">
		<cfset application.reCaptchaSecret = "6Lf90wkTAAAAADkUe475YBH7WlD3aHPz8iuxugjB">
                -->
                <cfset application.reCaptchaSite = "6LecxB8TAAAAAGWlJMzVT4GmzAdTA4ZE5x6FQ0rq">
		<cfset application.reCaptchaSecret = "6LecxB8TAAAAANkG9eex6mRolvc81QRoMNowpmV4">

		<!--- Date and time format --->
		<cfset application.datetime = Now()>
		<cfset application.date = DateFormat(application.datetime, "mmmm d, yyyy")>
		<cfset application.time = TimeFormat(application.datetime, "h:mmtt")>
		<cfset application.date_dbase = DateFormat(application.datetime, "yyyy-mm-dd")>
		<cfset application.time_dbase = TimeFormat(application.datetime, "hh:mm:ss")>
		<cfset application.timestamp = TimeFormat(application.datetime, "yyyy-mm-dd hh:mm:ss")>

        <!--- Server variables --->
        <cfset application.ipaddress = cgi.remote_host>
        <cfset application.browser = cgi.http_user_agent>
        <cfset application.referer = cgi.http_referer>

		<cfreturn true>
	</cffunction>


	<cffunction name="OnRequestStart" access="public" returntype="boolean" output="false" hint="I perform pre page processing. If I return false, I hault the rest of the page from processing.">

		<!--- Check for initialization. --->
		<cfif StructKeyExists( URL, "reset" )>

			<!--- Reset application and session. --->
			<cfset THIS.OnApplicationStart()>

		</cfif>

		<!--- Return out. --->
		<cfreturn true>
	</cffunction>


	<cffunction name="onMissingTemplate" returnType="boolean" output="false" hint="Checks for missing .cfm files.">
	    <cfargument name="thePage" type="string" required="true">

	    <cflog file="404" text="#arguments.thePage#">
	    <cfif findNoCase("/es/", arguments.thePage)>
	    	<cflocation url="#application.esRoot#404.cfm" addToken="false">
	    <cfelse>
	    	<cflocation url="#application.root#404.cfm" addToken="false">
	    </cfif>
	</cffunction>


	<cffunction name="onError" returnType="void" output="true">
	    <cfargument name="exception" required="true">
	    <cfargument name="eventname" type="string" required="true">
	    <cfset var errortext = "">

	    <cflog file="error" text="#arguments.exception.message#">

	    <cfsavecontent variable="errortext">
		    <cfoutput>
			    An error occurred: http://#cgi.server_name##cgi.script_name#?#cgi.query_string#<br>
			    Time: #dateFormat(now(), "short")# #timeFormat(now(), "short")#<br>

			    <cfdump var="#arguments.exception#" label="Error">
			    <cfdump var="#form#" label="Form">
			    <cfdump var="#url#" label="URL">
		    </cfoutput>
	    </cfsavecontent>

	    <cfmail to="admin@smsmktg.com" from="alerts@smsstudios.com" subject="Vac-U-Max Error: #arguments.exception.message#" type="html">
	        #errortext#
	    </cfmail>
            <cfmail to="kmcowan@cprassoc.com" from="alerts@smsstudios.com" subject="Vac-U-Max Admin Error: #arguments.exception.message#" type="html">
	        #errortext#
	    </cfmail>

		<cfif findNoCase("/es/", cgi.script_name)>
	    	<cflocation url="#application.esRoot#error.cfm" addToken="false">
	    <cfelse>
	    	<cflocation url="#application.root#error.cfm" addToken="false">
		</cfif>

	</cffunction>

</cfcomponent>
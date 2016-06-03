<cfcomponent displayname="formProcessing" hint="Component handles all processing for form input">

	<cffunction name="getReps" access="public" output="no" hint="Method gets rep info based on zip code entered.">
		<cfargument name="zip" default="">
		<cfargument name="section" default="">

		<cfset short = Left(arguments.zip, 3)>

		<cfquery name="getReps" dataSource="#application.datasource#">
			SELECT reps.company, reps.name, reps.email, repsVUM.name as vName, repsVUM.email as vEmail, section
			FROM reps
			LEFT JOIN repZips
			ON reps.id = repZips.rID
			LEFT JOIN repsVUM
			ON repZips.rvID = repsVUM.id
			WHERE z1 <= <cfqueryparam value="#short#" cfsqltype="CF_SQL_VARCHAR">
				AND z2 >= <cfqueryparam value="#short#" cfsqltype="CF_SQL_VARCHAR">
				<cfif arguments.section neq "">AND section = <cfqueryparam value="#arguments.section#" cfsqltype="CF_SQL_VARCHAR"></cfif>
		</cfquery>

		<cfreturn getReps>
	</cffunction>


	<cffunction name="getRepsInt" access="public" output="no" hint="Method gets rep info based on zip code entered.">
		<cfargument name="cou" default="">
		<cfargument name="section" default="">

		<cfquery name="getReps" dataSource="#application.datasource#">
			SELECT reps.company, reps.name, reps.email, repsVUM.name as vName, repsVUM.email as vEmail, repsInt.couID, section
			FROM reps
			LEFT JOIN repsInt
			ON reps.id = repsInt.rID
			LEFT JOIN repsVUM
			ON repsInt.rvID = repsVUM.id
			LEFT JOIN countries
			ON repsInt.couID = countries.id
			WHERE code = <cfqueryparam value="#arguments.cou#" cfsqltype="CF_SQL_VARCHAR">
				<cfif arguments.section neq "">AND section = <cfqueryparam value="#arguments.section#" cfsqltype="CF_SQL_VARCHAR"></cfif>
		</cfquery>

		<cfreturn getReps>
	</cffunction>


	<cffunction name="dbInsert" access="public" output="no" hint="Method inserts the contact info into the db.">
		<cfargument name="form" required="true" default="">
		<cfargument name="formName" required="true" default="">
		<cfargument name="date" required="true" default="">
		<cfargument name="time" required="true" default="">

		<cfset form = arguments.form>
		<cfparam name="form.prod" default="">
		<cfparam name="form.fn" default="">
		<cfparam name="form.ln" default="">
		<cfparam name="form.co" default="">
		<cfparam name="form.ph" default="">
		<cfparam name="form.fax" default="">
		<cfparam name="form.email" default="">
		<cfparam name="form.ad1" default="">
		<cfparam name="form.ad2" default="">
		<cfparam name="form.ci" default="">
		<cfparam name="form.st" default="">
		<cfparam name="form.zip" default="">
		<cfparam name="form.cou" default="">

		<cfquery name="dbInsert" dataSource="#application.datasource#">
			INSERT INTO quotes (submitted, comp, fname, lname, phone, fax, email, address1, address2, city, state, zip, country, form, prod, backup)
			VALUES (
				<cfqueryparam value="#date#" cfsqltype="CF_SQL_VARCHAR">,
				<cfqueryparam value="#Trim(form.co)#" cfsqltype="CF_SQL_VARCHAR">,
				<cfqueryparam value="#Trim(form.fn)#" cfsqltype="CF_SQL_VARCHAR">,
				<cfqueryparam value="#Trim(form.ln)#" cfsqltype="CF_SQL_VARCHAR">,
				<cfqueryparam value="#Trim(form.ph)#" cfsqltype="CF_SQL_VARCHAR">,
				<cfqueryparam value="#Trim(form.fax)#" cfsqltype="CF_SQL_VARCHAR">,
				<cfqueryparam value="#Trim(form.email)#" cfsqltype="CF_SQL_VARCHAR">,
				<cfqueryparam value="#Trim(form.ad1)#" cfsqltype="CF_SQL_VARCHAR">,
				<cfqueryparam value="#Trim(form.ad2)#" cfsqltype="CF_SQL_VARCHAR">,
				<cfqueryparam value="#Trim(form.ci)#" cfsqltype="CF_SQL_VARCHAR">,
				<cfqueryparam value="#Trim(form.st)#" cfsqltype="CF_SQL_VARCHAR">,
				<cfqueryparam value="#Trim(form.zip)#" cfsqltype="CF_SQL_VARCHAR">,
				<cfqueryparam value="#Trim(form.cou)#" cfsqltype="CF_SQL_VARCHAR">,
				<cfqueryparam value="#arguments.formName#" cfsqltype="CF_SQL_VARCHAR">,
				<cfqueryparam value="#form.prod#" cfsqltype="CF_SQL_VARCHAR">,
				<cfqueryparam value="#arguments.date#_#arguments.time#_#Trim(form.ln)#.html" cfsqltype="CF_SQL_VARCHAR">)
		</cfquery>

		<cfreturn>
	</cffunction>


	<cffunction name="rfqBackup" access="public" output="yes" hint="Method creates a CSV backup of the form data.">
		<cfargument name="message" required="true" default="">
		<cfargument name="date" required="true" default="">
		<cfargument name="time" required="true" default="">
		<cfargument name="ln" required="true" default="">

		<cfsavecontent variable="newMess">
			<cfoutput>
				<!DOCTYPE html>
				<html>
				<head>
					<title>BACKUP: #arguments.date# #arguments.time# #arguments.ln#</title>
					<meta charset="utf-8">
				</head>
				<body>
					#arguments.message#
				</body>
				</html>
			</cfoutput>
		</cfsavecontent>
                <!--- cfset arguments.time = "#ReplaceNoCase(arguments.time, ':', '-')#" --->
		<cfset backupFile = "#expandPath('/admin/reports/backups')#/#arguments.date#_#TimeFormat(now(), "HH-mm-ss")#_#arguments.ln#.html">
                <cffile action="write" file="#backupFile#" output="#newMess#">

		<cfreturn>
	</cffunction>


	<cffunction name="process" output="yes" returnType="void" access="public" hint="Method processes and sends the form input.">
		<cfargument name="subject" required="true" type="string" default="">
		<cfargument name="formName" required="true" type="string" default="">
		<cfargument name="form" required="true" type="struct" default="">
		<cfargument name="message" required="true" type="string" default="">
		<cfargument name="to" required="true" type="string" default="">
		<cfargument name="cc" type="string" default="">
		<cfargument name="date" required="true" type="string" default="">
		<cfargument name="time" required="true" type="string" default="">
		<cfargument name="upload" default="">
		<cfargument name="section" default="">

		<cfset form = arguments.form>

		<cfif form.cou eq "US">
			<cfinvoke component="#application.components#.formProcessing"
				method="getReps"
				returnVariable="r">
				<cfinvokeargument name="zip" value="#form.zip#">
				<cfinvokeargument name="section" value="#arguments.section#">
			</cfinvoke>

		<cfelse>

			<cfinvoke component="#application.components#.formProcessing"
				method="getRepsInt"
				returnVariable="r">
				<cfinvokeargument name="cou" value="#form.cou#">
				<cfinvokeargument name="section" value="#arguments.section#">
			</cfinvoke>
		</cfif>

		<cfif r.recordcount gt 0 && arguments.formName neq "General Contact" && form.st neq "ON">
			<cfloop query="r">
				<cfmail to="#r.email#" cc="#r.vEmail#" replyto="#form.email#" from="forms@smsstudios.com" subject="#arguments.subject#" type="text/html">
					#arguments.message#
					<cfif arguments.upload neq ""><cfmailparam file = "#upload#"></cfif>
				</cfmail>
			</cfloop>
                <cfelseif form.st eq "ON" > 
                                <cfmail to="andypizans@vac-u-max.net" bcc="kmcowan@cprassoc.com" replyto="#form.email#" from="forms@smsstudios.com" subject="#arguments.subject#" type="text/html">
					#arguments.message#
					<cfif arguments.upload neq ""><cfmailparam file = "#upload#"></cfif>
				</cfmail>
		</cfif>

		<cfmail to="#arguments.to#" cc="#arguments.cc#" replyto="#form.email#" from="forms@smsstudios.com" subject="#arguments.subject#" type="text/html">
			<cfif r.recordcount gt 0 && arguments.formName neq "General Contact">
				<strong>Also sent to:</strong><br>
				<cfloop query="r">
					VAC-U-MAX Regional Manager: #r.vName#<br>
					#r.company#: #r.name#<br>
					<br>
				</cfloop>
				<br><br>
			</cfif>
			#arguments.message#
			<cfif arguments.upload neq ""><cfmailparam file = "#upload#"></cfif>
		</cfmail>

		<cfinvoke component="#application.components#.formProcessing" method="dbInsert">
			<cfinvokeargument name="form" value="#form#">
			<cfinvokeargument name="formName" value="#arguments.formName#">
			<cfinvokeargument name="date" value="#arguments.date#">
			<cfinvokeargument name="time" value="#arguments.time#">
		</cfinvoke>

		<cfinvoke component="#application.components#.formProcessing" method="rfqBackup">
			<cfinvokeargument name="message" value="#arguments.message#">
			<cfinvokeargument name="date" value="#arguments.date#">
			<cfinvokeargument name="time" value="#arguments.time#">
			<cfinvokeargument name="ln" value="#Trim(form.ln)#">
		</cfinvoke>

		<cfreturn>
	</cffunction>

</cfcomponent>
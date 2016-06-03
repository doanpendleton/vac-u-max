<cfsetting requestTimeout="600">
<cfinclude template="QueryToCSV.cfm">
<cfset today = DateFormat(Now(), 'yyyy-mm-dd')>
<cfset prevFile = "#expandPath('../admin/reports')#/report-#DateFormat(DateAdd('d', -1, Now()), 'yyyy-mm-dd')#.csv">
<cfset mailTo = "sales@vac-u-max.net">
<cfset cc = "doanpendleton@vac-u-max.net">
<cfset subject = "VAC-U-MAX RFQ Batch Report for #DateFormat(today, 'long')#">
<cflog log="scheduler" type="Information" text="VUM Batch Report: task started">

<!--- Delete previous batch file if it exists --->
<cfif FileExists(prevFile)>
	<cffile action="delete" file="#prevFile#">
	<cflog log="scheduler" type="Information" text="VUM Batch Report: old file deleted">
</cfif>

<!--- Check for RFQs submitted today --->
<cfquery name="r" datasource="#application.datasource#">
	SELECT id, submitted, comp, fname, lname, phone, fax, email, address1, address2, city, state, zip, country, form, prod
    FROM quotes
	WHERE submitted = <cfqueryparam value="#today#" cfsqltype="cf_sql_date">
	ORDER BY comp
</cfquery>
<cflog log="scheduler" type="Information" text="VUM Batch Report: data gathered">

<cfif r.recordcount gt 0>
	<!--- Send batch report if there RFQs for today --->
	<cfset batchFile = "#expandPath('../admin/reports')#/report-#today#.csv">
	<cfset batch = QueryToCSV(r, "comp, fname, lname, phone, fax, email, address1, address2, city, state, zip, country, form, prod")>
	<cffile action="write" file="#batchFile#" output="#batch#">
	<cflog log="scheduler" type="Information" text="VUM Batch Report: file created">

	<cfoutput>
		<cfmail to="#mailTo#" cc="#cc#" from="forms@smsstudios.com" subject="#subject#" type="text/html">
			There were <strong>#r.recordcount#</strong> RFQs submitted.
			<cfmailparam file="#batchFile#">
		</cfmail>
	</cfoutput>
	<cflog log="scheduler" type="Information" text="VUM Batch Report: file sent">
<cfelse>
	<!--- Send no RFQs for today message --->
	<cfoutput>
		<cfmail to="#mailTo#" cc="#cc#" from="forms@smsstudios.com" subject="#subject#" type="text/html">
			There were <strong>0</strong> RFQs submitted.
		</cfmail>
	</cfoutput>
	<cflog log="scheduler" type="Information" text="VUM Batch Report: no file message sent">
</cfif>
<cflog log="scheduler" type="Information" text="VUM Batch Report: done">
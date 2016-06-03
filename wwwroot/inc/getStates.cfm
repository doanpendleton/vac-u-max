<cfparam name="form.country" default="">

<cfquery name="getStates" dataSource="#application.datasource#">
	SELECT code, abbr, state
	FROM states
	LEFT JOIN countries
	ON cID = id
	WHERE code = <cfqueryparam value="#form.country#" CFSQLType="cf_sql_varchar">
	ORDER BY state
</cfquery>

<!--- Process the query result and generate xml --->
<cfxml variable="stateXML"> 
<response>
	<cfoutput query="getStates">
    <state>
    	<abbr>#abbr#</abbr>
		<name>#state#</name>
    </state>
	</cfoutput>
	
	<cfif getStates.recordcount gt 0>
		<list>true</list>
	<cfelse>
		<list>false</list>
	</cfif>
</response>
</cfxml>

<cfoutput>#stateXML#</cfoutput>
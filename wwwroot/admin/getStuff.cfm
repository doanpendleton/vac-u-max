<cfparam name="form.section" default="">

<cfswitch expression="#form.section#">
	<!--- Gets user info and sends back XML response --->
	<cfcase value="users">
		<cfparam name="form.user" default="">
		<cfinvoke 
			component="#application.components#.queryController" 
			method="users" 
			returnvariable="users">
			<cfinvokeargument name="user" value="#form.user#">
		</cfinvoke>
		
		<!--- Process the query result and generate xml --->
		<cfxml variable="userXml"> 
		<response> 
		    <cfoutput query="users">
		    <id>#XmlFormat(users.id, "true")#</id>
		    <username>#XmlFormat(users.username, "true")#</username>
		    <password>#XmlFormat(users.password, "true")#</password>
		    <access>#users.access#</access>
		    <accNumber>#XmlFormat(users.accNumber, "true")#</accNumber>
		    <fname>#XmlFormat(users.fname, "true")#</fname>
		    <lname>#XmlFormat(users.lname, "true")#</lname>
		    <cname>#XmlFormat(users.cname, "true")#</cname>
		    <phone>#users.phone#</phone>
		    <fax>#users.fax#</fax>
		    <email>#users.email#</email>
		    <street>#XmlFormat(users.street, "true")#</street>
		    <street2>#XmlFormat(users.street2, "true")#</street2>
		    <city>#XmlFormat(users.city, "true")#</city>
		    <state>#XmlFormat(users.state, "true")#</state>
		    <zip>#users.zip#</zip>
		    <memo>#XmlFormat(users.memo, "true")#</memo>
		    </cfoutput>
		</response>
		</cfxml>
		
		<cfoutput>#userXml#</cfoutput>
	</cfcase>
	
	
	<!--- Gets the subcats for the pneumatic product page ---->
	<cfcase value="subCatsPneu">
		<cfparam name="form.cat" default="">
		<cfparam name="form.prod" default="">
		
		<cfset sel = arrayNew(1)>
		
		<cfloop from="1" to="#listLen(form.cat)#" index="i">
			<!--- Get the subcategories assigned to the selected category --->
			<cfquery name="getSubCats" dataSource="#application.datasource#">
				SELECT s_id, s_title
				FROM prodSubCat
				LEFT JOIN link
				ON s_id = sCatID
				WHERE ownerID = <cfqueryparam value="#listGetAt(form.cat, i)#" CFSQLType="cf_sql_integer">
				ORDER BY l_order
			</cfquery>
			
			<cfif form.prod neq "">
				<cfquery name="selSub" datasource="#application.datasource#">
					SELECT sOwnerID, prodID
				    FROM link
				    WHERE prodID = <cfqueryparam value="#form.prod#" CFSQLType="cf_sql_integer">
				    	AND sOwnerID != 0
				    ORDER BY sOwnerID
				</cfquery>
			</cfif>
			
			<cfloop query="getSubCats">
				<cfset items = "">
				<cfif form.prod neq "">
					<cfloop query="selSub">
						<cfif getSubCats.s_id eq selSub.sOwnerID>
							<cfset items = listAppend(items, '#getSubCats.s_id#,#getSubCats.s_title#,true')>
						<cfelse>
							<cfset items = listAppend(items, '#getSubCats.s_id#,#getSubCats.s_title#,false')>
						</cfif>
					</cfloop>
				<cfelse>
					<cfset items = listAppend(items, '#getSubCats.s_id#,#getSubCats.s_title#,false')>
				</cfif>
				
				<cfset ArrayAppend(sel, items)>
			</cfloop>
		</cfloop>
		
		<!--- Process the query result and generate xml --->
		<cfxml variable="subCatXml"> 
		<response>
			<cfoutput>
		    <cfloop from="1" to="#arrayLen(sel)#" index="j">
		    <subcat>
		    	<id>#listGetAt(sel[j], 1)#</id>
				<title>#listGetAt(sel[j], 2)#</title>
				<selected>#listGetAt(sel[j], 3)#</selected>
		    </subcat>
		    </cfloop>
			</cfoutput>
			
			<cfif arrayLen(sel) gt 0>
				<list>true</list>
			<cfelse>
				<list>false</list>
			</cfif>
		</response>
		</cfxml>
		
		<cfoutput>#subCatXml#</cfoutput>
	</cfcase>
	
	
	<!--- Gets the subcats for the vacuum product page ---->
	<cfcase value="subCatsVac">
		<cfparam name="form.cat" default="">
		<cfparam name="form.prod" default="">
		
		<cfset sel = arrayNew(1)>
		
		<cfloop from="1" to="#listLen(form.cat)#" index="i">
			<!--- Get the subcategories assigned to the selected category --->
			<cfquery name="getSubCats" dataSource="#application.datasource#">
				SELECT s_id, s_title
				FROM prodSubCat
				LEFT JOIN link
				ON s_id = sCatID
				WHERE ownerID = <cfqueryparam value="#listGetAt(form.cat, i)#" CFSQLType="cf_sql_integer">
				ORDER BY l_order
			</cfquery>
			
			<cfif form.prod neq "">
				<cfquery name="selSub" datasource="#application.datasource#">
					SELECT sOwnerID, vacID
				    FROM link
				    WHERE vacID = <cfqueryparam value="#form.prod#" CFSQLType="cf_sql_integer">
				    	AND sOwnerID != 0
				    ORDER BY sOwnerID
				</cfquery>
			</cfif>
			
			<cfloop query="getSubCats">
				<cfset items = "">
				<cfif form.prod neq "">
					<cfloop query="selSub">
						<cfif getSubCats.s_id eq selSub.sOwnerID>
							<cfset items = listAppend(items, '#getSubCats.s_id#,#getSubCats.s_title#,true')>
						<cfelse>
							<cfset items = listAppend(items, '#getSubCats.s_id#,#getSubCats.s_title#,false')>
						</cfif>
					</cfloop>
				<cfelse>
					<cfset items = listAppend(items, '#getSubCats.s_id#,#getSubCats.s_title#,false')>
				</cfif>
				
				<cfset ArrayAppend(sel, items)>
			</cfloop>
		</cfloop>
		
		<!--- Process the query result and generate xml --->
		<cfxml variable="subCatXml"> 
		<response>
			<cfoutput>
		    <cfloop from="1" to="#arrayLen(sel)#" index="j">
		    <subcat>
		    	<id>#listGetAt(sel[j], 1)#</id>
				<title>#listGetAt(sel[j], 2)#</title>
				<selected>#listGetAt(sel[j], 3)#</selected>
		    </subcat>
		    </cfloop>
			</cfoutput>
			
			<cfif arrayLen(sel) gt 0>
				<list>true</list>
			<cfelse>
				<list>false</list>
			</cfif>
		</response>
		</cfxml>
		
		<cfoutput>#subCatXml#</cfoutput>
	</cfcase>
	
	
	<!--- Gets the subcats for the accessories page ---->
	<cfcase value="subCatsAcc">
		<cfparam name="form.cat" default="">
		<cfparam name="form.acc" default="">
		
		<cfset sel = arrayNew(1)>
		
		<cfloop from="1" to="#listLen(form.cat)#" index="i">
			<!--- Get the subcategories assigned to the selected category --->
			<cfquery name="getSubCats" dataSource="#application.datasource#">
				SELECT s_id, s_title
				FROM prodSubCat
				LEFT JOIN link
				ON s_id = sCatID
				WHERE ownerID = <cfqueryparam value="#listGetAt(form.cat, i)#" CFSQLType="cf_sql_integer">
				ORDER BY l_order
			</cfquery>
			
			<cfif form.acc neq "">
				<cfquery name="selSub" datasource="#application.datasource#">
					SELECT sOwnerID, accID
				    FROM link
				    WHERE accID = <cfqueryparam value="#form.acc#" CFSQLType="cf_sql_integer">
				    	AND sOwnerID != 0
				    ORDER BY sOwnerID
				</cfquery>
			</cfif>
			
			<cfloop query="getSubCats">
				<cfset items = "">
				<cfif form.acc neq "">
					<cfloop query="selSub">
						<cfif getSubCats.s_id eq selSub.sOwnerID>
							<cfset items = listAppend(items, '#getSubCats.s_id#,#getSubCats.s_title#,true')>
						<cfelse>
							<cfset items = listAppend(items, '#getSubCats.s_id#,#getSubCats.s_title#,false')>
						</cfif>
					</cfloop>
				<cfelse>
					<cfset items = listAppend(items, '#getSubCats.s_id#,#getSubCats.s_title#,false')>
				</cfif>
				
				<cfset ArrayAppend(sel, items)>
			</cfloop>
		</cfloop>
		
		<!--- Process the query result and generate xml --->
		<cfxml variable="subCatXml"> 
		<response>
			<cfoutput>
		    <cfloop from="1" to="#arrayLen(sel)#" index="j">
		    <subcat>
		    	<id>#listGetAt(sel[j], 1)#</id>
				<title>#listGetAt(sel[j], 2)#</title>
				<selected>#listGetAt(sel[j], 3)#</selected>
		    </subcat>
		    </cfloop>
			</cfoutput>
			
			<cfif arrayLen(sel) gt 0>
				<list>true</list>
			<cfelse>
				<list>false</list>
			</cfif>
		</response>
		</cfxml>
		
		<cfoutput>#subCatXml#</cfoutput>
	</cfcase>
</cfswitch>
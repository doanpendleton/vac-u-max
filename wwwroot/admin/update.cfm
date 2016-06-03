<cfparam name="form.section" default="">

<cfswitch expression="#form.section#">
	<!--- Update the order and status of categories --->
	<!--- Pneumatic --->
	<cfcase value="cat">
		<!--- Update the active categories --->
		<cfloop from="1" to="#listLen(form.act, '&')#" index="i">
			<cfset actID = listGetAt(form.act, i, '&')>
			<cfset actID = RemoveChars(actID, 1, 4)>
			
			<cfif len(actID)>
				<cfquery name="updateCatOrder" dataSource="#application.datasource#">
					UPDATE link
					SET l_order = <cfqueryparam value="#i#" CFSQLType="cf_sql_integer">,
						l_switch = <cfqueryparam value="1" CFSQLType="cf_sql_integer">
					WHERE ownerID = <cfqueryparam value="1" CFSQLType="cf_sql_integer">
						AND catID = <cfqueryparam value="#actID#" CFSQLType="cf_sql_integer">
				</cfquery>
			</cfif>
		</cfloop>
		
		<!--- Update the inactive categories --->
		<cfloop from="1" to="#listLen(form.in, '&')#" index="j">
			<cfset inID = listGetAt(form.in, j, '&')>
			<cfset inID = RemoveChars(inID, 1, 3)>
			
			<cfif len(inID)>
				<cfquery name="updateCatOrder" dataSource="#application.datasource#">
					UPDATE link
					SET l_order = <cfqueryparam value="#j#" CFSQLType="cf_sql_integer">,
						l_switch = <cfqueryparam value="0" CFSQLType="cf_sql_integer">
					WHERE ownerID = <cfqueryparam value="1" CFSQLType="cf_sql_integer">
						AND catID = <cfqueryparam value="#inID#" CFSQLType="cf_sql_integer">
				</cfquery>
			</cfif>
		</cfloop>
		
		<cfoutput><p class="success">Changes saved!</p></cfoutput>
	</cfcase>
	
	<!--- Vacuum --->
	<cfcase value="vacCat">
		<!--- Update the active categories --->
		<cfloop from="1" to="#listLen(form.act, '&')#" index="i">
			<cfset actID = listGetAt(form.act, i, '&')>
			<cfset actID = RemoveChars(actID, 1, 4)>
			
			<cfif len(actID)>
				<cfquery name="updateCatOrder" dataSource="#application.datasource#">
					UPDATE link
					SET l_order = <cfqueryparam value="#i#" CFSQLType="cf_sql_integer">,
						l_switch = <cfqueryparam value="1" CFSQLType="cf_sql_integer">
					WHERE ownerID = <cfqueryparam value="2" CFSQLType="cf_sql_integer">
						AND catID = <cfqueryparam value="#actID#" CFSQLType="cf_sql_integer">
				</cfquery>
			</cfif>
		</cfloop>
		
		<!--- Update the inactive categories --->
		<cfloop from="1" to="#listLen(form.in, '&')#" index="j">
			<cfset inID = listGetAt(form.in, j, '&')>
			<cfset inID = RemoveChars(inID, 1, 3)>
			
			<cfif len(inID)>
				<cfquery name="updateCatOrder" dataSource="#application.datasource#">
					UPDATE link
					SET l_order = <cfqueryparam value="#j#" CFSQLType="cf_sql_integer">,
						l_switch = <cfqueryparam value="0" CFSQLType="cf_sql_integer">
					WHERE ownerID = <cfqueryparam value="2" CFSQLType="cf_sql_integer">
						AND catID = <cfqueryparam value="#inID#" CFSQLType="cf_sql_integer">
				</cfquery>
			</cfif>
		</cfloop>
		
		<cfoutput><p class="success">Changes saved!</p></cfoutput>
	</cfcase>
	
	
	<!--- Update the order and status of subcategories --->
	<!--- Pneumatic --->
	<cfcase value="subCat">
		<!--- Update the active subcategories --->
		<cfloop from="1" to="#listLen(form.catList)#" index="a">
			<cfset newAct = evaluate("form.act" & a)>
			<cfset remove = len(listGetAt(form.catList, a))+1>
			
			<cfloop from="1" to="#listLen(newAct, '&')#" index="i">
				<cfset actID = listGetAt(newAct, i, '&')>
				<cfset actID = RemoveChars(actID, 1, remove)>
				
				<cfif len(actID)>
					<cfquery name="updateSubCatOrder" dataSource="#application.datasource#">
						UPDATE link
						SET l_order = <cfqueryparam value="#i#" CFSQLType="cf_sql_integer">,
							l_switch = <cfqueryparam value="1" CFSQLType="cf_sql_integer">
						WHERE ownerID = <cfqueryparam value="#listGetAt(form.catList, a)#" CFSQLType="cf_sql_integer">
							AND sCatID = <cfqueryparam value="#actID#" CFSQLType="cf_sql_integer">
					</cfquery>
				</cfif>
			</cfloop>
		</cfloop>
		
		<!--- Update the inactive subcategories --->
		<cfloop from="1" to="#listLen(form.catList)#" index="b">
			<cfset newIn = evaluate("form.in" & b)>
			<cfset remove = len(listGetAt(form.catList, b))+1>
			
			<cfloop from="1" to="#listLen(newIn, '&')#" index="j">
				<cfset inID = listGetAt(newIn, j, '&')>
				<cfset inID = RemoveChars(inID, 1, remove)>
				
				<cfif len(inID)>
					<cfquery name="updateSubCatOrder" dataSource="#application.datasource#">
						UPDATE link
						SET l_order = <cfqueryparam value="#j#" CFSQLType="cf_sql_integer">,
							l_switch = <cfqueryparam value="0" CFSQLType="cf_sql_integer">
						WHERE ownerID = <cfqueryparam value="#listGetAt(form.catList, b)#" CFSQLType="cf_sql_integer">
							AND sCatID = <cfqueryparam value="#inID#" CFSQLType="cf_sql_integer">
					</cfquery>
				</cfif>
			</cfloop>
		</cfloop>
		
		<cfoutput><p class="success">Changes saved!</p></cfoutput>
	</cfcase>
	
	<!--- Vacuum --->
	<cfcase value="vacSubCat">
		<!--- Update the active subcategories --->
		<cfloop from="1" to="#listLen(form.catList)#" index="a">
			<cfset newAct = evaluate("form.act" & a)>
			<cfset remove = len(listGetAt(form.catList, a))+1>
			
			<cfloop from="1" to="#listLen(newAct, '&')#" index="i">
				<cfset actID = listGetAt(newAct, i, '&')>
				<cfset actID = RemoveChars(actID, 1, remove)>
				
				<cfif len(actID)>
					<cfquery name="updateSubCatOrder" dataSource="#application.datasource#">
						UPDATE link
						SET l_order = <cfqueryparam value="#i#" CFSQLType="cf_sql_integer">,
							l_switch = <cfqueryparam value="1" CFSQLType="cf_sql_integer">
						WHERE ownerID = <cfqueryparam value="#listGetAt(form.catList, a)#" CFSQLType="cf_sql_integer">
							AND sCatID = <cfqueryparam value="#actID#" CFSQLType="cf_sql_integer">
					</cfquery>
				</cfif>
			</cfloop>
		</cfloop>
		
		<!--- Update the inactive subcategories --->
		<cfloop from="1" to="#listLen(form.catList)#" index="b">
			<cfset newIn = evaluate("form.in" & b)>
			<cfset remove = len(listGetAt(form.catList, b))+1>
			
			<cfloop from="1" to="#listLen(newIn, '&')#" index="j">
				<cfset inID = listGetAt(newIn, j, '&')>
				<cfset inID = RemoveChars(inID, 1, remove)>
				
				<cfif len(inID)>
					<cfquery name="updateSubCatOrder" dataSource="#application.datasource#">
						UPDATE link
						SET l_order = <cfqueryparam value="#j#" CFSQLType="cf_sql_integer">,
							l_switch = <cfqueryparam value="0" CFSQLType="cf_sql_integer">
						WHERE ownerID = <cfqueryparam value="#listGetAt(form.catList, b)#" CFSQLType="cf_sql_integer">
							AND sCatID = <cfqueryparam value="#inID#" CFSQLType="cf_sql_integer">
					</cfquery>
				</cfif>
			</cfloop>
		</cfloop>
		
		<cfoutput><p class="success">Changes saved!</p></cfoutput>
	</cfcase>
	
	
	<!--- Update the status of products --->
	<!--- Pneumatic --->
	<cfcase value="pneu">
		<!--- Update the active products --->
		<cfloop from="1" to="#listLen(form.act, '&')#" index="i">
			<cfset actID = listGetAt(form.act, i, '&')>
			<cfset actID = RemoveChars(actID, 1, 4)>
			
			<cfif len(actID)>
				<cfquery name="updateProdStatus" dataSource="#application.datasource#">
					UPDATE products
					SET p_switch = <cfqueryparam value="1" CFSQLType="cf_sql_integer">
					WHERE id = <cfqueryparam value="#actID#" CFSQLType="cf_sql_integer">
				</cfquery>
			</cfif>
		</cfloop>
		
		<!--- Update the inactive products --->
		<cfloop from="1" to="#listLen(form.in, '&')#" index="j">
			<cfset inID = listGetAt(form.in, j, '&')>
			<cfset inID = RemoveChars(inID, 1, 3)>
			
			<cfif len(inID)>
				<cfquery name="updateProdStatus" dataSource="#application.datasource#">
					UPDATE products
					SET p_switch = <cfqueryparam value="0" CFSQLType="cf_sql_integer">
					WHERE id = <cfqueryparam value="#inID#" CFSQLType="cf_sql_integer">
				</cfquery>
			</cfif>
		</cfloop>
		
		<cfoutput><p class="success">Changes saved!</p></cfoutput>
	</cfcase>
	
	<!--- Vacuum --->
	<cfcase value="vac">
		<!--- Update the active products --->
		<cfloop from="1" to="#listLen(form.act, '&')#" index="i">
			<cfset actID = listGetAt(form.act, i, '&')>
			<cfset actID = RemoveChars(actID, 1, 4)>
			
			<cfif len(actID)>
				<cfquery name="updateProdStatus" dataSource="#application.datasource#">
					UPDATE vacuum
					SET v_switch = <cfqueryparam value="1" CFSQLType="cf_sql_integer">
					WHERE v_id = <cfqueryparam value="#actID#" CFSQLType="cf_sql_integer">
				</cfquery>
			</cfif>
		</cfloop>
		
		<!--- Update the inactive products --->
		<cfloop from="1" to="#listLen(form.in, '&')#" index="j">
			<cfset inID = listGetAt(form.in, j, '&')>
			<cfset inID = RemoveChars(inID, 1, 3)>
			
			<cfif len(inID)>
				<cfquery name="updateProdStatus" dataSource="#application.datasource#">
					UPDATE vacuum
					SET v_switch = <cfqueryparam value="0" CFSQLType="cf_sql_integer">
					WHERE v_id = <cfqueryparam value="#inID#" CFSQLType="cf_sql_integer">
				</cfquery>
			</cfif>
		</cfloop>
		
		<cfoutput><p class="success">Changes saved!</p></cfoutput>
	</cfcase>
	
	
	<!--- Update the status of accessories --->
	<cfcase value="acc">
		<!--- Update the active accessories --->
		<cfloop from="1" to="#listLen(form.act, '&')#" index="i">
			<cfset actID = listGetAt(form.act, i, '&')>
			<cfset actID = RemoveChars(actID, 1, 4)>
			
			<cfif len(actID)>
				<cfquery name="updateProdStatus" dataSource="#application.datasource#">
					UPDATE accessories
					SET a_switch = <cfqueryparam value="1" CFSQLType="cf_sql_integer">
					WHERE a_id = <cfqueryparam value="#actID#" CFSQLType="cf_sql_integer">
				</cfquery>
			</cfif>
		</cfloop>
		
		<!--- Update the inactive accessories --->
		<cfloop from="1" to="#listLen(form.in, '&')#" index="j">
			<cfset inID = listGetAt(form.in, j, '&')>
			<cfset inID = RemoveChars(inID, 1, 3)>
			
			<cfif len(inID)>
				<cfquery name="updateProdStatus" dataSource="#application.datasource#">
					UPDATE accessories
					SET a_switch = <cfqueryparam value="0" CFSQLType="cf_sql_integer">
					WHERE a_id = <cfqueryparam value="#inID#" CFSQLType="cf_sql_integer">
				</cfquery>
			</cfif>
		</cfloop>
		
		<cfoutput><p class="success">Changes saved!</p></cfoutput>
	</cfcase>
	
	
	<!--- Update the order and status of case studies --->
	<cfcase value="case">
		<cfinvoke 
			component="#application.components#.queryController" 
			method="adminCases" 
			returnvariable="cases">
			<cfinvokeargument name="case" value="#form.cases#">
		</cfinvoke>
		
		<cfloop query="cases">
			<cfif cases.c_featured eq 1>
				<cfquery name="caseUpdate" dataSource="#application.datasource#">
					UPDATE cases
					SET c_featured = <cfqueryparam value="0" CFSQLType="cf_sql_integer">
					WHERE c_id = <cfqueryparam value="#form.cases#" CFSQLType="cf_sql_integer">
				</cfquery>
				
				<cfoutput>false</cfoutput>
			<cfelse>
				<cfquery name="caseUpdate" dataSource="#application.datasource#">
					UPDATE cases
					SET c_featured = <cfqueryparam value="1" CFSQLType="cf_sql_integer">
					WHERE c_id = <cfqueryparam value="#form.cases#" CFSQLType="cf_sql_integer">
				</cfquery>
				
				<cfoutput>true</cfoutput>
			</cfif>
		</cfloop>
	</cfcase>
</cfswitch>
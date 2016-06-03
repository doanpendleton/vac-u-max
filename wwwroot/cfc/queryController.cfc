<cfcomponent displayname="queryController" hint="Component handles all database queries">

	<cfinclude template="../inc/QueryToCSV.cfm">

	<cffunction name="queryAppend" access="public" returntype="void" output="false" hint="This takes two queries and appends the second one to the first one. This actually updates the first query and does not return anything.">

	    <!--- Define arguments. --->
	    <cfargument name="queryOne" type="query" required="true">
	    <cfargument name="queryTwo" type="query" required="true">

	    <!--- Define the local scope. --->
	    <cfset var LOCAL = StructNew()>

	    <!--- Get the column list (as an array for faster access. --->
	    <cfset LOCAL.Columns = ListToArray( ARGUMENTS.QueryTwo.ColumnList )>

	    <!--- Loop over the second query. --->
	    <cfloop query="ARGUMENTS.QueryTwo">
		    <!--- Add a row to the first query. --->
		    <cfset QueryAddRow( ARGUMENTS.QueryOne )>

		    <!--- Loop over the columns. --->
		    <cfloop index="LOCAL.Column" from="1" to="#ArrayLen( LOCAL.Columns )#" step="1">
		    	<!--- Get the column name for easy access. --->
				<cfset LOCAL.ColumnName = LOCAL.Columns[ LOCAL.Column ]>

				<!--- Set the column value in the newly created row. --->
				<cfset ARGUMENTS.QueryOne[ LOCAL.ColumnName ][ ARGUMENTS.QueryOne.RecordCount ] = ARGUMENTS.QueryTwo[ LOCAL.ColumnName ][ ARGUMENTS.QueryTwo.CurrentRow ]>
		    </cfloop>
	    </cfloop>

	    <!--- Return out. --->
	    <cfreturn>
    </cffunction>


    <cffunction name="countryList" output="false" access="public" returnType="any">
		<cfquery name="countryList" dataSource="#application.datasource#">
			SELECT id, code, country
			FROM countries
			ORDER BY country
		</cfquery>

		<cfreturn countryList>
	</cffunction>


	<!--- Main Nav --->
	<cffunction name="prodNav" output="no" access="public" returntype="query" hint="Method returns the product categories">
		<cfargument name="spanish" default="false">

    	<cfquery name="prodNav" datasource="#application.datasource#">
        	SELECT l_id, ownerID, catID, sOwnerID, sCatID, l_order, l_switch, c_id, c_title, c_url, c_direct
            FROM link
            LEFT JOIN <cfif arguments.spanish>sp_</cfif>prodCat
            ON catID = c_id
            WHERE l_switch = <cfqueryparam value="1" cfsqltype="cf_sql_integer">
			ORDER BY ownerID, l_order
        </cfquery>

        <cfreturn prodNav>
    </cffunction>


    <!--- Side Nav --->
    <cffunction name="sideNav" output="no" access="public" returntype="query" hint="Method retrieves the side nav">
    	<cfargument name="selectCat" default="">
		<cfargument name="spanish" default="false">

        <cfquery name="sideNav" datasource="#application.datasource#">
        	SELECT a.l_id, a.ownerID, a.catID, a.sCatID, a.l_order, c_id, c_title, c_url, c_direct,
        		b.l_id, b.ownerID, b.catID, b.sCatID, b.l_order, b.l_switch as s_switch, s_id, s_title, s_url, s_direct
        	FROM link a
        	LEFT JOIN <cfif arguments.spanish>sp_</cfif>prodCat
        	ON a.catID = c_id
        	LEFT JOIN link b
        	ON c_id = b.ownerID
        	LEFT JOIN <cfif arguments.spanish>sp_</cfif>prodSubCat
        	ON b.sCatID = s_id
        	WHERE a.ownerID = <cfqueryparam value="1" CFSQLType="cf_sql_integer">
        		AND a.l_switch = <cfqueryparam value="1" CFSQLType="cf_sql_integer">
        	ORDER BY a.ownerID, a.l_order, b.ownerID, b.l_order
        </cfquery>

        <cfreturn sideNav>
    </cffunction>

    <cffunction name="sideVac" output="no" access="public" returntype="query" hint="Method retrieves the vacuum section side nav">
    	<cfargument name="selectCat" default="">
		<cfargument name="spanish" default="false">

        <cfquery name="sideVac" datasource="#application.datasource#">
        	SELECT a.l_id, a.ownerID, a.catID, a.sCatID, a.l_order, c_id, c_title, c_url,
        		b.l_id, b.ownerID, b.catID, b.sCatID, b.l_order, b.l_switch as s_switch, s_id, s_title, s_url
        	FROM link a
        	LEFT JOIN <cfif arguments.spanish>sp_</cfif>prodCat
        	ON a.catID = c_id
        	LEFT JOIN link b
        	ON c_id = b.ownerID
        	LEFT JOIN <cfif arguments.spanish>sp_</cfif>prodSubCat
        	ON b.sCatID = s_id
        	WHERE a.ownerID = <cfqueryparam value="2" CFSQLType="cf_sql_integer">
        		AND a.l_switch = <cfqueryparam value="1" CFSQLType="cf_sql_integer">
        	ORDER BY a.ownerID, a.l_order, b.ownerID, b.l_order
        </cfquery>

        <cfreturn sideVac>
    </cffunction>


    <!--- Landing Page --->
    <cffunction name="vacLanding" output="no" access="public" returntype="query" hint="Method retrieves a list of selected sub categories for the landing page.">
		<cfargument name="spanish" default="false">

    	<cfquery name="vacOver" datasource="#application.datasource#">
        	SELECT vl_id, pc_id, psc_id, vl_img, vl_sort, vl_switch, c_id, c_title, c_url, s_id, s_title, s_url
            FROM vacLanding
            LEFT JOIN <cfif arguments.spanish>sp_</cfif>prodCat
            ON pc_id = c_id
            LEFT JOIN <cfif arguments.spanish>sp_</cfif>prodSubCat
            ON psc_id = s_id
            WHERE vl_switch = <cfqueryparam value="1" cfsqltype="cf_sql_integer">
			ORDER BY vl_sort
        </cfquery>

        <cfreturn vacOver>
    </cffunction>


    <!--- Overview Page --->
    <cffunction name="over" output="no" access="public" returntype="query" hint="Method retrieves a list of selected category and all products">
    	<cfargument name="selectCat" default="">
    	<cfargument name="selectSubCat" default="">
		<cfargument name="spanish" default="false">

        <cfif arguments.selectCat neq "">
	        <cfquery name="over" datasource="#application.datasource#">
	        	SELECT l_id, ownerID, catID, prodID, l_order, l_switch, c_id, c_title, c_url, c_desc, c_meta, c_header,
	            	id, p_title, p_url, p_subTitle, p_desc, p_descShort, p_switch
	            FROM <cfif arguments.spanish>sp_</cfif>prodCat
	            LEFT JOIN link
	            ON c_id = ownerID
	            LEFT JOIN <cfif arguments.spanish>sp_</cfif>products
	            ON prodID = id
	            LEFT JOIN <cfif arguments.spanish>sp_</cfif>images
	            ON id = p_id
	            WHERE c_url = <cfqueryparam value="#arguments.selectCat#" cfsqltype="cf_sql_varchar">
	            	AND p_switch = <cfqueryparam value="1" cfsqltype="cf_sql_integer">
				GROUP BY p_title
				ORDER BY ownerID, l_order
	        </cfquery>
	    <cfelse>
	    	<cfquery name="over" datasource="#application.datasource#">
	        	SELECT l_id, sOwnerID, sCatID, prodID, l_order, l_switch, s_id as c_id, s_title as c_title, s_url as c_url, s_desc as c_desc, s_meta as c_meta, s_header as c_header,
	            	id, p_title, p_url, p_subTitle, p_desc, p_descShort, p_switch
	            FROM <cfif arguments.spanish>sp_</cfif>prodSubCat
	            LEFT JOIN link
	            ON s_id = sOwnerID
	            LEFT JOIN <cfif arguments.spanish>sp_</cfif>products
	            ON prodID = id
	            LEFT JOIN <cfif arguments.spanish>sp_</cfif>images
	            ON id = p_id
	            WHERE s_url = <cfqueryparam value="#arguments.selectSubCat#" cfsqltype="cf_sql_varchar">
	            	AND p_switch = <cfqueryparam value="1" cfsqltype="cf_sql_integer">
	            GROUP BY p_title
				ORDER BY sOwnerID, l_order
	        </cfquery>
	    </cfif>

        <cfreturn over>
    </cffunction>

    <cffunction name="overImg" output="no" access="public" returntype="query" hint="Method returns the selected product images for the overview page">
    	<cfargument name="selectImg" default="">
		<cfargument name="spanish" default="false">

        <cfquery name="img" datasource="#application.datasource#">
        	SELECT p_id, i_diagram, i_file, i_alt, i_order, i_switch
            FROM <cfif arguments.spanish>sp_</cfif>images
            WHERE p_id = <cfqueryparam value="#arguments.selectImg#" cfsqltype="cf_sql_integer">
            	AND i_switch = <cfqueryparam value="1" CFSQLType="cf_sql_integer">
            ORDER BY i_diagram, i_order asc
            LIMIT 1
        </cfquery>

        <cfreturn img>
    </cffunction>

    <cffunction name="vacOver" output="no" access="public" returntype="query" hint="Method retrieves a list of selected sub category and all products">
    	<cfargument name="selectCat" default="">
    	<cfargument name="selectSubCat" default="">
		<cfargument name="spanish" default="false">

        <cfif arguments.selectCat neq "">
	        <cfquery name="vacOver" datasource="#application.datasource#">
	        	SELECT l_id, ownerID, catID, vacID, accID, l_order, l_switch, c_id, c_title, c_desc, c_url, c_meta, c_header,
	            	v_id, v_title, v_item, v_desc, v_descShort, v_stan, v_tech, v_desc2, v_imgFile, v_switch
	            FROM <cfif arguments.spanish>sp_</cfif>prodCat
	            LEFT JOIN link
	            ON c_id = ownerID
	            LEFT JOIN <cfif arguments.spanish>sp_</cfif>vacuum
	            ON vacID = v_id
	            WHERE c_url = <cfqueryparam value="#arguments.selectCat#" cfsqltype="cf_sql_varchar">
	            	AND v_switch = <cfqueryparam value="1" cfsqltype="cf_sql_integer">
				ORDER BY ownerID, l_order
	        </cfquery>

	        <cfquery name="vacAccOver" datasource="#application.datasource#">
				SELECT l_id, ownerID, catID, vacID, accID, l_order, l_switch, c_id, c_title, c_url, c_desc, c_meta, c_header,
					a_id as v_id, a_item as v_item, a_title as v_title, a_desc as v_desc, a_descShort as v_descShort, a_imgFile as v_imgFile, a_switch as v_switch
			    FROM <cfif arguments.spanish>sp_</cfif>prodCat
			    LEFT JOIN link
			    ON c_id = ownerID
			    LEFT JOIN <cfif arguments.spanish>sp_</cfif>accessories
			    ON accID = a_id
			    WHERE c_url = <cfqueryparam value="#arguments.selectCat#" cfsqltype="cf_sql_varchar">
			    	AND a_switch = <cfqueryparam value="1" cfsqltype="cf_sql_integer">
				ORDER BY ownerID, l_order
			</cfquery>

	        <cfinvoke
				component="#application.components#.queryController"
				method="queryAppend">
				<cfinvokeargument name="queryOne" value="#vacOver#">
				<cfinvokeargument name="queryTwo" value="#vacAccOver#">
			</cfinvoke>
	    <cfelse>
	    	<cfquery name="vacOver" datasource="#application.datasource#">
	        	SELECT l_id, sOwnerID, sCatID, vacID, accID, l_order, l_switch, s_id as c_id, s_title as c_title, s_url as c_url, s_desc as c_desc, s_meta as c_meta, s_header as c_header,
	            	v_id, v_title, v_item, v_desc, v_descShort, v_stan, v_tech, v_desc2, v_imgFile, v_switch
	            FROM <cfif arguments.spanish>sp_</cfif>prodSubCat
	            LEFT JOIN link
	            ON s_id = sOwnerID
	            LEFT JOIN <cfif arguments.spanish>sp_</cfif>vacuum
	            ON vacID = v_id
	            WHERE s_url = <cfqueryparam value="#arguments.selectSubCat#" cfsqltype="cf_sql_varchar">
	            	AND v_switch = <cfqueryparam value="1" cfsqltype="cf_sql_integer">
				ORDER BY sOwnerID, l_order
	        </cfquery>

	        <cfquery name="vacAccOver" datasource="#application.datasource#">
				SELECT l_id, sOwnerID, sCatID, vacID, accID, l_order, l_switch, s_id as c_id, s_title as c_title, s_url as c_url, s_desc as c_desc, s_meta as c_meta, s_header as c_header,
					a_id as v_id, a_item as v_item, a_title as v_title, a_desc as v_desc, a_descShort as  v_descShort, a_imgFile as v_imgFile, a_switch as v_switch
			    FROM <cfif arguments.spanish>sp_</cfif>prodSubCat
			    LEFT JOIN link
			    ON s_id = sOwnerID
			    LEFT JOIN <cfif arguments.spanish>sp_</cfif>accessories
			    ON accID = a_id
			    WHERE s_url = <cfqueryparam value="#arguments.selectSubCat#" cfsqltype="cf_sql_varchar">
			    	AND a_switch = <cfqueryparam value="1" cfsqltype="cf_sql_integer">
				ORDER BY ownerID, l_order
			</cfquery>

	        <cfinvoke
				component="#application.components#.queryController"
				method="queryAppend">
				<cfinvokeargument name="queryOne" value="#vacOver#">
				<cfinvokeargument name="queryTwo" value="#vacAccOver#">
			</cfinvoke>
	    </cfif>

        <cfreturn vacOver>
    </cffunction>


    <!--- Product Page --->
    <cffunction name="prod" output="no" access="public" returntype="query" hint="Method returns the selected product">
    	<cfargument name="selectCat" default="">
    	<cfargument name="selectSubCat" default="">
    	<cfargument name="selectProd" default="">
		<cfargument name="spanish" default="false">

        <cfif arguments.selectCat neq "">
	        <cfquery name="prod" datasource="#application.datasource#">
	        	SELECT l_id, ownerID, catID, prodID, l_switch, c_id, c_title, c_url, c_header,
	        		id, p_title, p_url, p_subTitle, p_desc, p_feat, p_specs, p_meta
	            FROM <cfif arguments.spanish>sp_</cfif>products
	            LEFT JOIN link
	            ON id = prodID
	            LEFT JOIN <cfif arguments.spanish>sp_</cfif>prodCat
	            ON ownerID = c_id
	            WHERE p_url = <cfqueryparam value="#arguments.selectProd#" cfsqltype="cf_sql_varchar">
	            	AND c_url = <cfqueryparam value="#arguments.selectCat#" cfsqltype="cf_sql_varchar">
	            GROUP BY c_title
	        </cfquery>
        <cfelse>
        	<cfquery name="prod" datasource="#application.datasource#">
	        	SELECT l_id, sOwnerID, sCatID, prodID, l_switch, s_id as c_id, s_title as c_title, s_url as c_url, s_header as c_header,
	        		id, p_title, p_url, p_subTitle, p_desc, p_feat, p_specs, p_meta
	            FROM <cfif arguments.spanish>sp_</cfif>products
	            LEFT JOIN link
	            ON id = prodID
	            LEFT JOIN <cfif arguments.spanish>sp_</cfif>prodSubCat
	            ON sOwnerID = s_id
	            WHERE p_url = <cfqueryparam value="#arguments.selectProd#" cfsqltype="cf_sql_varchar">
	            	AND s_url = <cfqueryparam value="#arguments.selectSubCat#" cfsqltype="cf_sql_varchar">
	            GROUP BY s_title
	        </cfquery>
        </cfif>

        <cfreturn prod>
    </cffunction>

    <cffunction name="prodImg" output="no" access="public" returntype="query" hint="Method returns the selected product images">
    	<cfargument name="selectImg" default="">
		<cfargument name="spanish" default="false">

        <cfquery name="img" datasource="#application.datasource#">
        	SELECT i_id, p_id, i_diagram, i_file, i_alt, i_cap, i_order, i_switch
            FROM <cfif arguments.spanish>sp_</cfif>images
            WHERE p_id = <cfqueryparam value="#arguments.selectImg#" cfsqltype="cf_sql_integer">
            	AND i_switch = <cfqueryparam value="1" CFSQLType="cf_sql_integer">
            ORDER BY i_diagram, i_order asc
        </cfquery>

        <cfreturn img>
    </cffunction>


    <!--- Vacuum Product Page --->
    <cffunction name="vac" output="no" access="public" returntype="query" hint="Method returns the selected vacuum product">
    	<cfargument name="selectCat" default="">
		<cfargument name="selectSubCat" default="">
    	<cfargument name="selectProd" default="">
		<cfargument name="spanish" default="false">

        <cfif arguments.selectCat neq "">
	        <cfquery name="vac" datasource="#application.datasource#">
	        	SELECT l_id, ownerID, catID, vacID, accID, c_id, c_title, c_url, c_header,
	        		v_id, v_title, v_item, v_desc, v_descShort, v_stan, v_tech, v_desc2, v_imgFile, v_meta
	            FROM <cfif arguments.spanish>sp_</cfif>vacuum
	            LEFT JOIN link
	            ON v_id = vacID
	            LEFT JOIN <cfif arguments.spanish>sp_</cfif>prodCat
	            ON ownerID = c_id
	            WHERE v_item = <cfqueryparam value="#arguments.selectProd#" cfsqltype="cf_sql_varchar">
	            	AND c_url = <cfqueryparam value="#arguments.selectCat#" cfsqltype="cf_sql_varchar">
	        </cfquery>

	        <cfquery name="acc" datasource="#application.datasource#">
	        	SELECT l_id, ownerID, catID, vacID, accID, c_id, c_title, c_url, c_header,
	        		a_id as v_id, a_title as v_title, a_item as v_item, a_desc as v_desc, a_descShort as  v_descShort, a_imgFile as v_imgFile, a_meta as v_meta
	            FROM <cfif arguments.spanish>sp_</cfif>accessories
	            LEFT JOIN link
	            ON a_id = accID
	            LEFT JOIN <cfif arguments.spanish>sp_</cfif>prodCat
	            ON ownerID = c_id
	            WHERE a_item = <cfqueryparam value="#arguments.selectProd#" cfsqltype="cf_sql_varchar">
	            	AND c_url = <cfqueryparam value="#arguments.selectCat#" cfsqltype="cf_sql_varchar">
	        </cfquery>

	        <cfinvoke
				component="#application.components#.queryController"
				method="queryAppend">
				<cfinvokeargument name="queryOne" value="#vac#">
				<cfinvokeargument name="queryTwo" value="#acc#">
			</cfinvoke>
	    <cfelse>
	    	<cfquery name="vac" datasource="#application.datasource#">
	        	SELECT l_id, sOwnerID, sCatID, vacID, l_switch, s_id as c_id, s_title as c_title, s_url as c_url, s_header as c_header,
	        		v_id, v_title, v_item, v_desc, v_descShort, v_stan, v_tech, v_desc2, v_imgFile, v_meta
	            FROM <cfif arguments.spanish>sp_</cfif>vacuum
	            LEFT JOIN link
	            ON v_id = vacID
	            LEFT JOIN <cfif arguments.spanish>sp_</cfif>prodSubCat
	            ON sOwnerID = s_id
	            WHERE v_item = <cfqueryparam value="#arguments.selectProd#" cfsqltype="cf_sql_varchar">
	            	AND s_url = <cfqueryparam value="#arguments.selectSubCat#" cfsqltype="cf_sql_varchar">
	        </cfquery>

	        <cfquery name="acc" datasource="#application.datasource#">
	        	SELECT l_id, sOwnerID, sCatID, vacID, l_switch, s_id as c_id, s_title as c_title, s_url as c_url, s_header as c_header,
	        		a_id as v_id, a_title as v_title, a_item as v_item, a_desc as v_desc, a_descShort as  v_descShort, a_imgFile as v_imgFile, a_meta as v_meta
	            FROM <cfif arguments.spanish>sp_</cfif>accessories
	            LEFT JOIN link
	            ON a_id = accID
	            LEFT JOIN <cfif arguments.spanish>sp_</cfif>prodSubCat
	            ON sOwnerID = s_id
	            WHERE a_item = <cfqueryparam value="#arguments.selectProd#" cfsqltype="cf_sql_varchar">
	            	AND s_url = <cfqueryparam value="#arguments.selectSubCat#" cfsqltype="cf_sql_varchar">
	        </cfquery>

	        <cfinvoke
				component="#application.components#.queryController"
				method="queryAppend">
				<cfinvokeargument name="queryOne" value="#vac#">
				<cfinvokeargument name="queryTwo" value="#acc#">
			</cfinvoke>
	    </cfif>

        <cfreturn vac>
    </cffunction>

    <cffunction name="vacAcc" output="no" access="public" returntype="query" hint="Method returns the selected product accessories">
    	<cfargument name="selectAcc" default="">
		<cfargument name="spanish" default="false">

        <cfquery name="acc" datasource="#application.datasource#">
        	SELECT al_id, vacID, accID, al_order, a_id, a_title, a_item, a_desc, a_descShort, a_imgFile
            FROM <cfif arguments.spanish>sp_</cfif>accessories
            LEFT JOIN accLink
            ON accID = a_id
            WHERE vacID = <cfqueryparam value="#arguments.selectAcc#" cfsqltype="cf_sql_integer">
            	AND al_switch = <cfqueryparam value="1" CFSQLType="cf_sql_integer">
            ORDER BY al_order asc
        </cfquery>

        <cfreturn acc>
    </cffunction>


    <!--- RFQ Pages ---->
    <cffunction name="rfq" output="no" access="public" returntype="query" hint="Method returns list of products for RFQ forms.">
    	<cfargument name="section" default="pneumatic">
		<cfargument name="spanish" default="false">

        <cfquery name="rfq" datasource="#application.datasource#">
        	<cfif arguments.section eq "pneumatic">
	        	SELECT id, p_title, p_url, p_switch
	            FROM <cfif arguments.spanish>sp_</cfif>products
	            WHERE p_switch = <cfqueryparam value="1" cfsqltype="cf_sql_integer">
	            ORDER BY p_title
	        <cfelse>
	        	SELECT v_id, v_title, v_item, v_switch
	            FROM <cfif arguments.spanish>sp_</cfif>vacuum
	            WHERE v_switch = <cfqueryparam value="1" cfsqltype="cf_sql_integer">
	            ORDER BY v_title
	        </cfif>
        </cfquery>

        <cfreturn rfq>
    </cffunction>


    <!--- Brochures --->
    <cffunction name="brochures" output="no" access="public" returnType="query" hint="Method returns literature to be displayed on product page">
		<cfargument name="spanish" default="false">

    	<cfquery name="bro" dataSource="#application.datasource#">
    		SELECT id, section, title, file, img, switch
    		FROM <cfif arguments.spanish>sp_</cfif>brochures
    		WHERE switch = <cfqueryparam value="1" cfsqltype="cf_sql_integer">
    		ORDER BY section
    	</cfquery>

    	<cfreturn bro>
    </cffunction>


    <!--- News --->
    <cffunction name="news" output="no" access="public" returntype="query" hint="Method returns a list of press releases and retrieves the full article of a seleced press release">
    	<cfargument name="article" default="">
		<cfargument name="spanish" default="false">

        <cfquery name="news" datasource="#application.datasource#">
        	SELECT n_id, n_date, n_title, n_desc, n_img, n_switch
            FROM <cfif arguments.spanish>sp_</cfif>news
            WHERE n_switch = <cfqueryparam value="1" cfsqltype="cf_sql_integer">
			<cfif article neq "">
				AND n_id = <cfqueryparam value="#article#" cfsqltype="cf_sql_varchar">
			</cfif>
            ORDER BY n_date desc
        </cfquery>

        <cfreturn news>
    </cffunction>


    <!--- Trade Shows & Events --->
    <cffunction name="events" output="no" access="public" returntype="query" hint="Method returns a list of all trade shows and events">
    	<cfargument name="event" default="">
		<cfargument name="spanish" default="false">

    	<cfquery name="events" datasource="#application.datasource#">
        	SELECT id, year, startDate, displayDate, title, link, location, venue, industry, booth
            FROM <cfif arguments.spanish>sp_</cfif>events
            WHERE switch = <cfqueryparam value="1" cfsqltype="cf_sql_integer">
            ORDER BY startDate asc
        </cfquery>

        <cfreturn events>
    </cffunction>


    <!--- Cases --->
    <cffunction name="cases" output="no" access="public" returntype="query" hint="Method returns a list of case studies and retrieves the full text of a seleced case">
    	<cfargument name="case" default="">
		<cfargument name="spanish" default="false">

        <cfquery name="case" datasource="#application.datasource#">
        	SELECT c_id, c_cat, c_title, c_subTitle, c_summary, c_body, c_pdf, c_featured, c_order, c_switch
            FROM <cfif arguments.spanish>sp_</cfif>cases
            WHERE c_switch = <cfqueryparam value="1" cfsqltype="cf_sql_integer">
			<cfif arguments.case neq "">
			AND c_id = <cfqueryparam value="#arguments.case#" cfsqltype="cf_sql_varchar">
			</cfif>
			ORDER BY c_cat asc, c_id desc
        </cfquery>

        <cfreturn case>
    </cffunction>

    <cffunction name="featCases" output="no" access="public" returntype="query" hint="Method returns a list of case studies and retrieves the full text of a seleced case">
    	<cfargument name="case" default="">
		<cfargument name="spanish" default="false">

        <cfquery name="case" datasource="#application.datasource#">
        	SELECT c_id, c_cat, c_title, c_subTitle, c_summary, c_body, c_featured, c_order, c_switch
            FROM <cfif arguments.spanish>sp_</cfif>cases
            WHERE c_switch = <cfqueryparam value="1" cfsqltype="cf_sql_integer">
			AND c_featured = <cfqueryparam value="1" cfsqltype="cf_sql_integer">
			ORDER BY c_cat, c_order
        </cfquery>

        <cfreturn case>
    </cffunction>

    <cffunction name="landCases" output="no" access="public" returntype="query" hint="Method returns a list of case studies and retrieves the full text of a seleced case">
    	<cfargument name="section" default="">
		<cfargument name="spanish" default="false">

        <cfquery name="case" datasource="#application.datasource#">
        	SELECT c_id, c_cat, c_title, c_subTitle, c_summary, c_body, c_featured, c_order, c_switch
            FROM <cfif arguments.spanish>sp_</cfif>cases
            WHERE c_switch = <cfqueryparam value="1" cfsqltype="cf_sql_integer">
			AND c_cat = <cfqueryparam value="#arguments.section#" cfsqltype="cf_sql_text">
			ORDER BY c_order
        </cfquery>

        <cfreturn case>
    </cffunction>


    <!--------- Admin Section ----------->
    <!--- Users --->
    <cffunction name="users" output="no" access="public" returntype="query" hint="Method returns a list of all users">
    	<cfargument name="user" default="">

    	<cfquery name="users" datasource="#application.datasource#">
        	SELECT id, username, password, access, accNumber, fname, lname, cname, phone, fax, email, street, street2, city, state, zip, memo, alphaSec, u_switch
            FROM users
            WHERE u_switch = <cfqueryparam value="1" cfsqltype="cf_sql_integer">
            <cfif arguments.user neq "">
            AND id = <cfqueryparam value="#arguments.user#" cfsqltype="cf_sql_integer">
            </cfif>
            ORDER BY lname
        </cfquery>

        <cfreturn users>
    </cffunction>

    <!--- Products Section --->
    <cffunction name="pneuCat" output="no" access="public" returntype="query" hint="Method retrieves a list of all categories, sub categories, and products">
    	<cfargument name="selectCat" default="">

    	<cfquery name="pneuCat" datasource="#application.datasource#">
        	SELECT l_id, ownerID, catID, vacID, l_order, l_switch, c_id, c_title, c_url, c_desc, c_meta, c_header, c_direct
            FROM prodCat
            LEFT JOIN link
            ON c_id = catID
            WHERE ownerID = <cfqueryparam value="1" CFSQLType="cf_sql_integer">
            <cfif arguments.selectCat neq "">AND c_id = <cfqueryparam value="#arguments.selectCat#" cfsqltype="cf_sql_integer"></cfif>
			ORDER BY l_order
        </cfquery>

        <cfreturn pneuCat>
    </cffunction>

    <cffunction name="vacCat" output="no" access="public" returntype="query" hint="Method retrieves a list of all categories, sub categories, and products">
    	<cfargument name="selectCat" default="">

    	<cfquery name="vacCat" datasource="#application.datasource#">
        	SELECT l_id, ownerID, catID, vacID, l_order, l_switch, c_id, c_title, c_url, c_desc, c_meta, c_header, c_direct
            FROM prodCat
            LEFT JOIN link
            ON c_id = catID
            WHERE ownerID = <cfqueryparam value="2" CFSQLType="cf_sql_integer">
            <cfif arguments.selectCat neq "">AND c_id = <cfqueryparam value="#arguments.selectCat#" cfsqltype="cf_sql_integer"></cfif>
			ORDER BY l_order
        </cfquery>

        <cfreturn vacCat>
    </cffunction>


    <cffunction name="pneuSubCat" output="no" access="public" returntype="query" hint="Method retrieves a list of all vacuum subcategories">
    	<cfargument name="selectSubCat" default="">

    	<cfquery name="pneuSubCat" datasource="#application.datasource#">
    		<cfif arguments.selectSubCat eq "">
	        	SELECT a.l_id, a.ownerID, a.catID, a.sCatID, a.l_order, c_id, c_title, c_url, c_desc,
	        		b.l_id, b.ownerID, b.catID, b.sCatID, b.l_order, b.l_switch as s_switch, s_id, s_title, s_url
	        	FROM link a
	        	LEFT JOIN prodCat
	        	ON a.catID = c_id
	        	LEFT JOIN link b
	        	ON c_id = b.ownerID
	        	LEFT JOIN prodSubCat
	        	ON b.sCatID = s_id
	        	WHERE a.ownerID = <cfqueryparam value="1" CFSQLType="cf_sql_integer">
	        		AND a.l_switch = <cfqueryparam value="1" CFSQLType="cf_sql_integer">
	        		AND s_title != <cfqueryparam value="" CFSQLType="cf_sql_varchar">
	        	ORDER BY a.ownerID, a.l_order, b.ownerID, b.l_order
	        <cfelse>
	        	SELECT l_id, ownerID, catID, sCatID, l_order, l_switch,
	        		s_id, s_title, s_url, s_desc, s_meta, s_header, s_direct
	        	FROM prodSubCat
	        	LEFT JOIN link
	        	ON s_id = sCatID
	        	WHERE sCatID = <cfqueryparam value="#arguments.selectSubCat#" CFSQLType="cf_sql_integer">
	        	ORDER BY ownerID, l_order
	        </cfif>
        </cfquery>

        <cfreturn pneuSubCat>
    </cffunction>

    <cffunction name="vacSubCat" output="no" access="public" returntype="query" hint="Method retrieves a list of all vacuum subcategories">
    	<cfargument name="selectSubCat" default="">

    	<cfquery name="vacSubCat" datasource="#application.datasource#">
    		<cfif arguments.selectSubCat eq "">
	        	SELECT a.l_id, a.ownerID, a.catID, a.sCatID, a.l_order, c_id, c_title, c_url, c_desc,
	        		b.l_id, b.ownerID, b.catID, b.sCatID, b.l_order, b.l_switch as s_switch, s_id, s_title, s_url
	        	FROM link a
	        	LEFT JOIN prodCat
	        	ON a.catID = c_id
	        	LEFT JOIN link b
	        	ON c_id = b.ownerID
	        	LEFT JOIN prodSubCat
	        	ON b.sCatID = s_id
	        	WHERE a.ownerID = <cfqueryparam value="2" CFSQLType="cf_sql_integer">
	        		AND a.l_switch = <cfqueryparam value="1" CFSQLType="cf_sql_integer">
	        		AND s_title != <cfqueryparam value="" CFSQLType="cf_sql_varchar">
	        	ORDER BY a.ownerID, a.l_order, b.ownerID, b.l_order
	        <cfelse>
	        	SELECT l_id, ownerID, catID, sCatID, l_order, l_switch,
	        		s_id, s_title, s_url, s_desc, s_meta, s_header, s_direct
	        	FROM prodSubCat
	        	LEFT JOIN link
	        	ON s_id = sCatID
	        	WHERE sCatID = <cfqueryparam value="#arguments.selectSubCat#" CFSQLType="cf_sql_integer">
	        	ORDER BY ownerID, l_order
	        </cfif>
        </cfquery>

        <cfreturn vacSubCat>
    </cffunction>


    <cffunction name="pneuProd" output="no" access="public" returntype="query" hint="Method returns the selected vacuum product">
    	<cfargument name="selectProd" default="">

        <cfquery name="pneuProd" datasource="#application.datasource#">
        	SELECT l_id, ownerID, catID, sOwnerID, sCatID, prodID, l_switch, c_id, c_title, c_url, c_header, c_direct, s_id, s_title, s_url, s_header,
        		id, p_title, p_url, p_subTitle, p_desc, p_descShort, p_feat, p_specs, p_meta, p_switch
            FROM products
            LEFT JOIN link
            ON id = prodID
            LEFT JOIN prodCat
            ON ownerID = c_id
            LEFT JOIN prodSubCat
            ON sOwnerID = s_id
            <cfif arguments.selectProd neq "">
            WHERE id = <cfqueryparam value="#arguments.selectProd#" CFSQLType="cf_sql_integer">
            </cfif>
            GROUP BY id
            ORDER BY p_title
        </cfquery>

        <cfreturn pneuProd>
    </cffunction>

    <cffunction name="vacProd" output="no" access="public" returntype="query" hint="Method returns the selected vacuum product">
    	<cfargument name="selectProd" default="">

        <cfquery name="vacProd" datasource="#application.datasource#">
        	SELECT l_id, ownerID, catID, sOwnerID, sCatID, vacID, l_switch, c_id, c_title, c_url, c_header, s_id, s_title, s_url, s_header,
        		v_id, v_title, v_item, v_desc, v_descShort, v_stan, v_tech, v_desc2, v_imgFile, v_meta, v_switch
            FROM vacuum
            LEFT JOIN link
            ON v_id = vacID
            LEFT JOIN prodCat
            ON ownerID = c_id
            LEFT JOIN prodSubCat
            ON sOwnerID = s_id
            <cfif arguments.selectProd neq "">
            WHERE v_id = <cfqueryparam value="#arguments.selectProd#" CFSQLType="cf_sql_integer">
            </cfif>
            GROUP BY v_id
            ORDER BY v_item
        </cfquery>

        <cfreturn vacProd>
    </cffunction>

    <cffunction name="vacAccAdmin" output="no" access="public" returntype="query" hint="Method returns the selected product accessories">
    	<cfquery name="acc" datasource="#application.datasource#">
        	SELECT a_id, a_title, a_item, a_desc, a_descShort, a_imgFile, a_meta, a_switch
            FROM accessories
            ORDER BY a_item
        </cfquery>

        <cfreturn acc>
    </cffunction>

    <cffunction name="vacAccSel" output="no" access="public" returntype="query" hint="Method returns the selected vacuum accessory">
    	<cfargument name="selectAcc" default="">

        <cfquery name="vacAcc" datasource="#application.datasource#">
        	SELECT l_id, ownerID, catID, sOwnerID, sCatID, vacID, l_switch, c_id, c_title, c_url, c_header, s_id, s_title, s_url, s_header,
        		a_id, a_title, a_item, a_desc, a_descShort, a_imgFile, a_meta, a_switch
            FROM accessories
            LEFT JOIN link
            ON a_id = accID
            LEFT JOIN prodCat
            ON ownerID = c_id
            LEFT JOIN prodSubCat
            ON sOwnerID = s_id
            WHERE a_id = <cfqueryparam value="#arguments.selectAcc#" CFSQLType="cf_sql_integer">
        </cfquery>

        <cfreturn vacAcc>
    </cffunction>


    <!--- RFQ --->
    <cffunction name="adminRfq" output="no" access="public" returntype="query" hint="Method returns a list of RFQ form submissions.">
    	<cfargument name="sec" required="true" default="">

        <cfquery name="rfq" datasource="#application.datasource#">
        	SELECT id, submitted, comp, fname, lname, phone, fax, email, address1, address2, city, state, zip, country, form, prod, backup
            FROM quotes
			WHERE form = <cfqueryparam value="#arguments.sec#" cfsqltype="cf_sql_varchar">
			ORDER BY submitted desc
        </cfquery>

        <cfreturn rfq>
    </cffunction>


    <!--- Trade Shows & Events --->
    <cffunction name="adminEvents" output="no" access="public" returntype="query" hint="Method returns a list of all trade shows and events">
    	<cfargument name="event" default="">

		<cfquery name="events" datasource="#application.datasource#">
        	SELECT id, year, startDate, displayDate, title, link, location, venue, industry, booth, switch
            FROM #application.prefix#events
			<cfif event neq "">
				WHERE id = <cfqueryparam value="#event#" cfsqltype="cf_sql_varchar">
			</cfif>
            ORDER BY startDate asc
        </cfquery>

        <cfreturn events>
    </cffunction>


    <!--- Cases --->
    <cffunction name="adminCases" output="no" access="public" returntype="query" hint="Method returns a list of case studies and retrieves the full text of a seleced case">
    	<cfargument name="case" default="">

        <cfquery name="case" datasource="#application.datasource#">
        	SELECT c_id, c_cat, c_title, c_subTitle, c_summary, c_body, c_pdf, c_featured, c_order, c_switch
            FROM cases
			<cfif case neq "">
			WHERE c_id = <cfqueryparam value="#arguments.case#" cfsqltype="cf_sql_integer">
			</cfif>
			ORDER BY c_cat asc, c_id desc
        </cfquery>

        <cfreturn case>
    </cffunction>


    <!--- Brochures --->
    <cffunction name="adminBrochures" output="no" access="public" returnType="query" hint="Method returns literature to be displayed on product page">
    	<cfargument name="bro" default="">

    	<cfquery name="bro" dataSource="#application.datasource#">
    		SELECT id, section, title, file, img, switch
    		FROM #application.prefix#brochures
    		WHERE id = <cfqueryparam value="#arguments.bro#" cfsqltype="cf_sql_integer">
    	</cfquery>

    	<cfreturn bro>
    </cffunction>

</cfcomponent>
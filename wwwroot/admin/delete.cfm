<cfparam name="url.section" default="">

<cfswitch expression="#url.section#">
	<!--- Delete user from db --->
	<cfcase value="user">
		<cfparam name="url.user" default="">

		<cfquery name="deleteUser" dataSource="#application.datasource#">
			DELETE FROM users
			WHERE id = <cfqueryparam value="#url.user#" cfsqltype="cf_sql_integer">
		</cfquery>

		<cflocation url="index.cfm?delete" addToken="no">
	</cfcase>


	<!--- Delete rep from db --->
	<cfcase value="reps">
		<cfparam name="url.rep" default="">

		<cfquery name="deleteRep" dataSource="#application.datasource#">
			DELETE FROM reps
			WHERE id = <cfqueryparam value="#url.rep#" cfsqltype="cf_sql_integer">
		</cfquery>

		<cfquery name="deleteRepZips" dataSource="#application.datasource#">
			DELETE FROM repZips
			WHERE rID = <cfqueryparam value="#url.rep#" cfsqltype="cf_sql_integer">
		</cfquery>

		<cflocation url="reps.cfm?delete" addToken="no">
	</cfcase>


	<!--- Delete category from db --->
	<!--- Pneumatic --->
	<cfcase value="cat">
		<cfparam name="url.cat" default="">

		<cfquery name="deleteCat" dataSource="#application.datasource#">
			DELETE FROM prodCat
			WHERE c_id = <cfqueryparam value="#url.cat#" cfsqltype="cf_sql_integer">
		</cfquery>

		<cfquery name="deleteLinkOwner" dataSource="#application.datasource#">
			DELETE FROM link
			WHERE ownerID = <cfqueryparam value="#url.cat#" cfsqltype="cf_sql_integer">
		</cfquery>

		<cfquery name="deleteLinkCat" dataSource="#application.datasource#">
			DELETE FROM link
			WHERE catID = <cfqueryparam value="#url.cat#" cfsqltype="cf_sql_integer">
		</cfquery>

		<cflocation url="pneuCat.cfm?delete" addToken="no">
	</cfcase>

	<!--- Vacuum --->
	<cfcase value="vacCat">
		<cfparam name="url.cat" default="">

		<cfquery name="deleteCat" dataSource="#application.datasource#">
			DELETE FROM prodCat
			WHERE c_id = <cfqueryparam value="#url.cat#" cfsqltype="cf_sql_integer">
		</cfquery>

		<cfquery name="deleteLinkOwner" dataSource="#application.datasource#">
			DELETE FROM link
			WHERE ownerID = <cfqueryparam value="#url.cat#" cfsqltype="cf_sql_integer">
		</cfquery>

		<cfquery name="deleteLinkCat" dataSource="#application.datasource#">
			DELETE FROM link
			WHERE catID = <cfqueryparam value="#url.cat#" cfsqltype="cf_sql_integer">
		</cfquery>

		<cflocation url="vacCat.cfm?delete" addToken="no">
	</cfcase>

	<!--- Delete subcategory from db --->
	<!--- Pneumatic --->
	<cfcase value="subCat">
		<cfparam name="url.subCat" default="">

		<cfquery name="deleteCat" dataSource="#application.datasource#">
			DELETE FROM prodSubCat
			WHERE s_id = <cfqueryparam value="#url.subCat#" cfsqltype="cf_sql_integer">
		</cfquery>

		<cfquery name="deleteLinkSubOwner" dataSource="#application.datasource#">
			DELETE FROM link
			WHERE sOwnerID = <cfqueryparam value="#url.subCat#" cfsqltype="cf_sql_integer">
		</cfquery>

		<cfquery name="deleteLinkSubCat" dataSource="#application.datasource#">
			DELETE FROM link
			WHERE sCatID = <cfqueryparam value="#url.subCat#" cfsqltype="cf_sql_integer">
		</cfquery>

		<cflocation url="pneuSubCat.cfm?delete" addToken="no">
	</cfcase>

	<!--- Vacuum --->
	<cfcase value="vacSubCat">
		<cfparam name="url.subCat" default="">

		<cfquery name="deleteCat" dataSource="#application.datasource#">
			DELETE FROM prodSubCat
			WHERE s_id = <cfqueryparam value="#url.subCat#" cfsqltype="cf_sql_integer">
		</cfquery>

		<cfquery name="deleteLinkSubOwner" dataSource="#application.datasource#">
			DELETE FROM link
			WHERE sOwnerID = <cfqueryparam value="#url.subCat#" cfsqltype="cf_sql_integer">
		</cfquery>

		<cfquery name="deleteLinkSubCat" dataSource="#application.datasource#">
			DELETE FROM link
			WHERE sCatID = <cfqueryparam value="#url.subCat#" cfsqltype="cf_sql_integer">
		</cfquery>

		<cflocation url="vacSubCat.cfm?delete" addToken="no">
	</cfcase>


	<!--- Delete product and image from db --->
	<!--- Pneumatic --->
	<cfcase value="pneu">
		<cfparam name="url.prod" default="">

		<cfquery name="getImg" dataSource="#application.datasource#">
			SELECT i_file
			FROM images
			WHERE p_id = <cfqueryparam value="#url.prod#" cfsqltype="cf_sql_integer">
		</cfquery>

		<cfset fullPath = expandPath("../prodImg")>
		<cfloop query="getImg">
			<cffile action="delete" file="#fullPath#/#getImg.i_file#">
		</cfloop>

		<cfquery name="deleteImg" dataSource="#application.datasource#">
			DELETE FROM images
			WHERE p_id = <cfqueryparam value="#url.prod#" cfsqltype="cf_sql_integer">
		</cfquery>

		<cfquery name="deleteProd" dataSource="#application.datasource#">
			DELETE FROM products
			WHERE id = <cfqueryparam value="#url.prod#" cfsqltype="cf_sql_integer">
		</cfquery>

		<cfquery name="deleteLinkProd" dataSource="#application.datasource#">
			DELETE FROM link
			WHERE prodID = <cfqueryparam value="#url.prod#" cfsqltype="cf_sql_integer">
		</cfquery>

		<cflocation url="pneumatic.cfm?delete" addToken="no">
	</cfcase>

	<!--- Delete a pneumatic product's image from db and server --->
	<cfcase value="pneuImg">
		<cfparam name="url.prodImg" default="">

		<!--- Get the file name --->
		<cfquery name="deleteProdImg" dataSource="#application.datasource#">
			SELECT i_file
			FROM images
			WHERE i_id = <cfqueryparam value="#url.prodImg#" cfsqltype="cf_sql_integer">
		</cfquery>

		<!--- Delete the file --->
		<cfset fullPath = expandPath("../prodImg")>
		<cffile action="delete" file="#fullPath#/#deleteProdImg.i_file#">

		<cfquery name="deleteImg" dataSource="#application.datasource#">
			DELETE FROM images
			WHERE i_id = <cfqueryparam value="#url.prodImg#" cfsqltype="cf_sql_integer">
		</cfquery>

		<cflocation url="pneuProdFunctions.cfm?prod=#url.prod#" addToken="no">
	</cfcase>

	<!--- Vacuum --->
	<cfcase value="vac">
		<cfparam name="url.prod" default="">

		<cfquery name="getImg" dataSource="#application.datasource#">
			SELECT v_imgFile
			FROM vacuum
			WHERE v_id = <cfqueryparam value="#url.prod#" cfsqltype="cf_sql_integer">
		</cfquery>

		<cfset fullPath = expandPath("../prodImg")>
		<cffile action="delete" file="#fullPath#/#getImg.v_imgFile#">

		<cfquery name="deleteProd" dataSource="#application.datasource#">
			DELETE FROM vacuum
			WHERE v_id = <cfqueryparam value="#url.prod#" cfsqltype="cf_sql_integer">
		</cfquery>

		<cfquery name="deleteLinkProd" dataSource="#application.datasource#">
			DELETE FROM link
			WHERE vacID = <cfqueryparam value="#url.prod#" cfsqltype="cf_sql_integer">
		</cfquery>

		<cfquery name="deleteAccLink" dataSource="#application.datasource#">
			DELETE FROM accLink
			WHERE vacID = <cfqueryparam value="#url.prod#" cfsqltype="cf_sql_integer">
		</cfquery>

		<cflocation url="vacuum.cfm?delete" addToken="no">
	</cfcase>

	<!--- Delete a vacuum product's image from db and server --->
	<cfcase value="vacImg">
		<cfparam name="url.prodImg" default="">

		<!--- Get the file name --->
		<cfquery name="deleteProdImg" dataSource="#application.datasource#">
			SELECT v_imgFile
			FROM vacuum
			WHERE v_id = <cfqueryparam value="#url.prodImg#" cfsqltype="cf_sql_integer">
		</cfquery>

		<!--- Delete the file --->
		<cfset fullPath = expandPath("../prodImg")>
		<cffile action="delete" file="#fullPath#/#deleteProdImg.v_imgFile#">

		<cfquery name="updateProd" dataSource="#application.datasource#">
			UPDATE vacuum
			SET v_imgFile = <cfqueryparam value="NULL" null="yes" CFSQLType="cf_sql_varchar">
			WHERE v_id = <cfqueryparam value="#url.prodImg#" cfsqltype="cf_sql_integer">
		</cfquery>
	</cfcase>


	<!--- Delete accessory and image from db --->
	<cfcase value="acc">
		<cfparam name="url.acc" default="">

		<cfquery name="getImg" dataSource="#application.datasource#">
			SELECT a_imgFile
			FROM accessories
			WHERE a_id = <cfqueryparam value="#url.acc#" cfsqltype="cf_sql_integer">
		</cfquery>

		<cfif getImg.a_imgFile neq "">
			<cfset fullPath = expandPath("../prodImg")>
			<cffile action="delete" file="#fullPath#/#getImg.a_imgFile#">
		</cfif>

		<cfquery name="deleteAcc" dataSource="#application.datasource#">
			DELETE FROM accessories
			WHERE a_id = <cfqueryparam value="#url.acc#" cfsqltype="cf_sql_integer">
		</cfquery>

		<cfquery name="deleteLinkProd" dataSource="#application.datasource#">
			DELETE FROM link
			WHERE accID = <cfqueryparam value="#url.acc#" cfsqltype="cf_sql_integer">
		</cfquery>

		<cfquery name="deleteAccLink" dataSource="#application.datasource#">
			DELETE FROM accLink
			WHERE accID = <cfqueryparam value="#url.acc#" cfsqltype="cf_sql_integer">
		</cfquery>

		<cflocation url="vacAcc.cfm?delete" addToken="no">
	</cfcase>

	<!--- Delete an accessory's image from db and server --->
	<cfcase value="accImg">
		<cfparam name="url.prodImg" default="">

		<!--- Get the file name --->
		<cfquery name="deleteAccImg" dataSource="#application.datasource#">
			SELECT a_imgFile
			FROM accessories
			WHERE a_id = <cfqueryparam value="#url.accImg#" cfsqltype="cf_sql_integer">
		</cfquery>

		<!--- Delete the file --->
		<cfset fullPath = expandPath("../prodImg")>
		<cffile action="delete" file="#fullPath#/#deleteAccImg.a_imgFile#">

		<cfquery name="updateProd" dataSource="#application.datasource#">
			UPDATE accessories
			SET a_imgFile = <cfqueryparam value="NULL" null="yes" CFSQLType="cf_sql_varchar">
			WHERE a_id = <cfqueryparam value="#url.accImg#" cfsqltype="cf_sql_integer">
		</cfquery>
	</cfcase>


	<!--- Delete case from db and associated pdf from server --->
	<cfcase value="case">
		<cfparam name="url.case" default="">

		<!--- Get PDF name from db and delete the file if it exists --->
		<cfquery name="deleteCasePDF" dataSource="#application.datasource#">
			SELECT c_pdf
			FROM cases
			WHERE c_id = <cfqueryparam value="#url.case#" cfsqltype="cf_sql_integer">
		</cfquery>

		<cfif deleteCasePDF.c_pdf neq "">
			<cfset fullPath = expandPath("../userfiles/cases")>
			<cffile action="delete" file="#fullPath#/#deleteCasePDF.c_pdf#">
		</cfif>

		<!--- Delete the case from the db --->
		<cfquery name="deleteCase" dataSource="#application.datasource#">
			DELETE FROM cases
			WHERE c_id = <cfqueryparam value="#url.case#" cfsqltype="cf_sql_integer">
		</cfquery>

		<cflocation url="cases.cfm?delete" addToken="no">
	</cfcase>


	<!--- Delete a case's pdf from db and server --->
	<cfcase value="casePDF">
		<cfparam name="url.casePDF" default="">

		<!--- Get the file name --->
		<cfquery name="deleteCasePDF" dataSource="#application.datasource#">
			SELECT c_pdf
			FROM cases
			WHERE c_id = <cfqueryparam value="#url.casePDF#" cfsqltype="cf_sql_integer">
		</cfquery>

		<!--- Delete the file --->
		<cfset fullPath = expandPath("../userfiles/cases")>
		<cffile action="delete" file="#fullPath#/#deleteCasePDF.c_pdf#">

		<cfquery name="updateCase" dataSource="#application.datasource#">
			UPDATE cases
			SET c_pdf = <cfqueryparam value="NULL" null="yes" CFSQLType="cf_sql_varchar">
			WHERE c_id = <cfqueryparam value="#url.casePDF#" cfsqltype="cf_sql_integer">
		</cfquery>

		<cfreturn>
	</cfcase>

	<!--- Delete brochure from db and associated files from server --->
	<cfcase value="bro">
		<cfparam name="url.bro" default="">

		<!--- Get PDF and thumbnail name from db --->
		<cfquery name="deleteBroPDF" dataSource="#application.datasource#">
			SELECT file, img
			FROM brochures
			WHERE id = <cfqueryparam value="#url.bro#" cfsqltype="cf_sql_integer">
		</cfquery>

		<!--- Delete the file and tumbnail --->
		<cfset fullPath = expandPath("../userfiles/brochures")>
		<cffile action="delete" file="#fullPath#/#deleteBroPDF.file#">
		<cffile action="delete" file="#fullPath#/#deleteBroPDF.img#">

		<!--- Delete the brochure from the db --->
		<cfquery name="deleteBro" dataSource="#application.datasource#">
			DELETE FROM brochures
			WHERE id = <cfqueryparam value="#url.bro#" cfsqltype="cf_sql_integer">
		</cfquery>

		<cflocation url="brochures.cfm?delete" addToken="no">
	</cfcase>


	<!--- Delete a brochures's pdf and thumbnail from db and server --->
	<cfcase value="broPDF">
		<cfparam name="url.broPDF" default="">

		<!--- Get the file and thumbnail name --->
		<cfquery name="deleteBroPDF" dataSource="#application.datasource#">
			SELECT file, img
			FROM brochures
			WHERE id = <cfqueryparam value="#url.broPDF#" cfsqltype="cf_sql_integer">
		</cfquery>

		<!--- Delete the file and thumbnail --->
		<cfset fullPath = expandPath("../userfiles/brochures")>
		<cffile action="delete" file="#fullPath#/#deleteBroPDF.file#">
		<cffile action="delete" file="#fullPath#/#deleteBroPDF.img#">

		<cfquery name="updateBro" dataSource="#application.datasource#">
			UPDATE brochures
			SET file = <cfqueryparam value="NULL" null="yes" CFSQLType="cf_sql_varchar">,
				img = <cfqueryparam value="NULL" null="yes" CFSQLType="cf_sql_varchar">
			WHERE id = <cfqueryparam value="#url.broPDF#" cfsqltype="cf_sql_integer">
		</cfquery>

		<cfreturn>
	</cfcase>


	<!--- Delete news from db and associated image from server --->
	<cfcase value="news">
		<cfparam name="url.news" default="">

		<!--- Get image name from db --->
		<cfquery name="deleteNewsImg" dataSource="#application.datasource#">
			SELECT n_img
			FROM news
			WHERE n_id = <cfqueryparam value="#url.news#" cfsqltype="cf_sql_integer">
		</cfquery>

		<cfif deleteNewsImg.n_img neq "">
			<!--- Delete the image --->
			<cfset fullPath = expandPath("../img/news")>
			<cffile action="delete" file="#fullPath#/#deleteNewsImg.n_img#">
		</cfif>

		<!--- Delete the news article from the db --->
		<cfquery name="deleteNews" dataSource="#application.datasource#">
			DELETE FROM news
			WHERE n_id = <cfqueryparam value="#url.news#" cfsqltype="cf_sql_integer">
		</cfquery>

		<cflocation url="news.cfm?delete" addToken="no">
	</cfcase>


	<!--- Delete a news pdf and thumbnail from db and server --->
	<cfcase value="newsImg">
		<cfparam name="url.newsImg" default="">

		<!--- Get the file and thumbnail name --->
		<cfquery name="deleteNewsImg" dataSource="#application.datasource#">
			SELECT n_img
			FROM news
			WHERE n_id = <cfqueryparam value="#url.newsImg#" cfsqltype="cf_sql_integer">
		</cfquery>

		<!--- Delete the image --->
		<cfset fullPath = expandPath("../img/news")>
		<cffile action="delete" file="#fullPath#/#deleteNewsImg.n_img#">

		<cfquery name="updateBro" dataSource="#application.datasource#">
			UPDATE news
			SET n_img = <cfqueryparam value="NULL" null="yes" CFSQLType="cf_sql_varchar">
			WHERE n_id = <cfqueryparam value="#url.newsImg#" cfsqltype="cf_sql_integer">
		</cfquery>

		<cfreturn>
	</cfcase>


	<!--- Delete event from db --->
	<cfcase value="events">
		<cfparam name="url.event" default="">

		<!--- Delete the event from the db --->
		<cfquery name="deleteEvent" dataSource="#application.datasource#">
			DELETE FROM events
			WHERE id = <cfqueryparam value="#url.event#" cfsqltype="cf_sql_integer">
		</cfquery>

		<cflocation url="events.cfm?delete" addToken="no">
	</cfcase>


	<!--- Delete a RFQ entry and CSV backup from db and server --->
	<cfcase value="rfq">
		<cfparam name="url.rfq" default="">
		<cfparam name="url.page" default="">
		<cfparam name="url.from" default="">
		<cfparam name="url.to" default="">

		<!--- Get the file and thumbnail name --->
		<cfquery name="deleteBackup" dataSource="#application.datasource#">
			SELECT backup
			FROM quotes
			WHERE id = <cfqueryparam value="#url.rfq#" cfsqltype="cf_sql_integer">
		</cfquery>

		<!--- Delete the image --->
		<cfif deleteBackup.recordcount gt 0>
			<cfset fullPath = expandPath("./reports/backups")>
			<cfif fileExists("#fullPath#/#deleteBackup.backup#")>
				<cffile action="delete" file="#fullPath#/#deleteBackup.backup#">
			</cfif>
		</cfif>

		<!--- Delete the db record --->
		<cfquery name="deleteRFQ" dataSource="#application.datasource#">
			DELETE FROM quotes
			WHERE id = <cfqueryparam value="#url.rfq#" cfsqltype="cf_sql_integer">
		</cfquery>

		<cflocation url="#url.page#.cfm?delete&from=#url.from#&#url.to#" addToken="no">
	</cfcase>
</cfswitch>
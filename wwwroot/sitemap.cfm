<cfprocessingdirective pageencoding="utf-8">
<cfinvoke
	component="#application.components#.queryController"
	method="sideNav"
	returnvariable="side">
</cfinvoke>
<cfinvoke
	component="#application.components#.queryController"
	method="sideVac"
	returnvariable="sideVac">
</cfinvoke>
<cfquery name="pneu" dataSource="#application.datasource#">
	SELECT p_url, c_url
	FROM products
	LEFT JOIN link
	ON id = prodID
	LEFT JOIN prodCat
	ON ownerID = c_id
	WHERE p_switch = <cfqueryparam value="1" CFSQLType="cf_sql_integer">
	GROUP BY p_url
</cfquery>
<cfquery name="vac" dataSource="#application.datasource#">
	SELECT v_item, c_url
	FROM vacuum
	LEFT JOIN link
	ON v_id = vacID
	LEFT JOIN prodCat
	ON ownerID = c_id
	WHERE v_switch = <cfqueryparam value="1" CFSQLType="cf_sql_integer">
	GROUP BY v_item
</cfquery>
<cfinvoke
	component="#application.components#.queryController"
	method="news"
	returnvariable="news">
</cfinvoke>
<cfinvoke
	component="#application.components#.queryController"
	method="cases"
	returnvariable="case">
</cfinvoke>
<?xml version="1.0" encoding="UTF-8"?>
<urlset
xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9
http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd">
	<url>
		<loc>http://www.vac-u-max.com/</loc>
		<priority>1</priority>
	</url>
	<url>
		<loc>http://www.vac-u-max.com/landingPneumatic.cfm</loc>
		<priority>0.9</priority>
	</url>
	<url>
		<loc>http://www.vac-u-max.com/landingVacuum.cfm</loc>
		<priority>0.9</priority>
	</url>
	<url>
		<loc>http://www.vac-u-max.com/product.cfm?cat=aero-mechanical-conveyors&prod=aero-mechanical-conveyors</loc>
		<priority>0.9</priority>
	</url>
	<url>
		<loc>http://www.vac-u-max.com/product.cfm?cat=flexible-screw-conveyors&prod=flexible-screw-conveyors</loc>
		<priority>0.9</priority>
	</url>
	<url>
		<loc>http://www.vac-u-max.com/product.cfm?cat=pulsonic-bin-activators&prod=pulsonic-bin-activators</loc>
		<priority>0.9</priority>
	</url>
	<url>
		<loc>http://www.vac-u-max.com/quotePneumatic.cfm</loc>
		<priority>0.8</priority>
	</url>
	<url>
		<loc>http://www.vac-u-max.com/quoteVacuum.cfm</loc>
		<priority>0.8</priority>
	</url>
	<url>
		<loc>http://www.vac-u-max.com/quoteAerocon.cfm</loc>
		<priority>0.8</priority>
	</url>
	<url>
		<loc>http://www.vac-u-max.com/quoteFlexibleScrew.cfm</loc>
		<priority>0.8</priority>
	</url>
	<url>
		<loc>http://www.vac-u-max.com/quotePulsonic.cfm</loc>
		<priority>0.8</priority>
	</url>
	<cfoutput query="side" group="c_title">
		<cfif side.c_direct eq 0>
			<url>
				<loc>http://www.vac-u-max.com/overview.cfm?cat=#side.c_url#</loc>
				<priority>0.78</priority>
			</url>

		<cfelse>

			<url>
				<loc>http://www.vac-u-max.com/product.cfm?cat=#side.c_url#&prod=#side.c_url#</loc>
				<priority>0.78</priority>
			</url>
		</cfif>
	</cfoutput>
	<cfoutput query="side" group="c_title">
		<cfoutput>
			<cfif side.s_title neq "" AND side.s_switch eq 1>
				<cfif side.s_direct eq 0>
					<url>
						<loc>http://www.vac-u-max.com/overview.cfm?subCat=#side.s_url#</loc>
						<priority>0.75</priority>
					</url>

				<cfelse>

					<url>
						<loc>http://www.vac-u-max.com/product.cfm?cat=#side.c_url#&prod=#side.s_url#</loc>
						<priority>0.75</priority>
					</url>
				</cfif>
			</cfif>
		</cfoutput>
	</cfoutput>
	<cfoutput query="sideVac" group="c_title">
		<url>
			<loc>http://www.vac-u-max.com/vacView.cfm?cat=#side.c_url#</loc>
			<priority>0.78</priority>
		</url>
	</cfoutput>
	<cfoutput query="sideVac" group="c_title">
		<cfoutput>
			<cfif side.s_title neq "">
				<url>
					<loc>http://www.vac-u-max.com/vacView.cfm?subCat=#side.s_url#</loc>
					<priority>0.78</priority>
				</url>
			</cfif>
		</cfoutput>
	</cfoutput>
	<cfoutput query="pneu">
		<url>
			<loc>http://www.vac-u-max.com/product.cfm?cat=#pneu.c_url#&prod=#pneu.p_url#</loc>
			<priority>0.7</priority>
		</url>
	</cfoutput>
	<cfoutput query="vac">
		<url>
			<loc>http://www.vac-u-max.com/vacuum.cfm?cat=#vac.c_url#&prod=#vac.v_item#</loc>
			<priority>0.7</priority>
		</url>
	</cfoutput>
	<url>
		<loc>http://www.vac-u-max.com/corporate.cfm</loc>
		<priority>0.6</priority>
	</url>
	<url>
		<loc>http://www.vac-u-max.com/news.cfm</loc>
		<priority>0.6</priority>
	</url>
	<url>
		<loc>http://www.vac-u-max.com/case_histories.cfm</loc>
		<priority>0.6</priority>
	</url>
	<url>
		<loc>http://www.vac-u-max.com/brochures.cfm</loc>
		<priority>0.6</priority>
	</url>
	<url>
		<loc>http://www.vac-u-max.com/sales/</loc>
		<priority>0.6</priority>
	</url>
	<url>
		<loc>http://www.vac-u-max.com/contact.cfm</loc>
		<priority>0.6</priority>
	</url>
	<cfloop query="news">
		<url>
			<loc>http://www.vac-u-max.com/news.cfm?article=<cfoutput>#DateFormat(news.n_date, 'yyyy-mm-dd')#</cfoutput></loc>
			<priority>0.5</priority>
		</url>
	</cfloop>
	<cfloop query="case">
		<url>
			<loc>http://www.vac-u-max.com/case_histories.cfm?case=<cfoutput>#case.c_id#</cfoutput></loc>
			<priority>0.5</priority>
		</url>
	</cfloop>
	<url>
		<loc>http://www.vac-u-max.com/searchresults.cfm</loc>
		<priority>0.3</priority>
	</url>
	<url>
		<loc>http://www.vac-u-max.com/terms.cfm</loc>
		<priority>0.3</priority>
	</url>
	<url>
		<loc>http://www.vac-u-max.com/privacy.cfm</loc>
		<priority>0.3</priority>
	</url>
	<url>
		<loc>http://www.vac-u-max.com/site.cfm</loc>
		<priority>0.3</priority>
	</url>
</urlset>
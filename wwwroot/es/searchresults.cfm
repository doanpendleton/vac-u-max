<cfprocessingdirective pageEncoding="utf-8">
<cfparam name="form.search" default="">
<!DOCTYPE html>
<html>
<head>
	<title>VAC-U-MAX | Resultados de la Búsqueda</title>
	<meta name="description" content="">
	<cfinclude template="../inc/head.cfm">
</head>

<body>
	<cfinclude template="inc/top.cfm">

    <div id="homeCon" class="container">
		<div class="conIndent">
			<div class="row-fluid">
		    	<div id="inBan1" class="inBanner">
		    		<h1>Resultados de la Búsqueda</h1>
		    		<div class="clearfix"></div>
		    	</div><!--- inBanner --->
			</div><!--- row-fluid --->

	    	<div class="row-fluid">
		    	<div id="prodCon" class="span9 well">
	    			<cfset q = '#form.search#&siteSearch=www.vac-u-max.com/es'>
					<cfset start = 1>
					<cfhttp url="https://www.googleapis.com/customsearch/v1?key=AIzaSyAKcOHKQbjpfFWhjj7VJQypzqVwCRl_j0I&cx=012416142057924093751:lzfk2x4xlvq&q=#q#&start=#start#&language=es" method="GET" result="res">
						<cfhttpparam encoded="no" type="CGI" name="referer" value="http://www.vac-u-max.com/es/searchresults.cfm" />
					</cfhttp>

					<cfset out = DeserializeJSON(res.FileContent)>

					<cfif isDefined("out.items")>
						<cfset start = start+ ArrayLen(out.items)>
						<cfloop array="#out.items#" index="r">
							<div class="results">
								<cfoutput>
								<h3><a href="#r.link#">#r.title#</a></h3>
								<p>#r.snippet#</p>
								<a href="#r.link#">#r.link#</a>
								</cfoutput>
							</div>
						</cfloop>
					<cfelse>
						<div class="line"></div>
						<h2>Lo sentimos, no se encontraron resultados.</h2>
					</cfif>
	    		</div>

	    		<cfinclude template="inc/sideNews.cfm">
	    	</div><!--- row-fluid--->
		</div><!--- conIndent --->
    </div><!--- container --->

    <cfinclude template="inc/footer.cfm">
    <cfinclude template="../inc/scripts.cfm">
</body>
</html>
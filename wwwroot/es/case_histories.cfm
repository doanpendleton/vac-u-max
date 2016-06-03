<cfprocessingdirective pageEncoding="utf-8">
<cfparam name="url.case" default="">
<cfinvoke
	component="#application.components#.queryController"
	method="cases"
	returnvariable="case">
	<cfinvokeargument name="case" value="#url.case#">
	<cfinvokeargument name="spanish" value="true">
</cfinvoke>
<!DOCTYPE html>
<html>
<head>
	<title>VAC-U-MAX | Casos de Aplicación<cfif url.case neq ""><cfoutput query="case"> | #case.c_title#</cfoutput></cfif></title>
	<meta name="description" content="">
	<cfinclude template="../inc/head.cfm">
</head>

<body>
	<cfinclude template="inc/top.cfm">

    <div id="homeCon" class="container">
		<div class="conIndent">
			<div class="row-fluid">
		    	<div id="inBan1" class="inBanner">
		    		<h1>Casos de Aplicación</h1>
		    		<div class="clearfix"></div>
		    	</div><!--- inBanner --->
			</div><!--- row-fluid --->

	    	<div class="row-fluid">
	    		<div id="prodCon" class="span9 well">
		    		<cfif url.case eq "">
			    		<cfoutput query="case" group="c_cat">
	    					<h2>#case.c_cat#</h2>
	    					<cfoutput>
			    				<ul>
			    					<li><a href="?case=#case.c_id#">#case.c_title#</a></li>
			    				</ul>
	    					</cfoutput>
	    				</cfoutput>

	    			<cfelse>

	    				<cfoutput query="case">
		    				<cfif case.c_pdf neq ""><a href="#application.root#userfiles/cases/#case.c_pdf#" class="quoteBtn pull-right" target="_blank">Descargar caso <span>»</span></a></cfif>
							<div class="clearfix"></div>

							<h2>#case.c_title#</h2>
							<h4>#case.c_subTitle#</h4>

							#case.c_body#
						</cfoutput>
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
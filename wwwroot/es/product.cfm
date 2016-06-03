<cfprocessingdirective pageEncoding="utf-8">
<cfparam name="url.cat" default="">
<cfparam name="url.subCat" default="">
<cfparam name="url.prod" default="">
<cfinvoke
	component="#application.components#.queryController"
	method="prod"
	returnvariable="prod">
	<cfinvokeargument name="selectCat" value="#url.cat#">
	<cfinvokeargument name="selectSubCat" value="#url.subCat#">
	<cfinvokeargument name="selectProd" value="#url.prod#">
	<cfinvokeargument name="spanish" value="true">
</cfinvoke>
<cfif prod.recordcount lt 1>
	<cflog file="404" text="Page: #cgi.script_name# | Cat Var: #url.cat# | Subcat Var: #url.subCat# | Prod Var: #url.prod#">
	<cflocation url="404.cfm" addToken="no">
</cfif>
<cfinvoke
	component="#application.components#.queryController"
	method="prodImg"
	returnvariable="img">
	<cfinvokeargument name="selectImg" value="#prod.id#">
	<cfinvokeargument name="spanish" value="true">
</cfinvoke>
<!DOCTYPE html>
<html>
<head>
	<cfoutput query="prod">
		<title>VAC-U-MAX | <cfif not FindNoCase('<br class="visible-desktop">', prod.c_title)>#prod.c_title# | </cfif>#prod.p_title#</title>
		<meta name="description" content="#prod.p_meta#">
		<cfinclude template="../inc/head.cfm">
		<link rel="stylesheet" href="#application.css#jquery.fancybox.css?v=2.1.4" type="text/css" media="screen">
		<link rel="stylesheet" href="#application.css#jquery.fancybox-buttons.css?v=1.0.5" type="text/css" media="screen">
	</cfoutput>
</head>

<body>
	<cfinclude template="inc/top.cfm">

    <div id="homeCon" class="container">
		<div class="conIndent">
			<div class="row-fluid">
		    	<cfoutput query="prod">
			    	<div id="inBan#prod.c_header#" class="inBanner">
			    		<h1>#prod.c_title#</h1>
			    		<div class="clearfix"></div>
			    	</div><!--- inBanner --->
		    	</cfoutput>
			</div><!--- row-fluid --->

	    	<div class="row-fluid">
	    		<cfinclude template="inc/sideNav.cfm">

	    		<div id="prodCon" class="span9 well">
	    			<div class="colRight pull-right">
	    				<cfif url.prod eq "pulsonic-bin-activators">
		    				<a href="quotePulsonic.cfm?prod=<cfoutput query='prod'>#prod.p_url#</cfoutput>" class="quoteBtn">Solicitud de cotización <span>»</span></a>
		    			<cfelseif url.prod eq "aero-mechanical-conveyors">
		    				<a href="quoteAerocon.cfm?prod=<cfoutput query='prod'>#prod.p_url#</cfoutput>" class="quoteBtn">Solicitud de cotización <span>»</span></a>
		    			<cfelseif url.prod eq "flexible-screw-conveyors">
		    				<a href="quoteFlexibleScrew.cfm?prod=<cfoutput query='prod'>#prod.p_url#</cfoutput>" class="quoteBtn">Solicitud de cotización <span>»</span></a>
		    			<cfelse>
		    				<a href="quotePneumatic.cfm?prod=<cfoutput query='prod'>#prod.p_url#</cfoutput>" class="quoteBtn">Solicitud de cotización <span>»</span></a>
		    			</cfif>

		    			<cfoutput query="img">
			    			<cfif img.i_diagram eq 0 AND img.currentrow eq 1>
				    			<a class="fancybox-button disImg" rel="fancybox-button" href="#application.root#prodImg/#img.i_file#" title="#img.i_cap#">
			    					<div id="zoom" class="btn"><i class="icon-zoom-in"></i></div>
									<img src="#application.root#prodImg/#img.i_file#" alt="#img.i_alt#">
									<cfif img.currentrow eq 1 AND img.i_cap neq ""><p><em>#img.i_cap#</em></p></cfif>
								</a>

							<cfelseif img.i_diagram eq 0 AND img.currentrow gt 1 AND img.currentrow lte 7>

								<a class="fancybox-button disImgSm" rel="fancybox-button" href="#application.root#prodImg/#img.i_file#" title="#img.i_cap#">
									<img src="#application.root#prodImg/#img.i_file#" alt="#img.i_alt#">
								</a>
								<cfif img.currentrow eq 4><div class="clearfix"></div></cfif>

							<cfelse>

								<a class="fancybox-button hide" rel="fancybox-button" href="#application.root#prodImg/#img.i_file#" title="#img.i_cap#">
									<img src="#application.root#prodImg/#img.i_file#" alt="#img.i_alt#">
								</a>
							</cfif>
						</cfoutput>
	    			</div>

	    			<cfoutput query="prod">
	    				<h2>#prod.p_title#</h2>
						<cfif prod.p_subTitle neq ""><h4 class="subTitle">#prod.p_subTitle#</h4></cfif>
						<cfif prod.p_desc neq ""><p>#prod.p_desc#</p></cfif>

						<cfif prod.p_feat neq "">
							<h3>Características</h3>
							<p>#prod.p_feat#</p>
	    				</cfif>

	    				<cfif prod.p_specs neq "">
							<h3>Especificaciones</h3>
							<p>#prod.p_specs#</p>
	    				</cfif>
	    			</cfoutput>

	    			<cfoutput query="img" group="i_diagram">
		    			<cfif img.i_diagram eq 1><h3>Diagramas</h3></cfif>
		    		</cfoutput>

		    		<cfoutput query="img">
			    		<cfif img.i_diagram eq 1><img src="#application.root#prodImg/#img.i_file#" alt="#img.i_alt#"></cfif>
			    		<cfif img.i_diagram eq 1 AND img.i_cap neq ""><p class="cap"><em>#img.i_cap#</em></p></cfif>
			    	</cfoutput>
	    		</div>
	    	</div><!--- row-fluid--->
		</div><!--- conIndent --->
    </div><!--- container --->

    <cfinclude template="inc/footer.cfm">
    <cfinclude template="../inc/scripts.cfm">
    <cfoutput>
		<script src="#application.js#jquery.mousewheel-3.0.6.pack.js"></script>
		<script src="#application.js#jquery.fancybox.pack.js?v=2.1.4"></script>
		<script src="#application.js#jquery.fancybox-buttons.js?v=1.0.5"></script>
		<script src="#application.js#jquery.fancybox-media.js?v=1.0.5"></script>
    </cfoutput>
	<script>
		$(document).ready(function() {
			$(".fancybox-button").fancybox({
				prevEffect		: 'none',
				nextEffect		: 'none',
				closeBtn		: false,
				helpers		: {
					title	: { type : 'inside' },
					buttons	: {}
				}
			});
		});
	</script>
</body>
</html>
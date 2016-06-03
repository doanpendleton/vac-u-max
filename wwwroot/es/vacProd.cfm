<cfprocessingdirective pageEncoding="utf-8">
<cfparam name="url.cat" default="">
<cfparam name="url.subCat" default="">
<cfparam name="url.prod" default="">
<cfinvoke
	component="#application.components#.queryController"
	method="vac"
	returnvariable="vac">
	<cfinvokeargument name="selectCat" value="#url.cat#">
	<cfinvokeargument name="selectSubCat" value="#url.subCat#">
	<cfinvokeargument name="selectProd" value="#url.prod#">
	<cfinvokeargument name="spanish" value="true">
</cfinvoke>
<cfif vac.recordcount lt 1>
	<cflog file="404" text="Page: #cgi.script_name# | Cat Var: #url.cat# | Subcat Var: #url.subCat# | Prod Var: #url.prod#"> <cflocation url="404.cfm" addToken="no">
</cfif>
<cfinvoke
	component="#application.components#.queryController"
	method="vacAcc"
	returnvariable="acc">
	<cfinvokeargument name="selectAcc" value="#vac.v_id#">
	<cfinvokeargument name="spanish" value="true">
</cfinvoke>
<!DOCTYPE html>
<html>
<head>
	<cfoutput query="vac">
		<title>VAC-U-MAX | #vac.c_title# | #vac.v_title#</title>
		<meta name="description" content="#vac.v_meta#">
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
		    	<cfoutput query="vac">
			    	<div id="inBan#vac.c_header#" class="inBanner">
			    		<h1>#vac.c_title#</h1>
			    		<div class="clearfix"></div>
			    	</div><!--- inBanner --->
		    	</cfoutput>
			</div><!--- row-fluid --->

	    	<div class="row-fluid">
	    		<cfinclude template="inc/sideVac.cfm">

	    		<div id="prodCon" class="span9 well">
	    			<div class="colRight pull-right">
	    				<cfoutput query="vac">
		    				<cfif url.prod eq "MDL1040" OR url.prod eq "MDL2120">
			    				<a href="quoteVacuumSystems.cfm?prod=#vac.v_item#" class="quoteBtn">Solicitud de cotización <span>»</span></a>
			    			<cfelse>
			    				<a href="quoteVacuum.cfm?prod=#vac.v_item#" class="quoteBtn">Solicitud de cotización <span>»</span></a>
			    			</cfif>

			    			<cfif vac.v_imgFile neq "">
				    			<a class="fancybox-button<cfif vac.IsFirst()> disImg</cfif>" rel="fancybox-button" href="prodImg/#vac.v_imgFile#" title="#vac.v_item#">
			    					<div id="zoom" class="btn"><i class="icon-zoom-in"></i></div>
									<img src="prodImg/#vac.v_imgFile#" alt="#vac.v_item#" width="250">
								</a>
							</cfif>
						</cfoutput>

						<cfif acc.recordcount neq 0>
							<div id="access">
			    				<h2>Accesorios</h2>

			    				<table class="table table-bordered">
						    	<cfoutput query="acc">
			    					<tr>
						    			<td>
						    				<cfif acc.a_imgFile neq ""><img src="prodImg/#acc.a_imgFile#" alt="#acc.a_item#" width="75" class="pull-left"></cfif>
						    				<h3>#acc.a_title#</h3>
						    				<p><strong>Item ##: #acc.a_item#</strong></p>
						    				<p>#acc.a_desc#</p>
						    			</td>
			    					</tr>
						    	</cfoutput>
			    				</table>
							</div>
						</cfif>
	    			</div>

	    			<cfoutput query="vac">
	    				<h2>#vac.v_title#</h2>
						<h4 class="subTitle">Item ##: #vac.v_item#</h4>

						<cfif vac.v_desc neq "">#vac.v_desc#</cfif> <cfif vac.v_stan neq "">
							<h3>Equipo de serie</h3>
							<p>#vac.v_stan#</p>
	    				</cfif>

	    				<cfif vac.v_tech neq "">
							<h3>Datos técnicos</h3>
							<p>#vac.v_tech#</p>
	    				</cfif>

	    				<cfif vac.v_desc2 neq "">
							<p>#vac.v_desc2#</p>
	    				</cfif>
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
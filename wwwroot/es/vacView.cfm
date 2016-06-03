<cfprocessingdirective pageEncoding="utf-8">
<cfinclude template="../inc/FullLeft.cfm">
<cfparam name="url.cat" default="">
<cfparam name="url.subCat" default="">
<cfinvoke
	component="#application.components#.queryController"
	method="vacOver"
	returnvariable="vacOver">
	<cfinvokeargument name="selectCat" value="#url.cat#">
	<cfinvokeargument name="selectSubCat" value="#url.subCat#">
	<cfinvokeargument name="spanish" value="true">
</cfinvoke>
<cfif vacOver.recordcount lt 1>
	<cflog file="404" text="Page: #cgi.script_name# | Cat Var: #url.cat# | Subcat Var: #url.subCat#">
	<cflocation url="404.cfm" addToken="no">
</cfif>
<!DOCTYPE html>
<html>
<head>
	<cfoutput query="vacOver" maxRows="1">
		<title>VAC-U-MAX | #vacOver.c_title#</title>
		<meta name="description" content="#vacOver.c_meta#">
		<cfinclude template="../inc/head.cfm">
		<link href="#application.css#jquery.fancybox.css?v=2.1.4" rel="stylesheet" type="text/css" media="screen">
		<link href="#application.css#jquery.fancybox-buttons.css?v=1.0.5" rel="stylesheet" type="text/css" media="screen">
	</cfoutput>
</head>

<body>
	<cfinclude template="inc/top.cfm">

    <div id="homeCon" class="container">
		<div class="conIndent">
			<div class="row-fluid">
				<cfoutput query="vacOver" maxRows="1">
			    	<div id="inBan#vacOver.c_header#" class="inBanner">
			    		<h1>#vacOver.c_title#</h1>
			    		<div class="clearfix"></div>
			    	</div><!--- inBanner --->
			    </cfoutput>
			</div><!--- row-fluid --->

	    	<div class="row-fluid">
	    		<cfinclude template="inc/sideVac.cfm">

	    		<div id="prodCon" class="span9 well">
	    			<cfoutput query="vacOver" group="c_title">
		    			<cfif url.cat eq "central-vacuum-systems" || url.subCat eq "custom-engineered-central-vacuum-cleaning-systems" || url.subcat eq "pre-engineered-systems-for-1-3-operators">
			    			<a href="quoteVacuumSystems.cfm" class="quoteBtn pull-right">Solicitud de cotización <span>»</span></a>
			    		<cfelse>
			    			<a href="quoteVacuum.cfm" class="quoteBtn pull-right">Solicitud de cotización <span>»</span></a>
			    		</cfif>

	    				<h2>#vacOver.c_title#</h2>

	    				#vacOver.c_desc#

	    				<table class="table table-bordered" id="overview">
	    					<tr>
				    			<cfoutput>
		    						<td class="gradient">
					    				<a href="vacProd.cfm?<cfif url.cat neq "">cat<cfelse>subCat</cfif>=#vacOver.c_url#&prod=#URLEncodedFormat(vacOver.v_item)#">
						    				<cfif vacOver.v_item eq "MDL2120"><h2 class="spT">Sistemas de limpieza mediante aspiración centralizada con diseño personalizado</h2></cfif>
						    				<cfif vacOver.v_item eq "MDL1040"><h2 class="spT">Sistemas prediseñados para 1 a 3 operadores</h2></cfif>
						    				<cfif vacOver.v_imgFile neq ""><img src="#application.root#prodImg/#vacOver.v_imgFile#" alt="#vacOver.v_item#" class="pull-left"></cfif>
						    				<h3 class="title">#vacOver.v_title#</h3>
						    				<h4 class="subT"><strong>Item ##:</strong> #vacOver.v_item#</h4>
											<span>#vacOver.v_descShort#</span>
										</a>
					    			</td>
									<cfif vacOver.currentrow mod 2 eq 0>
										</tr>
										<tr>
									<cfelseif vacOver.currentrow mod 2 eq 1 AND vacOver.IsLast()>
					    					<td>&nbsp;</td>
					    				</tr>
										<tr>
									</cfif>
								</cfoutput>
	    					</tr>
	    				</table>
	    			</cfoutput>
	    		</div>
	    	</div><!--- row-fluid--->
		</div><!--- conIndent --->
    </div><!--- container --->

    <cfinclude template="inc/footer.cfm">
    <cfinclude template="../inc/scripts.cfm">
</body>
</html>
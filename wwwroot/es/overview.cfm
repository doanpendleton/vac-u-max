<cfprocessingdirective pageEncoding="utf-8">
<cfinclude template="../inc/FullLeft.cfm">
<cfparam name="url.cat" default="">
<cfparam name="url.subCat" default="">
<cfinvoke
	component="#application.components#.queryController"
	method="over"
	returnvariable="over">
	<cfinvokeargument name="selectCat" value="#url.cat#">
	<cfinvokeargument name="selectSubCat" value="#url.subCat#">
	<cfinvokeargument name="spanish" value="true">
</cfinvoke>
<cfif over.recordcount lt 1>
	<cflog file="404" text="Page: #cgi.script_name# | Cat Var: #url.cat# | Subcat Var: #url.subCat#">
	<cflocation url="404.cfm" addToken="no">
</cfif>
<!DOCTYPE html>
<html>
<head>
	<cfoutput query="over" maxRows="1">
		<title>VAC-U-MAX | #over.c_title#</title>
		<meta name="description" content="#over.c_meta#">
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
				<cfoutput query="over" maxRows="1">
			    	<div id="inBan#over.c_header#" class="inBanner">
			    		<h1>#over.c_title#</h1>
			    		<div class="clearfix"></div>
			    	</div><!--- inBanner --->
		    	</cfoutput>
			</div><!--- row-fluid --->

	    	<div class="row-fluid">
	    		<cfinclude template="inc/sideNav.cfm">

	    		<div id="prodCon" class="span9 well">
	    			<cfoutput query="over" group="c_title">
		    			<a href="quotePneumatic.cfm" class="quoteBtn pull-right">Solicitud de cotización <span>»</span></a>
	    				<h2>#over.c_title#</h2>

	    				#over.c_desc#

	    				<table class="table table-bordered" id="overview">
	    					<tr>
			    				<cfoutput>
	    							<td class="gradient">
	    								<cfinvoke
											component="#application.components#.queryController"
											method="overImg"
											returnvariable="img">
											<cfinvokeargument name="selectImg" value="#over.id#">
											<cfinvokeargument name="spanish" value="true">
										</cfinvoke>
										<a href="product.cfm?<cfif url.cat neq "">cat<cfelse>subCat</cfif>=#over.c_url#&prod=#over.p_url#">
											<cfloop query="img">
												<cfif img.i_file neq ""><img src="#application.root#prodImg/#img.i_file#" alt="#img.i_alt#" class="pull-left"></cfif>
											</cfloop>
											<h3 class="title">#over.p_title#</h3>
											<span>#over.p_descShort#</span>
										</a>
				    				</td>
									<cfif over.currentrow mod 2 eq 0>
										</tr>
										<tr>
									<cfelseif over.currentrow mod 2 eq 1 AND over.IsLast()>
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
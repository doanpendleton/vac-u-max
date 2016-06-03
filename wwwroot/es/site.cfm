<cfprocessingdirective pageEncoding="utf-8">
<!DOCTYPE html>
<html>
<head>
	<title>VAC-U-MAX | Mapa del sitio</title>
	<meta name="description" content="">
	<cfinclude template="../inc/head.cfm">
</head>

<body>
	<cfinclude template="inc/top.cfm">

    <div id="homeCon" class="container">
		<div class="conIndent">
			<div class="row-fluid">
		    	<div id="inBan1" class="inBanner">
		    		<h1>Mapa del Sitio</h1>
		    		<div class="clearfix"></div>
		    	</div><!--- inBanner --->
			</div><!--- row-fluid --->

	    	<div class="row-fluid">
	    		<div id="prodCon" class="span9 well">
	    			<ul>
	    				<cfoutput>
	    					<li><a href="#application.esRoot#">Inicio</a></li>
							<li><a href="#application.esRoot#landingPneumatic.cfm">Sistemas de transporte neumático</a></li>
	    				</cfoutput>
	    				<ul>
	    					<cfinvoke
								component="#application.components#.queryController"
								method="sideNav"
								returnvariable="side">
								<cfinvokeargument name="spanish" value="true">
							</cfinvoke>
							<cfoutput query="side" group="c_title">
								<cfif side.c_direct eq 0>
									<li><a href="overview.cfm?cat=#side.c_url#">#side.c_title#</a></li>
									<cfinvoke
										component="#application.components#.queryController"
										method="over"
										returnvariable="over">
										<cfinvokeargument name="selectCat" value="#side.c_url#">
										<cfinvokeargument name="spanish" value="true">
									</cfinvoke>
									<ul>
										<ul>
											<cfloop query="over">
												<li><a href="product.cfm?cat=#side.c_url#&prod=#over.p_url#">#over.p_title#</a></li>
											</cfloop>
										</ul>
									</ul>
								<cfelse>
									<li><a href="product.cfm?cat=#side.c_url#&prod=#side.c_url#">#side.c_title#</a></li>
								</cfif>
								<ul>
									<cfoutput>
										<cfif side.s_title neq "" AND side.s_switch eq 1>
											<cfif side.s_direct eq 0>
												<li><a href="overview.cfm?subCat=#side.s_url#" class="subLink">#side.s_title#</a></li>
												<cfinvoke
													component="#application.components#.queryController"
													method="over"
													returnvariable="over">
													<cfinvokeargument name="selectSubCat" value="#side.s_url#">
													<cfinvokeargument name="spanish" value="true">
												</cfinvoke>
												<ul>
													<cfloop query="over">
														<li><a href="product.cfm?cat=#side.c_url#&prod=#over.p_url#">#over.p_title#</a></li>
													</cfloop>
												</ul>
											<cfelse>
												<li><a href="product.cfm?cat=#side.c_url#&prod=#side.s_url#" class="subLink">#side.s_title#</a></li>
											</cfif>
										</cfif>
									</cfoutput>
								</ul>
			    			</cfoutput>
	    				</ul>
	    				<ul>
	    					<cfinvoke
								component="#application.components#.queryController"
								method="sideVac"
								returnvariable="side">
								<cfinvokeargument name="spanish" value="true">
							</cfinvoke>
							<cfoutput query="side" group="c_title">
								<li><a href="vacView.cfm?cat=#side.c_url#">#side.c_title#</a></li>
								<cfinvoke
									component="#application.components#.queryController"
									method="vacOver"
									returnvariable="vacOver">
									<cfinvokeargument name="selectCat" value="#side.c_url#">
									<cfinvokeargument name="spanish" value="true">
								</cfinvoke>
								<ul>
									<ul>
										<cfloop query="vacOver">
											<li><a href="vacProd.cfm?cat=#side.c_url#&prod=#vacOver.v_item#">#vacOver.v_title# (#vacOver.v_item#)</a></li>
										</cfloop>
									</ul>
								</ul>
								<ul>
									<cfoutput>
										<cfif side.s_title neq "">
											<li><a href="vacView.cfm?subCat=#side.s_url#" class="subLink">#side.s_title#</a></li>
											<cfinvoke
												component="#application.components#.queryController"
												method="vacOver"
												returnvariable="vacOver">
												<cfinvokeargument name="selectSubCat" value="#side.s_url#">
												<cfinvokeargument name="spanish" value="true">
											</cfinvoke>
											<ul>
												<cfloop query="vacOver">
													<li><a href="vacProd.cfm?cat=#side.c_url#&prod=#vacOver.v_item#">#vacOver.v_title# (#vacOver.v_item#)</a></li>
												</cfloop>
											</ul>
										</cfif>
									</cfoutput>
				    			</ul>
			    			</cfoutput>
	    				</ul>
	    				<cfoutput>
		    				<li><a href="#application.esRoot#landingVacuum.cfm">Aspiradoras industriales</a></li>
		    				<li><a href="#application.esRoot#product.cfm?cat=aero-mechanical-conveyors&prod=aero-mechanical-conveyors">Transportadores aeromecánicos</a></li>
		    				<li><a href="#application.esRoot#product.cfm?cat=flexible-screw-conveyors&prod=flexible-screw-conveyors">Transportadores de tornillos flexibles</a></li>
		    				<li><a href="#application.esRoot#product.cfm?cat=pulsonic-bin-activators&prod=pulsonic-bin-activators">Activadores de recipiente Pulsonic</a></li>
		    				<li><a href="#application.esRoot#quotePneumatic.cfm">Solicitud de cotización de Sistemas de transporte neumático</a></li>
		    				<li><a href="#application.esRoot#quoteVacuum.cfm">Solicitud de cotización de Aspiradoras</a></li>
		    				<li><a href="#application.esRoot#quoteAerocon.cfm">Solicitud de cotización de Transportador aeromecánico</a></li>
		    				<li><a href="#application.esRoot#quoteFlexibleScrew.cfm">Solicitud de cotización de Transportadores de tornillos flexibles</a></li>
		    				<li><a href="#application.esRoot#quotePulsonic.cfm">Solicitud de cotización de Activadores de recipiente Pulsonic</a></li>
		    				<li><a href="#application.esRoot#corporate.cfm">Información empresarial</a></li>
		    				<li><a href="#application.esRoot#news.cfm">Noticias</a></li>
		    				<li><a href="#application.esRoot#case_histories.cfm">Casos reales</a></li>
		    				<li><a href="#application.esRoot#brochures.cfm">Folletos</a></li>
		    				<li><a href="#application.root#sales/sales.cfm">Ventas</a></li>
		    				<li><a href="#application.esRoot#contact.cfm">Contacto</a></li>
		    				<li><a href="#application.esRoot#terms.cfm">Términos y condiciones</a></li>
		    				<li><a href="#application.esRoot#privacy.cfm">Declaración de privacidad</a></li>
	    				</cfoutput>
	    			</ul>
	    		</div>

	    		<cfinclude template="inc/sideNews.cfm">
	    	</div><!--- row-fluid--->
		</div><!--- conIndent --->
    </div><!--- container --->

    <cfinclude template="inc/footer.cfm">
    <cfinclude template="../inc/scripts.cfm">
</body>
</html>
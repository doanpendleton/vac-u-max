<cfprocessingdirective pageEncoding="utf-8">
<!DOCTYPE html>
<html>
<head>
	<title>VAC-U-MAX | Site Map</title>
	<meta name="description" content="">
	<cfinclude template="inc/head.cfm">
</head>

<body>
	<cfinclude template="inc/top.cfm">

    <div id="homeCon" class="container">
		<div class="conIndent">
			<div class="row-fluid">
		    	<div id="inBan1" class="inBanner">
		    		<h1>Site Map</h1>
		    		<div class="clearfix"></div>
		    	</div><!--- inBanner --->
			</div><!--- row-fluid --->

	    	<div class="row-fluid">
	    		<div id="prodCon" class="span9 well">
	    			<ul>
	    				<cfoutput>
		    				<li><a href="#application.root#">Home</a></li>
		    				<li><a href="#application.root#landingPneumatic.cfm">Pneumatic Conveying Systems</a></li>
	    				</cfoutput>
	    				<ul>
	    					<cfinvoke
								component="#application.components#.queryController"
								method="sideNav"
								returnvariable="side">
							</cfinvoke>
							<cfoutput query="side" group="c_title">
								<cfif side.c_direct eq 0>
									<li><a href="overview.cfm?cat=#side.c_url#">#side.c_title#</a></li>
									<cfinvoke
										component="#application.components#.queryController"
										method="over"
										returnvariable="over">
										<cfinvokeargument name="selectCat" value="#side.c_url#">
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
							</cfinvoke>
							<cfoutput query="side" group="c_title">
								<li><a href="vacView.cfm?cat=#side.c_url#">#side.c_title#</a></li>
								<cfinvoke
									component="#application.components#.queryController"
									method="vacOver"
									returnvariable="vacOver">
									<cfinvokeargument name="selectCat" value="#side.c_url#">
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
		    				<li><a href="#application.root#landingVacuum.cfm">Industrial Vacuum Cleaners</a></li>
		    				<li><a href="#application.root#product.cfm?cat=aero-mechanical-conveyors&prod=aero-mechanical-conveyors">Aero-Mechanical Conveyors</a></li>
		    				<li><a href="#application.root#product.cfm?cat=flexible-screw-conveyors&prod=flexible-screw-conveyors">Flexible Screw Conveyors</a></li>
		    				<li><a href="#application.root#product.cfm?cat=pulsonic-bin-activators&prod=pulsonic-bin-activators">Pulsonic Bin Activators</a></li>
		    				<li><a href="#application.root#quotePneumatic.cfm">Pneumatic Conveying RFQ</a></li>
		    				<li><a href="#application.root#quoteVacuum.cfm">Vacuum Cleaning RFQ</a></li>
		    				<li><a href="#application.root#quoteAerocon.cfm">Aero-Mechanical Conveyor RFQ</a></li>
		    				<li><a href="#application.root#quoteFlexibleScrew.cfm">Flexible Screw Conveyors RFQ</a></li>
		    				<li><a href="#application.root#quotePulsonic.cfm">Pulsonic Bin Activators</a></li>
		    				<li><a href="#application.root#corporate.cfm">Corporate</a></li>
		    				<li><a href="#application.root#news.cfm">News</a></li>
		    				<li><a href="#application.root#case_histories.cfm">Case Histories</a></li>
		    				<li><a href="#application.root#brochures.cfm">Brochures</a></li>
		    				<li><a href="#application.root#sales/">Sales</a></li>
		    				<li><a href="#application.root#contact.cfm">Contact</a></li>
		    				<li><a href="#application.root#terms.cfm">Terms &amp; Conditions</a></li>
		    				<li><a href="#application.root#privacy.cfm">Privacy Statement</a></li>
	    				</cfoutput>
	    			</ul>
	    		</div>

	    		<cfinclude template="inc/sideNews.cfm">
	    	</div><!--- row-fluid--->
		</div><!--- conIndent --->
    </div><!--- container --->

    <cfinclude template="inc/footer.cfm">

	<cfinclude template="inc/scripts.cfm">
</body>
</html>
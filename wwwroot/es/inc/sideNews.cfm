				<cfinclude template="../../inc/FullLeft.cfm">
				<cfinvoke
					component="#application.components#.queryController"
					method="featCases"
					returnvariable="case">
					<cfinvokeargument name="spanish" value="true">
				</cfinvoke>
				<div id="cases" class="span3">
	    			<h3>Casos de Aplicación</h3>
	    			<cfoutput query="case" maxRows="3"><div class="study clearfix">
	    				<h5>#case.c_cat#</h5>
	    				<h4>#case.c_title#</h4>
	    				<cfset quote = case.c_summary>
	    				<cfif len(quote) gt 70>
						    <cfset trimmedQuote = fullLeft(quote, 70)>
						    <cfset trimmedQuote &= "...</p>">
						<cfelse>
						    <cfset trimmedQuote = quote>
						</cfif>
						#trimmedQuote#
	    				<div class="buttons pull-right"><div class="smallShadow pull-left"></div><a href="case_histories.cfm?case=#case.c_id#" class="pull-left gradient">Más Información <span>&raquo;</span></a></div>
	    			</div></cfoutput>

	    			<div id="caseNav">
		    			<div class="sideTitle lower">
							<h3>Líneas de Productos</h3>
						</div>

		    			<a href="overview.cfm?cat=products-by-application">Sistemas de transporte neumático VAC-U-MAX</a>
						<a href="product.cfm?cat=products-by-application&prod=pneumatic-conveying-batch-weigh-systems">Sistemas de transporte neumático de peso por lote</a>
						<a href="product.cfm?cat=products-by-application&prod=bulk-bag-unloader">Descargador de bolsas a granel</a>
						<a href="product.cfm?cat=components-and-accessories&prod=bulk-bag-loader">Cargadora de bolsas a granel</a>
						<a href="product.cfm?cat=components-and-accessories&prod=bag-dump-stations">Estaciones de descarga de bolsas</a>
						<a href="product.cfm?cat=components-and-accessories&prod=vac-u-max-bag-compactor">Compactador de bolsas</a>
						<a href="product.cfm?cat=flexible-screw-conveyors&prod=flexible-screw-conveyors">Transportadores con tornillos flexibles</a>
						<a href="product.cfm?cat=aero-mechanical-conveyors&prod=aero-mechanical-conveyors">Transportadores aeromecánicos</a>
						<a href="vacView.cfm?cat=general-purpose-industrial-vacuums">Industrial Vacuum Cleaners</a>
						<a href="vacView.cfm?cat=central-vacuum-systems">Central Vacuum Systems</a>
	    			</div>
	    		</div>
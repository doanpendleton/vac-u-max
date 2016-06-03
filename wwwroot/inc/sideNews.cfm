				<cfinclude template="FullLeft.cfm">
				<cfinvoke
					component="#application.components#.queryController"
					method="featCases"
					returnvariable="case">
				</cfinvoke>
				<div id="cases" class="span3">
	    			<h3>Application Stories</h3>
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
	    				<div class="buttons pull-right"><div class="smallShadow pull-left"></div><a href="case_histories.cfm?case=#case.c_id#" class="pull-left gradient">Read More <span>&raquo;</span></a></div>
	    			</div></cfoutput>

	    			<div id="caseNav">
		    			<div class="sideTitle lower">
							<h3>Product Lines</h3>
						</div>

		    			<a href="overview.cfm?cat=products-by-application">VAC-U-MAX Pneumatic Conveying Systems</a>
						<a href="product.cfm?cat=products-by-application&prod=pneumatic-conveying-batch-weigh-systems">Batch Weighing Systems</a>
						<a href="product.cfm?cat=products-by-application&prod=bulk-bag-unloader">Bulk Bag Unloader</a>
						<a href="product.cfm?cat=components-and-accessories&prod=bulk-bag-loader">Bulk Bag Loader</a>
						<a href="product.cfm?cat=components-and-accessories&prod=bag-dump-stations">Bag Dump Stations</a>
						<a href="product.cfm?cat=components-and-accessories&prod=vac-u-max-bag-compactor">Bag Compactors</a>
						<a href="product.cfm?cat=flexible-screw-conveyors&prod=flexible-screw-conveyors">Flexible Screw Conveyors</a>
						<a href="product.cfm?cat=aero-mechanical-conveyors&prod=aero-mechanical-conveyors">Aero-Mechanical Conveyors</a>
						<a href="vacView.cfm?cat=general-purpose-industrial-vacuums">Industrial Vacuum Cleaners</a>
						<a href="vacView.cfm?cat=central-vacuum-systems">Central Vacuum Systems</a>
	    			</div>
	    		</div>
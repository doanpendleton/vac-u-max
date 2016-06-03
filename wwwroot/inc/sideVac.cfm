				<cfinvoke 
					component="#application.components#.queryController" 
					method="sideVac" 
					returnvariable="side">
				</cfinvoke>
				<div class="span3 hidden-phone">
					<div id="phone">
						<img src="img/phone.png" alt="phone" width="32" height="32">
						<p>Contact us now.</p>
						<h4>973-759-4600</h4>
					</div>
						
					<div id="sideNav">
						<div class="sideTitle">
							<h3>Categories</h3>
						</div>
						
		    			<cfoutput query="side" group="c_title">
						<a href="vacView.cfm?cat=#side.c_url#">#side.c_title#</a>
							<cfoutput>
							<cfif side.s_title neq "">
								<a href="vacView.cfm?subCat=#side.s_url#" class="subLink"><span>&raquo;</span> #side.s_title#</a>
							</cfif>
							</cfoutput>
		    			</cfoutput>
		    			
		    			<div class="sideTitle lower">
							<h3>Product Lines</h3>
						</div>
		    			<a href="overview.cfm?cat=products-by-application">VAC-U-MAX Pneumatic Conveying Systems</a>
						<a href="product.cfm?cat=products-by-application&prod=batch-weighing-systems">Batch Weighing Systems</a>
						<a href="product.cfm?cat=products-by-application&prod=bulk-bag-unloader">Bulk Bag Unloader</a>
						<a href="product.cfm?cat=components-and-accessories&prod=bulk-bag-loader">Bulk Bag Loader</a>
						<a href="product.cfm?cat=components-and-accessories&prod=bag-dump-stations">Bag Dump Stations</a>
						<a href="product.cfm?cat=components-and-accessories&prod=bag-compactors">Bag Compactors</a>
						<a href="product.cfm?cat=flexible-screw-conveyors&prod=flexible-screw-conveyors">Flexible Screw Conveyors</a>
						<a href="product.cfm?cat=aero-mechanical-conveyors&prod=aero-mechanical-conveyors">Aero-Mechanical Conveyors</a>
						<a href="vacView.cfm?cat=general-purpose-industrial-vacuums">Industrial Vacuum Cleaners</a>
						<a href="vacView.cfm?cat=central-vacuum-systems">Central Vacuum Systems</a>
					</div><!--- sideNav --->
				</div>
				
				<div id="sideNavPhone" class="span3 visible-phone">
					<div class="accordion" id="sideNavPhone">
						<div class="accordion-group">
							<div class="accordion-heading">
								<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
									<span class="arrow pull-right"></span>
									<h3>Categories</h3>
								</a>
							</div>
							
							<div id="collapseOne" class="accordion-body collapse">
								<div class="accordion-inner">
									<cfoutput query="side" group="c_title">
									<a href="vacView.cfm?cat=#side.c_url#">#side.c_title#</a>
										<cfoutput>
										<cfif side.s_title neq "">
											<a href="vacView.cfm?cat=#side.s_url#" class="subLink"><span>&raquo;</span> #side.s_title#</a>
										</cfif>
										</cfoutput>
					    			</cfoutput>
					    			
					    			<div class="sideTitle lower">
										<h3>Product Lines</h3>
									</div>
					    			<a href="overview.cfm?cat=products-by-application">Products by Application</a>
									<a href="product.cfm?cat=products-by-application&prod=batch-weighing-systems">Batch Weighing Systems</a>
									<a href="product.cfm?cat=products-by-application&prod=bulk-bag-unloader">Bulk Bag Unloader</a>
									<a href="product.cfm?cat=products-by-application&prod=bulk-bag-loader">Bulk Bag Loader</a>
									<a href="product.cfm?cat=components-and-accessories&prod=bag-dump-stations">Bag Dump Stations</a>
									<a href="product.cfm?cat=components-and-accessories&prod=bag-compactors">Bag Compactors</a>
									<a href="product.cfm?cat=flexible-screw-conveyors&prod=flexible-screw-conveyors">Flexible Screw Conveyors</a>
									<a href="product.cfm?cat=aero-mechanical-conveyors&prod=aero-mechanical-conveyors">Aero-Mechanical Conveyors</a>
									<a href="vacView.cfm?cat=general-purpose-industrial-vacuums">Industrial Vacuum Cleaners</a>
									<a href="vacView.cfm?cat=central-vacuum-systems">Central Vacuum Systems</a>
								</div>
							</div>
						</div>
					</div>
				</div><!--- sideNav --->
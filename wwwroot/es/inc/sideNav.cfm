				<cfinvoke
					component="#application.components#.queryController"
					method="sideNav"
					returnvariable="side">
					<cfinvokeargument name="spanish" value="true">
				</cfinvoke>
				<div class="span3 hidden-phone">
					<div id="phone">
						<img src="../img/phone.png" alt="phone" width="32" height="32">
						<p>Contacte con nosotros ahora.</p>
						<h4>973-759-4600</h4>
					</div>
					<div id="phone">

						<h4 style="margin-left: 7px;margin-bottom: 3px;margin-top: 3px;"><a href="quotePneumatic.cfm" style="color: white;">Solicitud de cotización &raquo;</a></h4>

					</div>

					<div id="sideNav">
						<div class="sideTitle">
							<h3>Categorías</h3>
						</div>

		    			<cfoutput query="side" group="c_title">
						<cfif side.c_direct eq 0><a href="overview.cfm?cat=#side.c_url#">#side.c_title#</a><cfelse><a href="product.cfm?cat=#side.c_url#&prod=#side.c_url#">#side.c_title#</a></cfif>
							<cfoutput>
							<cfif side.s_title neq "" AND side.s_switch eq 1>
							<cfif side.s_direct eq 0>
								<a href="overview.cfm?subCat=#side.s_url#" class="subLink"><span>&raquo;</span> #side.s_title#</a>
							<cfelse>
								<a href="product.cfm?cat=#side.c_url#&prod=#side.s_url#" class="subLink"><span>&raquo;</span> #side.s_title#</a>
							</cfif>
							</cfif>
							</cfoutput>
		    			</cfoutput>

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
					</div><!--- sideNav --->
				</div>

				<div id="sideNavPhone" class="span3 visible-phone">
					<div class="accordion">
						<div class="accordion-group">
							<div class="accordion-heading">
								<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
									<span class="arrow pull-right"></span>
									<h3>Categorías</h3>
								</a>
							</div>

							<div id="collapseOne" class="accordion-body collapse">
								<div class="accordion-inner">
									<cfoutput query="side" group="c_title">
									<cfif side.c_direct eq 0>
									<a href="overview.cfm?cat=#side.c_url#">#side.c_title#</a><cfelse><a href="product.cfm?cat=#side.c_url#&prod=#side.c_url#">#side.c_title#</a>
									</cfif>
										<cfoutput>
										<cfif side.s_title neq "" AND side.s_switch eq 1>
										<cfif side.s_direct eq 0>
											<a href="overview.cfm?cat=#side.s_url#" class="subLink"><span>&raquo;</span> #side.s_title#</a>
										<cfelse>
											<a href="product.cfm?cat=#side.c_url#&prod=#side.s_url#" class="subLink"><span>&raquo;</span> #side.s_title#</a>
										</cfif>
										</cfif>
										</cfoutput>
					    			</cfoutput>

					    			<div class="sideTitle low">
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
						</div>
					</div>
				</div><!--- sideNav --->
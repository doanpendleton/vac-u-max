	<cfinvoke
		component="#application.components#.queryController"
		method="prodNav"
		returnvariable="nav">
		<cfinvokeargument name="spanish" value="true">
	</cfinvoke>
	<cfparam name="cat" default="">
	<div id="header" class="gradient">
		<div id="headAccent" class="gradient"></div>
		<div id="headCon" class="container">
			<div id="headFade" class="conIndent">
				<div id="lang" class="pull-right">
					<div class="btn-group">
						<button type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
							Idioma <span class="caret"></span>
						</button>
						<ul class="dropdown-menu" role="menu">
							<li><a href="<cfoutput>#replace(cgi.script_name, '/es', '')#</cfoutput>">English</a></li>
							<li><span>Español</span></li>
						</ul>
					</div>
				</div>
				<a href="https://twitter.com/vac_max" target="_blank" class="social twitter pull-right"></a>
				<a href="https://www.linkedin.com/company/vac-u-max" target="_blank" class="social linkedin pull-right"></a>

				<div class="row-fluid">
					<div class="span4"><a href="<cfoutput>#application.esRoot#</cfoutput>" id="logo"></a></div>

					<div class="span8">
						<div id="phNum" class="span4 offset8">
							<h1 class="hidden-phone">973-759-4600</h1>
							<h1 class="visible-phone"><a href="tel:973-759-4600">973-759-4600</a></h1>
						</div>

						<div id="searchBox" class="pull-right">
							<form action="<cfoutput>#application.esRoot#</cfoutput>searchresults.cfm" method="post" name="sitesearch">
								<input name="search" type="text" id="search">
								<input type="submit" name="go" id="go" value="Búsqueda">
							</form>
						</div>

						<div class="clearfix"></div>
						<div id="mainNav">
							<ul id="topMenu" class="sm nav nav-pills pull-right">
								<cfoutput>
								    <li><a href="#application.esRoot#">Inicio</a></li>
								    <li><a href="#application.esRoot#corporate.cfm">Corporativo</a></li>
								    <li><a href="#application.esRoot#news.cfm">Noticias</a>
								    	<ul>
									    	<li><a href="#application.esRoot#news.cfm">Noticias</a>
									    	<li><a href="#application.esRoot#events.cfm">Exposiciones &amp; Eventos</a>
								    	</ul>
								    </li>
								    <li><a href="#application.esRoot#case_histories.cfm">Casos de Aplicación</a></li>
								    <li><a href="#application.esRoot#brochures.cfm">Folletos</a></li>
								    <li><a href="#application.esRoot#contact.cfm">Contacto</a></li>
								</cfoutput>
						    </ul>
						</div>
					</div>
				</div>
			</div><!--- conIndent --->
		</div><!--- container --->
	</div><!--- header row-fluid --->

	<div id="prodNav" class="container">
    	<div class="navbar  gradient">
	    	<div class="navbar-inner  gradient">

			    <!-- .btn-navbar is used as the toggle for collapsed navbar content -->
			    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
			    	<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
			    </a>

			    <!-- Everything you want hidden at 940px or less, place within here -->
			    <div class="nav-collapse collapse">
		    	    <ul class="nav text-center">
						<cfoutput query="nav">
							<cfif nav.c_direct eq 1 AND nav.ownerID eq "">
								<li><a href="product.cfm?cat=#nav.c_url#&prod=#nav.c_url#">#nav.c_title#</a></li>
								<li class="divider-vert visible-desktop"></li>
								<li class="divider hidden-desktop"></li>
							<cfelseif nav.ownerID eq "">
								<cfset cat = nav.c_id>
								<li><a href="#application.esRoot#<cfif cat eq 1>landingPneumatic.cfm<cfelseif cat eq 2>landingVacuum.cfm</cfif>">#nav.c_title#</a></li>
								<cfif nav.c_url neq "pulsonic-bin-activators">
									<li class="divider-vert visible-desktop"></li>
									<li class="divider hidden-desktop"></li>
								</cfif>
							</cfif>
						</cfoutput>
					</ul>
			    </div>

		    </div>
	    </div><!--- navbar --->
    </div><!--- container --->
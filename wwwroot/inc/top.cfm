	<cfinvoke
		component="#application.components#.queryController"
		method="prodNav"
		returnvariable="nav">
	</cfinvoke>
	<cfparam name="cat" default="">
	<div id="header" class="gradient">
		<div id="headAccent" class="gradient"></div>
		<div id="headCon" class="container">
			<div id="headFade" class="conIndent">
				<div id="lang" class="pull-right">
					<div class="btn-group">
						<button type="button" class="btn btn-sm dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
							Language <span class="caret"></span>
						</button>
						<ul class="dropdown-menu dropdown-menu-left" role="menu">
							<li><span>English</span></li>
							<li><a href="/es<cfoutput>#cgi.script_name#</cfoutput>">Español</a></li>
						</ul>
					</div>
				</div>
				<a href="https://twitter.com/vac_max" target="_blank" class="social twitter pull-right"></a>
				<a href="https://www.linkedin.com/company/vac-u-max" target="_blank" class="social linkedin pull-right"></a>

				<div class="row-fluid">
					<div class="span4"><a href="<cfoutput>#application.root#</cfoutput>" id="logo"></a></div>

					<div class="span8">
						<div id="phNum" class="span4 offset8">
							<h1 class="hidden-phone">973-759-4600</h1>
							<h1 class="visible-phone"><a href="tel:973-759-4600">973-759-4600</a></h1>
						</div>

						<div id="searchBox" class="pull-right">
							<form action="<cfoutput>#application.root#</cfoutput>searchresults.cfm" method="post" name="sitesearch">
								<input name="search" type="text" id="search">
								<input type="submit" name="go" id="go" value="Search">
							</form>
						</div>

						<div class="clearfix"></div>
						<div id="mainNav">
							<ul id="topMenu" class="sm nav nav-pills pull-right">
								<cfoutput>
								    <li><a href="#application.root#">Home</a></li>
								    <li><a href="#application.root#corporate.cfm">Corporate</a></li>
								    <li><a href="#application.root#news.cfm">News</a>
								    	<ul>
									    	<li><a href="#application.root#news.cfm">News</a>
									    	<li><a href="#application.root#events.cfm">Trade Shows &amp; Events</a>
								    	</ul>
								    </li>
								    <li><a href="#application.root#case_histories.cfm">Application Stories</a></li>
								    <li><a href="#application.root#brochures.cfm">Brochures</a></li>
								    <li><a href="#application.root#reps.cfm">Find My Rep</a></li>
								    <li><a href="#application.root#contact.cfm">Contact Us</a></li>
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
						<li><a href="#application.root#<cfif cat eq 1>landingPneumatic.cfm<cfelseif cat eq 2>landingVacuum.cfm</cfif>">#nav.c_title#</a></li>
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
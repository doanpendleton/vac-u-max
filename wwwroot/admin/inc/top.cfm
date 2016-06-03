	<div id="header" class="gradient">
		<div class="container gradient">
			<div id="headFade" class="conIndent">
				<div class="row-fluid">
					<div class="span12"><a href="<cfoutput>#application.root#</cfoutput>admin/" id="logo"></a></div>
				</div><!--- row-fluid --->
			</div><!--- conIndent --->
		</div><!--- container --->
	</div><!--- header row-fluid --->

	<div class="container">
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
						<cfoutput>
						<li><a href="#application.root#admin">Users</a></li>
						<li class="divider-vert visible-desktop"></li>
						<li class="divider hidden-desktop"></li>

						<li class="dropdown">
							<a href="##" class="dropdown-toggle" data-toggle="dropdown">Pneumatic <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="pneuCat.cfm">Categories</a></li>
								<li><a href="pneuSubCat.cfm">Subcategories</a></li>
								<li><a href="pneumatic.cfm">Products</a></li>
							</ul>
						</li>
						<li class="divider-vert visible-desktop"></li>
						<li class="divider hidden-desktop"></li>

						<li class="dropdown">
							<a href="##" class="dropdown-toggle" data-toggle="dropdown">Vacuum <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="vacCat.cfm">Categories</a></li>
								<li><a href="vacSubCat.cfm">Subcategories</a></li>
								<li><a href="vacuum.cfm">Products</a></li>
								<li><a href="vacAcc.cfm">Accessories</a></li>
							</ul>
						</li>
						<li class="divider-vert visible-desktop"></li>
						<li class="divider hidden-desktop"></li>

						<li class="dropdown">
							<a href="##" class="dropdown-toggle" data-toggle="dropdown">RFQ <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="rfqPneu.cfm">Pneumatic</a></li>
								<li><a href="rfqVac.cfm">Vacuum</a></li>
								<li><a href="rfqVacSys.cfm">Vacuum Cleaning Systems</a></li>
								<li><a href="rfqAero.cfm">Aero-Mechanical</a></li>
								<li><a href="rfqFlex.cfm">Flexible Screw</a></li>
								<li><a href="rfqPuls.cfm">Pulsonic</a></li>
								<li><a href="rfqGen.cfm">General Contact</a></li>
								<li><a href="rfqQuick.cfm">Quick Quote</a></li>
							</ul>
						</li>
						<li class="divider-vert visible-desktop"></li>
						<li class="divider hidden-desktop"></li>

						<li><a href="cases.cfm">Application Stories</a></li>
						<li class="divider-vert visible-desktop"></li>
						<li class="divider hidden-desktop"></li>

						<li><a href="brochures.cfm">Brochures</a></li>
						<li class="divider-vert visible-desktop"></li>
						<li class="divider hidden-desktop"></li>

						<li><a href="news.cfm">News</a></li>
						<li class="divider-vert visible-desktop"></li>
						<li class="divider hidden-desktop"></li>

						<li><a href="events.cfm">Events</a></li>
						<li class="divider-vert visible-desktop"></li>
						<li class="divider hidden-desktop"></li>

						<li><a href="logout.cfm">Logout</a></li>
						<li class="divider-vert visible-desktop"></li>
						<li class="divider hidden-desktop"></li>
						</cfoutput>
					</ul>
			    </div>

		    </div>
	    </div><!--- navbar --->
    </div><!--- container --->
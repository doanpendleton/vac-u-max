<cfprocessingdirective pageEncoding="utf-8">
<cfinclude template="inc/FullLeft.cfm">
<cfinvoke
	component="#application.components#.queryController"
	method="featCases"
	returnvariable="case">
</cfinvoke>
<!DOCTYPE html>
<html>
<head>
	<title>VAC-U-MAX</title>
	<meta name="description" content="">
	<cfinclude template="inc/head.cfm">
</head>

<body>
	<cfinclude template="inc/top.cfm">

    <div id="homeCon" class="container">
		<div class="conIndent">
	    	<div id="myCarousel" class="carousel slide">
			    <!-- Carousel items -->
			    <div class="carousel-inner">
			    	<div class="active item">
				    	<img src="img/banner01.jpg" alt="banner01" width="995" height="370">
			    	</div>
			    	<div class="item">
				    	<img src="img/banner02.jpg" alt="banner02" width="995" height="370">
			    	</div>
			    	<div class="item">
				    	<img src="img/banner03.jpg" alt="banner03" width="995" height="370">
			    	</div>
                    <div class="item">
				    	<img src="img/banner04.jpg" alt="banner04" width="995" height="370">
		    	  </div>
			    </div>
	    	</div><!--- carousel --->

	    	<div class="row-fluid">
	    		<div id="tabbed" class="span7">
	    			<h3>A pioneer in vacuum pneumatic conveying, <nobr>VAC-U-MAX</nobr> specializes in the design and manufacture of pneumatic systems and support equipment for the conveying, weighing, and batching of dry materials.</h3>

	    			<ul class="nav hidden-phone" id="myTab">
					    <li class="active"><a href="#pneumatic" data-toggle="tab">Pneumatic<br>Conveying</a></li>
					    <li><a href="#vacuum" data-toggle="tab">Industrial<br>Vacuum</a></li>
					    <li><a href="#mechanical" data-toggle="tab">Aero-Mechanical<br>Conveying</a></li>
					    <li><a href="#flex" data-toggle="tab">Flexible Screw<br>Conveyors</a></li>
					    <li><a href="#pulsonic" data-toggle="tab">Pulsonic Bin<br>Activators</a></li>
					</ul>

					<div id="homeTab" class="tab-content hidden-phone">
					    <div class="tab-pane active" id="pneumatic">
						    <h4><img src="img/pnueTab.jpg" alt="Pneumatic Conveying Systems" width="151" height="201" class="pull-right">Pneumatic Conveying Systems</h4>
						    <p>VAC-U-MAX is a premier manufacturer of custom pneumatic systems and support equipment for conveying, batching, and weighing materials. With a VAC-U-MAX system on site, your company's product can move gently and quickly from point to point, with nothing in the way to impede the efficiency of its movement. <a href="landingPneumatic.cfm">Read More <span>&raquo;</span></a></p>
					    </div>

					    <div class="tab-pane" id="vacuum">
						    <h4><img src="img/vacTab.jpg" alt="Industrial Vacuum Cleaners" width="151" height="201" class="pull-right">Industrial Vacuum Cleaners</h4>
						    <p>VAC-U-MAX is a premier manufacturer of industrial vacuum cleaners for manufacturing and municipal facilities, government installations and environmental sites. VAC-U-MAX heavy-duty industrial vacuums improve your facility's cleanliness, improve working conditions and safety for your employees, reduce down-time of valuable production equipment, enhance your quality control efforts and recycle material previously considered as waste.</p>

							<p>Wet and dry applications include housekeeping of dust on floors, walls, and machine surfaces, bulk powder spill recovery, liquid spill cleanup, sump cleaning and tank emptying, and process clean-out. Custom-engineered vacuum cleaning systems are also available.  <a href="landingVacuum.cfm">Read More &raquo;</a></p>
					    </div>

					    <div class="tab-pane" id="mechanical">
						    <h4><img src="img/aeroTab.jpg" alt="Aero-Mechanical Conveyors" width="151" height="201" class="pull-right">Aero-Mechanical Conveyors</h4>
						    <p>Aero-Conveying is best defined as the movement of material using the desirable features of both pneumatic and mechanical conveying, and eliminating most of the disadvantages. The result is high volume, controlled transfer of dry materials (such as foods, pharmaceuticals, and chemical products), efficiently and economically, with little, if any, effect on the material, however friable and degradable. <a href="product.cfm?cat=products-by-application&prod=aero-mechanical-conveyors">Read More &raquo;</a></p>
					    </div>

					    <div class="tab-pane" id="flex">
						    <h4><img src="img/flexTab.jpg" alt="Flexible Screw Conveyors" width="151" height="201" class="pull-right">Flexible Screw Conveyors</h4>
						    <p>VAC-U-MAX Flexible Screw Conveyors systems are engineered to transport dry bulk materials. They convey powders and granular material without separation of product. They are great for Bulk Bag Discharging and Bulk Bag Filling.</p>

							<p>The Flexible Screw Conveyor system utilizes a stainless steel or carbon steel one-piece helix, which is enclosed within a stationary plastic tubing, for transferring material from its feed hopper to the discharge point, quickly and efficiently. <a href="product.cfm?cat=products-by-application&prod=flexible-screw-conveyors">Read More &raquo;</a></p>
					    </div>

					    <div class="tab-pane" id="pulsonic">
						    <h4><img src="img/pulsonicTab.jpg" alt="Pulsonic Bin Activators" width="151" height="201" class="pull-right">Pulsonic Bin Activators</h4>
						    <p>A Pulsonic system consists of a single programmer and one or more injectors. The overall system features simplicity of design, solid state reliability, efficient and versatile operation, low energy consumption and low initial and installation costs with little, if any, maintenance. <a href="product.cfm?cat=pulsonic-bin-activators&prod=pulsonic-bin-activators">Read More &raquo;</a></p>
					    </div>
					</div>
	    		</div>

	    		<div id="cases" class="span5 hidden-phone">
	    			<h3>Application Stories</h3>
	    			<cfoutput query="case" maxRows="3"><div class="study clearfix">
	    				<h5>#case.c_cat#</h5>
	    				<h4>#case.c_title#</h4>
	    				<cfset quote = case.c_summary>
	    				<cfif len(quote) gt 190>
						    <cfset trimmedQuote = fullLeft(quote, 190)>
						    <cfset trimmedQuote &= "...</p>">
						<cfelse>
						    <cfset trimmedQuote = quote>
						</cfif>
						#trimmedQuote#
	    				<div class="buttons pull-right"><div class="smallShadow pull-left"></div><a href="case_histories.cfm?case=#case.c_id#" class="pull-left gradient">Read More <span>&raquo;</span></a></div>
	    			</div></cfoutput>
	    		</div><!--- cases --->
	    	</div><!--- row-fluid--->
		</div><!--- conIndent --->
    </div><!--- container --->

    <cfinclude template="inc/footer.cfm">

	<cfinclude template="inc/scripts.cfm">
	<script>
		$(document).ready(function() {
			$(function(){
				$('#myCarousel').carousel();
			});
		});
    </script>
</body>
</html>
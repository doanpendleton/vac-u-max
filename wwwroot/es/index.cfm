<cfprocessingdirective pageEncoding="utf-8">
<cfinclude template="../inc/FullLeft.cfm">
<cfinvoke
	component="#application.components#.queryController"
	method="featCases"
	returnvariable="case">
	<cfinvokeargument name="spanish" value="true">
</cfinvoke>
<!DOCTYPE html>
<html>
<head>
	<title>VAC-U-MAX</title>
	<meta name="description" content="">
	<cfinclude template="../inc/head.cfm">
</head>

<body>
	<cfinclude template="inc/top.cfm">

    <div id="homeCon" class="container">
		<div class="conIndent">
	    	<div id="myCarousel" class="carousel slide">
			    <!-- Carousel items -->
			    <div class="carousel-inner">
			    	<div class="active item">
				    	<img src="../img/banner01.jpg" alt="banner01" width="995" height="370">
			    	</div>
			    	<div class="item">
				    	<img src="../img/banner02.jpg" alt="banner02" width="995" height="370">
			    	</div>
			    	<div class="item">
				    	<img src="../img/banner03.jpg" alt="banner03" width="995" height="370">
			    	</div>
                    <div class="item">
				    	<img src="../img/banner04.jpg" alt="banner04" width="995" height="370">
		    	  </div>
			    </div>
	    	</div><!--- carousel --->

	    	<div class="row-fluid">
	    		<div id="tabbed" class="span7">
	    			<h3><nobr>VAC-U-MAX</nobr>, como pionero en el transporte neumático por vacío, se especializa en el diseño y la fabricación de sistemas neumáticos y equipos de apoyo para el transporte, pesaje y procesamiento por lotes de materiales secos.</h3>

	    			<ul class="nav hidden-phone" id="myTab">
					    <li class="active"><a href="#pneumatic" data-toggle="tab">Sistema de transporte<br>neumático</a></li>
					    <li><a href="#vacuum" data-toggle="tab">Aspiradoras<br>industriales</a></li>
					    <li><a href="#mechanical" data-toggle="tab">Sistema de transporte<br>aeromecánico</a></li>
					    <li><a href="#flex" data-toggle="tab">Transportadores<br>de tornillos flexibles</a></li>
					    <li><a href="#pulsonic" data-toggle="tab">Activadores<br>de recipiente Pulsonic</a></li>
					</ul>

					<div id="homeTab" class="tab-content hidden-phone">
					    <div class="tab-pane active" id="pneumatic">
						    <h4><img src="../img/pnueTab.jpg" alt="Sistemas de transporte neumático" width="151" height="201" class="pull-right">Sistemas de transporte neumático</h4>
						    <p>VAC-U-MAX es un fabricante líder de sistemas neumáticos personalizados y equipos de apoyo para el transporte, procesamiento por lotes y pesaje de materiales. Con un sistema VAC-U-MAX en el lugar, el producto de su empresa se puede trasladar de forma suave y con rapidez de un punto a otro, sin nada en el camino que impida la eficacia de su traslado. <a href="landingPneumatic.cfm">Más Información <span>»</span></a></p>
					    </div>

					    <div class="tab-pane" id="vacuum">
						    <h4><img src="../img/vacTab.jpg" alt="Aspiradoras industriales" width="151" height="201" class="pull-right">Aspiradoras industriales</h4>
						    <p>VAC-U-MAX es un fabricante líder de aspiradoras industriales para plantas de fabricación e instalaciones municipales, gubernamentales y sitios ambientales. Las aspiradoras industriales VAC-U-MAX para aplicaciones exigentes mejoran la limpieza de sus instalaciones, las condiciones de trabajo y de seguridad para sus empleados, reducen el tiempo de inactividad del valioso equipo de producción, mejoran sus esfuerzos de control de calidad y reciclan material que anteriormente se consideraba residuo.</p>

							<p>Las aplicaciones húmedas y secas incluyen la limpieza de polvo sobre pisos, paredes y superficies de equipos, recuperación de derrame de polvo a granel, limpieza de derrames de líquidos, limpieza del sumidero y vaciado de tanques, y limpieza de proceso. También se dispone de sistemas de limpieza mediante aspiración de diseño personalizado. <a href="landingVacuum.cfm">Más Información »</a></p>
					    </div>

					    <div class="tab-pane" id="mechanical">
						    <h4><img src="../img/aeroTab.jpg" alt="Transportadores aeromecánicos" width="151" height="201" class="pull-right">Transportadores aeromecánicos</h4>
						    <p>El transporte aeromecánico se define mejor como el traslado de material mediante las características convenientes, tanto del transporte neumático como del mecánico, y la eliminación de la mayor parte de las desventajas. El resultado es una transferencia controlada de grandes volúmenes de materiales secos (tales como alimentos, productos farmacéuticos y sustancias químicas), de manera eficiente y económica, con poco o ningún efecto sobre el material, ya sea friable y degradable. <a href="product.cfm?cat=products-by-application&prod=aero-mechanical-conveyors">Más Información »</a></p>
					    </div>

					    <div class="tab-pane" id="flex">
						    <h4><img src="../img/flexTab.jpg" alt="Transportadores de tornillos flexibles" width="151" height="201" class="pull-right">Transportadores de tornillos flexibles</h4>
						    <p>El diseño de los sistemas de transportadores de tornillos flexibles VAC-U-MAX tiene como objetivo el transporte de materiales secos a granel. Estos equipos transportan polvos y material granular sin causar la separación del producto. Son excelentes para la descarga y el llenado de bolsas a granel.</p>

							<p>El sistema transportador de tornillos flexibles utiliza una hélice en una sola pieza de acero inoxidable o acero de carbono, encerrada dentro de un tubo de plástico fijo, para la transferencia de material desde su tolva de alimentación al punto de descarga, de forma rápida y eficiente. <a href="product.cfm?cat=products-by-application&prod=flexible-screw-conveyors">Más Información »</a></p>
					    </div>

					    <div class="tab-pane" id="pulsonic">
						    <h4><img src="../img/pulsonicTab.jpg" alt="Activadores de recipiente Pulsonic" width="151" height="201" class="pull-right">Activadores de recipiente Pulsonic</h4>
						    <p>Un sistema Pulsonic consta de un solo programador y de uno o más inyectores. El sistema integral cuenta con la simplicidad del diseño, la confiabilidad de estado sólido, la operación eficiente y versátil, el bajo consumo de energía, y costos iniciales y de instalación bajos con poco mantenimiento, si fuese necesario. <a href="product.cfm?cat=pulsonic-bin-activators&prod=pulsonic-bin-activators">Más Información »</a></p>
					    </div>
					</div>
	    		</div>

	    		<div id="cases" class="span5 hidden-phone">
	    			<h3>Casos de Aplicación</h3>
	    			<cfoutput query="case" maxRows="3">
		    			<div class="study clearfix">
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
							<div class="buttons pull-right">
								<div class="smallShadow pull-left"></div>
								<a href="case_histories.cfm?case=#case.c_id#" class="pull-left gradient">Más Información <span>»</span></a>
							</div>
	    				</div>
	    			</cfoutput>
	    		</div><!--- cases --->
	    	</div><!--- row-fluid--->
		</div><!--- conIndent --->
    </div><!--- container --->

    <cfinclude template="inc/footer.cfm">
    <cfinclude template="../inc/scripts.cfm">
	<script>
		$(document).ready(function() {
			$(function(){
				$('#myCarousel').carousel()
			});
		});
    </script>
</body>
</html>
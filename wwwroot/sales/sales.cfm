<cfprocessingdirective pageEncoding="utf-8">
<!DOCTYPE html>
<html>
<head>
	<title>VAC-U-MAX | Automatización de ventas</title>
	<meta name="description" content="">
	<cfinclude template="../inc/head.cfm">
	<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.18/themes/smoothness/jquery-ui.css" rel="stylesheet" type="text/css" media="screen">
	<link href="css/elfinder.min.css" rel="stylesheet" type="text/css" media="screen">
	<link href="css/theme.css" rel="stylesheet" type="text/css" media="screen">
</head>

<body>
	<cfinclude template="../es/inc/top.cfm">

    <div id="homeCon" class="container">
		<div class="conIndent">
			<div class="row-fluid">
		    	<div id="inBan1" class="inBanner">
		    		<h1>Automatización de ventas</h1>
		    		<div class="clearfix"></div>
		    	</div><!--- inBanner --->
			</div><!--- row-fluid --->

	    	<div class="row-fluid">
	    		<div id="prodCon" class="span12 well">
	    			<p><a href="logout.cfm" class="btnLink">Cerrar sesión</a></p>
	    			<div class="clearfix"></div>

	    			<div id="elfinder"></div>
	    		</div>
	    	</div><!--- row-fluid--->
		</div><!--- conIndent --->
    </div><!--- container --->

    <cfinclude template="../es/inc/footer.cfm">
    <cfinclude template="../inc/scripts.cfm">
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.21/jquery-ui.min.js"></script>
	<script src="js/elfinder.min.js"></script>
	<script>
		$().ready(function() {
			var elf = $('#elfinder').elfinder({
				<cfoutput>url : 'php/connector#SESSION.User.Access#.php',</cfoutput>
				height: 500
			}).elfinder('instance');
		});
	</script>
</body>
</html>
<cfprocessingdirective pageEncoding="utf-8">
<!DOCTYPE html>
<html>
<head>
	<title>VAC-U-MAX | Error</title>
	<cfinclude template="../inc/head.cfm">
</head>

<body>
	<cfinclude template="inc/top.cfm">
    
    <div id="homeCon" class="container">
		<div class="conIndent">
			<div class="row-fluid">
		    	<div id="inBan1" class="inBanner">
		    		<h1>Error</h1>
		    		<div class="clearfix"></div>
		    	</div><!--- inBanner --->
			</div><!--- row-fluid --->
	    	
	    	<div class="row-fluid">
	    		<div id="prodCon" class="span9 well">
	    			<h2>Se produjo un error</h2>
	    			
	    			<p>Lo sentimos; se produjo un error. Estamos trabajando para solucionar el problema.</p>
	    		</div>
	    		
	    		<cfinclude template="inc/sideNews.cfm">
	    	</div><!--- row-fluid--->
		</div><!--- conIndent --->
    </div><!--- container --->

    <cfinclude template="inc/footer.cfm">
    <cfinclude template="../inc/scripts.cfm">
</body>
</html>
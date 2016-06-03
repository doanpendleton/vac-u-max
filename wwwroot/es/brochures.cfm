<cfinvoke
	component="#application.components#.queryController"
	method="brochures"
	returnVariable="bro">
	<cfinvokeargument name="spanish" value="true">
</cfinvoke>
<cfprocessingdirective pageEncoding="utf-8">
<!DOCTYPE html>
<html>
<head>
	<title>VAC-U-MAX | Folletos</title>
	<meta name="description" content="">
	<cfinclude template="../inc/head.cfm">
</head>

<body>
	<cfinclude template="inc/top.cfm">

    <div id="homeCon" class="container">
		<div class="conIndent">
			<div class="row-fluid">
		    	<div id="inBan1" class="inBanner">
		    		<h1>Folletos</h1>
		    		<div class="clearfix"></div>
		    	</div><!--- inBanner --->
			</div><!--- row-fluid --->

	    	<div class="row-fluid">
	    		<div id="prodCon" class="span9 well">
	    			<ul class="nav" id="myTab">
	    				<cfset count = 1>
	    				<cfoutput query="bro" group="section">
		    				<li<cfif bro.isFirst()> class="active"</cfif>><a href="###count#" data-toggle="tab">#RemoveChars(bro.section, 1, 2)#</a></li>
							<cfset count++>
						</cfoutput>
					</ul>

	    			<div class="tab-content">
	    				<cfset count = 1>
	    				<cfoutput query="bro" group="section">
							<div class="tab-pane<cfif bro.isFirst()> active</cfif>" id="#count#">
								<cfoutput>
									<a href="#application.root#userfiles/brochures/#bro.file#" class="broBox pull-left" target="_blank" title="#bro.title#"><img src="#application.root#userfiles/brochures/#bro.img#">#bro.title#</a>
								</cfoutput>
							</div>

							<cfset count++>
					    </cfoutput>
					</div>
	    		</div>

	    		<cfinclude template="inc/sideNews.cfm">
	    	</div><!--- row-fluid--->
		</div><!--- conIndent --->
    </div><!--- container --->

    <cfinclude template="inc/footer.cfm">
    <cfinclude template="../inc/scripts.cfm">
</body>
</html>
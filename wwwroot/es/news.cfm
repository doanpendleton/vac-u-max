<cfprocessingdirective pageEncoding="utf-8">
<cfparam name="url.article" default="">
<cfinvoke
	component="#application.components#.queryController"
	method="news"
	returnvariable="news">
	<cfinvokeargument name="article" value="#url.article#">
	<cfinvokeargument name="spanish" value="true">
</cfinvoke>
<!DOCTYPE html>
<html>
<head>
	<title>VAC-U-MAX | Noticias<cfif url.article neq ""><cfoutput query="news"> | #news.n_title#</cfoutput></cfif></title>
	<meta name="description" content="">
	<cfinclude template="../inc/head.cfm">
</head>

<body>
	<cfinclude template="inc/top.cfm">

    <div id="homeCon" class="container">
		<div class="conIndent">
			<div class="row-fluid">
		    	<div id="inBan1" class="inBanner">
		    		<h1>Noticias</h1>
		    		<div class="clearfix"></div>
		    	</div><!--- inBanner --->
			</div><!--- row-fluid --->

	    	<div class="row-fluid">
	    		<div id="prodCon" class="span9 well">
	    			<cfif url.article eq "">
		    			<table cellpadding="0" cellspacing="0" width="100%" border="0" class="table">
		    				<cfoutput query="news">
			    				<tr>
			    					<td class="well well-small">#DateFormat(news.n_date, 'mm/dd/yyyy')#</td>
			    					<td class="well well-small"><a href="?article=#n_id#">#news.n_title#</a></td>
			    				</tr>
		    				</cfoutput>
		    			</table>

	    			<cfelse>
	    				<cfoutput query="news">
			    			<h2>#news.n_title#</h2>

			    			<cfif news.n_img neq ""><img src="../img/news/#news.n_img#" alt="#news.n_title#" class="pull-right" /></cfif>
			    			<p>#news.n_desc#</p>
			    		</cfoutput>
			    	</cfif>
	    		</div>

	    		<cfinclude template="inc/sideNews.cfm">
	    	</div><!--- row-fluid--->
		</div><!--- conIndent --->
    </div><!--- container --->

    <cfinclude template="inc/footer.cfm">
    <cfinclude template="../inc/scripts.cfm">
</body>
</html>
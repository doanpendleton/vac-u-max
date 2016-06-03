<cfprocessingdirective pageEncoding="utf-8">
<cfinvoke
	component="#application.components#.queryController"
	method="events"
	returnvariable="events">
</cfinvoke>
<!DOCTYPE html>
<html>
<head>
	<title>VAC-U-MAX | Trade Shows &amp; Events</title>
	<meta name="description" content="">
	<cfinclude template="inc/head.cfm">
</head>

<body>
	<cfinclude template="inc/top.cfm">

    <div id="homeCon" class="container">
		<div class="conIndent">
			<div class="row-fluid">
		    	<div id="inBan1" class="inBanner">
		    		<h1>Trade Shows &amp; Events</h1>
		    		<div class="clearfix"></div>
		    	</div><!--- inBanner --->
			</div><!--- row-fluid --->

	    	<div class="row-fluid">
	    		<div id="prodCon" class="span9 well">
	    			<cfif events.recordcount gt 0>
		    			<cfoutput query="events" group="year">
			    			<h2>#year# Trade Shows &amp; Events</h2>
			    			<table cellpadding="0" cellspacing="0" width="100%" border="0" class="table">
				    			<tr>
					    			<th width="90">Date</th>
					    			<th>Event</th>
					    			<th>Location</th>
					    			<th>Venue</th>
					    			<th>Industry</th>
					    			<th>Booth ##</th>
				    			</tr>
			    				<cfoutput>
				    				<tr>
				    					<td class="well well-small">#displayDate#</td>
				    					<td class="well well-small"><a href="#link#" target="_blank">#title#</a></td>
				    					<td class="well well-small">#location#</td>
				    					<td class="well well-small">#venue#</td>
				    					<td class="well well-small">#industry#</td>
				    					<td class="well well-small">#booth#</td>
				    				</tr>
			    				</cfoutput>
			    			</table>
		    			</cfoutput>

	    			<cfelse>

		    			<p>Sorry, there aren't trade shows or events currently scheduled.</p>
	    			</cfif>
	    		</div>

	    		<cfinclude template="inc/sideNews.cfm">
	    	</div><!--- row-fluid--->
		</div><!--- conIndent --->
    </div><!--- container --->

    <cfinclude template="inc/footer.cfm">

	<cfinclude template="inc/scripts.cfm">
</body>
</html>
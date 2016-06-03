<cfinvoke
	component="#application.components#.queryController"
	method="adminEvents"
	returnvariable="events">
</cfinvoke>
<cfprocessingdirective pageEncoding="utf-8">
<!DOCTYPE html>
<html>
<head>
	<cfinclude template="inc/head.cfm">
</head>

<body>
	<cfinclude template="inc/top.cfm">

    <div class="container">
		<div class="conIndent">
	    	<div class="row-fluid">
	    		<div id="prodCon" class="span12 well">
					<a href="eventsFunctions.cfm" class="quoteBtn">Add Event</a>
	    			<h1>Events</h1>
					<div class="clearfix"></div>

	    			<ul>
	    				<cfif isDefined('url.add')><li class="success">New event added.</li></cfif>
	    				<cfif isDefined('url.edit')><li class="success">Event edit successful.</li></cfif>
	    				<cfif isDefined('url.delete')><li class="success">Event deletion successful.</li></cfif>
	    			</ul>

					<cfif events.recordcount gt 0>
		    			<cfoutput query="events" group="year">
			    			<h2>#year# Trade Shows &amp; Events</h2>
			    			<cfoutput>
				    			<div class="caseBox">
									<h4 class="pull-left"><a href="eventsFunctions.cfm?event=#id#" title="Edit">#title#</a></h4>
									<a href="##" class="delete icon-trash pull-right" rel="#id#" title="Delete"></a>
									<a href="eventsFunctions.cfm?event=#id#" class="edit icon-edit pull-right" title="Edit"></a>
									<div class="clearfix"></div>
									<p>#displayDate# | #location# | #venue# | Booth: #booth#</p>
								</div>
			    			</cfoutput>
		    			</cfoutput>

	    			<cfelse>

		    			<p>There are no events to display.</p>
	    			</cfif>
	    		</div>
	    	</div><!--- row-fluid--->
		</div><!--- conIndent --->
    </div><!--- container --->

    <cfinclude template="inc/footer.cfm">

	<cfinclude template="inc/scripts.cfm">
	<script>
	$(document).ready(function() {
		$('.delete').click(function() {
			var event = $(this).attr('rel');
			var destination = 'delete.cfm?section=events&event=' + event;

			if (confirm('Are you sure you want to delete this event?')) {
				window.location.replace(destination);
			}
		});
	});
	</script>
</body>
</html>
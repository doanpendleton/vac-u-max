<cfprocessingdirective pageEncoding="utf-8">
<cfquery name="getReps" dataSource="#application.datasource#">
	SELECT reps.id, reps.company, reps.name, reps.email, pnue, vac
	FROM reps
	ORDER BY reps.company, reps.name
</cfquery>

<cfquery name="getVReps" dataSource="#application.datasource#">
	SELECT id, name, email
	FROM repsVUM
	ORDER BY name
</cfquery>
<!DOCTYPE html>
<html>
<head>
	<cfinclude template="inc/head.cfm">
	<link href="../css/chosen.min.css" rel="stylesheet" type="text/css">
</head>

<body>
	<cfinclude template="inc/top.cfm">

    <div class="container">
		<div class="conIndent">
	    	<div class="row-fluid">
	    		<div id="prodCon" class="span12 well">
		    		<a href="repsManAdd.cfm" class="quoteBtn">Add Regional Manager</a>
					<a href="repsAdd.cfm" class="quoteBtn spacer">Add Rep</a>
	    			<h1>Reps</h1>

	    			<ul>
	    				<cfif isDefined('url.add')><li class="success">New rep added.</li></cfif>
	    				<cfif isDefined('url.edit')><li class="success">Rep edit successful.</li></cfif>
	    				<cfif isDefined('url.delete')><li class="success">Rep deletion successful.</li></cfif>
	    			</ul>

					<h3>VAC-U-MAX Regional Managers</h3>
					<cfoutput query="getVReps">
						<div class="caseBox">
							<strong>#getVReps.name#</strong> <a href="##" id="#getVReps.id#" class="delete2 icon-trash pull-right" title="Delete"></a>
							<a href="mailto:#getVReps.email#" class="edit icon-envelope pull-right" title="Email" id="#getVReps.id#"></a>
							<a href="##" class="edit icon-edit pull-right" title="Edit" id="#getVReps.id#"></a>
						</div>
					</cfoutput>

					<h3>Sales Reps</h3>
					<cfoutput query="getReps">
						<div class="caseBox">
							<strong>#getReps.company#</strong><cfif getReps.name neq ""> - #getReps.name#</cfif> <a href="##" id="#getReps.id#" class="delete icon-trash pull-right" title="Delete"></a>
							<a href="mailto:#getReps.email#" class="edit icon-envelope pull-right" title="Email" id="#getReps.id#"></a>
							<a href="##" class="edit icon-edit pull-right" title="Edit" id="#getReps.id#"></a>
						</div>
					</cfoutput>
	    		</div>
	    	</div><!--- row-fluid--->
		</div><!--- conIndent --->
    </div><!--- container --->

    <cfinclude template="inc/footer.cfm">

	<cfinclude template="inc/scripts.cfm">
	<script src="<cfoutput>#application.root#</cfoutput>js/jquery.validate.min.js"></script>
	<script src="<cfoutput>#application.root#</cfoutput>js/chosen.jquery.min.js"></script>
	<script>
		$(document).ready(function() {
			$('.delete').click(function() {
				var rep = $(this).attr('id');
				var destination = 'delete.cfm?section=reps&rep=' + rep;

				if (confirm('Are you sure you want to delete this rep?')) {
					window.location.replace(destination);
				}

				return false;
			});

			$('.delete2').click(function() {
				var rep = $(this).attr('id');
				var destination = 'delete.cfm?section=vumReps&rep=' + rep;

				if (confirm('Are you sure you want to delete this manager?')) {
					window.location.replace(destination);
				}

				return false;
			});
		});
	</script>
</body>
</html>
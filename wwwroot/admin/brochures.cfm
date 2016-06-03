<cfinvoke 
	component="#application.components#.queryController" 
	method="brochures" 
	returnvariable="bro">
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
					<a href="broFunctions.cfm" class="quoteBtn">Add Brochure</a>
	    			<h1>Brochures</h1>
					<div class="clearfix"></div>
					
	    			<ul>
	    				<cfif isDefined('url.add')><li class="success">New brochure added.</li></cfif>
	    				<cfif isDefined('url.edit')><li class="success">Brochure edit successful.</li></cfif>
	    				<cfif isDefined('url.delete')><li class="success">Brochure deletion successful.</li></cfif>
	    			</ul>
					
					<cfif bro.recordcount gt 0>
	    				<cfoutput query="bro" group="section">
						<h3>#Replace(RemoveChars(bro.section, 1, 2), "<br>", " ")#</h3>
							<cfoutput>
							<div class="broBox pull-left">
								<a href="##" class="delete icon-trash pull-right" rel="#bro.id#" title="Delete"></a>
								<a href="broFunctions.cfm?bro=#bro.id#" class="edit icon-edit pull-right" title="Edit"></a>
								<div class="clearfix"></div>
								<a href="broFunctions.cfm?bro=#bro.id#" title="Edit"><img src="../userfiles/brochures/#bro.img#">#bro.title#</a>
							</div>
							</cfoutput>
							
							<div class="clearfix"></div>
	    				</cfoutput>
	    			<cfelse>
	    				<p>There are no brochures to display.</p>
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
			var bro = $(this).attr('rel');
			var destination = 'delete.cfm?section=bro&bro=' + bro;
			
			if (confirm('Are you sure you want to delete this brochure?')) {
				window.location.replace(destination);
			}
		});
	});
	</script>
</body>
</html>
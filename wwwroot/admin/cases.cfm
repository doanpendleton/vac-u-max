<cfinvoke 
	component="#application.components#.queryController" 
	method="adminCases" 
	returnvariable="cases">
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
					<a href="caseFunctions.cfm" class="quoteBtn">Add Application Story</a>
	    			<h1>Application Stories</h1>
					<div class="clearfix"></div>
					
	    			<ul>
	    				<cfif isDefined('url.add')><li class="success">New case study added.</li></cfif>
	    				<cfif isDefined('url.edit')><li class="success">Case study edit successful.</li></cfif>
	    				<cfif isDefined('url.delete')><li class="success">Case study deletion successful.</li></cfif>
	    			</ul>
	    			
	    			<p><span class="symLabel icon-star"></span> = Featured (Only three featured application stories are shown at a time.)</p>
	    			
					<cfif cases.recordcount gt 0>
	    				<cfoutput query="cases" group="c_cat">
						<h3>#cases.c_cat#</h3>
							<cfoutput>
							<div class="caseBox">
								<h4 class="pull-left"><a href="caseFunctions.cfm?case=#cases.c_id#" title="Edit">#cases.c_title#</a></h4>
								<a href="##" class="delete icon-trash pull-right" rel="#cases.c_id#" title="Delete"></a>
								<a href="caseFunctions.cfm?case=#cases.c_id#" class="edit icon-edit pull-right" title="Edit"></a>
								<a href="##" class="feature icon-star<cfif cases.c_featured eq 0>-empty</cfif> pull-right" rel="#cases.c_id#" title="Feature"></a>
							</div>
							</cfoutput>
	    				</cfoutput>
	    			<cfelse>
	    				<p>There are no application stories to display.</p>
	    			</cfif>
	    		</div>
	    	</div><!--- row-fluid--->
		</div><!--- conIndent --->
    </div><!--- container --->
    
    <cfinclude template="inc/footer.cfm">
	
	<cfinclude template="inc/scripts.cfm">
	<script>
	$(document).ready(function() {
		$('.feature').click(function() {
			var cases = $(this).attr('rel');
			var change = "a[rel*='" + cases + "']";
			
			$.ajax({
				type: 'POST',
				url: 'update.cfm',
				data: { section: 'case', cases: cases },
				cache: false,
				success: function(response){
					if ($.trim(response) === 'true') {
						$(change).removeClass('icon-star-empty');
						$(change).addClass('icon-star');
					} else {
						$(change).removeClass('icon-star');
						$(change).addClass('icon-star-empty');
					}
				}
			});
		});
		
		$('.delete').click(function() {
			var cases = $(this).attr('rel');
			var destination = 'delete.cfm?section=case&case=' + cases;
			
			if (confirm('Are you sure you want to delete this case?')) {
				window.location.replace(destination);
			}
		});
	});
	</script>
</body>
</html>
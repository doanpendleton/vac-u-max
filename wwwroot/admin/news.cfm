<cfinvoke 
	component="#application.components#.queryController" 
	method="news" 
	returnvariable="news">
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
					<a href="newsFunctions.cfm" class="quoteBtn">Add News</a>
	    			<h1>News</h1>
					<div class="clearfix"></div>
					
	    			<ul>
	    				<cfif isDefined('url.add')><li class="success">New article added.</li></cfif>
	    				<cfif isDefined('url.edit')><li class="success">Article edit successful.</li></cfif>
	    				<cfif isDefined('url.delete')><li class="success">Article deletion successful.</li></cfif>
	    			</ul>
	    			
					<cfif news.recordcount gt 0>
	    				<cfoutput query="news">
							<div class="caseBox">
								<h4 class="pull-left"><a href="newsFunctions.cfm?news=#news.n_id#" title="Edit">#DateFormat(news.n_date, 'mm/dd/yyyy')# - #news.n_title#</a></h4>
								<a href="##" class="delete icon-trash pull-right" rel="#news.n_id#" title="Delete"></a>
								<a href="newsFunctions.cfm?news=#news.n_id#" class="edit icon-edit pull-right" title="Edit"></a>
							</div>
	    				</cfoutput>
	    			<cfelse>
	    				<p>There are no articles to display.</p>
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
			var news = $(this).attr('rel');
			var destination = 'delete.cfm?section=news&news=' + news;
			
			if (confirm('Are you sure you want to delete this article?')) {
				window.location.replace(destination);
			}
		});
	});
	</script>
</body>
</html>
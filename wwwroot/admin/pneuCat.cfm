<cfinvoke 
	component="#application.components#.queryController" 
	method="pneuCat" 
	returnvariable="cat">
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
    				<a href="pneuCatFunctions.cfm" class="quoteBtn">Add Category</a>
	    			<h1>Pneumatic Categories</h1>
					<div class="clearfix"></div>
					
	    			<ul>
	    				<cfif isDefined('url.add')><li class="success">New category added.</li></cfif>
	    				<cfif isDefined('url.edit')><li class="success">Category edit successful.</li></cfif>
	    				<cfif isDefined('url.delete')><li class="success">Category deletion successful.</li></cfif>
	    			</ul>
	    			
	    			<div id="sortMessage" class="hide"></div>
					
					<div class="span6">
	    				<h2>Active</h2>
	    				<ul id="sortActive" class="sortable">
		    				<cfoutput query="cat">
							<cfif cat.l_switch eq 1>
								<li id="act_#cat.c_id#" class="caseBox">
									<h4 class="pull-left"><a href="pneuCatFunctions.cfm?cat=#cat.c_id#" title="Edit">#cat.c_title#</a></h4>
									<a href="##" class="delete icon-trash pull-right" rel="#cat.c_id#" title="Delete"></a>
									<a href="pneuCatFunctions.cfm?cat=#cat.c_id#" class="edit icon-edit pull-right" title="Edit"></a>
								</li>
							</cfif>
		    				</cfoutput>
	    				</ul>
					</div>
    				
    				<div class="span6 pull-right">
    				<h2>Hidden</h2>
	    				<ul id="sortInactive" class="sortable">
		    				<cfoutput query="cat" group="c_title">
							<cfif cat.l_switch eq 0>
								<li id="in_#cat.c_id#" class="caseBox">
									<h4 class="pull-left"><a href="pneuCatFunctions.cfm?cat=#cat.c_id#" title="Edit">#cat.c_title#</a></h4>
									<a href="##" class="delete icon-trash pull-right" rel="#cat.c_id#" title="Delete"></a>
									<a href="pneuCatFunctions.cfm?cat=#cat.c_id#" class="edit icon-edit pull-right" title="Edit"></a>
								</li>
							</cfif>
		    				</cfoutput>
	    				</ul>
    				</div>
	    		</div>
	    	</div><!--- row-fluid--->
		</div><!--- conIndent --->
    </div><!--- container --->
    
    <cfinclude template="inc/footer.cfm">
	
	<cfinclude template="inc/scripts.cfm">
	<script>
	$(document).ready(function() {
		var updateButton = '<p><a href="#" id="updateSort" class="btnLink pull-left">Update</a> Click to save the changes.</p>';
		
		$('#sortActive').sortable({
			connectWith: '#sortInactive',
			cursor: 'move',
			opacity: 0.6,
			placeholder: 'placeholder',
			start: function(e, ui){
		        ui.placeholder.height(ui.item.height());
		    },
		    tolerance: 'pointer',
			update: function() {
				$('#sortMessage').html(updateButton);
				$('#sortMessage').css('display', 'block');
			}
		});
		
		$('#sortInactive').sortable({
			connectWith: '#sortActive',
			cursor: 'move',
			opacity: 0.6,
			placeholder: 'placeholder',
			start: function(e, ui){
		        ui.placeholder.height(ui.item.height());
		    },
		    tolerance: 'pointer',
			update: function() {
				$('#sortMessage').html(updateButton);
				$('#sortMessage').css('display', 'block');
			}
		});
		
		$('#sortMessage').on('click', 'a.btnLink', function() {
			$('#sortMessage').html('<p>Saving changes...</p>');
			var actSort = $('#sortActive').sortable("serialize", { key: 'act' });
			var inSort = $('#sortInactive').sortable("serialize", { key: 'in' });
			//$('#sortMessage').html('<p>' + actSort + '<br>' + inSort + '</p>');
			$.ajax({
				type: 'POST',
				url: 'update.cfm',
				data: { section: 'cat', act: actSort, in: inSort},
				success: function(response){
					$('#sortMessage').html(response);
				}
			});
		});
		
		$('.delete').click(function() {
			var cat = $(this).attr('rel');
			var destination = 'delete.cfm?section=cat&cat=' + cat;
			
			if (confirm('Are you sure you want to delete this category?')) {
				window.location.replace(destination);
			}
			
			return false;
		});
	});
	</script>
</body>
</html>
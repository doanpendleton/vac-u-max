<cfinclude template="../inc/NumberAsString.cfm">
<cfinvoke 
	component="#application.components#.queryController" 
	method="pneuSubCat" 
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
					<a href="pneuSubCatFunctions.cfm" class="quoteBtn">Add Subcategory</a>
	    			<h1>Pneumatic Subcategories</h1>
					<div class="clearfix"></div>
					
	    			<ul>
	    				<cfif isDefined('url.add')><li class="success">New subcategory added.</li></cfif>
	    				<cfif isDefined('url.edit')><li class="success">Subcategory edit successful.</li></cfif>
	    				<cfif isDefined('url.delete')><li class="success">Subcategory deletion successful.</li></cfif>
	    			</ul>
	    			
	    			<div id="sortMessage" class="hide"></div>
					
					<div class="span6">
	    				<h2>Active</h2>
		    			<cfoutput query="cat" group="c_title">
			    			<h3>#cat.c_title#</h3>
		    				<ul id="#cat.c_url#" class="sortable">
		    					<cfoutput>
								<cfif cat.s_switch eq 1>
									<li id="#cat.c_id#_#cat.s_id#" class="caseBox">
										<h4 class="pull-left"><a href="pneuSubCatFunctions.cfm?subCat=#cat.s_id#" title="Edit">#cat.s_title#</a></h4>
										<a href="##" class="delete icon-trash pull-right" rel="#cat.s_id#" title="Delete"></a>
										<a href="pneuSubCatFunctions.cfm?subCat=#cat.s_id#" class="edit icon-edit pull-right" title="Edit"></a>
									</li>
								</cfif>
			    				</cfoutput>
		    				</ul>
		    			</cfoutput>
					</div>
    				
    				<div class="span6 pull-right">
    					<h2>Hidden</h2>
	    				<cfoutput query="cat" group="c_title">
			    			<h3>#cat.c_title#</h3>
		    				<ul id="#cat.c_url##cat.c_id#" class="sortable">
		    					<cfoutput>
								<cfif cat.s_switch eq 0>
									<li id="#cat.c_id#_#cat.s_id#" class="caseBox">
										<h4 class="pull-left"><a href="pneuSubCatFunctions.cfm?subCat=#cat.s_id#" title="Edit">#cat.s_title#</a></h4>
										<a href="##" class="delete icon-trash pull-right" rel="#cat.s_id#" title="Delete"></a>
										<a href="pneuSubCatFunctions.cfm?subCat=#cat.s_id#" class="edit icon-edit pull-right" title="Edit"></a>
									</li>
								</cfif>
			    				</cfoutput>
		    				</ul>
		    			</cfoutput>
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
		
		<cfoutput query="cat" group="c_title">
		$('###cat.c_url#').sortable({
			connectWith: '###cat.c_url##cat.c_id#',
			cursor: 'move',
			opacity: 0.6,
			placeholder: 'placeholder',
			start: function(e, ui){
		        ui.placeholder.height(ui.item.height());
		    },
		    tolerance: 'pointer',
			update: function() {
				$('##sortMessage').html(updateButton);
				$('##sortMessage').css('display', 'block');
			}
		});
		</cfoutput>
		
		<cfoutput query="cat" group="c_title">
		$('###cat.c_url##cat.c_id#').sortable({
			connectWith: '###cat.c_url#',
			cursor: 'move',
			opacity: 0.6,
			placeholder: 'placeholder',
			start: function(e, ui){
		        ui.placeholder.height(ui.item.height());
		    },
		    tolerance: 'pointer',
			update: function() {
				$('##sortMessage').html(updateButton);
				$('##sortMessage').css('display', 'block');
			}
		});
		</cfoutput>
		
		<cfset catList = "">
		<cfset actList = "">
		<cfset inList = "">
		$('#sortMessage').on('click', 'a.btnLink', function() {
			$('#sortMessage').html('<p>Saving changes...</p>');
			<cfoutput query="cat" group="c_title">
			var #NumberAsString(cat.c_id)# = $('###cat.c_url#').sortable('serialize', { key: '#cat.c_id#' });
			<cfset catList = listAppend(catList, #cat.c_id#)>
			<cfset actList = listAppend(actList, #NumberAsString(cat.c_id)#)>
			</cfoutput>
			<cfoutput query="cat" group="c_title">
			var #Reverse(NumberAsString(cat.c_id))# = $('###cat.c_url##cat.c_id#').sortable('serialize', { key: '#cat.c_id#' });
			<cfset inList = listAppend(inList, #Reverse(NumberAsString(cat.c_id))#)>
			</cfoutput>
			$.ajax({
				type: 'POST',
				url: 'update.cfm',
				data: {
					section: 'subCat', <cfoutput>catList: '#catList#', <cfloop from="1" to="#listLen(catList)#" index="i">act#i#: #listGetAt(actList, i)#, </cfloop><cfloop from="1" to="#listLen(catList)#" index="j">in#j#: #listGetAt(inList, j)#<cfif j lt listLen(inList)>, </cfif></cfloop></cfoutput>
				},
				success: function(response){
					$('#sortMessage').html(response);
				}
			});
		});
		
		$('.delete').click(function() {
			var subCat = $(this).attr('rel');
			var destination = 'delete.cfm?section=subCat&subCat=' + subCat;
			
			if (confirm('Are you sure you want to delete this subcategory?')) {
				window.location.replace(destination);
			}
			
			return false;
		});
	});
	</script>
</body>
</html>
<cfinvoke 
	component="#application.components#.queryController" 
	method="pneuProd" 
	returnvariable="prod">
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
    				<a href="pneuProdFunctions.cfm" class="quoteBtn">Add Product</a>
	    			<h1>Pneumatic Products</h1>
					<div class="clearfix"></div>
					
	    			<ul>
	    				<cfif isDefined('url.add')><li class="success">New product added.</li></cfif>
	    				<cfif isDefined('url.edit')><li class="success">Product edit successful.</li></cfif>
	    				<cfif isDefined('url.delete')><li class="success">Product deletion successful.</li></cfif>
	    			</ul>
	    			
	    			<div id="sortMessage" class="hide"></div>
					
					<cfoutput>
	    				<h2>Active</h2>
	    				
	    				<ul id="sortActive" class="sortable">
		    				<cfloop query="prod">
							<cfif prod.p_switch eq 1>
							<li id="act_#prod.id#" class="caseBox">
								<h4 class="pull-left"><a href="pneuProdFunctions.cfm?prod=#prod.id#" title="Edit">#prod.p_title#</a></h4>
								<div class="actionBtn pull-right">
									<a href="##" class="delete icon-trash pull-right" rel="#prod.id#" title="Delete"></a>
									<a href="pneuProdFunctions.cfm?prod=#prod.id#" class="edit icon-edit pull-right" title="Edit"></a>
								</div>
								<div class="clearfix"></div>
								
								<cfquery name="cats" datasource="#application.datasource#">
									SELECT c_title
									FROM prodCat
									LEFT JOIN link
									ON c_id = ownerID
									WHERE prodID = <cfqueryparam value="#prod.id#" CFSQLType="cf_sql_integer">
										AND ownerID > <cfqueryparam value="0" CFSQLType="cf_sql_integer">
										AND c_direct = <cfqueryparam value="0" CFSQLType="cf_sql_integer">
									ORDER BY c_title
								</cfquery>
								<p><strong>Categories:</strong> <cfloop query="cats">#cats.c_title#<cfif not cats.isLast()>; </cfif></cfloop></p>
								
								<cfquery name="subs" datasource="#application.datasource#">
									SELECT s_title
									FROM prodSubCat
									LEFT JOIN link
									ON s_id = sOwnerID
									WHERE prodID = <cfqueryparam value="#prod.id#" CFSQLType="cf_sql_integer">
										AND sOwnerID > <cfqueryparam value="0" CFSQLType="cf_sql_integer">
									ORDER BY s_title
								</cfquery>
								<p><strong>Subcategories:</strong> <cfloop query="subs">#subs.s_title#<cfif not subs.isLast()>; </cfif></cfloop></p>
							</li>
							</cfif>
		    				</cfloop>
	    				</ul>
	    				
	    				<div id="inactive" class="well">
		    				<h2>Inactive</h2>
		    				<ul id="sortInactive" class="sortable">
			    				<cfloop query="prod">
								<cfif prod.p_switch eq 0>
								<li id="in_#prod.id#" class="caseBox">
									<h4 class="pull-left"><a href="pneuProdFunctions.cfm?prod=#prod.id#" title="Edit">#prod.p_title#</a></h4>
									<div class="actionBtn pull-right">
										<a href="##" class="delete icon-trash pull-right" rel="#prod.id#" title="Delete"></a>
										<a href="pneuProdFunctions.cfm?prod=#prod.id#" class="edit icon-edit pull-right" title="Edit"></a>
									</div>
									<div class="clearfix"></div>
									
									<cfquery name="cats" datasource="#application.datasource#">
										SELECT c_title
										FROM prodCat
										LEFT JOIN link
										ON c_id = ownerID
										WHERE prodID = <cfqueryparam value="#prod.id#" CFSQLType="cf_sql_integer">
											AND ownerID > <cfqueryparam value="0" CFSQLType="cf_sql_integer">
											AND c_direct = <cfqueryparam value="0" CFSQLType="cf_sql_integer">
										ORDER BY c_title
									</cfquery>
									<p><strong>Categories:</strong> <cfloop query="cats">#cats.c_title#<cfif not cats.isLast()>; </cfif></cfloop></p>
									
									<cfquery name="subs" datasource="#application.datasource#">
										SELECT s_title
										FROM prodSubCat
										LEFT JOIN link
										ON s_id = sOwnerID
										WHERE prodID = <cfqueryparam value="#prod.id#" CFSQLType="cf_sql_integer">
											AND sOwnerID > <cfqueryparam value="0" CFSQLType="cf_sql_integer">
										ORDER BY s_title
									</cfquery>
									<p><strong>Subcategories:</strong> <cfloop query="subs">#subs.s_title#<cfif not subs.isLast()>; </cfif></cfloop></p>
								</li>
								</cfif>
			    				</cfloop>
		    				</ul>
		    			</div>
    				</cfoutput>
	    		</div>
	    	</div><!--- row-fluid--->
		</div><!--- conIndent --->
    </div><!--- container --->
    
    <cfinclude template="inc/footer.cfm">
	
	<cfinclude template="inc/scripts.cfm">
	<script type="text/javascript">
	$(document).ready(function() {
		var updateButton = '<p><a href="#" id="updateSort" class="btnLink pull-left">Update</a> Click to save the changes. The order will not be affected.</p>';
		
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
				data: { section: 'pneu', act: actSort, in: inSort},
				success: function(response){
					$('#sortMessage').html(response);
				}
			});
		});
		
		$('.delete').click(function() {
			var pneu = $(this).attr('rel');
			var destination = 'delete.cfm?section=pneu&prod=' + pneu;
			
			if (confirm('Are you sure you want to delete this product?')) {
				window.location.replace(destination);
			}
			
			return false;
		});
	});
	</script>
</body>
</html>
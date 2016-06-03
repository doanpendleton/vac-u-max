<cfset fromDate = DateAdd('d', -7, Now())>
<cfparam name="form.from" default="#DateFormat(fromDate, 'yyyy-mm-dd')#">
<cfparam name="form.to" default="#DateFormat(Now(), 'yyyy-mm-dd')#">
<cfinvoke 
	component="#application.components#.queryController"
	method="adminRfq"
	returnVariable="rfq">
	<cfinvokeargument name="sec" value="pneu">
</cfinvoke>
<cfquery name="r" dbtype="query">
	SELECT submitted, comp, name, phone, fax, email, address1, address2, city, state, zip, country, prod
	FROM rfq
	WHERE  submitted >= <cfqueryparam value="#DateFormat(form.from, 'yyyy-mm-dd')#" cfsqltype="cf_sql_date">
		AND submitted <= <cfqueryparam value="#DateFormat(form.to, 'yyyy-mm-dd')#" cfsqltype="cf_sql_date">
</cfquery>
<cfprocessingdirective pageEncoding="utf-8">
<!DOCTYPE html>
<html>
<head>
	<cfinclude template="inc/head.cfm">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
</head>

<body>
	<cfinclude template="inc/top.cfm">
    
    <div class="container">
		<div class="conIndent">
	    	<div class="row-fluid">
	    		<div id="prodCon" class="span12 well">
	    			<h1>RFQ Pneumatic</h1>
	    			
	    			<cfoutput>
	    			<form action="#cgi.script_name#" name="days" method="post" id="form">
	    				<p>Display from <input type="text" name="from" id="from" value="#DateFormat(form.from, 'mm/dd/yyyy')#"> 
	    				to <input type="text" name="to" id="to" value="#DateFormat(form.to, 'mm/dd/yyyy')#">
	    				<input name="send" type="submit" id="submit" class="subAdjust" value="Submit">
	    			</form>
	    			</cfoutput>
	    			
	    			<cfif r.recordcount gt 0>
	    				<table class="table table-bordered" id="overview">
	    					<tr>
							<cfoutput query="r">
								<td width="25%">
									<h4>#r.name#</h4>
									<p>#r.comp#<br>
									#r.phone#<br>
									<a href="mailto:#r.email#">#r.email#</a><br>
									<cfif r.fax neq "">#r.fax#<br></cfif>
									Submitted on: #DateFormat(r.submitted, "mm/dd/yyyy")#<br>
									Interested in: #r.prod#<br>
									<br>
									#r.address1#<br>
									<cfif r.address2 neq "">#r.address2#<br></cfif>
									#r.city#, #r.state# #r.zip#<br>
									#r..country#</p>
								</td>
							<cfif r.currentrow mod 4 eq 0>
				    		</tr>
				    		<tr>
				    		<cfelseif r.currentrow mod 4 eq 1 AND r.IsLast()>
				    			<td width="25%">&nbsp;</td>
				    			<td width="25%">&nbsp;</td>
				    			<td width="25%">&nbsp;</td>
				    		</tr>
				    		<tr>
				    		<cfelseif r.currentrow mod 4 eq 2 AND r.IsLast()>
				    			<td width="25%">&nbsp;</td>
				    			<td width="25%">&nbsp;</td>
				    		</tr>
				    		<tr>
				    		<cfelseif r.currentrow mod 4 eq 3 AND r.IsLast()>
				    			<td width="25%">&nbsp;</td>
				    		</tr>
				    		<tr>
				    		</cfif>
				    		</cfoutput>
	    					</tr>
	    				</table>
	    			<cfelse>
	    				<p>There are no submissions to display.</p>
	    			</cfif>
	    		</div>
	    	</div><!--- row-fluid--->
		</div><!--- conIndent --->
    </div><!--- container --->
    
    <cfinclude template="inc/footer.cfm">
	<cfinclude template="inc/scripts.cfm">
	<script src="<cfoutput>#application.root#</cfoutput>js/jquery.validate.min.js"></script>
	<cfquery name="minD" dbtype="query">
    	SELECT submitted
    	FROM rfq
    	ORDER BY submitted
	</cfquery>
	<script>
	$(document).ready(function() {
		var minD = '<cfoutput query="minD" maxrows="1">#DateFormat(rfq.submitted, "yyyy, mm, dd")#</cfoutput>';
		
		$( "#from" ).datepicker({
			defaultDate: "+1w",
			changeMonth: true,
			changeYear: true,
			maxDate: 'today',
			minDate: new Date(minD),
			numberOfMonths: 3,
			onClose: function( selectedDate ) {
				$( "#to" ).datepicker( "option", "minDate", selectedDate );
			},
			showButtonPanel: true
		});
		$( "#to" ).datepicker({
			defaultDate: "+1w",
			changeMonth: true,
			changeYear: true,
			maxDate: 'today',
			numberOfMonths: 3,
			onClose: function( selectedDate ) {
				$( "#from" ).datepicker( "option", "maxDate", selectedDate );
			},
			showButtonPanel: true
		});
		
		$("#form").validate({
			errorPlacement: function(error, element) {
				 error.insertAfter(element);
			},
			rules: {
				from: "required",
				to: "required"
			},
			messages: {
				from: "Please enter a starting date.",
				to: "Please enter an ending date."
			}
		});
	});
	</script>
</body>
</html>
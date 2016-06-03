<cfset fromDate = DateAdd('d', -7, Now())>
<cfif isDefined("url.from")>
	<cfparam name="form.from" default="#url.from#">
<cfelse>
	<cfparam name="form.from" default="#DateFormat(fromDate, 'yyyy-mm-dd')#">
</cfif>
<cfif isDefined("url.to")>
	<cfparam name="form.to" default="#url.to#">
<cfelse>
	<cfparam name="form.to" default="#DateFormat(Now(), 'yyyy-mm-dd')#">
</cfif>
<cfinvoke
	component="#application.components#.queryController"
	method="adminRfq"
	returnVariable="rfq">
	<cfinvokeargument name="sec" value="Pulsonic Bin Activators">
</cfinvoke>
<cfquery name="r" dbtype="query">
	SELECT *
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
	    			<h1>RFQ Pulsonic</h1>

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
									<a href="##" class="delete icon-trash pull-right" rel="#r.id#&page=rfqPuls&from=#form.from#&to=#form.to#" title="Delete"></a>
									<cfif r.backup neq ""><a href="reports/backups/#r.backup#" class="edit icon-file pull-right" title="View" target="_blank"></a></cfif>
									<h4><span class="symLabel icon-user pull-left"></span>#r.fname# #r.lname#</h4>
									<p><span class="symLabel icon-briefcase pull-left"></span>#r.comp#<br>
									<span class="symLabel icon-bell pull-left"></span>#r.phone#<br>
									<a href="mailto:#r.email#"><span class="symLabel icon-envelope pull-left"></span>#r.email#</a><br>
									<cfif r.fax neq ""><span class="symLabel icon-print pull-left"></span>#r.fax#<br></cfif>
									<span class="symLabel icon-calendar pull-left"></span>Submitted on: #DateFormat(r.submitted, "mm/dd/yyyy")#<br>
									<span class="symLabel icon-exclamation-sign pull-left"></span>Interested in: #r.prod#<br>
									<br>
									<span class="symLabel icon-road pull-left"></span>#r.address1#<br>
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
	<cfinclude template="inc/rfq.cfm">
</body>
</html>
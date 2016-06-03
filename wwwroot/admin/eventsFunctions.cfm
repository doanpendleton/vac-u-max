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
	    			<cfset showForm = true>
	    			<cfparam name="url.event" default="">
					<cfparam name="form.date" default="">
					<cfparam name="form.disDate" default="">
					<cfparam name="form.ti" default="">
					<cfparam name="form.link" default="">
					<cfparam name="form.loc" default="">
					<cfparam name="form.venue" default="">
					<cfparam name="form.ind" default="">
					<cfparam name="form.booth" default="">
					<cfparam name="form.hide" default="1">

					<cfif isDefined("form.send")>
						<cfset errors = "">

						<cfif errors is "">
							<!--- do something here --->
							<cfset showForm = false>
						</cfif>
					</cfif>

					<cfif showForm>
						<cfif url.event eq "">
		    				<h1>Add Event</h1>

							<cfoutput>
							<form action="#cgi.script_name#" method="post" id="form">
								<p>Fields designated with an asterisk (<span class="ast">*</span>) are required.</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Start Date</label>
									<input type="text" name="date" id="date">
								</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Display Date</label>
									<input type="text" name="disDate" id="disDate" class="form">
								</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Title</label>
									<input type="text" name="ti" id="ti" class="form">
								</p>
								<p>
									<label class="formLabel">Link</label>
									<input type="text" name="link" id="link" class="form"><br>
									<label class="formLabel">&nbsp;</label>
									<em>Must include "http://"</em>
								</p>
								<p>
									<label class="formLabel">Location</label>
									<input type="text" name="loc" id="loc" class="form">
								</p>
								<p>
									<label class="formLabel">Venue</label>
									<input type="text" name="venue" id="venue" class="form">
								</p>
								<p>
									<label class="formLabel">Industry</label>
									<input type="text" name="ind" id="ind" class="form">
								</p>
								<p>
									<label class="formLabel">Booth</label>
									<input type="text" name="booth" id="booth" class="form">
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="hide" id="hide" value="0"> Hidden</label>
								</p>
								<p>
									<input type="hidden" name="eventID" id="eventID" value="">
									<input name="send" type="submit" id="submit" value="Submit">
								</p>
							</form>
							</cfoutput>

						<cfelse>
							<cfinvoke
								component="#application.components#.queryController"
								method="adminEvents"
								returnvariable="events">
								<cfinvokeargument name="event" value="#url.event#">
							</cfinvoke>

							<h1>Edit Event</h1>

							<cfoutput query="events">
							<form action="#cgi.script_name#" method="post" id="form">
								<p>Fields designated with an asterisk (<span class="ast">*</span>) are required.</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Date</label>
									<input type="text" name="date" id="date" value="#DateFormat(events.startDate, 'mm/dd/yyyy')#">
								</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Display Date</label>
									<input type="text" name="disDate" id="disDate" class="form" value="#events.displayDate#">
								</p>
								<p>
									<label class="formLabel"><span class="ast">*</span>Title</label>
									<input type="text" name="ti" id="ti" class="form" value="#events.title#">
								</p>
								<p>
									<label class="formLabel">Link</label>
									<input type="text" name="link" id="link" class="form" value="#events.link#"><br>
									<label class="formLabel">&nbsp;</label>
									<em>Must include "http://"</em>
								</p>
								<p>
									<label class="formLabel">Location</label>
									<input type="text" name="loc" id="loc" class="form" value="#events.location#">
								</p>
								<p>
									<label class="formLabel">Venue</label>
									<input type="text" name="venue" id="venue" class="form" value="#events.venue#">
								</p>
								<p>
									<label class="formLabel">Industry</label>
									<input type="text" name="ind" id="ind" class="form" value="#events.industry#">
								</p>
								<p>
									<label class="formLabel">Booth</label>
									<input type="text" name="booth" id="booth" class="form" value="#events.booth#">
								</p>
								<p>
									<label class="checkLabel"><input type="checkbox" name="hide" id="hide" value="0"<cfif events.switch eq 0> checked</cfif>> Hidden</label>
								</p>
								<p>
									<input type="hidden" name="eventID" id="eventID" value="#url.event#">
									<input name="send" type="submit" id="submit" value="Submit">
								</p>
							</form>
							</cfoutput>
						</cfif>

					<cfelse>

						<cfif form.eventID eq "">
							<!--- Add new event to db. --->
							<cfoutput>
								<cfquery name="addEvent" dataSource="#application.datasource#">
									INSERT INTO events (year, startDate, displayDate, title, link, location, venue, industry, booth, switch)
									VALUES (
										<cfqueryparam value="#DateFormat(form.date, 'yyyy')#" CFSQLType="cf_sql_integer">,
										<cfqueryparam value="#DateFormat(form.date, 'yyyy-mm-dd')#" CFSQLType="cf_sql_timestamp">,
										<cfqueryparam value="#Trim(form.disDate)#" cfsqltype="cf_sql_varchar">,
										<cfqueryparam value="#Trim(form.ti)#" cfsqltype="cf_sql_text">,
										<cfqueryparam value="#Trim(form.link)#" cfsqltype="cf_sql_text">,
										<cfqueryparam value="#Trim(form.loc)#" cfsqltype="cf_sql_varchar">,
										<cfqueryparam value="#Trim(form.venue)#" cfsqltype="cf_sql_varchar">,
										<cfqueryparam value="#Trim(form.ind)#" cfsqltype="cf_sql_varchar">,
										<cfqueryparam value="#Trim(form.booth)#" cfsqltype="cf_sql_varchar">,
										<cfqueryparam value="#Trim(form.hide)#" cfsqltype="cf_sql_integer">)
								</cfquery>

								<cflocation url="events.cfm?add" addToken="no">
							</cfoutput>

						<cfelse>

							<!--- Edit event --->
							<cfoutput>
								<cfquery name="editEvent" dataSource="#application.datasource#">
									UPDATE events
									SET year = <cfqueryparam value="#DateFormat(form.date, 'yyyy')#" CFSQLType="cf_sql_integer">,
										startDate = <cfqueryparam value="#DateFormat(form.date, 'yyyy-mm-dd')#" CFSQLType="cf_sql_timestamp">,
										displayDate = <cfqueryparam value="#Trim(form.disDate)#" cfsqltype="cf_sql_varchar">,
										title = <cfqueryparam value="#Trim(form.ti)#" cfsqltype="cf_sql_text">,
										link = <cfqueryparam value="#Trim(form.link)#" cfsqltype="cf_sql_text">,
										location = <cfqueryparam value="#Trim(form.loc)#" cfsqltype="cf_sql_varchar">,
										venue = <cfqueryparam value="#Trim(form.venue)#" cfsqltype="cf_sql_varchar">,
										industry = <cfqueryparam value="#Trim(form.ind)#" cfsqltype="cf_sql_varchar">,
										booth = <cfqueryparam value="#Trim(form.booth)#" cfsqltype="cf_sql_varchar">,
										switch = <cfqueryparam value="#Trim(form.hide)#" cfsqltype="cf_sql_integer">
									WHERE id = <cfqueryparam value="#Trim(form.eventID)#" cfsqltype="cf_sql_integer">
								</cfquery>

								<cflocation url="events.cfm?edit" addToken="no">
							</cfoutput>
						</cfif>
					</cfif>
	    		</div>
	    	</div><!--- row-fluid--->
		</div><!--- conIndent --->
    </div><!--- container --->

    <cfinclude template="inc/footer.cfm">

	<cfinclude template="inc/scripts.cfm">
	<script src="<cfoutput>#application.root#</cfoutput>js/jquery.validate.min.js"></script>
	<script>
		$(document).ready(function() {
			$( "#date" ).datepicker({
				changeMonth: true,
				changeYear: true,
				numberOfMonths: 1,
				showButtonPanel: true
			});

			$("#form").validate({
				ignore: [],
				errorPlacement: function(error, element) {
					 if (element.attr('name') == 'bod') {
						error.insertBefore(element);
					} else {
						error.appendTo(element.parent());
					}
				},
				rules: {
					date: "required",
					disDate: "required",
					ti: "required"
				},
				messages: {
					date: "Please enter a start date.",
					disDate: "Please enter a display date.",
					ti: "Please enter a title."
				}
			});
		});
	</script>
</body>
</html>
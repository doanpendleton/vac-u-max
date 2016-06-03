	<cfquery name="minD" dbtype="query">
    	SELECT submitted
    	FROM rfq
    	ORDER BY submitted
	</cfquery>
	<script>
		$(document).ready(function() {
			var minD = '<cfoutput query="minD" maxrows="1">#DateFormat(minD.submitted, "yyyy, mm, dd")#</cfoutput>';

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

			$('.delete').click(function() {
				var rfq = $(this).attr('rel');
				var destination = 'delete.cfm?section=rfq&rfq=' + rfq;

				if (confirm('Are you sure you want to delete this lead?')) {
					window.location.replace(destination);
				}
			});
		});
	</script>
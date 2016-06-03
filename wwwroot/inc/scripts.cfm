	<cfoutput>
	    <script>document.cookie='resolution='+Math.max(screen.width,screen.height)+("devicePixelRatio" in window ? ","+devicePixelRatio : ",1")+'; path=/';</script>
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script src="#application.js#jquery.smartmenus.min.js"></script>
		<cfif FindNoCase("contact", cgi.script_name)><script src="#application.js#insiteContact.js"></script></cfif>
		<cfif FindNoCase("quote", cgi.script_name)><script src="#application.js#insiteRFQ.js"></script></cfif>
		<cfif FindNoCase("landingPneumatic", cgi.script_name)><script src="#application.js#insiteQuote.js"></script></cfif>
		<script src="#application.js#jquery.resize.min.js"></script>
		<script src="#application.js#bootstrap.min.js"></script>
		<script src="#application.js#tracking-footer.js"></script>
		<script>
			$(document).ready(function() {
				$('##topMenu').smartmenus({
					keepHighlighted: true,
					subIndicators: false
				});

				var phone = $('##phone');
				var nav = $('##sideNav');

				$(window).scroll(function() {
					if($(this).scrollTop() > 431) {
						phone.addClass("fixedPhone");
						phone.css("width", nav.width());
						nav.stop().css("margin-top", "50px");
					} else {
						phone.removeClass("fixedPhone");
						phone.css("width", nav.width());
						nav.stop().css("margin-top", "0px");
					}
				});

				$(nav).resize(function() {
					phone.css("width", nav.width());
				});
			});
		</script>
	</cfoutput>
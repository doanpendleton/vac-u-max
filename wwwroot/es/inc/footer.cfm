	<div id="footer" class="gradient">
    	<div class="container">
    		<div id="footBar" class="row-fluid"></div>

    		<div class="row-fluid hidden-phone">
    			<div class="span6">
    				<cfoutput>
    				<p>
	    				<a href="#application.root#sales/sales.cfm">Ventas</a> |
    					<a href="#application.esRoot#terms.cfm">Términos y Condiciones</a> |
    					<a href="#application.esRoot#privacy.cfm">Declaración de Privacidad</a> |
    					<a href="#application.esRoot#site.cfm">Mapa del Sitio</a>
    				</p>
    				<p>&copy; #DateFormat(Now(), "yyyy")# VAC-U-MAX</p>
    				</cfoutput>
    			</div>

    			<div class="span6 text-right">
    				<p>VAC-U-MAX &bull; 69 William Street, Belleville, NJ  07109</p>
    				<h3>973-759-4600<br>800-822-8629</h3>
    			</div>
    		</div><!--- row-fluid --->

    		<div class="row-fluid visible-phone">
    			<div class="span12">
    				<cfoutput>
    				<p>
    					<a href="#application.esRoot#terms.cfm">Términos y Condiciones</a> |
    					<a href="#application.esRoot#privacy.cfm">Declaración de Privacidad</a> |
    					<a href="#application.esRoot#">Mapa del Sitio</a>
    				</p>
    				<p>VAC-U-MAX &bull; 69 William Street, Belleville, NJ  07109</p>
    				<h3><a href="tel:973-759-4600">973-759-4600</a><br><a href="tel:800-822-8629">800-822-8629</a></h3>
    				<p>&copy; #DateFormat(Now(), "yyyy")# VAC-U-MAX</p>
    				</cfoutput>
    				<script>
					  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
					  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
					  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
					  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

					  ga('create', 'UA-51498203-1', 'vac-u-max.com');
					  ga('send', 'pageview');

					</script>
    			</div>
    		</div><!--- row-fluid --->
    	</div><!--- container --->
    </div><!--- footer --->
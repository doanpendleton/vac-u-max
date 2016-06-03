<cfsetting enablecfoutputonly="true">

<cfif structKeyExists(form, "g-recaptcha-response")>
	<cfscript>
		creds = {'siteKey'=application.reCaptchaSite, 'secret'=application.reCaptchaSecret};

		// ReCAPTCHA supports 40+ languages listed at: https://developers.google.com/recaptcha/docs/language
		lang = 'en';

		// The response from ReCAPTCHA
		if ( StructKeyExists(form, 'g-recaptcha-response') ) {
		  reCaptcha = new cfc.reCaptcha(creds.secret);
		  resp = reCaptcha.verifyResponse(response=form['g-recaptcha-response'], remoteip=cgi.remote_addr);
		}
	</cfscript>
    <cfif resp.success>
    	<cfoutput>true</cfoutput>
    <cfelse>
    	<cfoutput><label class="error">Please complete the reCAPTCHA.</label></cfoutput>
    </cfif>
<cfelse>
    <cfoutput><label class="error">No form submission.</label></cfoutput>
</cfif>
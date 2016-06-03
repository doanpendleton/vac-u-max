//TopSpot Form Code - START - Contact Us - 8-12-2014 - Kate
jQuery(document).ready(function(){
	var insiteForm = jQuery('form#form');
	var submitBtn = insiteForm.find('input[type="submit"]');
	submitBtn.hide();
	submitBtn.after('<input name="send" type="submit" id="send" value="Submit" track="track-FORM-btn">');
 
	function trackContactForm() {
		if (insiteForm.find(':input[name="fn"]').val() != "") {
			trackurl = "//www.topfloortech.com/insitemetrics/uRMJ/uniformv2.php";
			trackurl += "?actk=havmcp-6o3bs6dmtp";
			trackurl += "&imReferrerField=" + encodeURIComponent(document.referrer);
 
			trackurl += "&Interested=" + encodeURIComponent(insiteForm.find('select[name="int"] option:selected').text());
			trackurl += "&Name=" + encodeURIComponent(insiteForm.find(':input[name="fn"]').val() + " " + insiteForm.find(':input[name="ln"]').val());
			trackurl += "&Company=" + encodeURIComponent(insiteForm.find(':input[name="co"]').val());
			trackurl += "&Phone=" + encodeURIComponent(insiteForm.find(':input[name="ph"]').val());
			trackurl += "&Fax=" + encodeURIComponent(insiteForm.find(':input[name="fax"]').val());
			trackurl += "&imEmailField=" + encodeURIComponent(insiteForm.find(':input[name="email"]').val());
			trackurl += "&Address=" + encodeURIComponent(insiteForm.find(':input[name="ad"]').val());
			trackurl += "&Address2=" + encodeURIComponent(insiteForm.find(':input[name="ad2"]').val());
			trackurl += "&City=" + encodeURIComponent(insiteForm.find(':input[name="ci"]').val());
			trackurl += "&State=" + encodeURIComponent(insiteForm.find(':input[name="st"]').val());
			trackurl += "&Zip_Code=" + encodeURIComponent(insiteForm.find(':input[name="zip"]').val());
			trackurl += "&Country=" + encodeURIComponent(insiteForm.find('select[name="cou"] option:selected').text());
			trackurl += "&Comments=" + encodeURIComponent(insiteForm.find(':input[name="com"]').val());

			trackimg = new Image(1,1);
			trackimg.src = trackurl;
			ga('send', 'pageview', '/forms/contactThanks')
		}
		setTimeout(function(){submitBtn.click();}, 500);
	}
	jQuery(':input[track="track-FORM-btn"]').click(function(e) {e.preventDefault(); trackContactForm();});
	insiteForm.find('input').keyup(function(e) {
		if(e.keyCode==13){e.preventDefault(); trackContactForm();}
	});
});
//TopSpot Form Code - END - Contact Us - 8-12-2014 - Kate
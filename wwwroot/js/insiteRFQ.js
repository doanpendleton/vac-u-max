//TopSpot Form Code - START - RFQ - 8-12-2014 - Kate
jQuery(document).ready(function(){
	var currentpage = window.location.pathname;
	
	var quotePneumatic = [ "/quotePneumatic.cfm/", "/quotePneumatic.cfm" ];
	var quoteVacuum = [ "/quoteVacuum.cfm/", "/quoteVacuum.cfm" ];
	var quoteAerocon = [ "/quoteAerocon.cfm/", "/quoteAerocon.cfm", "/quoteAerocon.cfm?prod=aero-mechanical-conveyors/", "/quoteAerocon.cfm?prod=aero-mechanical-conveyors" ];
	var quoteFlexibleScrew = [ "/quoteFlexibleScrew.cfm/", "/quoteFlexibleScrew.cfm", "/quoteFlexibleScrew.cfm?prod=flexible-screw-conveyors/", "/quoteFlexibleScrew.cfm?prod=flexible-screw-conveyors" ];
	var quotePulsonic = [ "/quotePulsonic.cfm/", "/quotePulsonic.cfm", "/quotePulsonic.cfm?prod=pulsonic-bin-activators/", "/quotePulsonic.cfm?prod=pulsonic-bin-activators" ];
	var quoteVacuumSystems = [ "/quoteVacuumSystems.cfm/", "/quoteVacuumSystems.cfm" ];
 
	if ( jQuery.inArray(currentpage, quotePneumatic) != -1 ) {
		var insitePneumaticForm = jQuery('form#form');
			var submitPneumaticBtn = insitePneumaticForm.find('input[type="submit"]');
			submitPneumaticBtn.hide();
			submitPneumaticBtn.after('<input name="send" type="submit" id="send" value="Submit Quote" track="track-Pneumatic-btn">');
		 
			function trackPneumaticForm() {
				if (insitePneumaticForm.find(':input[name="fn"]').val() != "") {
					trackurl = "//www.topfloortech.com/insitemetrics/uRMJ/uniformv2.php";
					trackurl += "?actk=havmcp-6qlwkr87kq";
					trackurl += "&imReferrerField=" + encodeURIComponent(document.referrer);
		 
					trackurl += "&Interested=" + encodeURIComponent(insitePneumaticForm.find('select[name="prod"] option:selected').text());
					trackurl += "&Company=" + encodeURIComponent(insitePneumaticForm.find(':input[name="co"]').val());
					trackurl += "&Name=" + encodeURIComponent(insitePneumaticForm.find(':input[name="fn"]').val() + " " + insitePneumaticForm.find(':input[name="ln"]').val());
					trackurl += "&Phone=" + encodeURIComponent(insitePneumaticForm.find(':input[name="ph"]').val());
					trackurl += "&Fax=" + encodeURIComponent(insitePneumaticForm.find(':input[name="fax"]').val());
					trackurl += "&imEmailField=" + encodeURIComponent(insitePneumaticForm.find(':input[name="email"]').val());
					trackurl += "&Address=" + encodeURIComponent(insitePneumaticForm.find(':input[name="ad1"]').val());
					trackurl += "&Address2=" + encodeURIComponent(insitePneumaticForm.find(':input[name="ad2"]').val());
					trackurl += "&City=" + encodeURIComponent(insitePneumaticForm.find(':input[name="ci"]').val());
					trackurl += "&State=" + encodeURIComponent(insitePneumaticForm.find(':input[name="st"]').val());
					trackurl += "&Zip_Code=" + encodeURIComponent(insitePneumaticForm.find(':input[name="zip"]').val());
					trackurl += "&Country=" + encodeURIComponent(insitePneumaticForm.find('select[name="cou"] option:selected').text());
					trackurl += "&Application=" + encodeURIComponent(insitePneumaticForm.find(':input[name="com"]').val());
					trackurl += "&Rep_visit=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="0_rep"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Magazine=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="0_mag_a"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Publication=" + encodeURIComponent(insitePneumaticForm.find(':input[name="0_mag_b"]').val());
					trackurl += "&Trade_Show=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="0_trade_a"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Trade=" + encodeURIComponent(insitePneumaticForm.find(':input[name="0_trade_b"]').val());
					trackurl += "&Internet=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="0_int_a"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Search=" + encodeURIComponent(insitePneumaticForm.find(':input[name="0_int_b"]').val());
					trackurl += "&Other=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="0_oth_a"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Other1=" + encodeURIComponent(insitePneumaticForm.find(':input[name="0_oth_b"]').val());
					trackurl += "&Common_Name=" + encodeURIComponent(insitePneumaticForm.find(':input[name="1_cname"]').val());
					trackurl += "&Trade_Name=" + encodeURIComponent(insitePneumaticForm.find(':input[name="1_tname"]').val());
					trackurl += "&Density=" + encodeURIComponent(insitePneumaticForm.find(':input[name="2_density"]').val());
					trackurl += "&Units=" + encodeURIComponent(insitePneumaticForm.find('select[name="2_units"] option:selected').text());
					trackurl += "&Pellet=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="3a_pellet"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Flake=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="3a_flake"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Granule=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="3a_gran"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Fibrous=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="3a_fib"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Powder=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="3a_pow"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Object=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="3a_object_a"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Describe=" + encodeURIComponent(insitePneumaticForm.find(':input[name="3a_object_b"]').val());
					trackurl += "&Size=" + encodeURIComponent(insitePneumaticForm.find(':input[name="3b_size"]').val());
					trackurl += "&Units=" + encodeURIComponent(insitePneumaticForm.find('select[name="3b_units"] option:selected').text());
					trackurl += "&Dusty=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="3c_dust"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Hygoscropic=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="3c_hyg"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Non_Dusty=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="3c_noDust"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Fragile=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="3c_frag"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Abrasive=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="3c_abr"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Other=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="3c_oth_a"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Other2=" + encodeURIComponent(insitePneumaticForm.find(':input[name="3c_oth_b"]').val());
					trackurl += "&Cohesive=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="3d_coh"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Acidic=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="3d_acid"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Radioactive=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="3d_rad"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Adhesive=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="3d_adh"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Caustic=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="3d_cau"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Corrosive=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="3e_cor_a"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Materials=" + encodeURIComponent(insitePneumaticForm.find(':input[name="3e_cor_b"]').val());
					trackurl += "&Toxic=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="3f_tox_a"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Explain=" + encodeURIComponent(insitePneumaticForm.find(':input[name="3f_tox_b"]').val());
					trackurl += "&Explosive=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="3g_exp_a"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Explain=" + encodeURIComponent(insitePneumaticForm.find(':input[name="3g_exp_b"]').val());
					trackurl += "&Value=" + encodeURIComponent(insitePneumaticForm.find(':input[name="3g_exp_c"]').val());
					trackurl += "&Free_Flowing=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="4_free"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Fluidizes=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="4_fluid"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Sluggish=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="4_slug"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Non_Fluidizing=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="4_notFluid"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Not_Free_Flowing=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="4_notFree"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Fluidizes_and_Floods=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="4_flood"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Compresses=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="4_comp_a"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Angle=" + encodeURIComponent(insitePneumaticForm.find(':input[name="4_comp_b"]').val());
					trackurl += "&Segregation=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="5_seg"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Breakage=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="5_break"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Hours/Day=" + encodeURIComponent(insitePneumaticForm.find(':input[name="6_day"]').val());
					trackurl += "&Days/Week=" + encodeURIComponent(insitePneumaticForm.find(':input[name="6_week"]').val());
					trackurl += "&Weeks/Year=" + encodeURIComponent(insitePneumaticForm.find(':input[name="6_year"]').val());
					trackurl += "&Vertical=" + encodeURIComponent(insitePneumaticForm.find(':input[name="7_vert"]').val());
					trackurl += "&Horizontal=" + encodeURIComponent(insitePneumaticForm.find(':input[name="7_hor"]').val());
					trackurl += "&Bends=" + encodeURIComponent(insitePneumaticForm.find(':input[name="8_bends"]').val());
					trackurl += "&Conveyed=" + encodeURIComponent(insitePneumaticForm.find(':input[name="9_pick"]').val());
					trackurl += "&Continuous=" + encodeURIComponent(insitePneumaticForm.find(':radio[name="10_cont"]:checked').val());
					trackurl += "&Rate=" + encodeURIComponent(insitePneumaticForm.find(':input[name="10_rate"]').val());
					trackurl += "&Process=" + encodeURIComponent(insitePneumaticForm.find(':input[name="10_proc"]').val());
					trackurl += "&Material=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="11_fib_a"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Size=" + encodeURIComponent(insitePneumaticForm.find(':input[name="11_fib_b"]').val());
					trackurl += "&Weight=" + encodeURIComponent(insitePneumaticForm.find(':input[name="11_fib_c"]').val());
					trackurl += "&Boxes=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="11_box_a"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Size=" + encodeURIComponent(insitePneumaticForm.find(':input[name="11_box_b"]').val());
					trackurl += "&Weight=" + encodeURIComponent(insitePneumaticForm.find(':input[name="11_box_c"]').val());
					trackurl += "&Bulk_Bags=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="11_ibc_a"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Size=" + encodeURIComponent(insitePneumaticForm.find(':input[name="11_ibc_b"]').val());
					trackurl += "&Weight=" + encodeURIComponent(insitePneumaticForm.find(':input[name="11_ibc_c"]').val());
					trackurl += "&Paper_or_Plastic=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="11_bag_a"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Size=" + encodeURIComponent(insitePneumaticForm.find(':input[name="11_bag_b"]').val());
					trackurl += "&Weight=" + encodeURIComponent(insitePneumaticForm.find(':input[name="11_bag_c"]').val());
					trackurl += "&Large_box=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="11_gay_a"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Size=" + encodeURIComponent(insitePneumaticForm.find(':input[name="11_gay_b"]').val());
					trackurl += "&Weight=" + encodeURIComponent(insitePneumaticForm.find(':input[name="11_gay_c"]').val());
					trackurl += "&Storage_Hopper=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="11_silo_a"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Size=" + encodeURIComponent(insitePneumaticForm.find(':input[name="11_silo_b"]').val());
					trackurl += "&Weight=" + encodeURIComponent(insitePneumaticForm.find(':input[name="11_silo_c"]').val());
					trackurl += "&Describe=" + encodeURIComponent(insitePneumaticForm.find(':input[name="11_outlet"]').val());
					trackurl += "&Type=" + encodeURIComponent(insitePneumaticForm.find(':input[name="11_type"]').val());
					trackurl += "&Size=" + encodeURIComponent(insitePneumaticForm.find(':input[name="11_size"]').val());
					trackurl += "&Flow_Rate=" + encodeURIComponent(insitePneumaticForm.find(':input[name="11_flow"]').val());
					trackurl += "&Container=" + encodeURIComponent(insitePneumaticForm.find(':input[name="11_other"]').val());
					trackurl += "&Feed=" + encodeURIComponent(insitePneumaticForm.find(':radio[name="12_feed"]:checked').val());
					trackurl += "&Process=" + encodeURIComponent(insitePneumaticForm.find(':input[name="13_fed"]').val());
					trackurl += "&lbs/min=" + encodeURIComponent(insitePneumaticForm.find(':input[name="14_min"]').val());
					trackurl += "&lbs/hr=" + encodeURIComponent(insitePneumaticForm.find(':input[name="14_hr"]').val());
					trackurl += "&Feeding=" + encodeURIComponent(insitePneumaticForm.find(':radio[name="15_cont"]:checked').val());
					trackurl += "&Batch=" + encodeURIComponent(insitePneumaticForm.find(':input[name="16_size"]').val());
					trackurl += "&Weight=" + encodeURIComponent(insitePneumaticForm.find('select[name="16_units"] option:selected').text());
					trackurl += "&hr=" + encodeURIComponent(insitePneumaticForm.find(':input[name="16a_hr"]').val());
					trackurl += "&day=" + encodeURIComponent(insitePneumaticForm.find(':input[name="16a_day"]').val());
					trackurl += "&Minutes=" + encodeURIComponent(insitePneumaticForm.find(':input[name="16b_min"]').val());
					trackurl += "&Rate=" + encodeURIComponent(insitePneumaticForm.find(':input[name="17_rate"]').val());
					trackurl += "&Units=" + encodeURIComponent(insitePneumaticForm.find('select[name="17_units"] option:selected').text());
					trackurl += "&Points=" + encodeURIComponent(insitePneumaticForm.find(':input[name="18_points"]').val());
					trackurl += "&Mixer=" + encodeURIComponent(insitePneumaticForm.find(':input[name="18_mix"]').val());
					trackurl += "&Blender=" + encodeURIComponent(insitePneumaticForm.find(':input[name="18_blend"]').val());
					trackurl += "&Reactor=" + encodeURIComponent(insitePneumaticForm.find(':input[name="18_react"]').val());
					trackurl += "&Filling Machine=" + encodeURIComponent(insitePneumaticForm.find(':input[name="18_fill"]').val());
					trackurl += "&Silo=" + encodeURIComponent(insitePneumaticForm.find(':input[name="18_silo"]').val());
					trackurl += "&Tank=" + encodeURIComponent(insitePneumaticForm.find(':input[name="18_tank"]').val());
					trackurl += "&Mill=" + encodeURIComponent(insitePneumaticForm.find(':input[name="18_mill"]').val());
					trackurl += "&Screen=" + encodeURIComponent(insitePneumaticForm.find(':input[name="18_screen"]').val());
					trackurl += "&Dryer=" + encodeURIComponent(insitePneumaticForm.find(':input[name="18_dry"]').val());
					trackurl += "&Tablet_Press=" + encodeURIComponent(insitePneumaticForm.find(':input[name="18_tab"]').val());
					trackurl += "&Volumetric_Feed=" + encodeURIComponent(insitePneumaticForm.find(':input[name="18_vol"]').val());
					trackurl += "&Loss=" + encodeURIComponent(insitePneumaticForm.find(':input[name="18_loss"]').val());
					trackurl += "&Other=" + encodeURIComponent(insitePneumaticForm.find(':input[name="18_other"]').val());
					trackurl += "&Size=" + encodeURIComponent(insitePneumaticForm.find(':input[name="19_size"]').val());
					trackurl += "&Headroom=" + encodeURIComponent(insitePneumaticForm.find(':input[name="20_room"]').val());
					trackurl += "&Withstand=" + encodeURIComponent(insitePneumaticForm.find(':radio[name="21_vac_a"]:checked').val());
					trackurl += "&Primary=" + encodeURIComponent(insitePneumaticForm.find(':radio[name="21_vac_b"]:checked').val());
					trackurl += "&Fumes=" + encodeURIComponent(insitePneumaticForm.find(':radio[name="22_heat"]:checked').val());
					trackurl += "&Describe=" + encodeURIComponent(insitePneumaticForm.find(':input[name="22_des"]').val());
					trackurl += "&Operation=" + encodeURIComponent(insitePneumaticForm.find(':radio[name="22_load"]:checked').val());
					trackurl += "&Located=" + encodeURIComponent(insitePneumaticForm.find(':radio[name="23_loc"]:checked').val());
					trackurl += "&Roof=" + encodeURIComponent(insitePneumaticForm.find(':radio[name="23_roof"]:checked').val());
					trackurl += "&Site=" + encodeURIComponent(insitePneumaticForm.find(':input[name="24_loc"]').val());
					trackurl += "&Height=" + encodeURIComponent(insitePneumaticForm.find(':input[name="24_alt"]').val());
					trackurl += "&Units=" + encodeURIComponent(insitePneumaticForm.find(':radio[name="24_unit"]:checked').val());
					trackurl += "&Carbon_Steel=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="25_steel"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&304_SS=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="25_304"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&316_SS=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="25_316"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Other=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="25_other_a"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Other2=" + encodeURIComponent(insitePneumaticForm.find(':input[name="25_other_b"]').val());
					trackurl += "&Single Phase=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="26_sing_a"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Volts=" + encodeURIComponent(insitePneumaticForm.find(':input[name="26_sing_b"]').val());
					trackurl += "&Hz=" + encodeURIComponent(insitePneumaticForm.find(':input[name="26_sing_c"]').val());
					trackurl += "&Three Phase=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="26_three_a"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Volts=" + encodeURIComponent(insitePneumaticForm.find(':input[name="26_three_b"]').val());
					trackurl += "&Hz=" + encodeURIComponent(insitePneumaticForm.find(':input[name="26_three_c"]').val());
					trackurl += "&Other=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="26_oth_a"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Other2=" + encodeURIComponent(insitePneumaticForm.find(':input[name="26_oth_b"]').val());
					trackurl += "&Volts=" + encodeURIComponent(insitePneumaticForm.find(':input[name="26_oth_c"]').val());
					trackurl += "&Hz=" + encodeURIComponent(insitePneumaticForm.find(':input[name="26_oth_d"]').val());
					trackurl += "&Class=" + encodeURIComponent(insitePneumaticForm.find(':input[name="27_class"]').val());
					trackurl += "&Division=" + encodeURIComponent(insitePneumaticForm.find(':input[name="27_div"]').val());
					trackurl += "&Group=" + encodeURIComponent(insitePneumaticForm.find(':input[name="27_group"]').val());
					trackurl += "&Unclassified=" + encodeURIComponent(insitePneumaticForm.find(':input[name="27_un"]').val());
					trackurl += "&General=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="28_gen"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Carbon=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="28_wat1"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Water-tight=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="28_wat2"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Stainless_steel=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="28_steel"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Fiberglass=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="28_fib"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Explosion-proof=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="28_exp_a"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Specify=" + encodeURIComponent(insitePneumaticForm.find(':input[name="28_exp_b"]').val());
					trackurl += "&TEFC=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="29_tefc"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Explosion-proof=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="29_exp_a"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Confirm=" + encodeURIComponent(insitePneumaticForm.find(':input[name="29_exp_b"]').val());
					trackurl += "&Other=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="29_oth_a"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Other2=" + encodeURIComponent(insitePneumaticForm.find(':input[name="29_oth_b"]').val());
					trackurl += "&Distance1=" + encodeURIComponent(insitePneumaticForm.find(':input[name="30_rec"]').val());
					trackurl += "&Distance2=" + encodeURIComponent(insitePneumaticForm.find(':input[name="30_pow"]').val());
					trackurl += "&Distance3=" + encodeURIComponent(insitePneumaticForm.find(':input[name="31_loc"]').val());
					trackurl += "&Experience=" + encodeURIComponent(insitePneumaticForm.find(':input[name="32_exp"]').val());
					trackurl += "&Pneumatically=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="33_han"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Dilute_phase=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="33_pos"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Vacuum=" + encodeURIComponent(insitePneumaticForm.find(':checkbox[name="33_vac"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Problems=" + encodeURIComponent(insitePneumaticForm.find(':input[name="33a_prob"]').val());
					trackurl += "&Medium=" + encodeURIComponent(insitePneumaticForm.find(':input[name="33b_fil"]').val());
					
					trackimg = new Image(1,1);
					trackimg.src = trackurl;
					
					if (insitePneumaticForm.find(':input[name="co"]').val() && insitePneumaticForm.find(':input[name="fn"]').val() && insitePneumaticForm.find(':input[name="ln"]').val() && insitePneumaticForm.find(':input[name="ph"]').val() && insitePneumaticForm.find(':input[name="email"]').val() && insitePneumaticForm.find(':input[name="ad1"]').val() && insitePneumaticForm.find(':input[name="ci"]').val() && insitePneumaticForm.find(':input[name="st"]').val() && insitePneumaticForm.find(':input[name="zip"]').val() && insitePneumaticForm.find(':input[name="cou"]').val() != "") {
						ga('send', 'pageview', '/forms/quotePneumaticThanks');
					}
				}
				setTimeout(function(){submitPneumaticBtn.click();}, 500);
			}
			jQuery(':input[track="track-Pneumatic-btn"]').click(function(e) {e.preventDefault(); trackPneumaticForm();});
			insitePneumaticForm.find('input').keyup(function(e) {
				if(e.keyCode==13){e.preventDefault(); trackPneumaticForm();}
			});
	}
	
	if ( jQuery.inArray(currentpage, quoteVacuum) != -1 ) {
			var insiteVacuumForm = jQuery('form#form');
			var submitVacuumBtn = insiteVacuumForm.find('input[type="submit"]');
			submitVacuumBtn.hide();
			submitVacuumBtn.after('<input name="send" type="submit" id="send" value="Submit Quote" track="track-Vacuum-btn">');
		 
			function trackVacuumForm() {
				if (insiteVacuumForm.find(':input[name="fn"]').val() != "") {
					trackurl = "//www.topfloortech.com/insitemetrics/uRMJ/uniformv2.php";
					trackurl += "?actk=havmcp-6o3bsg93sg";
					trackurl += "&imReferrerField=" + encodeURIComponent(document.referrer);
		 
					trackurl += "&Interested=" + encodeURIComponent(insiteVacuumForm.find('select[name="prod"] option:selected').text());
					trackurl += "&Company=" + encodeURIComponent(insiteVacuumForm.find(':input[name="co"]').val());
					trackurl += "&Name=" + encodeURIComponent(insiteVacuumForm.find(':input[name="fn"]').val() + " " + insiteVacuumForm.find(':input[name="ln"]').val());
					trackurl += "&Phone=" + encodeURIComponent(insiteVacuumForm.find(':input[name="ph"]').val());
					trackurl += "&Fax=" + encodeURIComponent(insiteVacuumForm.find(':input[name="fax"]').val());
					trackurl += "&imEmailField=" + encodeURIComponent(insiteVacuumForm.find(':input[name="email"]').val());
					trackurl += "&Address=" + encodeURIComponent(insiteVacuumForm.find(':input[name="ad1"]').val());
					trackurl += "&Address2=" + encodeURIComponent(insiteVacuumForm.find(':input[name="ad2"]').val());
					trackurl += "&City=" + encodeURIComponent(insiteVacuumForm.find(':input[name="ci"]').val());
					trackurl += "&State=" + encodeURIComponent(insiteVacuumForm.find(':input[name="st"]').val());
					trackurl += "&Zip_Code=" + encodeURIComponent(insiteVacuumForm.find(':input[name="zip"]').val());
					trackurl += "&Country=" + encodeURIComponent(insiteVacuumForm.find('select[name="cou"] option:selected').text());
					trackurl += "&Referrer=" + encodeURIComponent(insiteVacuumForm.find(':input[name="1_learn"]').val());
					trackurl += "&Floors=" + encodeURIComponent(insiteVacuumForm.find(':checkbox[name="2_floor"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Overhead=" + encodeURIComponent(insiteVacuumForm.find(':checkbox[name="2_over"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Machinery=" + encodeURIComponent(insiteVacuumForm.find(':checkbox[name="2_machine"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Sumps=" + encodeURIComponent(insiteVacuumForm.find(':checkbox[name="2_sump"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Walls=" + encodeURIComponent(insiteVacuumForm.find(':checkbox[name="2_walls"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Brooms=" + encodeURIComponent(insiteVacuumForm.find(':checkbox[name="3_broom"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Vacuums=" + encodeURIComponent(insiteVacuumForm.find(':checkbox[name="3_shop"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Other=" + encodeURIComponent(insiteVacuumForm.find(':checkbox[name="3_oth"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Debris=" + encodeURIComponent(insiteVacuumForm.find(':input[name="4_debris"]').val());
					trackurl += "&Density=" + encodeURIComponent(insiteVacuumForm.find(':input[name="4_density"]').val());
					trackurl += "&Weight=" + encodeURIComponent(insiteVacuumForm.find('select[name="4_unit"] option:selected').text());
					trackurl += "&Explosion_Hazard=" + encodeURIComponent(insiteVacuumForm.find(':radio[name="4_exp"]:checked').val());
					trackurl += "&Abrasive=" + encodeURIComponent(insiteVacuumForm.find(':radio[name="4_abr"]:checked').val());
					trackurl += "&Portable=" + encodeURIComponent(insiteVacuumForm.find(':checkbox[name="5_port"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Compressed_Air_Powered=" + encodeURIComponent(insiteVacuumForm.find(':checkbox[name="5_comp"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Electric_3_Phase=" + encodeURIComponent(insiteVacuumForm.find(':checkbox[name="5_three"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Electric_Single_Phase=" + encodeURIComponent(insiteVacuumForm.find(':checkbox[name="5_single"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Stationery=" + encodeURIComponent(insiteVacuumForm.find(':checkbox[name="5_stat"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Class=" + encodeURIComponent(insiteVacuumForm.find(':input[name="5_class"]').val());
					trackurl += "&Division=" + encodeURIComponent(insiteVacuumForm.find(':input[name="5_div"]').val());
					trackurl += "&Group=" + encodeURIComponent(insiteVacuumForm.find(':input[name="5_group"]').val());
					trackurl += "&Pick_Up_Points=" + encodeURIComponent(insiteVacuumForm.find(':input[name="5_points"]').val());
					trackurl += "&Pick_Up_Points=" + encodeURIComponent(insiteVacuumForm.find(':input[name="5_concur"]').val());
					trackurl += "&Hose_Size=" + encodeURIComponent(insiteVacuumForm.find(':radio[name="5_hose"]:checked').val());
					trackurl += "&Tubing_Horizontal=" + encodeURIComponent(insiteVacuumForm.find(':input[name="5_horiz"]').val());
					trackurl += "&Tubing_Vertical=" + encodeURIComponent(insiteVacuumForm.find(':input[name="5_vert"]').val());
					trackurl += "&Drum=" + encodeURIComponent(insiteVacuumForm.find(':checkbox[name="6_drum"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Hopper=" + encodeURIComponent(insiteVacuumForm.find(':checkbox[name="6_self"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Bulk_Bag=" + encodeURIComponent(insiteVacuumForm.find(':checkbox[name="6_bulk"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Fiber_Drum=" + encodeURIComponent(insiteVacuumForm.find(':checkbox[name="6_fib"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Return_Debris=" + encodeURIComponent(insiteVacuumForm.find(':checkbox[name="6_review"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Comments=" + encodeURIComponent(insiteVacuumForm.find(':input[name="7_details"]').val());
					
					trackimg = new Image(1,1);
					trackimg.src = trackurl;
					
					if (insiteVacuumForm.find(':input[name="co"]').val() && insiteVacuumForm.find(':input[name="fn"]').val() && insiteVacuumForm.find(':input[name="ln"]').val() && insiteVacuumForm.find(':input[name="ph"]').val() && insiteVacuumForm.find(':input[name="email"]').val() && insiteVacuumForm.find(':input[name="ad1"]').val() && insiteVacuumForm.find(':input[name="ci"]').val() && insiteVacuumForm.find(':input[name="st"]').val() && insiteVacuumForm.find(':input[name="zip"]').val() && insiteVacuumForm.find(':input[name="cou"]').val() != "") {
					ga('send', 'pageview', '/forms/quoteVacuumThanks');
					}
				}
				setTimeout(function(){submitVacuumBtn.click();}, 500);
			}
			jQuery(':input[track="track-Vacuum-btn"]').click(function(e) {e.preventDefault(); trackVacuumForm();});
			insiteVacuumForm.find('input').keyup(function(e) {
				if(e.keyCode==13){e.preventDefault(); trackVacuumForm();}
			});
	}
	
	if ( jQuery.inArray(currentpage, quoteAerocon) != -1 ) {
		var insiteAeroconForm = jQuery('form#form');
			var submitAeroconBtn = insiteAeroconForm.find('input[type="submit"]');
			submitAeroconBtn.hide();
			submitAeroconBtn.after('<input name="send" type="submit" id="send" value="Submit Quote" track="track-Aerocon-btn">');
		 
			function trackAeroconForm() {
				if (insiteAeroconForm.find(':input[name="fn"]').val() != "") {
					trackurl = "//www.topfloortech.com/insitemetrics/uRMJ/uniformv2.php";
					trackurl += "?actk=havmcp-6qlxpf2pmx";
					trackurl += "&imReferrerField=" + encodeURIComponent(document.referrer);
		 
					trackurl += "&Interested=" + encodeURIComponent(insiteAeroconForm.find('select[name="prod"] option:selected').text());
					trackurl += "&Company=" + encodeURIComponent(insiteAeroconForm.find(':input[name="co"]').val());
					trackurl += "&Name=" + encodeURIComponent(insiteAeroconForm.find(':input[name="fn"]').val() + " " + insiteAeroconForm.find(':input[name="ln"]').val());
					trackurl += "&Phone=" + encodeURIComponent(insiteAeroconForm.find(':input[name="ph"]').val());
					trackurl += "&Fax=" + encodeURIComponent(insiteAeroconForm.find(':input[name="fax"]').val());
					trackurl += "&imEmailField=" + encodeURIComponent(insiteAeroconForm.find(':input[name="email"]').val());
					trackurl += "&Address=" + encodeURIComponent(insiteAeroconForm.find(':input[name="ad1"]').val());
					trackurl += "&Address2=" + encodeURIComponent(insiteAeroconForm.find(':input[name="ad2"]').val());
					trackurl += "&City=" + encodeURIComponent(insiteAeroconForm.find(':input[name="ci"]').val());
					trackurl += "&State=" + encodeURIComponent(insiteAeroconForm.find(':input[name="st"]').val());
					trackurl += "&Zip_Code=" + encodeURIComponent(insiteAeroconForm.find(':input[name="zip"]').val());
					trackurl += "&Country=" + encodeURIComponent(insiteAeroconForm.find('select[name="cou"] option:selected').text());
					trackurl += "&Materials=" + encodeURIComponent(insiteAeroconForm.find(':input[name="1_mat"]').val());
					trackurl += "&Density=" + encodeURIComponent(insiteAeroconForm.find(':input[name="1_density"]').val());
					trackurl += "&Unit=" + encodeURIComponent(insiteAeroconForm.find('select[name="1_units_a"] option:selected').text());
					trackurl += "&Rate=" + encodeURIComponent(insiteAeroconForm.find(':input[name="1_rate"]').val());
					trackurl += "&Manufacturer=" + encodeURIComponent(insiteAeroconForm.find(':input[name="1_man"]').val());
					trackurl += "&Agglomerate=" + encodeURIComponent(insiteAeroconForm.find(':checkbox[name="1_agg"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Granular=" + encodeURIComponent(insiteAeroconForm.find(':checkbox[name="1_gran"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Powder=" + encodeURIComponent(insiteAeroconForm.find(':checkbox[name="1_pow"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Stringy=" + encodeURIComponent(insiteAeroconForm.find(':checkbox[name="1_fib"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Free=" + encodeURIComponent(insiteAeroconForm.find(':checkbox[name="1_free"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Bridges=" + encodeURIComponent(insiteAeroconForm.find(':checkbox[name="1_bridge"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Friable=" + encodeURIComponent(insiteAeroconForm.find(':checkbox[name="1_fri"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Abrasive=" + encodeURIComponent(insiteAeroconForm.find(':checkbox[name="1_abr"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Size =" + encodeURIComponent(insiteAeroconForm.find(':input[name="1_part"]').val());
					trackurl += "&Moisture=" + encodeURIComponent(insiteAeroconForm.find(':input[name="1_moist"]').val());
					trackurl += "&Temperature=" + encodeURIComponent(insiteAeroconForm.find(':input[name="1_temp"]').val());
					trackurl += "&Unit=" + encodeURIComponent(insiteAeroconForm.find('select[name="1_units_b"] option:selected').text());
					trackurl += "&Horizontal =" + encodeURIComponent(insiteAeroconForm.find(':input[name="2_hor"]').val());
					trackurl += "&Vertical=" + encodeURIComponent(insiteAeroconForm.find(':input[name="2_ver"]').val());
					trackurl += "&Diagonal=" + encodeURIComponent(insiteAeroconForm.find(':radio[name="2_dia"]:checked').val());
					trackurl += "&Material=" + encodeURIComponent(insiteAeroconForm.find(':input[name="2_matIn"]').val());
					trackurl += "&Discharge=" + encodeURIComponent(insiteAeroconForm.find(':input[name="2_matOut"]').val());
					trackurl += "&Inlets=" + encodeURIComponent(insiteAeroconForm.find(':input[name="2_inlets"]').val());
					trackurl += "&Points=" + encodeURIComponent(insiteAeroconForm.find(':input[name="2_dis"]').val());
					trackurl += "&Unloader=" + encodeURIComponent(insiteAeroconForm.find(':radio[name="3_unload"]:checked').val());
					trackurl += "&Station=" + encodeURIComponent(insiteAeroconForm.find(':radio[name="3_dump"]:checked').val());
					trackurl += "&Other=" + encodeURIComponent(insiteAeroconForm.find(':input[name="3_other"]').val());
					trackurl += "&Hours/Day=" + encodeURIComponent(insiteAeroconForm.find(':input[name="4_day"]').val());
					trackurl += "&Days/Week=" + encodeURIComponent(insiteAeroconForm.find(':input[name="4_week"]').val());
					trackurl += "&Weeks/Year=" + encodeURIComponent(insiteAeroconForm.find(':input[name="4_year"]').val());
					trackurl += "&Product_Contact=" + encodeURIComponent(insiteAeroconForm.find(':input[name="5_con"]').val());
					trackurl += "&Non-product_Contact=" + encodeURIComponent(insiteAeroconForm.find(':input[name="5_non"]').val());
					trackurl += "&Tube/Auger=" + encodeURIComponent(insiteAeroconForm.find(':radio[name="5_tube"]:checked').val());
					trackurl += "&Cable/Auger=" + encodeURIComponent(insiteAeroconForm.find(':radio[name="5_cable"]:checked').val());
					trackurl += "&Discs=" + encodeURIComponent(insiteAeroconForm.find(':radio[name="5_disc"]:checked').val());
					trackurl += "&Wash=" + encodeURIComponent(insiteAeroconForm.find(':radio[name="5_wash"]:checked').val());
					trackurl += "&Water_Proofing=" + encodeURIComponent(insiteAeroconForm.find(':radio[name="5_proof"]:checked').val());
					trackurl += "&Voltage=" + encodeURIComponent(insiteAeroconForm.find(':radio[name="6_volt"]:checked').val());
					trackurl += "&Other=" + encodeURIComponent(insiteAeroconForm.find(':input[name="6_other"]').val());
					trackurl += "&Class=" + encodeURIComponent(insiteAeroconForm.find(':input[name="6_class"]').val());
					trackurl += "&Division=" + encodeURIComponent(insiteAeroconForm.find(':input[name="6_div"]').val());
					trackurl += "&Group=" + encodeURIComponent(insiteAeroconForm.find(':input[name="6_group"]').val());
					trackurl += "&Equipment=" + encodeURIComponent(insiteAeroconForm.find(':radio[name="7_loc"]:checked').val());
					trackurl += "&Attachment=" + encodeURIComponent(insiteAeroconForm.find(':input[name="upload"]').val());
					trackurl += "&Comments=" + encodeURIComponent(insiteAeroconForm.find(':input[name="com"]').val());
					
					trackimg = new Image(1,1);
					trackimg.src = trackurl;
					
					if (insiteAeroconForm.find(':input[name="co"]').val() && insiteAeroconForm.find(':input[name="fn"]').val() && insiteAeroconForm.find(':input[name="ln"]').val() && insiteAeroconForm.find(':input[name="ph"]').val() && insiteAeroconForm.find(':input[name="email"]').val() && insiteAeroconForm.find(':input[name="ad1"]').val() && insiteAeroconForm.find(':input[name="ci"]').val() && insiteAeroconForm.find(':input[name="st"]').val() && insiteAeroconForm.find(':input[name="zip"]').val() && insiteAeroconForm.find(':input[name="cou"]').val() != "") {
					ga('send', 'pageview', '/forms/quoteAeroconThanks');
					}
				}
				setTimeout(function(){submitAeroconBtn.click();}, 500);
			}
			jQuery(':input[track="track-Aerocon-btn"]').click(function(e) {e.preventDefault(); trackAeroconForm();});
			insiteAeroconForm.find('input').keyup(function(e) {
				if(e.keyCode==13){e.preventDefault(); trackAeroconForm();}
			});
	}
	
	if ( jQuery.inArray(currentpage, quoteFlexibleScrew) != -1 ) {
		var insiteFlexibleScrewForm = jQuery('form#form');
			var submitFlexibleScrewBtn = insiteFlexibleScrewForm.find('input[type="submit"]');
			submitFlexibleScrewBtn.hide();
			submitFlexibleScrewBtn.after('<input name="send" type="submit" id="send" value="Submit Quote" track="track-FlexibleScrew-btn">');
		 
			function trackFlexibleScrewForm() {
				if (insiteFlexibleScrewForm.find(':input[name="fn"]').val() != "") {
					trackurl = "//www.topfloortech.com/insitemetrics/uRMJ/uniformv2.php";
					trackurl += "?actk=havmcp-6qlxq6644d";
					trackurl += "&imReferrerField=" + encodeURIComponent(document.referrer);
		 
					trackurl += "&Interested=" + encodeURIComponent(insiteFlexibleScrewForm.find('select[name="prod"] option:selected').text());
					trackurl += "&Company=" + encodeURIComponent(insiteFlexibleScrewForm.find(':input[name="co"]').val());
					trackurl += "&Name=" + encodeURIComponent(insiteFlexibleScrewForm.find(':input[name="fn"]').val() + " " + insiteFlexibleScrewForm.find(':input[name="ln"]').val());
					trackurl += "&Phone=" + encodeURIComponent(insiteFlexibleScrewForm.find(':input[name="ph"]').val());
					trackurl += "&Fax=" + encodeURIComponent(insiteFlexibleScrewForm.find(':input[name="fax"]').val());
					trackurl += "&imEmailField=" + encodeURIComponent(insiteFlexibleScrewForm.find(':input[name="email"]').val());
					trackurl += "&Address=" + encodeURIComponent(insiteFlexibleScrewForm.find(':input[name="ad1"]').val());
					trackurl += "&Address2=" + encodeURIComponent(insiteFlexibleScrewForm.find(':input[name="ad2"]').val());
					trackurl += "&City=" + encodeURIComponent(insiteFlexibleScrewForm.find(':input[name="ci"]').val());
					trackurl += "&State=" + encodeURIComponent(insiteFlexibleScrewForm.find(':input[name="st"]').val());
					trackurl += "&Zip_Code=" + encodeURIComponent(insiteFlexibleScrewForm.find(':input[name="zip"]').val());
					trackurl += "&Country=" + encodeURIComponent(insiteFlexibleScrewForm.find('select[name="cou"] option:selected').text());
					trackurl += "&Rep_visit=" + encodeURIComponent(insiteFlexibleScrewForm.find(':checkbox[name="0_rep"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Magazine=" + encodeURIComponent(insiteFlexibleScrewForm.find(':checkbox[name="0_mag_a"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Publication=" + encodeURIComponent(insiteFlexibleScrewForm.find(':input[name="0_mag_b"]').val());
					trackurl += "&Trade_Show=" + encodeURIComponent(insiteFlexibleScrewForm.find(':checkbox[name="0_trade_a"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Trade=" + encodeURIComponent(insiteFlexibleScrewForm.find(':input[name="0_trade_b"]').val());
					trackurl += "&Internet=" + encodeURIComponent(insiteFlexibleScrewForm.find(':checkbox[name="0_int_a"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Search=" + encodeURIComponent(insiteFlexibleScrewForm.find(':input[name="0_int_b"]').val());
					trackurl += "&Other=" + encodeURIComponent(insiteFlexibleScrewForm.find(':checkbox[name="0_oth_a"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Other1=" + encodeURIComponent(insiteFlexibleScrewForm.find(':input[name="0_oth_b"]').val());
					trackurl += "&Materials=" + encodeURIComponent(insiteFlexibleScrewForm.find(':input[name="1_mat"]').val());
					trackurl += "&Density=" + encodeURIComponent(insiteFlexibleScrewForm.find(':input[name="1_density"]').val());
					trackurl += "&Unit=" + encodeURIComponent(insiteFlexibleScrewForm.find('select[name="1_units_a"] option:selected').text());
					trackurl += "&Rate=" + encodeURIComponent(insiteFlexibleScrewForm.find(':input[name="1_rate"]').val());
					trackurl += "&Manufacturer=" + encodeURIComponent(insiteFlexibleScrewForm.find(':input[name="1_man"]').val());
					trackurl += "&Agglomerate=" + encodeURIComponent(insiteFlexibleScrewForm.find(':checkbox[name="1_agg"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Granular=" + encodeURIComponent(insiteFlexibleScrewForm.find(':checkbox[name="1_gran"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Powder=" + encodeURIComponent(insiteFlexibleScrewForm.find(':checkbox[name="1_pow"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Stringy=" + encodeURIComponent(insiteFlexibleScrewForm.find(':checkbox[name="1_fib"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Free=" + encodeURIComponent(insiteFlexibleScrewForm.find(':checkbox[name="1_free"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Bridges=" + encodeURIComponent(insiteFlexibleScrewForm.find(':checkbox[name="1_bridge"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Friable=" + encodeURIComponent(insiteFlexibleScrewForm.find(':checkbox[name="1_fri"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Abrasive=" + encodeURIComponent(insiteFlexibleScrewForm.find(':checkbox[name="1_abr"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Size =" + encodeURIComponent(insiteFlexibleScrewForm.find(':input[name="1_part"]').val());
					trackurl += "&Moisture=" + encodeURIComponent(insiteFlexibleScrewForm.find(':input[name="1_moist"]').val());
					trackurl += "&Temperature=" + encodeURIComponent(insiteFlexibleScrewForm.find(':input[name="1_temp"]').val());
					trackurl += "&Unit=" + encodeURIComponent(insiteFlexibleScrewForm.find('select[name="1_units_b"] option:selected').text());
					trackurl += "&Horizontal =" + encodeURIComponent(insiteFlexibleScrewForm.find(':input[name="2_hor"]').val());
					trackurl += "&Vertical=" + encodeURIComponent(insiteFlexibleScrewForm.find(':input[name="2_ver"]').val());
					trackurl += "&Diagonal=" + encodeURIComponent(insiteFlexibleScrewForm.find(':radio[name="2_dia"]:checked').val());
					trackurl += "&Material=" + encodeURIComponent(insiteFlexibleScrewForm.find(':input[name="2_matIn"]').val());
					trackurl += "&Discharge=" + encodeURIComponent(insiteFlexibleScrewForm.find(':input[name="2_matOut"]').val());
					trackurl += "&Inlets=" + encodeURIComponent(insiteFlexibleScrewForm.find(':input[name="2_inlets"]').val());
					trackurl += "&Points=" + encodeURIComponent(insiteFlexibleScrewForm.find(':input[name="2_dis"]').val());
					trackurl += "&Unloader=" + encodeURIComponent(insiteFlexibleScrewForm.find(':radio[name="3_unload"]:checked').val());
					trackurl += "&Station=" + encodeURIComponent(insiteFlexibleScrewForm.find(':radio[name="3_dump"]:checked').val());
					trackurl += "&Other=" + encodeURIComponent(insiteFlexibleScrewForm.find(':input[name="3_other"]').val());
					trackurl += "&Hours/Day=" + encodeURIComponent(insiteFlexibleScrewForm.find(':input[name="4_day"]').val());
					trackurl += "&Days/Week=" + encodeURIComponent(insiteFlexibleScrewForm.find(':input[name="4_week"]').val());
					trackurl += "&Weeks/Year=" + encodeURIComponent(insiteFlexibleScrewForm.find(':input[name="4_year"]').val());
					trackurl += "&Product_Contact=" + encodeURIComponent(insiteFlexibleScrewForm.find(':input[name="5_con"]').val());
					trackurl += "&Non-product_Contact=" + encodeURIComponent(insiteFlexibleScrewForm.find(':input[name="5_non"]').val());
					trackurl += "&Tube/Auger=" + encodeURIComponent(insiteFlexibleScrewForm.find(':radio[name="5_tube"]:checked').val());
					trackurl += "&Cable/Auger=" + encodeURIComponent(insiteFlexibleScrewForm.find(':radio[name="5_cable"]:checked').val());
					trackurl += "&Discs=" + encodeURIComponent(insiteFlexibleScrewForm.find(':radio[name="5_disc"]:checked').val());
					trackurl += "&Wash=" + encodeURIComponent(insiteFlexibleScrewForm.find(':radio[name="5_wash"]:checked').val());
					trackurl += "&Water_Proofing=" + encodeURIComponent(insiteFlexibleScrewForm.find(':radio[name="5_proof"]:checked').val());
					trackurl += "&Voltage=" + encodeURIComponent(insiteFlexibleScrewForm.find(':radio[name="6_volt"]:checked').val());
					trackurl += "&Other=" + encodeURIComponent(insiteFlexibleScrewForm.find(':input[name="6_other"]').val());
					trackurl += "&Class=" + encodeURIComponent(insiteFlexibleScrewForm.find(':input[name="6_class"]').val());
					trackurl += "&Division=" + encodeURIComponent(insiteFlexibleScrewForm.find(':input[name="6_div"]').val());
					trackurl += "&Group=" + encodeURIComponent(insiteFlexibleScrewForm.find(':input[name="6_group"]').val());
					trackurl += "&Equipment=" + encodeURIComponent(insiteFlexibleScrewForm.find(':radio[name="7_loc"]:checked').val());
					trackurl += "&Attachment=" + encodeURIComponent(insiteFlexibleScrewForm.find(':input[name="upload"]').val());
					trackurl += "&Comments=" + encodeURIComponent(insiteFlexibleScrewForm.find(':input[name="com"]').val());
					
					trackimg = new Image(1,1);
					trackimg.src = trackurl;
					
					if (insiteFlexibleScrewForm.find(':input[name="co"]').val() && insiteFlexibleScrewForm.find(':input[name="fn"]').val() && insiteFlexibleScrewForm.find(':input[name="ln"]').val() && insiteFlexibleScrewForm.find(':input[name="ph"]').val() && insiteFlexibleScrewForm.find(':input[name="email"]').val() && insiteFlexibleScrewForm.find(':input[name="ad1"]').val() && insiteFlexibleScrewForm.find(':input[name="ci"]').val() && insiteFlexibleScrewForm.find(':input[name="st"]').val() && insiteFlexibleScrewForm.find(':input[name="zip"]').val() && insiteFlexibleScrewForm.find(':input[name="cou"]').val() != "") {
					ga('send', 'pageview', '/forms/quoteFlexibleScrewThanks');
					}
				}
				setTimeout(function(){submitFlexibleScrewBtn.click();}, 500);
			}
			jQuery(':input[track="track-FlexibleScrew-btn"]').click(function(e) {e.preventDefault(); trackFlexibleScrewForm();});
			insiteFlexibleScrewForm.find('input').keyup(function(e) {
				if(e.keyCode==13){e.preventDefault(); trackFlexibleScrewForm();}
			});
	}
	
	if ( jQuery.inArray(currentpage, quotePulsonic) != -1 ) {
		var insitePulsonicForm = jQuery('form#form');
			var submitPulsonicBtn = insitePulsonicForm.find('input[type="submit"]');
			submitPulsonicBtn.hide();
			submitPulsonicBtn.after('<input name="send" type="submit" id="send" value="Submit Quote" track="track-Pulsonic-btn">');
		 
			function trackPulsonicForm() {
				if (insitePulsonicForm.find(':input[name="fn"]').val() != "") {
					trackurl = "//www.topfloortech.com/insitemetrics/uRMJ/uniformv2.php";
					trackurl += "?actk=havmcp-6qlxqo9fmi";
					trackurl += "&imReferrerField=" + encodeURIComponent(document.referrer);
		 
					trackurl += "&Interested=" + encodeURIComponent(insitePulsonicForm.find('select[name="prod"] option:selected').text());
					trackurl += "&Company=" + encodeURIComponent(insitePulsonicForm.find(':input[name="co"]').val());
					trackurl += "&Name=" + encodeURIComponent(insitePulsonicForm.find(':input[name="fn"]').val() + " " + insitePulsonicForm.find(':input[name="ln"]').val());
					trackurl += "&Phone=" + encodeURIComponent(insitePulsonicForm.find(':input[name="ph"]').val());
					trackurl += "&Fax=" + encodeURIComponent(insitePulsonicForm.find(':input[name="fax"]').val());
					trackurl += "&imEmailField=" + encodeURIComponent(insitePulsonicForm.find(':input[name="email"]').val());
					trackurl += "&Address=" + encodeURIComponent(insitePulsonicForm.find(':input[name="ad1"]').val());
					trackurl += "&Address2=" + encodeURIComponent(insitePulsonicForm.find(':input[name="ad2"]').val());
					trackurl += "&City=" + encodeURIComponent(insitePulsonicForm.find(':input[name="ci"]').val());
					trackurl += "&State=" + encodeURIComponent(insitePulsonicForm.find(':input[name="st"]').val());
					trackurl += "&Zip_Code=" + encodeURIComponent(insitePulsonicForm.find(':input[name="zip"]').val());
					trackurl += "&Country=" + encodeURIComponent(insitePulsonicForm.find('select[name="cou"] option:selected').text());
					trackurl += "&Common_Name=" + encodeURIComponent(insitePulsonicForm.find(':input[name="1_cname"]').val());
					trackurl += "&Trade_Name=" + encodeURIComponent(insitePulsonicForm.find(':input[name="1_tname"]').val());
					trackurl += "&Chemical=" + encodeURIComponent(insitePulsonicForm.find(':input[name="1_chem"]').val());
					trackurl += "&Manufacturer=" + encodeURIComponent(insitePulsonicForm.find(':input[name="1_man"]').val());
					trackurl += "&Density=" + encodeURIComponent(insitePulsonicForm.find(':input[name="2_density"]').val());
					trackurl += "&Unit=" + encodeURIComponent(insitePulsonicForm.find('select[name="2_units"] option:selected').text());
					trackurl += "&Pellet=" + encodeURIComponent(insitePulsonicForm.find(':checkbox[name="3a_pellet"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Granular=" + encodeURIComponent(insitePulsonicForm.find(':checkbox[name="3a_gran"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Powder=" + encodeURIComponent(insitePulsonicForm.find(':checkbox[name="3a_pow"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Flake=" + encodeURIComponent(insitePulsonicForm.find(':checkbox[name="3a_flake"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Hygroscopic=" + encodeURIComponent(insitePulsonicForm.find(':checkbox[name="3a_hygro"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Cohesive=" + encodeURIComponent(insitePulsonicForm.find(':checkbox[name="3a_coh"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Aerates=" + encodeURIComponent(insitePulsonicForm.find(':checkbox[name="3a_aer"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Compacts=" + encodeURIComponent(insitePulsonicForm.find(':checkbox[name="3a_com"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Arch=" + encodeURIComponent(insitePulsonicForm.find(':checkbox[name="3b_arch"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Bridge=" + encodeURIComponent(insitePulsonicForm.find(':checkbox[name="3b_bridge"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Cling=" + encodeURIComponent(insitePulsonicForm.find(':checkbox[name="3b_cling"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Rathole=" + encodeURIComponent(insitePulsonicForm.find(':checkbox[name="3b_rath"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Hopper_Walls=" + encodeURIComponent(insitePulsonicForm.find(':checkbox[name="3b_walls"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Hopper_Only=" + encodeURIComponent(insitePulsonicForm.find(':checkbox[name="3b_only"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Hopper=" + encodeURIComponent(insitePulsonicForm.find(':checkbox[name="3b_and"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Unit=" + encodeURIComponent(insitePulsonicForm.find(':input[name="3b_ft"]').val());
					trackurl += "&Closed=" + encodeURIComponent(insitePulsonicForm.find(':checkbox[name="3c_closed"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Minutes=" + encodeURIComponent(insitePulsonicForm.find(':checkbox[name="3c_for"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Unit=" + encodeURIComponent(insitePulsonicForm.find(':input[name="3c_min"]').val());
					trackurl += "&Empty=" + encodeURIComponent(insitePulsonicForm.find(':checkbox[name="3c_core"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Other=" + encodeURIComponent(insitePulsonicForm.find(':input[name="3_other"]').val());
					trackurl += "&Maximum=" + encodeURIComponent(insitePulsonicForm.find(':input[name="4_max"]').val());
					trackurl += "&Minimum=" + encodeURIComponent(insitePulsonicForm.find(':input[name="4_min"]').val());
					trackurl += "&Temperature=" + encodeURIComponent(insitePulsonicForm.find(':input[name="5_temp"]').val());
					trackurl += "&Unit=" + encodeURIComponent(insitePulsonicForm.find('select[name="5_units"] option:selected').text());
					trackurl += "&Demand=" + encodeURIComponent(insitePulsonicForm.find(':checkbox[name="6_demand"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Continuous=" + encodeURIComponent(insitePulsonicForm.find(':checkbox[name="6_con"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Sample=" + encodeURIComponent(insitePulsonicForm.find(':checkbox[name="6_bag"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Shape=" + encodeURIComponent(insitePulsonicForm.find('select[name="6_hopper"] option:selected').text());
					trackurl += "&Width=" + encodeURIComponent(insitePulsonicForm.find(':input[name="6_ft"]').val());
					trackurl += "&Height=" + encodeURIComponent(insitePulsonicForm.find(':input[name="6_height"]').val());
					trackurl += "&Vertical=" + encodeURIComponent(insitePulsonicForm.find(':input[name="6_vert"]').val());
					trackurl += "&Size=" + encodeURIComponent(insitePulsonicForm.find(':input[name="6_dis"]').val());
					trackurl += "&Shape=" + encodeURIComponent(insitePulsonicForm.find(':radio[name="6_shape"]:checked').val());
					trackurl += "&Type=" + encodeURIComponent(insitePulsonicForm.find(':input[name="6_valve"]').val());
					trackurl += "&Vibrator=" + encodeURIComponent(insitePulsonicForm.find(':checkbox[name="6_vib"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Other=" + encodeURIComponent(insitePulsonicForm.find(':checkbox[name="6_other_a"]:checked').map(function(){return jQuery(this).val();}).get().join(', '));
					trackurl += "&Comments=" + encodeURIComponent(insitePulsonicForm.find(':input[name="6_other_b"]').val());
					trackurl += "&Power=" + encodeURIComponent(insitePulsonicForm.find(':input[name="7_power"]').val());
					trackurl += "&Rating=" + encodeURIComponent(insitePulsonicForm.find(':input[name="8_nema"]').val());
					trackurl += "&Plant=" + encodeURIComponent(insitePulsonicForm.find(':input[name="9_air"]').val());
					trackurl += "&Material=" + encodeURIComponent(insitePulsonicForm.find(':input[name="10_mat"]').val());
					trackurl += "&Attachment=" + encodeURIComponent(insitePulsonicForm.find(':input[name="upload"]').val());
					
					trackimg = new Image(1,1);
					trackimg.src = trackurl;
					
					if (insitePulsonicForm.find(':input[name="co"]').val() && insitePulsonicForm.find(':input[name="fn"]').val() && insitePulsonicForm.find(':input[name="ln"]').val() && insitePulsonicForm.find(':input[name="ph"]').val() && insitePulsonicForm.find(':input[name="email"]').val() && insitePulsonicForm.find(':input[name="ad1"]').val() && insitePulsonicForm.find(':input[name="ci"]').val() && insitePulsonicForm.find(':input[name="st"]').val() && insitePulsonicForm.find(':input[name="zip"]').val() && insitePulsonicForm.find(':input[name="cou"]').val() != "") {
					ga('send', 'pageview', '/forms/quotePulsonicThanks');
					}
				}
				setTimeout(function(){submitPulsonicBtn.click();}, 500);
			}
			jQuery(':input[track="track-Pulsonic-btn"]').click(function(e) {e.preventDefault(); trackPulsonicForm();});
			insitePulsonicForm.find('input').keyup(function(e) {
				if(e.keyCode==13){e.preventDefault(); trackPulsonicForm();}
			});
	}
	
	if ( jQuery.inArray(currentpage, quoteVacuumSystems) != -1 ) {
		var insiteVacuumSystemsForm = jQuery('form#form');
			var submitVacuumSystemsBtn = insiteVacuumSystemsForm.find('input[type="submit"]');
			submitVacuumSystemsBtn.hide();
			submitVacuumSystemsBtn.after('<input name="send" type="submit" id="send" value="Submit Quote" track="track-VacuumSystems-btn">');
		 
			function trackVacuumSystemsForm() {
				if (insiteVacuumSystemsForm.find(':input[name="fn"]').val() != "") {
					trackurl = "//www.topfloortech.com/insitemetrics/uRMJ/uniformv2.php";
					trackurl += "?actk=havmcp-6qlxrfk6m9";
					trackurl += "&imReferrerField=" + encodeURIComponent(document.referrer);
		 
					trackurl += "&Interested=" + encodeURIComponent(insiteVacuumSystemsForm.find('select[name="prod"] option:selected').text());
					trackurl += "&Company=" + encodeURIComponent(insiteVacuumSystemsForm.find(':input[name="co"]').val());
					trackurl += "&Name=" + encodeURIComponent(insiteVacuumSystemsForm.find(':input[name="fn"]').val() + " " + insiteVacuumSystemsForm.find(':input[name="ln"]').val());
					trackurl += "&Phone=" + encodeURIComponent(insiteVacuumSystemsForm.find(':input[name="ph"]').val());
					trackurl += "&Fax=" + encodeURIComponent(insiteVacuumSystemsForm.find(':input[name="fax"]').val());
					trackurl += "&imEmailField=" + encodeURIComponent(insiteVacuumSystemsForm.find(':input[name="email"]').val());
					trackurl += "&Address=" + encodeURIComponent(insiteVacuumSystemsForm.find(':input[name="ad1"]').val());
					trackurl += "&Address2=" + encodeURIComponent(insiteVacuumSystemsForm.find(':input[name="ad2"]').val());
					trackurl += "&City=" + encodeURIComponent(insiteVacuumSystemsForm.find(':input[name="ci"]').val());
					trackurl += "&St=" + encodeURIComponent(insiteVacuumSystemsForm.find('select[name="st"] option:selected').text());
					trackurl += "&Zip_Code=" + encodeURIComponent(insiteVacuumSystemsForm.find(':input[name="zip"]').val());
					trackurl += "&Country=" + encodeURIComponent(insiteVacuumSystemsForm.find('select[name="cou"] option:selected').text());
					trackurl += "&Size=" + encodeURIComponent(insiteVacuumSystemsForm.find(':input[name="1_fac"]').val());
					trackurl += "&Unit=" + encodeURIComponent(insiteVacuumSystemsForm.find('select[name="1_fac_u"] option:selected').text());
					trackurl += "&Area=" + encodeURIComponent(insiteVacuumSystemsForm.find(':input[name="1_area"]').val());
					trackurl += "&Unit=" + encodeURIComponent(insiteVacuumSystemsForm.find('select[name="1_area_u"] option:selected').text());
					trackurl += "&Type=" + encodeURIComponent(insiteVacuumSystemsForm.find(':input[name="1_type"]').val());
					trackurl += "&Budget=" + encodeURIComponent(insiteVacuumSystemsForm.find(':input[name="1_avail"]').val());
					trackurl += "&Timing=" + encodeURIComponent(insiteVacuumSystemsForm.find(':input[name="1_time"]').val());
					trackurl += "&Points=" + encodeURIComponent(insiteVacuumSystemsForm.find(':input[name="2_pick"]').val());
					trackurl += "&Simultaneously=" + encodeURIComponent(insiteVacuumSystemsForm.find(':input[name="2_sim"]').val());
					trackurl += "&Hose=" + encodeURIComponent(insiteVacuumSystemsForm.find(':input[name="2_hose"]').val());
					trackurl += "&Unit=" + encodeURIComponent(insiteVacuumSystemsForm.find('select[name="2_hose_u"] option:selected').text());
					trackurl += "&Horizontal=" + encodeURIComponent(insiteVacuumSystemsForm.find(':input[name="2_hor"]').val());
					trackurl += "&Unit=" + encodeURIComponent(insiteVacuumSystemsForm.find('select[name="2_hor_u"] option:selected').text());
					trackurl += "&Vertical=" + encodeURIComponent(insiteVacuumSystemsForm.find(':input[name="2_ver"]').val());
					trackurl += "&Unit=" + encodeURIComponent(insiteVacuumSystemsForm.find('select[name="2_ver_u"] option:selected').text());
					trackurl += "&Operation=" + encodeURIComponent(insiteVacuumSystemsForm.find(':radio[name="2_op"]:checked').val());
					trackurl += "&Hours=" + encodeURIComponent(insiteVacuumSystemsForm.find(':input[name="2_op_b"]').val());
					trackurl += "&Operating=" + encodeURIComponent(insiteVacuumSystemsForm.find(':radio[name="2_closed"]:checked').val());
					trackurl += "&Description=" + encodeURIComponent(insiteVacuumSystemsForm.find(':input[name="2_desc"]').val());
					trackurl += "&Ambient=" + encodeURIComponent(insiteVacuumSystemsForm.find(':input[name="3_temp"]').val());
					trackurl += "&Unit=" + encodeURIComponent(insiteVacuumSystemsForm.find('select[name="3_temp_u"] option:selected').text());
					trackurl += "&Sound =" + encodeURIComponent(insiteVacuumSystemsForm.find(':input[name="3_sound_a"]').val());
					trackurl += "&Unit1=" + encodeURIComponent(insiteVacuumSystemsForm.find(':input[name="3_sound_b"]').val());
					trackurl += "&Unit2=" + encodeURIComponent(insiteVacuumSystemsForm.find('select[name="3_sound_c"] option:selected').text());
					trackurl += "&Hours=" + encodeURIComponent(insiteVacuumSystemsForm.find(':input[name="3_sound_d"]').val());
					trackurl += "&Hazardous =" + encodeURIComponent(insiteVacuumSystemsForm.find(':input[name="3_haz"]').val());
					trackurl += "&Class=" + encodeURIComponent(insiteVacuumSystemsForm.find(':input[name="3_class"]').val());
					trackurl += "&Group=" + encodeURIComponent(insiteVacuumSystemsForm.find(':input[name="3_group"]').val());
					trackurl += "&Division=" + encodeURIComponent(insiteVacuumSystemsForm.find(':input[name="3_div"]').val());
					trackurl += "&HEPA=" + encodeURIComponent(insiteVacuumSystemsForm.find(':radio[name="3_hepa"]:checked').val());
					trackurl += "&Material=" + encodeURIComponent(insiteVacuumSystemsForm.find(':radio[name="3_mat"]:checked').val());
					trackurl += "&Material_Name=" + encodeURIComponent(insiteVacuumSystemsForm.find(':input[name="4_na"]').val());
					trackurl += "&Density=" + encodeURIComponent(insiteVacuumSystemsForm.find(':input[name="4_bulk"]').val());
					trackurl += "&Largest=" + encodeURIComponent(insiteVacuumSystemsForm.find(':input[name="4_par_a"]').val());
					trackurl += "&Smallest=" + encodeURIComponent(insiteVacuumSystemsForm.find(':input[name="4_par_b"]').val());
					trackurl += "&Max_Temp=" + encodeURIComponent(insiteVacuumSystemsForm.find(':input[name="4_temp"]').val());
					trackurl += "&Unit=" + encodeURIComponent(insiteVacuumSystemsForm.find('select[name="4_temp_u"] option:selected').text());
					trackurl += "&Dry=" + encodeURIComponent(insiteVacuumSystemsForm.find(':radio[name="4_dry"]:checked').val());
					trackurl += "&Dusty=" + encodeURIComponent(insiteVacuumSystemsForm.find(':radio[name="4_dust"]:checked').val());
					trackurl += "&Hygroscopic=" + encodeURIComponent(insiteVacuumSystemsForm.find(':radio[name="4_hyg"]:checked').val());
					trackurl += "&Corrosive=" + encodeURIComponent(insiteVacuumSystemsForm.find(':radio[name="4_cor"]:checked').val());
					trackurl += "&Oily=" + encodeURIComponent(insiteVacuumSystemsForm.find(':radio[name="4_oil"]:checked').val());
					trackurl += "&Sticky=" + encodeURIComponent(insiteVacuumSystemsForm.find(':radio[name="4_sti"]:checked').val());
					trackurl += "&Toxic=" + encodeURIComponent(insiteVacuumSystemsForm.find(':radio[name="4_tox"]:checked').val());
					trackurl += "&Abrasive=" + encodeURIComponent(insiteVacuumSystemsForm.find(':radio[name="4_abr"]:checked').val());
					trackurl += "&Explosive=" + encodeURIComponent(insiteVacuumSystemsForm.find(':radio[name="4_exp"]:checked').val());
					trackurl += "&Volts=" + encodeURIComponent(insiteVacuumSystemsForm.find(':input[name="5_volt"]').val());
					trackurl += "&Phase=" + encodeURIComponent(insiteVacuumSystemsForm.find(':input[name="5_ph"]').val());
					trackurl += "&Hertz=" + encodeURIComponent(insiteVacuumSystemsForm.find(':input[name="5_hz"]').val());
					trackurl += "&CFM=" + encodeURIComponent(insiteVacuumSystemsForm.find(':input[name="5_air_a"]').val());
					trackurl += "&PSI=" + encodeURIComponent(insiteVacuumSystemsForm.find(':input[name="5_air_b"]').val());
					trackurl += "&Comments=" + encodeURIComponent(insiteVacuumSystemsForm.find(':input[name="6_dis"]').val());
					trackurl += "&Method=" + encodeURIComponent(insiteVacuumSystemsForm.find(':input[name="7_meth"]').val());
					trackurl += "&Manufacturer=" + encodeURIComponent(insiteVacuumSystemsForm.find(':input[name="7_equip"]').val());
					
					trackimg = new Image(1,1);
					trackimg.src = trackurl;
					
					if (insiteVacuumSystemsForm.find(':input[name="co"]').val() && insiteVacuumSystemsForm.find(':input[name="fn"]').val() && insiteVacuumSystemsForm.find(':input[name="ln"]').val() && insiteVacuumSystemsForm.find(':input[name="ph"]').val() && insiteVacuumSystemsForm.find(':input[name="email"]').val() && insiteVacuumSystemsForm.find(':input[name="ad1"]').val() && insiteVacuumSystemsForm.find(':input[name="ci"]').val() && insiteVacuumSystemsForm.find(':input[name="st"]').val() && insiteVacuumSystemsForm.find(':input[name="zip"]').val() && insiteVacuumSystemsForm.find(':input[name="cou"]').val() != "") {
					ga('send', 'pageview', '/forms/quoteVacuumSystemsThanks');
					}
				}
				setTimeout(function(){submitVacuumSystemsBtn.click();}, 500);
			}
			jQuery(':input[track="track-VacuumSystems-btn"]').click(function(e) {e.preventDefault(); trackVacuumSystemsForm();});
			insiteVacuumSystemsForm.find('input').keyup(function(e) {
				if(e.keyCode==13){e.preventDefault(); trackVacuumSystemsForm();}
			});
	}
});
//TopSpot Form Code - END - RFQ - 8-12-2014 - Kate
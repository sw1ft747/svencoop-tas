CreateTrigger("Spawn", Vector(1920.500, 1738.812, 151.000), Vector(0, 0, 0), Vector(306.906, 308.250, 215.406));
CreateTrigger("Start", Vector(1196.469, -1816.969, 60.219), Vector(0, 0, 0), Vector(148.688, 99.844, 170.875));
CreateTrigger("fixBosstStart", Vector(659.500, -2233.250, 131.969), Vector(0, 0, 0), Vector(281.188, 122.844, 236.969));
CreateTrigger("zalypahl21", Vector(-278.781, -1881.531, 71.844), Vector(0, 0, 0), Vector(61.781, 477.375, 350.594));
CreateTrigger("1", Vector(-558.625, -1285.937, 160.968), Vector(0, 0, 0), Vector(208.656, 75.469, 154.656));
CreateTrigger("zalypa", Vector(161.750, -1764.344, 421.344), Vector(0, 0, -347.812), Vector(66.125, 350.750, 0));
CreateTrigger("tonnelGovna", Vector(-867.438, 3.906, 379.188), Vector(0, 0, -279.719), Vector(35.312, 142.750, 0));
CreateTrigger("self", Vector(-1857.500, 41.906, 24.500), Vector(0, 0, 0), Vector(149.594, 233.812, 263.031));
CreateTrigger("afterSelf", Vector(-2014.500, 733.469, 96.344), Vector(0, 0, 0), Vector(501.406, 29.812, 677.625));
CreateTrigger("toSelf", Vector(-1246.844, -73.031, 127.594), Vector(0, 0, 0), Vector(106.031, 225.969, 232.031));



printl( "Executed \"c16_a2.lua\"" );

function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "Spawn") then
		ClientCmd("weapon_gauss;");
		CreateTimer(5.0, ClientCmd,"+tau");
		ClientCmd("sc_im_play c16_a2StartV2");
		CreateTimer(0.222, ClientCmd,"sc_st_timescale 0.5");
		--CreateTimer(13.200, ClientCmd,"sc_st_timescale 0.05");
		--CreateTimer(8.222, ClientCmd,"sc_st_timescale 0.1");
		--CreateTimer(14.035, ClientCmd,"sc_im_stop");
		CreateTimer(0.322, ClientCmd,"toggle_survival_mode; wait; toggle_survival_mode;");

	elseif (name == "Start") then
		ClientCmd("setang 0 280 0");
		--CreateTimer(0.000, ClientCmd,"+forward");
		--CreateTimer(0.035, ClientCmd,"+duck");
		--CreateTimer(0.000, ClientCmd,"+jump");
		CreateTimer(0.238, ClientCmd,"-tau");
		--CreateTimer(0.040, ClientCmd,"-forward");
		--CreateTimer(0.020, ClientCmd,"-jump");
		--CreateTimer(0.040, ClientCmd,"-duck");

	elseif (name == "fixBosstStart") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c16_a2fixBosstStart");
		--ClientCmd("say record");

	elseif (name == "zalypa") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c16_a2zalypaV22");
		--ClientCmd("say record");

	elseif (name == "zalypahl21") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c16_a2zalypahl21");
		--ClientCmd("say record");
	
	elseif (name == "1") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c16_a2_1V2");
		--ClientCmd("say 1");
		CreateTimer(0.300, ClientCmd,"toggle_survival_mode");
		--ClientCmd("weapon_crowbar");

	elseif (name == "tonnelGovna") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c16_a2tonnelGovnaV3");
		CreateTimer(2.000, ClientCmd,"toggle_survival_mode");
		--ClientCmd("say record");

	elseif (name == "toSelf") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c16_a2toSelfV2");
		--ClientCmd("say ToSelf");
		
	elseif (name == "self") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c16_a2self");
		--ClientCmd("say Self");

	elseif (name == "afterSelf") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c16_a2afterSelf");
		--ClientCmd("say afterSelf");


    end
end



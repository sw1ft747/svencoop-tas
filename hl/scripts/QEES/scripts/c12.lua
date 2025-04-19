ClientCmd("sc_st_timescale 0.1");
ClientCmd( "weapon_crossbow;weapon_gauss" );

CreateTrigger("spawnc12", Vector(617.594, 1228.344, 661.125), Vector(0, 0, -80.781), Vector(53.938, 49.688, 0));
CreateTrigger("afterspawnc12", Vector(776.406, 829.594, 615.125), Vector(0, 0, 0), Vector(118.156, 28.562, 157.406));
CreateTrigger("windowc12", Vector(956.875, -343.219, 614.688), Vector(0, 0, 0), Vector(117.656, 40.406, 109.938));
CreateTrigger("c12Tosewer", Vector(-1193.281, 303.469, 387.469), Vector(0, 0, 0), Vector(250.219, 76.000, 197.094));


CreateTrigger("fixBoost", Vector(777.250, 137.031, 610.688), Vector(0, 0, 0), Vector(108.875, 34.750, 225.500));


CreateTrigger("c12survivalmode", Vector(-2094.938, -137.375, -55.188), Vector(0, 0, -179.156), Vector(201.750, 293.156, 0));
CreateTrigger("c12survivalmode2", Vector(-2065.062, -26.031, 319.375), Vector(0, 0, -87.875), Vector(83.062, 88.938, 0));
CreateTrigger("c12takeCrossBow", Vector(-1630.781, 473.844, 539.625), Vector(0, 0, -132.531), Vector(219.438, 104.938, 0));
CreateTrigger("c12survivalmode3", Vector(-1999.562, -108.406, -230.031), Vector(0, 0, 0), Vector(107.875, 90.750, 89.094));


CreateTrigger("crossbow", Vector(-2623.000, -1465.781, -125.719), Vector(0, 0, -87.719), Vector(169.969, 46.156, 0));
CreateTrigger("gauss", Vector(-3102.406, -1798.812, -240.219), Vector(0, 0, 0), Vector(51.500, 148.125, 169.938));
--CreateTrigger("scstop", Vector(-3517.562, -1599.219, -164.375), Vector(0, 0, 0), Vector(117.594, 79.156, 123.938));
CreateTrigger("secondBot", Vector(-2631.500, -503.000, -180.844), Vector(0, 0, 0), Vector(176.875, 25.656, 81.719));
CreateTrigger("upper", Vector(-3537.156, -1385.219, -188.625), Vector(0, 0, 0), Vector(130.031, 99.625, 113.938));
CreateTrigger("stopper", Vector(-3407.594, -1093.750, 831.094), Vector(0, 0, 0), Vector(56.562, 161.719, 185.750));

--CreateTrigger("elevator", Vector(-2833.156, 949.094, -1143.375), Vector(0, 0, 0), Vector(44.625, 74.562, 113.031));
--CreateTrigger("XBOOSTFINAL", Vector(-3385.062, -181.750, -1130.781), Vector(0, 0, 0), Vector(224.781, 34.312, 103.062));
CreateTrigger("timescale", Vector(-3489.594, -1090.625, 734.156), Vector(0, 0, 0), Vector(47.531, 56.156, 43.594));
CreateTrigger("timetest", Vector(-2900.281, 610.719, -1122.656), Vector(0, 0, 0), Vector(137.500, 119.938, 148.969));

CreateTrigger("stop_05", Vector(-3178.750, -492.031, -989.906), Vector(0, 0, 0), Vector(189.562, 25.938, 117.375));

printl( "Executed \"c12.lua\"" );

function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "c12survivalmode") then
		ClientCmd("kill; wait; toggle_survival_mode; wait; toggle_survival_mode");

	elseif (name == "spawnc12") then
		ClientCmd("sc_im_play c12spawn");
		ClientCmd("+tau");
		CreateTimer(1.650, ClientCmd,"-tau");
		CreateTimer(23.000, ClientCmd,"sc_st_timescale 0.5");
		CreateTimer(36.300, ClientCmd,"sc_st_timescale 0.1");

	elseif (name == "afterspawnc12") then
		--ClientCmd("say record");
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play afterspawnc12");

	elseif (name == "fixBoost") then
		--ClientCmd("say record");
		ClientCmd("sc_im_stop");
		--ClientCmd("setang 0.330319 246.242065 0.000000");
		ClientCmd("sc_im_play c12fixBoost");

	elseif (name == "windowc12") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play windowc12");

	elseif (name == "c12Tosewer") then
		--ClientCmd("say record");
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c12Tosewer");
	
	elseif (name == "c12survivalmode2") then
		ClientCmd("toggle_survival_mode");

	elseif (name == "c12takeCrossBow") then
		ClientCmd("weapon_crossbow;");
	
	elseif (name == "c12survivalmode3") then
		--ClientCmd("say record");
		CreateTimer(0.099, ClientCmd,"toggle_survival_mode; wait; toggle_survival_mode; wait; toggle_survival_mode; wait; weapon_crossbow; weapon_gauss");
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c12Towater2");
		CreateTimer(0.099, ClientCmd,"+forward");
		CreateTimer(0.506, ClientCmd,"-forward");
		CreateTimer(0.506, ClientCmd,"+jump");
		CreateTimer(0.516, ClientCmd,"-jump");

	elseif (name == "secondBot") then
		--ClientCmd("say record");
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c12water2");

    elseif (name == "crossbow") then
		ClientCmd("weapon_crossbow;");
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c12ToXboost2");
		--ClientCmd("sc_st_timescale 0.05");

    elseif (name == "gauss") then
		ClientCmd("weapon_gauss;");
		--ClientCmd("say record");
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c12gauss2");

	elseif (name == "upper") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c12upper2");
		
	elseif (name == "stopper") then
		ClientCmd("sc_im_stop");

	elseif (name == "timescale") then
		ClientCmd("sc_st_timescale 0.1");

	--[[elseif (name == "elevator") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c12elevator");
		CreateTimer(0.100, ClientCmd,"-tau");--]]

	--[[elseif (name == "XBOOSTFINAL") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c12XBOOSTFINAL");--]]

	elseif (name == "stop_05") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_st_timescale 0.05");

	elseif (name == "timetest") then
		--ClientCmd("sc_st_timescale 0.05");
    end
end



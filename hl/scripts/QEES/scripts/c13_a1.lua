ClientCmd( "weapon_crossbow; weapon_gauss");
--CreateTimer(10.150, ClientCmd,"weapon_snark");
CreateTrigger("spawn", Vector(-273.500, -1081.031, 1699.375), Vector(0, 0, 0), Vector(53.719, 39.688, 114.062));
CreateTrigger("afterDoor", Vector(-226.469, -700.781, 1698.406), Vector(0, 0, 0), Vector(239.812, 43.375, 175.625));
CreateTrigger("BOOST1", Vector(-303.438, 1189.469, 271.750), Vector(0, 0, -497.031), Vector(351.938, 59.438, 0));
CreateTrigger("AFTERBOOST1", Vector(671.906, 1226.812, -157.250), Vector(0, 0, 0), Vector(62.688, 21.406, 135.510));
CreateTrigger("doorTOdoor", Vector(667.781, 1204.219, -123.750), Vector(0, 0, 0), Vector(68.344, 13.094, 156.531));

--CreateTrigger("tryCrossBow", Vector(623.969, 523.906, -251.094), Vector(0, 0, 0), Vector(64.750, 25.719, 120.781));
CreateTrigger("tryCrossBow", Vector(773.781, 855.844, -129.625), Vector(0, 0, -116.875), Vector(81.125, 31.688, 0));
CreateTrigger("tryCrossBow22", Vector(618.375, 351.312, -254.438), Vector(0, 0, 0), Vector(99.156, 50.469, 120.188));
CreateTrigger("Snarks", Vector(481.156, 349.219, -112.594), Vector(0, 0, -133.562), Vector(99.531, 194.312, 0));
CreateTrigger("tryCrossBow2", Vector(193.219, -223.656, -251.625), Vector(0, 0, 0), Vector(206.656, 89.188, 202.312));
CreateTrigger("INAIR", Vector(409.094, -762.562, -252.438), Vector(0, 0, 0), Vector(143.438, 75.625, 256.938));
CreateTrigger("afterXBoost", Vector(256.188, -1177.312, 3.219), Vector(0, 0, 0), Vector(161.844, 40.938, 128.500));

CreateTrigger("selfSink", Vector(-114.281, -1473.125, 0.469), Vector(0, 0, 0), Vector(153.375, 168.500, 162.000));
CreateTrigger("selfSink2", Vector(-135.625, -1354.469, 5.062), Vector(0, 0, 0), Vector(67.812, 58.281, 120.156));

CreateTrigger("elevator", Vector(-110.750, -1467.812, -12.688), Vector(0, 0, -126.812), Vector(155.438, 164.875, 0));
CreateTrigger("End", Vector(-1056.844, -1025.406, -46.531), Vector(0, 0, -210.750), Vector(38.250, 256.500, 0));
CreateTrigger("openingDoors", Vector(-1916.812, -606.312, -234.406), Vector(0, 0, 0), Vector(106.781, 201.781, 97.406));


printl( "Executed \"c13_a1.lua\"" );

function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "spawn") then
		ClientCmd("setang 0 90 0");
		ClientCmd("-forward");
		ClientCmd("sc_im_play c13_a1spawn_V2");
		--ClientCmd("say record");

	elseif (name == "afterDoor") then
		--CreateTimer(4.000, ClientCmd,"sc_st_timescale 0.05");
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c13_a1afterDoor_V2");
		--ClientCmd("say record");

	elseif (name == "BOOST1") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c13_a1BOOST1");
		--ClientCmd("say record");

	elseif (name == "AFTERBOOST1") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c13_a1AFTERBOOST1");
		--ClientCmd("say record");
	
	elseif (name == "doorTOdoor") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c13_a1doorTOdoor_V2");
		--ClientCmd("say record");

	elseif (name == "tryCrossBow") then
		--ClientCmd("sc_st_timescale 0.05");
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c13_a1tryCrossBow_V2");
		--ClientCmd("say record");

	elseif (name == "tryCrossBow22") then
		--ClientCmd("sc_st_timescale 0.05");
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c13_a1tryCrossBow22_V22");
		--ClientCmd("say record");

	elseif (name == "INAIR") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c13_a1INAIR");
		--ClientCmd("say record");

	elseif (name == "afterXBoost") then
		--ClientCmd("sc_st_timescale 0.05");
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c13_a1afterXBoost_V2");
		CreateTimer(0.580, ClientCmd,"toggle_survival_mode; wait; toggle_survival_mode;");
		--ClientCmd("say record");
		
	elseif (name == "selfSink") then
		ClientCmd("sc_im_stop");
		ClientCmd("weapon_crowbar");
		--ClientCmd("say record");
		ClientCmd("sc_im_play c13_a1selfSink_V2");
		--ClientCmd("setang 0 90 0");
		--ClientCmd("say record");

	elseif (name == "selfSink2") then
		--ClientCmd("+duck");
		ClientCmd("sc_im_stop");
		ClientCmd("setang 0 90 0");
		CreateTimer(0.160, ClientCmd,"sc_im_play c13_a1selfSink2_V2");
		--ClientCmd("say record");
		
	--[[elseif (name == "elevator") then
		--CreateTimer(4.000, ClientCmd,"sc_st_timescale 0.05");
		ClientCmd("sc_im_stop");
		ClientCmd("say RecordingEnd");
		ClientCmd("setang 0 330 0");
		ClientCmd("sc_im_play c13_a1elevator");

	elseif (name == "End") then
		--ClientCmd("sc_st_timescale 0.05");
		--ClientCmd("say RecordingEnd2");
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c13_a1End");
		CreateTimer(0.580, ClientCmd,"toggle_survival_mode; wait; toggle_survival_mode");

	elseif (name == "openingDoors") then
		--ClientCmd("sc_st_timescale 0.05");
		--ClientCmd("say RecordingOpeningDoors");
		CreateTimer(0.156, ClientCmd,"kill");
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c13_a1openingDoors");--]]


	
    end
end



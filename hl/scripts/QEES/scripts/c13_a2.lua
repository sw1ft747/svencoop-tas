CreateTrigger("water", Vector(256.375, 1479.438, -1279.000), Vector(0, 0, 0), Vector(81.094, 95.969, 150.375));
CreateTrigger("setang", Vector(-8.781, 1505.875, -1275.250), Vector(0, 0, 0), Vector(43.062, 74.969, 120.031));
CreateTrigger("time_scale", Vector(1528.344, 1482.719, -1278.281), Vector(0, 0, 0), Vector(36.344, 124.562, 125.469));
CreateTrigger("freeze", Vector(1631.625, 1519.594, -1188.438), Vector(0, 0, 0), Vector(32.969, 32.500, 18.094));
CreateTrigger("boost", Vector(1563.594, 1294.438, -930.875), Vector(0, 0, 0), Vector(576.062, 510.875, 76.219));
CreateTrigger("Door", Vector(1761.781, 1643.594, -125.312), Vector(0, 0, 0), Vector(185.812, 190.250, 232.031));
CreateTrigger("Door2", Vector(1787.906, 1845.062, -125.125), Vector(0, 0, 0), Vector(166.875, 54.750, 125.438));
CreateTrigger("end", Vector(1823.250, 1956.625, -121.562), Vector(0, 0, 0), Vector(97.531, 34.656, 115.094));
CreateTrigger("end2", Vector(2273.719, 2234.062, -118.219), Vector(0, 0, 0), Vector(159.969, 45.469, 112.031));
CreateTrigger("time_scale2", Vector(1825.656, 1913.594, -124.969), Vector(0, 0, 0), Vector(93.281, 15.438, 96.062));


printl( "Executed \"c13_a2.lua\"" );

function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "water") then
		ClientCmd("sc_st_timescale 0.25");
		ClientCmd("sc_im_play c13_a2water");
		--ClientCmd("say record");
		--ClientCmd("sc_strafe");
		ClientCmd("setang 0 0 0");

	elseif (name == "setang") then
		ClientCmd("setang -10.620719 354.237671 0.000000");

	elseif (name == "time_scale") then
		ClientCmd("weapon_medkit");
		--ClientCmd("say record");
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c13_a2freeze");
		ClientCmd("rcon sc_st_timescale 0.1");

	elseif (name == "freeze") then
		ClientCmd("sc_im_stop");
		CreateTimer(0.0, ClientCmd,"sc_freeze2");
		CreateTimer(1.340, ClientCmd,"sc_im_play c13_a2freeze2");
		CreateTimer(1.340, ClientCmd,"sc_freeze2");
		CreateTimer(1.340, ClientCmd,"setang 0 60 0");
		CreateTimer(1.340, ClientCmd,"weapon_gauss");
		--CreateTimer(1.644, ClientCmd,"sc_st_timescale 0.05");
	
	elseif (name == "boost") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c13_a2Boost");
		--ClientCmd("say record");
		--ClientCmd("sc_st_timescale 0.1");
	
	elseif (name == "Door") then
		--ClientCmd("sc_strafe");
		CreateTimer(0.0, ClientCmd,"sc_im_stop");
		--CreateTimer(0.140, ClientCmd,"sc_im_play c13_a2Door");
		--CreateTimer(0.0, ClientCmd,"say 1");
		ClientCmd("-tau");
	
	elseif (name == "Door2") then
		ClientCmd("sc_im_stop");
		--ClientCmd("sc_im_play c13_a2door2");
		--ClientCmd("say record");
		--ClientCmd( "sc_st_timescale 0.05");
		
	elseif (name == "end") then
		ClientCmd("sc_im_stop");
		--ClientCmd("sc_im_play c13_a2end");
		--ClientCmd( "sc_st_timescale 0.05");

	elseif (name == "end2") then
		ClientCmd("sc_im_stop");
		--ClientCmd("sc_im_play c13_a2end2");
		--ClientCmd("say record");
		--ClientCmd( "sc_st_timescale 0.05");

	elseif (name == "time_scale2") then
		--ClientCmd( "sc_st_timescale 0.05");
    end
end


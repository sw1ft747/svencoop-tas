ClientCmd("weapon_357; weapon_shotgun");
CreateTrigger("spawn", Vector(2704.188, 2234.406, -227.250), Vector(0, 0, 0), Vector(35.781, 40.250, 87.375));
CreateTrigger("OPENDOOR", Vector(1278.031, 2405.375, -301.312), Vector(0, 0, 0), Vector(66.156, 214.594, 175.094));
CreateTrigger("door1", Vector(1112.000, 2438.938, -298.500), Vector(0, 0, 0), Vector(65.562, 128.156, 128.312));
CreateTrigger("door2", Vector(515.312, 2421.219, -623.219), Vector(0, 0, 0), Vector(15.531, 170.594, 120.594));
CreateTrigger("povorot1", Vector(-2898.000, 2402.562, -626.656), Vector(0, 0, 0), Vector(46.500, 219.594, 230.625));
CreateTrigger("povorot2", Vector(-3315.125, 780.062, -622.625), Vector(0, 0, 0), Vector(214.906, 59.500, 238.188));
CreateTrigger("mines", Vector(-1352.688, 313.750, -626.906), Vector(0, 0, 0), Vector(53.250, 203.531, 178.938));
CreateTrigger("shlagbaum", Vector(144.125, -1898.531, -646.281), Vector(0, 0, 0), Vector(171.656, 27.000, 232.500));
CreateTrigger("shlagbaum2", Vector(-1725.812, -2978.250, -631.906), Vector(0, 0, 0), Vector(210.750, 61.969, 274.625));
CreateTrigger("povorot3", Vector(-1990.031, -709.719, -634.875), Vector(0, 0, 0), Vector(207.438, 44.719, 214.938));
CreateTrigger("povorot4", Vector(-3409.094, -377.125, -632.438), Vector(0, 0, 0), Vector(71.688, 223.812, 155.531));
CreateTrigger("upboost", Vector(-3835.062, -3015.594, -626.125), Vector(0, 0, 0), Vector(211.469, 38.469, 171.375));
CreateTrigger("upboost2", Vector(-4365.000, -3331.688, -626.562), Vector(0, 0, 0), Vector(24.656, 218.531, 259.969));



printl( "Executed \"c07_a2.lua\"" );

function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "spawn") then
		ClientCmd("sc_im_play c07_a2spawn");
		CreateTimer(0.060, ClientCmd,"+forward");
		CreateTimer(0.330, ClientCmd,"-forward");
		CreateTimer(0.330, ClientCmd,"+jump");
		CreateTimer(0.338, ClientCmd,"-jump");
		CreateTimer(0.498, ClientCmd,"+jump");
		CreateTimer(0.504, ClientCmd,"-jump");
		ClientCmd("sc_st_timescale 0.5");

	elseif (name == "OPENDOOR") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c07_a2OPENDOOR");
		--ClientCmd("say record");
		--CreateTimer(0.538, ClientCmd,"default_fov 60");
		--CreateTimer(1.938, ClientCmd,"default_fov 120");
		ClientCmd("sc_st_disable_spread 1");

	elseif (name == "door1") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c07_a2door1");
		--ClientCmd("say record");
		ClientCmd("sc_st_disable_spread 0");

	elseif (name == "door2") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c07_a2door2");
		--ClientCmd("say record");

	elseif (name == "povorot1") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c07_a2povorot1");
		--ClientCmd("say record");

	elseif (name == "povorot2") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c07_a2povorot2");
		--ClientCmd("say record");

	elseif (name == "mines") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c07_a2mines");
		--ClientCmd("say record");

	elseif (name == "shlagbaum") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c07_a2shlagbaum");
		--ClientCmd("say record");

	elseif (name == "shlagbaum2") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c07_a2shlagbaum2");
		ClientCmd("weapon_shotgun");
		--ClientCmd("say record");

	elseif (name == "povorot3") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c07_a2povorot3");
		--ClientCmd("say record");

	elseif (name == "povorot4") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c07_a2povorot4");
		--ClientCmd("say record");

	elseif (name == "upboost") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c07_a2upboost");
		--ClientCmd("say record");
		--ClientCmd("fps_max 400");
		--CreateTimer(0.600, ClientCmd,"sc_st_timescale 0.05");

	elseif (name == "upboost2") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c07_a2upboost2");
		--ClientCmd("say record");

    end
end



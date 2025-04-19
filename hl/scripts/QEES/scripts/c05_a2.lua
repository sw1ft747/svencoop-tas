CreateTrigger("start", Vector(-829.375, -886.719, -1502.250), Vector(0, 0, 0), Vector(65.531, 58.188, 121.562));
CreateTrigger("boostGovna", Vector(-814.125, -187.875, -1506.375), Vector(0, 0, 0), Vector(139.500, 28.250, 144.188));
CreateTrigger("1000FPS", Vector(-1575.000, 895.156, -1683.500), Vector(0, 0, 0), Vector(589.469, 286.875, 1317.812));
CreateTrigger("EDGE", Vector(-1395.875, 1308.312, -1737.062), Vector(0, 0, 0), Vector(80.625, 78.406, 250.812));
CreateTrigger("PovorotGovna", Vector(-885.219, 3033.438, -1902.531), Vector(0, 0, 0), Vector(157.812, 50.812, 157.219));
--CreateTrigger("shit", Vector(-426.406, 3396.938, -1897.000), Vector(0, 0, 0), Vector(87.031, 138.062, 197.875));
CreateTrigger("shit", Vector(-725.812, 3382.750, -1904.656), Vector(0, 0, 0), Vector(48.469, 152.625, 174.969));
CreateTrigger("shit2", Vector(528.781, 3383.750, -1899.688), Vector(0, 0, 0), Vector(49.188, 167.156, 207.594));
CreateTrigger("drop", Vector(1215.938, 3438.281, -1875.062), Vector(0, 0, 0), Vector(109.688, 72.219, 250.688));
--CreateTrigger("drop2", Vector(1497.438, 3266.906, -2873.469), Vector(0, 0, -150.938), Vector(132.625, 93.750, 0));
--CreateTrigger("afterTop", Vector(1331.781, 3564.312, -3753.062), Vector(0, 0, 0), Vector(92.344, 140.062, 115.125));
CreateTrigger("afterTop", Vector(1250.406, 3753.219, -3875.062), Vector(0, 0, 0), Vector(185.031, 265.844, 200.312));
CreateTrigger("dojump", Vector(1444.812, 3464.656, -3588.250), Vector(0, 0, 0), Vector(57.812, 88.094, 231.219));

CreateTrigger("Fly", Vector(127.656, 4477.719, -3886.125), Vector(0, 0, 0), Vector(110.125, 137.125, 274.531));
CreateTrigger("15Sec", Vector(-570.375, 4481.812, -3970.781), Vector(0, 0, 0), Vector(91.500, 159.344, 211.531));
CreateTrigger("power2", Vector(-571.812, 4500.219, -3682.344), Vector(0, 0, 0), Vector(97.250, 128.625, 162.875));
CreateTrigger("power3", Vector(-124.531, 4094.812, -3406.219), Vector(0, 0, 0), Vector(59.125, 28.344, 52.781));
CreateTrigger("power3V2", Vector(-125.281, 4977.938, -3337.375), Vector(0, 0, 0), Vector(71.844, 52.781, 160.875));
CreateTrigger("123", Vector(-131.625, 4329.625, -3174.031), Vector(0, 0, 0), Vector(95.438, 60.531, 179.125));


printl( "Executed \"c05_a2.lua\"" );

function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "start") then
		--CreateTimer(1.600, ClientCmd,"sc_st_timescale 0.05");
		ClientCmd("sc_im_play c05_a2start2__V2");
		CreateTimer(0.110, ClientCmd,"+forward");
		CreateTimer(0.440, ClientCmd,"+jump");
		CreateTimer(0.450, ClientCmd,"-forward");
		CreateTimer(0.460, ClientCmd,"-jump");

	elseif (name == "boostGovna") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c05_a2boostGovna__V2");
		--ClientCmd("sc_st_timescale 0.05");
		--ClientCmd("sc_strafe");
		--CreateTimer(0.000, ClientCmd,"say record");
		--CreateTimer(0.360, ClientCmd,"sc_strafe");
		--CreateTimer(0.300, ClientCmd,"sc_im_stop");
		--CreateTimer(0.300, ClientCmd,"sc_im_play c05_a2JumpBug2");
		--CreateTimer(0.400, ClientCmd,"fps_max 1000");

	elseif (name == "1000FPS") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c05_a2_1000FPS");
		ClientCmd("fps_max 1000");
		--ClientCmd("say record");

	elseif (name == "EDGE") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c05_a2_EDGE");
		--ClientCmd("say record");
		ClientCmd("fps_max 20");
		CreateTimer(0.100, ClientCmd,"fps_max 1000");
		
	elseif (name == "PovorotGovna") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c05_a2PovorotGovna2__V2");
		--ClientCmd("say record");
		ClientCmd("fps_max 20");
		CreateTimer(0.100, ClientCmd,"fps_max 500");
		--ClientCmd("setang 3.179580 337.137451 0.000000");
		--ClientCmd("sc_st_timescale 0.1");
		
	elseif (name == "shit") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c05_a2shit2__V2");
		--ClientCmd("sc_st_timescale 0.1");

	elseif (name == "shit2") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c05_a2shit22__V2_2");
		--ClientCmd("say record");
	
	elseif (name == "drop") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c05_a2drop2__V2_2");
		--ClientCmd("say record");

	elseif (name == "afterTop") then
		ClientCmd("sc_im_stop");
		--CreateTimer(2.000, ClientCmd,"sc_st_timescale 0.1");
		ClientCmd("sc_im_play c05_a2afterTop2__V2_2");
		--ClientCmd("say record");

	elseif (name == "Fly") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c05_a2Fly__V2_2");
		--ClientCmd("say record");

	elseif (name == "15Sec") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c05_a2_15Sec__V2_2");
		--ClientCmd("say record");
		--ClientCmd("setang 89.000000 90 0.000000");
	
	elseif (name == "power2") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c05_a2powerV2__V2_2");
		--CreateTimer(1.200, ClientCmd,"sc_st_timescale 0.1");
		--ClientCmd("say record")

	elseif (name == "power3V2") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c05_a2powerV3__V2_2");
		--ClientCmd("say record");

	elseif (name == "123") then
		ClientCmd("say power_up");
    end
end



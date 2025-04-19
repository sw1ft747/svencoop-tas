CreateTrigger("start", Vector(-829.375, -886.719, -1502.250), Vector(0, 0, 0), Vector(65.531, 58.188, 121.562));
CreateTrigger("boostGovna", Vector(214.031, 1206.625, -1512.406), Vector(0, 0, 0), Vector(79.312, 32.312, 163.719));
CreateTrigger("PovorotGovna", Vector(-885.219, 3033.438, -1902.531), Vector(0, 0, 0), Vector(157.812, 50.812, 157.219));
CreateTrigger("shit", Vector(-426.406, 3396.938, -1897.000), Vector(0, 0, 0), Vector(87.031, 138.062, 197.875));
CreateTrigger("drop", Vector(1215.938, 3438.281, -1875.062), Vector(0, 0, 0), Vector(109.688, 72.219, 250.688));
--CreateTrigger("afterTop", Vector(1331.781, 3564.312, -3753.062), Vector(0, 0, 0), Vector(92.344, 140.062, 115.125));
CreateTrigger("afterTop", Vector(1250.406, 3753.219, -3875.062), Vector(0, 0, 0), Vector(185.031, 265.844, 200.312));
CreateTrigger("dojump", Vector(1444.812, 3464.656, -3588.250), Vector(0, 0, 0), Vector(57.812, 88.094, 231.219));
CreateTrigger("power2", Vector(-571.812, 4500.219, -3682.344), Vector(0, 0, 0), Vector(97.250, 128.625, 162.875));
CreateTrigger("power3", Vector(-124.531, 4094.812, -3406.219), Vector(0, 0, 0), Vector(59.125, 28.344, 52.781));
CreateTrigger("123", Vector(-116.956, 4726.344, -3146.969), Vector(0, 0, 0), Vector(54.613, 31.555, 92.571));



printl( "Executed \"c05_a2.lua\"" );

function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "start") then
		ClientCmd("sc_st_timescale 0.25");
		ClientCmd("sc_im_play c05_a2start");
		--CreateTimer(0.110, ClientCmd,"+forward");
		--CreateTimer(0.442, ClientCmd,"+jump");
		--CreateTimer(0.450, ClientCmd,"-forward");
		--CreateTimer(0.460, ClientCmd,"-jump");
		--CreateTimer(0.460, ClientCmd,"-jump");
		--CreateTimer(9.260, ClientCmd,"sc_st_timescale 0.1");
		--CreateTimer(11.960, ClientCmd,"sc_jumpbug");
		--CreateTimer(18.100, ClientCmd,"sc_st_timescale 0.1");
		CreateTimer(15.660, ClientCmd,"sc_im_stop");
		CreateTimer(15.660, ClientCmd,"sc_im_play c05_a2Power");

	elseif (name == "boostGovna") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c05_a2boostGovna");
		--ClientCmd("sc_strafe");
		--ClientCmd("+duck");
		--CreateTimer(0.160, ClientCmd,"-duck");
		--CreateTimer(0.360, ClientCmd,"sc_strafe");
	
	elseif (name == "PovorotGovna") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c05_a2PovorotGovna");
		
	elseif (name == "shit") then
		--ClientCmd("sc_st_timescale 0.1");
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c05_a2shit");
	
	elseif (name == "drop") then
		ClientCmd("sc_im_stop");
		--ClientCmd("sc_st_timescale 0.1");
		--ClientCmd("sc_jumpbug");
		ClientCmd("sc_im_play c05_a2drop");
	
	elseif (name == "dojump") then
		--ClientCmd("sc_im_stop");
		--ClientCmd("sc_jumpbug");
		--ClientCmd("sc_im_record c05_a2dojump");
		--ClientCmd("sc_st_timescale 0.05");

	elseif (name == "afterTop") then
		ClientCmd("sc_im_stop");
		--ClientCmd("sc_st_timescale 0.1");
		ClientCmd("sc_im_play c05_a2afterTop");

	elseif (name == "power2") then
		ClientCmd("sc_im_stop");
		--ClientCmd("sc_st_timescale 0.1");
		ClientCmd("sc_im_play c05_a2power2");

	elseif (name == "power3") then
		ClientCmd("sc_im_stop");
		--ClientCmd("say record");
		ClientCmd("sc_im_play c05_a2power3");

	elseif (name == "123") then
		ClientCmd("say power_up");
    end
end



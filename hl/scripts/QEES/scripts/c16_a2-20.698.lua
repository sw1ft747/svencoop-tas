CreateTrigger("Spawn", Vector(1920.500, 1738.812, 151.000), Vector(0, 0, 0), Vector(306.906, 308.250, 215.406));
CreateTrigger("Start", Vector(1196.469, -1816.969, 60.219), Vector(0, 0, 0), Vector(148.688, 99.844, 170.875));
CreateTrigger("zalypa", Vector(161.750, -1764.344, 421.344), Vector(0, 0, -347.812), Vector(66.125, 350.750, 0));
CreateTrigger("tonnelGovna", Vector(-1000.500, -86.438, 43.812), Vector(0, 0, 0), Vector(149.812, 244.625, 384.406));



printl( "Executed \"c16_a2.lua\"" );

function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "Spawn") then
		ClientCmd("weapon_gauss;\n");
		CreateTimer(5.0, ClientCmd,"+tau");
		ClientCmd("sc_im_play c16_a2Start\n");
		CreateTimer(0.222, ClientCmd,"sc_st_timescale 0.5");
		--CreateTimer(13.722, ClientCmd,"sc_st_timescale 0.1");
		--CreateTimer(8.222, ClientCmd,"sc_st_timescale 0.1");
		--CreateTimer(14.035, ClientCmd,"sc_im_stop");

	elseif (name == "Start") then
		--CreateTimer(0.000, ClientCmd,"sc_st_timescale 0.01");
		--CreateTimer(0.160, ClientCmd,"sc_st_timescale 0.1");
		ClientCmd("setang 0.428425 276.921387 0.000000");
		CreateTimer(0.000, ClientCmd,"+forward");
		CreateTimer(0.035, ClientCmd,"+duck");
		CreateTimer(0.035, ClientCmd,"+jump");
		CreateTimer(0.037, ClientCmd,"-tau");
		CreateTimer(0.160, ClientCmd,"-forward");
		CreateTimer(0.160, ClientCmd,"-jump");
		CreateTimer(0.160, ClientCmd,"-duck");

	elseif (name == "zalypa") then
		ClientCmd("sc_im_stop\n");
		ClientCmd("sc_im_play c16_a2zalypa\n");

	elseif (name == "tonnelGovna") then
		ClientCmd("sc_im_stop\n");
		ClientCmd("sc_im_play c16_a2tonnelGovna\n");
		


    end
end



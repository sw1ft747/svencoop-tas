CreateTrigger("DarkRoom", Vector(3077.562, 514.938, 161.125), Vector(0, 0, -159.094), Vector(505.250, 498.281, 0));
CreateTrigger("afterDark", Vector(19.812, 1847.156, 1648.875), Vector(0, 0, 0), Vector(137.625, 182.344, 125.781));
CreateTrigger("spawn4", Vector(88.312, 1965.344, 1734.094), Vector(0, 0, -65.438), Vector(21.625, 30.188, 0));
CreateTrigger("spawn2", Vector(37.188, 1937.844, 1669.938), Vector(0, 0, 0), Vector(22.969, 41.250, 107.906));
CreateTrigger("ground", Vector(-1202.250, 428.469, -133.688), Vector(0, 0, 0), Vector(302.812, 39.438, 303.719));
CreateTrigger("ground2", Vector(-1139.062, 123.656, 171.156), Vector(0, 0, -285.000), Vector(203.562, 65.125, 0));
CreateTrigger("tonnelGovna", Vector(-394.625, -353.594, -74.688), Vector(0, 0, -50.125), Vector(16.000, 75.031, 0));
CreateTrigger("inside", Vector(-289.250, -247.656, -74.562), Vector(0, 0, 0), Vector(77.969, 23.156, 59.656));
CreateTrigger("inside2", Vector(-825.156, 119.719, -110.969), Vector(0, 0, 0), Vector(335.375, 51.094, 257.469));


printl( "Executed \"c14.lua\"" );

function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "DarkRoom") then
		--ClientCmd( "sc_jumpbug");
		CreateTimer(0.222, ClientCmd,"sc_st_timescale 0.25");
		ClientCmd( "weapon_gauss");
		--CreateTimer(12.300, ClientCmd,"sc_st_timescale 0.05");
		--CreateTimer(8.322, ClientCmd,"sc_ducktap");
		--CreateTimer(8.922, ClientCmd,"sc_ducktap");
		--CreateTimer(10.922, ClientCmd,"sc_jumpbug");
		CreateTimer(5.0, ClientCmd,"+tau");
		CreateTimer(8.500, ClientCmd,"-tau");
		--CreateTimer(8.550, ClientCmd,"+tau");
		--CreateTimer(8.600, ClientCmd,"+left");
		--CreateTimer(8.860, ClientCmd,"-left");
		--CreateTimer(9.000, ClientCmd,"+back");
		--CreateTimer(9.100, ClientCmd,"-back");
		
	elseif (name == "spawn2") then
		ClientCmd("setang -0.131120 178.846436 0.000000");
		ClientCmd("sc_im_play c14solo");
		ClientCmd("say spawn_norm");

	elseif (name == "ground") then
		ClientCmd("sc_im_stop");
		--ClientCmd("say 1");
		ClientCmd( "weapon_crossbow");

	elseif (name == "ground2") then
		ClientCmd("sc_im_play c14ground2");
		--ClientCmd("say 2");

	elseif (name == "tonnelGovna") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c14tonnel");
		--CreateTimer(0.200, ClientCmd,"sc_st_timescale 0.05");

	elseif (name == "inside") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c14inside");

	--[[elseif (name == "inside2") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c14inside2");

	elseif (name == "spawn4") then
		ClientCmd("sc_jumpbug");
		ClientCmd("say 4");
		ClientCmd("sc_im_record c14RocketDude");
		CreateTimer(3.800, ClientCmd,"sc_im_stop");
		CreateTimer(3.800, ClientCmd,"sc_im_record c14RocketShot");
		CreateTimer(3.800, ClientCmd,"sc_jumpbug");--]]
    end
end



--CreateTrigger("leftSpawn", Vector(3948.031, 1765.344, -587.844), Vector(0, 0, 0), Vector(84.625, 125.719, 206.344));
CreateTrigger("rightSpawn", Vector(3437.844, 1764.125, -584.031), Vector(0, 0, 0), Vector(74.938, 125.875, 196.812));
CreateTrigger("ups", Vector(1808.094, 480.188, 3.531), Vector(0, 0, 0), Vector(15.375, 157.250, 138.312));
CreateTrigger("420MLGShot", Vector(3266.656, 385.344, 4.469), Vector(0, 0, 0), Vector(36.688, 126.750, 188.875));




printl( "Executed \"c10.lua\"" );

function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "leftSpawn") then
		--ClientCmd("sc_im_record c10LeftSpawn");

	elseif (name == "rightSpawn") then
		ClientCmd("toggle_survival_mode;");
		ClientCmd("sc_im_play c10rightSpawn");
		CreateTimer(8.700, ClientCmd,"toggle_survival_mode");
		CreateTimer(8.700, ClientCmd,"toggle_survival_mode");
		--CreateTimer(11.300, ClientCmd,"say open");
		CreateTimer(9.418, ClientCmd,"+attack");
		ClientCmd("sc_st_disable_spread 1");
		--CreateTimer(9.410, ClientCmd,"sc_st_disable_spread 1");
		CreateTimer(9.430, ClientCmd,"sc_st_disable_spread 0");
		--CreateTimer(9.350, ClientCmd,"sc_st_timescale 0.005");
		--CreateTimer(9.350, ClientCmd,"default_fov 1");
		CreateTimer(9.350, ClientCmd,"+duck");
		CreateTimer(9.430, ClientCmd,"-duck");
		--CreateTimer(9.430, ClientCmd,"default_fov 120");
		CreateTimer(9.430, ClientCmd,"-attack");
		--CreateTimer(9.430, ClientCmd,"sc_st_timescale 0.25");
		--CreateTimer(9.424, ClientCmd,"getpos");
		CreateTimer(9.100, ClientCmd,"+left");
		CreateTimer(9.400, ClientCmd,"-left");
		--CreateTimer(14.900, ClientCmd,"sc_st_timescale 0.10");
		CreateTimer(10, ClientCmd,"sc_im_play c10gruntRoom");
		CreateTimer(18, ClientCmd,"sc_im_stop");
	
	elseif (name == "420MLGShot") then
		ClientCmd("sc_im_stop")
		ClientCmd("sc_strafe")
		CreateTimer(0.255, ClientCmd,"setang 2.100091 259.969482 0.000000");
		--CreateTimer(0.27111, ClientCmd,"getpos");
		--CreateTimer(0.27111, ClientCmd,"+attack");
		CreateTimer(0.455, ClientCmd,"-attack");
		CreateTimer(0.955, ClientCmd,"sc_strafe");
		--ClientCmd("sc_im_record c10_420MLGShot");
	elseif (name == "ups") then
		CreateTimer(0.355, ClientCmd, "sc_im_stop")
		--ClientCmd("sc_im_play c10_UPS");
		CreateTimer(0.800, ClientCmd,"say pizdite_ego_na_zdorovie");

    end
end



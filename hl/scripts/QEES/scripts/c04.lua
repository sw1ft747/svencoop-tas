CreateTrigger("spawn", Vector(40.158, 1453.000, 90.218), Vector(0, 0, -60.187), Vector(37.342, 22.719, 0));
--ClientCmd("sc_st_timescale 0.25");


printl( "Executed \"c04.lua\"" );

function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "spawn") then
		ClientCmd("sc_st_timescale 0.25");
		ClientCmd("weapon_9mmhandgun");
		ClientCmd("sc_strafe_ignore_ground 0");
		ClientCmd("toggle_survival_mode;");
		ClientCmd("toggle_survival_mode;");
		CreateTimer(0.700, ClientCmd,"+jump");
		CreateTimer(0.500, ClientCmd,"+attack2");
		CreateTimer(0.800, ClientCmd,"-attack2");
		CreateTimer(0.744, ClientCmd,"kill");
		CreateTimer(0.780, ClientCmd,"-jump");
		ClientCmd("setang -0.358296 31.788940 0.000000");
		CreateTimer(0.285, ClientCmd,"setang 0 360 0");
		CreateTimer(0.580, ClientCmd,"setang -1.311199 293.878784 0.000000");
		--CreateTimer(0.580, ClientCmd,"setang 0 280.345337 0");
		CreateTimer(1.600, ClientCmd,"sc_st_timescale 0.1");

	elseif (name == "123") then

    end
end



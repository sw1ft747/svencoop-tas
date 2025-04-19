ClientCmd( "sc_st_timescale 0.25");

printl( "Executed \"c13_a4.lua\"" );

function SpeedrunInit()
    ClientCmd("sc_strafe_yaw -89");
    ClientCmd("sc_strafe_type 0");
    ClientCmd("-jump");
    ClientCmd("-duck");
    ClientCmd("-forward");
    ClientCmd("-back");
    ClientCmd("-moveleft");
    ClientCmd("-moveright");
    ClientCmd("sc_st_setangles_stop");
end

function SpeedrunStart()
    InputManager.Record( "c13_a4" );
    ClientCmd("+tau");
    
    CreateTimer(0.000, ClientCmd,"sc_strafe_ignore_ground 0");
    CreateTimer(0.380, ClientCmd,"sc_strafe_yaw 90");
    CreateTimer(0.590, ClientCmd,"sc_strafe_ignore_ground 1; sc_strafe_yaw -90; +forward");
    CreateTimer(0.610, ClientCmd,"+duck");
    CreateTimer(1.000, ClientCmd,"+jump; -forward");
    CreateTimer(1.040, ClientCmd,"-duck");
    CreateTimer(1.140, ClientCmd,"sc_strafe_yaw -51; sc_st_setangles 0 -31 60");
    CreateTimer(1.260, ClientCmd,"-tau; sc_strafe_yaw -31");
    CreateTimer(1.380, ClientCmd,"+duck");
    CreateTimer(1.420, ClientCmd,"-duck; sc_strafe_yaw -2; +tau");
    CreateTimer(1.640, ClientCmd,"sc_strafe_yaw -120; sc_st_setangles 0 -90 160");
    CreateTimer(1.650, ClientCmd,"sc_strafe_type 1");
    CreateTimer(1.750, ClientCmd,"sc_st_setangles 90 -90 155");
    CreateTimer(1.930, ClientCmd,"sc_strafe_yaw 179; -jump");
    CreateTimer(2.000, ClientCmd,"toggle_survival_mode;");
    CreateTimer(2.100, ClientCmd,"toggle_survival_mode;");
    CreateTimer(2.070, ClientCmd,"+moveright; +back");
    CreateTimer(3.700, ClientCmd,"-moveright; -back; +jump; sc_strafe_yaw 90");
    CreateTimer(3.710, ClientCmd,"sc_st_setangles 0 120 60");
    CreateTimer(3.720, ClientCmd,"sc_strafe_yaw 120; sc_st_setangles 0 104 0");
    CreateTimer(3.870, ClientCmd,"-tau");
    CreateTimer(3.900, ClientCmd,"+duck; weapon_shotgun; sc_strafe_type 0");
    CreateTimer(4.070, ClientCmd,"kill");
    CreateTimer(4.070, ClientCmd,"-duck; fps_max 20");
    CreateTimer(4.270, ClientCmd,"-jump");
    CreateTimer(5.070, ClientCmd,"sc_strafe_type 0; fps_max 500");
    CreateTimer(4.470, ClientCmd,"sc_strafe_yaw \"\"; sc_strafe_type 0; sc_ducktap_adjust_fps 10000");
    CreateTimer(4.350, ClientCmd,"say Аптеку бери.");
    CreateTimer(5.600, CreateTrigger, "CrossBow", Vector(150.719, -924.781, -248.250), Vector(0, 0, 0), Vector(100.312, 57.281, 250.688) );
    CreateTimer(5.600, CreateTrigger, "Spawn", Vector(366.438, -585.469, -249.500), Vector(0, 0, 0), Vector(98.719, 296.219, 304.906));
    CreateTimer(7.800, ClientCmd,"weapon_hornetgun");
end

function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "CrossBow") then
		ClientCmd("weapon_gauss");
    elseif (name == "Spawn") then
		CreateTimer(0.240, ClientCmd,"toggle_survival_mode");
        CreateTimer(0.240, ClientCmd,"toggle_survival_mode");
    end
end

function OnSpecialSpawn(pPlayerEdict)
    if ( pPlayerEdict.vars.netname == "QEES51" ) then
        ClientCmd( "weapon_gauss" );
    end
end

start_time = 0.0;
activated_portalbegin = false;

function OnEntityTouch(entity, other)
    if ( entity ~= nill and entity.vars.model == "*44" and entity.vars.target == "portalbegin_mm" and not activated_portalbegin ) then
        -- StartTimer();
        -- start_time = SegmentCurrentTime();

        local portal_activation_time = 116.0;

        CreateTimer( 116.0 - 10.0, function()
            ClientCmd( "weapon_gauss" );
            ClientCmd( "say Gauss charge and angles change in 5 sec" );
            CreateTimer( 5.0, ClientCmd, "+tau; sc_st_setangles 0 -83 200" );
            CreateTimer( 5.0, ClientCmd, "sc_strafe 1; sc_strafe_ignore_ground 0; sc_strafe_vectorial_increment 0; sc_strafe_dir 4; sc_strafe_point_x -42.093750; sc_strafe_point_y 313.718750" );
            CreateTimer( 9.5, ClientCmd, "sc_strafe_dir 3; sc_st_setangles_stop; setang 0 -83" );
            CreateTimer( 9.85, ClientCmd, "+jump; -tau" );
        end );

        for t = 10.0, 0.0, -1.0 do
            CreateTimer( 116.0 - ( 10.0 - t ), ClientCmd, string.format( "say Portal activation in %.1f seconds", 10.0 - t ) );
        end

        activated_portalbegin = true;
    end
end

SpeedrunInit();
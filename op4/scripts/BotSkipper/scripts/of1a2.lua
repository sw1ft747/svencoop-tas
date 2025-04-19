spawns_state = 0;

function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
    printl( "OnPlayerSpawn()" );

    local sPlayerName = pPlayerEdict.vars.netname;

    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) );

    if ( spawns_state == 0 ) then
        if ( sPlayerName == "BotSkipper" ) then
            pPlayerEdict.vars.origin = Vector( -857, -2487, 120 );
            pPlayerEdict.vars.angles = Vector( -7, 4, 0 );
        end
    end
end

function SpeedrunStart()
    start_time = SegmentCurrentTime();

	EnableSurvivalMode();

    ClientCmd( "setvel 0 0 0;sc_strafe_yaw \"\";sc_strafe_type 0;sc_strafe 1;-jump;pausable 0;-duck;sc_strafe_ignore_ground 1;sc_st_legit_mode_ignore_freeze 1;-sc_ducktap;sc_strafe_vectorial_increment 0" );
    ClientCmd( "sc_st_setangles_stop; sc_st_setangles2_stop; sc_st_follow_point_stop;-forward; -jump; -duck; -attack; -moveleft; -right; -moveright;-back; -sc_ducktap; sc_aimbot_scripts_filter_targets 1" );
    ClientCmd( "sc_strafe 0; sc_strafe_dir 3; sc_strafe_ignore_ground 1; sc_strafe_vectorial 1; sc_strafe_vectorial_increment 0; sc_strafe_vectorial_snap 0; sc_aimbot 0; sc_st_disable_spread 0; sc_jumpbug_min_fall_velocity 580" );
    ClientCmd( "clockwindow 0; cl_smoothtime 0; mp_respawndelay 0; mp_classic_mode 1; fps_max 200; sc_jumpbug_min_fall_velocity 580; sc_st_legit_mode_ignore_freeze 1; sc_aimbot_change_angles_back 1" );

    CreateTrigger("trigger", Vector(-232.812, -2464.344, -1114.562), Vector(0, 0, -112.969), Vector(83.969, 15.812, 0));

    CreateTimer( 0.0, ClientCmd, "sc_strafe 1;kill;wait;toggle_survival_mode;mp_respawndelay 1341");
    CreateTimer( 0.01, ClientCmd, "+jump;sc_strafe_yaw 30;setang 0 0 0");
    CreateTimer( 0.2, ClientCmd, "sc_st_setangles 60 -90 200");
    CreateTimer( 0.58, ClientCmd, "+duck");
    CreateTimer( 0.6, ClientCmd, "-duck");
    CreateTimer( 1.58, ClientCmd, "sc_strafe_yaw -42.1");
    CreateTimer( 2.0, ClientCmd, "sc_st_setangles 0 -90 60");
    CreateTimer( 2.2, ClientCmd, "-jump");
    CreateTimer( 2.23, ClientCmd, "sc_strafe_yaw 95");
    CreateTimer( 2.31, ClientCmd, "+back;sc_strafe_ignore_ground 0;sc_strafe_yaw 95;sc_strafe_type 1;fps_max 60");
    CreateTimer( 2.4, ClientCmd, "-back;sc_strafe_type 0");
    CreateTimer( 2.5, ClientCmd, "+forward;sc_strafe_yaw -92");
    CreateTimer( 2.52, ClientCmd, "-forward");
    CreateTimer( 3.0, ClientCmd, "fps_max 40;wait;wait;wait;+jump;wait;fps_max 200");
    CreateTimer( 3.3, ClientCmd, "sc_st_setangles 0 -179 60");
    CreateTimer( 3.52, ClientCmd, "sc_strafe_yaw -179");


end

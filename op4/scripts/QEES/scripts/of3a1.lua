spawns_state = 0;

function SpeedrunStart()
    start_time = SegmentCurrentTime();

	EnableSurvivalMode();
    RemoveAllTimers();

    SetTimescale( 0.25 );

    ClientCmd( "weapon_satchel;sv_cheats 0;setvel 0 0 0;sc_strafe_yaw \"\";sc_strafe_type 0;sc_strafe 0;-jump;pausable 0;-duck;sc_strafe_ignore_ground 1;sc_st_legit_mode_ignore_freeze 1;-sc_ducktap;sc_strafe_vectorial_increment 0" );
    ClientCmd( "sc_st_setangles_stop; sc_st_setangles2_stop; sc_st_follow_point_stop; -jump; -duck; -attack;-attack2; -moveleft; -right; -moveright;-back; -sc_ducktap; sc_aimbot_scripts_filter_targets 1" );
    ClientCmd( "sc_strafe 1; sc_strafe_dir 3; sc_strafe_ignore_ground 1; sc_strafe_vectorial 1; sc_strafe_vectorial_increment 0; sc_strafe_vectorial_snap 0; sc_aimbot 0; sc_st_disable_spread 0; sc_jumpbug_min_fall_velocity 580" );
    ClientCmd( "clockwindow 0; cl_smoothtime 0; mp_respawndelay 0; mp_classic_mode 1; fps_max 200; sc_jumpbug_min_fall_velocity 580; sc_st_legit_mode_ignore_freeze 1; sc_aimbot_change_angles_back 1" );
    
    -- СТАРТ КАРРТЫ
    CreateTimer( 0.01, ClientCmd, "setvel 0 0 0;sc_Strafe_type 0;sc_strafe 1;sc_strafe_ignore_ground 0;sc_strafe_yaw -136" );
    CreateTimer( 0.53, ClientCmd, "sc_strafe_yaw -90");
    CreateTimer( 0.21, ClientCmd, "sc_st_setangles 0 -90 60");
    CreateTimer( 0.73, ClientCmd, "+use;wait;-use;+attack2;sc_strafe_yaw -63;sc_st_setangles -60 140 40");
    CreateTimer( 1.0, ClientCmd, "sc_Strafe_yaw 91;sc_st_setangles 0 -90 100");
    CreateTimer( 1.1, ClientCmd, "-attack2");
    CreateTimer( 1.3, ClientCmd, "+jump;sc_Strafe_yaw -90;sc_strafe_type 0;+attack");
    CreateTimer( 1.8, ClientCmd, "gibme");
    CreateTimer( 1.8, ClientCmd, "sc_strafe_yaw -88");
    CreateTimer( 1.9, ClientCmd, "+duck");
    CreateTimer( 2.07, ClientCmd, "-attack;weapon_9mmAR");
    CreateTimer( 2.05, ClientCmd, "-duck");
    CreateTimer( 2.16, ClientCmd, "sc_strafe_yaw -90");
    CreateTimer( 2.3, ClientCmd, "gibme");
    CreateTimer( 2.3, ClientCmd, "gibme");
    CreateTimer( 2.3, ClientCmd, "gibme");
    CreateTimer( 2.425, ClientCmd, "+duck");
    CreateTimer( 2.6, ClientCmd, "-duck");
    CreateTimer( 2.58, ClientCmd, "+attack2;setang -40 90 0;+duck");
    CreateTimer( 2.60, ClientCmd, "wait;-attack2;wait;setang 0 -90 0");
    CreateTimer( 2.60, ClientCmd, "-duck");

    CreateTimer( 2.609, ClientCmd, "sc_strafe_yaw \"\"");
    CreateTimer( 2.609, ClientCmd, "-jump");
    CreateTimer( 4.965, ClientCmd, "restart");
    --[[CreateTimer( 3.1, ClientCmd, "gibme");
    CreateTimer( 3.2, ClientCmd, "sc_strafe_yaw -79;-jump");]]
    
end

function OnFireTargets( targetname, activator, caller, usetype, value, delay )
    if (targetname == "tele_out_mrg1" ) then
        ClientCmd("pausable 1;pause;sc_script PrintTime()");
    end
end

function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
    printl( "OnPlayerSpawn()" );

    local sPlayerName = pPlayerEdict.vars.netname;

    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) );

    if ( spawns_state == 0 ) then
        if ( sPlayerName == "QEES" ) then
            pPlayerEdict.vars.origin = Vector( 209, 1337, -216 );
            pPlayerEdict.vars.angles = Vector( 0, -136, 0 );
        end
    end
end

function PrintTime()
    PrintChatText( string.format( "%.3f (%d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end
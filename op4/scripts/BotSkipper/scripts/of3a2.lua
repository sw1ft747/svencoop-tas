spawns_state = 0;

function SpeedrunStart()
    start_time = SegmentCurrentTime();

	EnableSurvivalMode();
    RemoveAllTimers();

    SetTimescale( 0.25 );

    ClientCmd( "sv_cheats 0;setvel 0 0 0;sc_strafe_yaw \"\";sc_strafe_type 0;sc_strafe 0;-jump;pausable 0;-duck;sc_strafe_ignore_ground 1;sc_st_legit_mode_ignore_freeze 1;-sc_ducktap;sc_strafe_vectorial_increment 0" );
    ClientCmd( "sc_st_setangles_stop; sc_st_setangles2_stop; sc_st_follow_point_stop; -jump; -duck; -attack;-attack2; -moveleft; -right; -moveright;-back; -sc_ducktap; sc_aimbot_scripts_filter_targets 1" );
    ClientCmd( "sc_strafe 1; sc_strafe_dir 3; sc_strafe_ignore_ground 1; sc_strafe_vectorial 1; sc_strafe_vectorial_increment 0; sc_strafe_vectorial_snap 0; sc_aimbot 0; sc_st_disable_spread 0; sc_jumpbug_min_fall_velocity 580" );
    ClientCmd( "clockwindow 0; cl_smoothtime 0; mp_respawndelay 0; mp_classic_mode 1; fps_max 200; sc_jumpbug_min_fall_velocity 580; sc_st_legit_mode_ignore_freeze 1; sc_aimbot_change_angles_back 1" );
    
    -- СТАРТ КАРРТЫ
    CreateTimer( 0.01, ClientCmd, "setvel 0 0 0;sc_Strafe_type 0;sc_strafe 1;sc_strafe_ignore_ground 0;sc_strafe_yaw 35" );
    CreateTimer( 0.28, ClientCmd, "+jump;wait;-jump");
    CreateTimer( 0.2, ClientCmd, "sc_st_setangles -45 -13 60");
    CreateTimer( 0.29, ClientCmd, "gibme");
    CreateTimer( 0.29, ClientCmd, "gibme");
    CreateTimer( 0.7, ClientCmd, "gibme");
    CreateTimer( 1, ClientCmd, "gibme");
    CreateTimer( 1, ClientCmd, "gibme");
    CreateTimer( 1, ClientCmd, "gibme");
    CreateTimer( 1, ClientCmd, "gibme");
    CreateTimer( 1, ClientCmd, "gibme");
    CreateTimer( 1, ClientCmd, "gibme");
    CreateTimer( 1.15, ClientCmd, "gibme;+back");
    CreateTimer( 1.15, ClientCmd, "gibme");
    CreateTimer( 1.15, ClientCmd, "gibme");
    CreateTimer( 1.15, ClientCmd, "gibme");
    CreateTimer( 1.15, ClientCmd, "gibme");
    CreateTimer( 1.15, ClientCmd, "gibme");
    CreateTimer( 1.15, ClientCmd, "gibme");
    CreateTimer( 1.15, ClientCmd, "gibme");
    CreateTimer( 1.4, ClientCmd, "-duck;-back");



end

function OnFireTargets( targetname, activator, caller, usetype, value, delay )
    if ( targetname == "tele_out_mgr" ) then
        ClientCmd("sc_script PrintTime()");
    end
end

function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
    printl( "OnPlayerSpawn()" );

    local sPlayerName = pPlayerEdict.vars.netname;

    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) );

    if ( spawns_state == 0 ) then
        if ( sPlayerName == "BotSkipper" ) then
            pPlayerEdict.vars.origin = Vector( -565, -811, -1224 );
            pPlayerEdict.vars.angles = Vector( 0, 35, 0 );
        elseif ( sPlayerName == "kolokola777" ) then
            pPlayerEdict.vars.origin = Vector( -565, -811, -1224 );
            pPlayerEdict.vars.angles = Vector( 0, -1, 0 );
        end
    end
end

function PrintTime()
    PrintChatText( string.format( "%.3f (%d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

-- 1.365
--[[    CreateTimer( 0.01, ClientCmd, "setvel 0 0 0;sc_Strafe_type 0;sc_strafe 1;sc_strafe_ignore_ground 0;sc_strafe_yaw 35" );
    CreateTimer( 0.28, ClientCmd, "+jump;wait;-jump");
    CreateTimer( 0.2, ClientCmd, "sc_st_setangles -45 -13 60");
    CreateTimer( 0.29, ClientCmd, "gibme");
    CreateTimer( 0.29, ClientCmd, "gibme");
    CreateTimer( 0.7, ClientCmd, "gibme");
    CreateTimer( 1, ClientCmd, "gibme");
    CreateTimer( 1, ClientCmd, "gibme");
    CreateTimer( 1, ClientCmd, "gibme");
    CreateTimer( 1, ClientCmd, "gibme");
    CreateTimer( 1, ClientCmd, "gibme");
    CreateTimer( 1, ClientCmd, "gibme");
    CreateTimer( 1.15, ClientCmd, "gibme;+back");
    CreateTimer( 1.15, ClientCmd, "gibme");
    CreateTimer( 1.15, ClientCmd, "gibme");
    CreateTimer( 1.15, ClientCmd, "gibme");
    CreateTimer( 1.15, ClientCmd, "gibme");
    CreateTimer( 1.15, ClientCmd, "gibme");
    CreateTimer( 1.15, ClientCmd, "gibme");
    CreateTimer( 1.15, ClientCmd, "gibme");
    CreateTimer( 1.4, ClientCmd, "-duck");]]
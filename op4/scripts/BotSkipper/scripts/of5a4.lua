spawns_state = 0;
revive_state = 0;


function SpeedrunStart()
    start_time = SegmentCurrentTime();

	EnableSurvivalMode();
    RemoveAllTimers();
    DrawVisualHints();
    SetTimescale( 0.1 );

    ClientCmd( "sv_cheats 0;setvel 0 0 0;sc_strafe_yaw \"\";sc_strafe_type 0;sc_strafe 0;-jump;pausable 0;-duck;sc_strafe_ignore_ground 1;sc_st_legit_mode_ignore_freeze 1;-sc_ducktap;sc_strafe_vectorial_increment 0" );
    ClientCmd( "sc_st_setangles_stop; sc_st_setangles2_stop; sc_st_follow_point_stop; -jump; -duck; -attack;-attack2; -moveleft; -right; -moveright;-back; -sc_ducktap; sc_aimbot_scripts_filter_targets 1" );
    ClientCmd( "sc_strafe 0; sc_strafe_dir 3; sc_strafe_ignore_ground 1; sc_strafe_vectorial 1; sc_strafe_vectorial_increment 0; sc_strafe_vectorial_snap 0; sc_aimbot 0; sc_st_disable_spread 0; sc_jumpbug_min_fall_velocity 580" );
    ClientCmd( "clockwindow 0; cl_smoothtime 0; mp_respawndelay 0; mp_classic_mode 1; fps_max 200; sc_jumpbug_min_fall_velocity 580; sc_st_legit_mode_ignore_freeze 1; sc_aimbot_change_angles_back 1" );

    -- СТАРТ КАРРТЫ
    CreateTimer( 0.01, ClientCmd, "setang 0 27 0;weapon_sporelauncher;sc_strafe_yaw \"\";setvel 0 0 0;sc_Strafe_type 0;sc_strafe 1;sc_strafe_ignore_ground 0" );
    CreateTimer( 1, DisableSurvivalMode);
    CreateTimer( 1.05, EnableSurvivalMode);
    --CreateTimer( 1.14, ClientCmd, "kill");
    --[[CreateTimer( 0.134, ClientCmd, "+jump");
    CreateTimer( 0.355, ClientCmd, "+duck;-jump");
    CreateTimer( 0.83, ClientCmd, "-duck;+jump;sc_Strafe_yaw -165");
    CreateTimer( 0.93, ClientCmd, "sc_st_setangles 0 -90 60");
    CreateTimer( 1.2, ClientCmd, "sc_strafe_yaw -107");
    CreateTimer( 1.5, DisableSurvivalMode);
    CreateTimer( 1.5, EnableSurvivalMode);
    CreateTimer( 1.7, ClientCmd, "-jump");
    CreateTimer( 1.785, ClientCmd, "setang -89 -90 0;+attack;+duck");
    CreateTimer( 1.79, ClientCmd, "setang 0 -90 0");
    CreateTimer( 1.80, ClientCmd, "-attack;weapon_9mmhandgun");
    CreateTimer( 1.9, ClientCmd, "sc_selfsink2");
    CreateTimer( 2.1, ClientCmd, "-duck");
    CreateTimer( 5.0, ClientCmd, "fps_max 200;sc_strafe_yaw \"\";sc_st_timescale 0.1"); ]]--

end

function DrawVisualHints()
    ClientCmd( "sc_debug_draw_box -1503 -29 -27 -16 -16 -18 16 16 18 255 255 255 90 1 1000000" );

end

function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
    printl( "OnPlayerSpawn()" );

    local sPlayerName = pPlayerEdict.vars.netname;

    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) );

    if ( spawns_state == 0 ) then
        if ( sPlayerName == "QEES" ) then
            pPlayerEdict.vars.origin = Vector( -2802, -336, -27 );
            pPlayerEdict.vars.angles = Vector( 0, 27, 0 );
        elseif ( sPlayerName == "jorik" ) then
            pPlayerEdict.vars.origin = Vector( -2802, -336, -27 );
            pPlayerEdict.vars.angles = Vector( 0, 27, 0 );
        end
    end
end

function PrintTime()
    PrintChatText( string.format( "%.3f (%d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

function OnClientKill( pPlayerEdict )
    printl( "OnClientKill( " .. tostring( pPlayerEdict.vars.netname ) .. " )" );
    if ( revive_state == 0 ) then
        CreateTimer( 0.65, ClientCmd, "fps_max 20");
        revive_state = 1;
    end
end

function OnSpecialSpawn( pPlayerEdict )
    printl( "OnSpecialSpawn()" );
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" has been revived at " .. tostring( pPlayerEdict.vars.origin ) );
    if ( spawns_state == 0 ) then
        pPlayerEdict.vars.origin = Vector(-1531.520752, 17.814432, -180.920044);
        --pPlayerEdict.vars.angles = Vector( 0, 140, 0 );
        CreateTimer( 0.01, ClientCmd, "fps_max 200;weapon_crossbow");
    end    
end
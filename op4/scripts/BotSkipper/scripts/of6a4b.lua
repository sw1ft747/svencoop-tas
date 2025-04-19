spawns_state = 0;
revive_state = 0;


function SpeedrunStart()
    start_time = SegmentCurrentTime();

	EnableSurvivalMode();
    RemoveAllTimers();

    SetTimescale( 0.25 );

    ClientCmd( "sv_cheats 0;setvel 0 0 0;sc_strafe_yaw \"\";sc_strafe_type 0;sc_strafe 0;-jump;pausable 0;-duck;sc_strafe_ignore_ground 1;sc_st_legit_mode_ignore_freeze 1;-sc_ducktap;sc_strafe_vectorial_increment 0" );
    ClientCmd( "sc_st_setangles_stop; sc_st_setangles2_stop; sc_st_follow_point_stop; -jump; -duck; -attack;-attack2; -moveleft; -right; -moveright;-back; -sc_ducktap; sc_aimbot_scripts_filter_targets 1" );
    ClientCmd( "sc_strafe 0; sc_strafe_dir 3; sc_strafe_ignore_ground 1; sc_strafe_vectorial 1; sc_strafe_vectorial_increment 0; sc_strafe_vectorial_snap 0; sc_aimbot 0; sc_st_disable_spread 0; sc_jumpbug_min_fall_velocity 580" );
    ClientCmd( "clockwindow 0; cl_smoothtime 0; mp_respawndelay 0; mp_classic_mode 1; fps_max 200; sc_jumpbug_min_fall_velocity 580; sc_st_legit_mode_ignore_freeze 1; sc_aimbot_change_angles_back 1" );
    
    -- СТАРТ КАРРТЫ
    CreateTimer( 0.01, ClientCmd, "weapon_9mmAR;setvel 0 0 0;sc_Strafe_type 0;sc_strafe 1;sc_strafe_ignore_ground 0;sc_strafe_yaw -40" );
    CreateTimer( 0.3, ClientCmd, "gibme");
    CreateTimer( 0.3, ClientCmd, "gibme");
    CreateTimer( 0.3, ClientCmd, "gibme");
    CreateTimer( 0.3, ClientCmd, "gibme;sc_strafe_yaw 178.5");
    CreateTimer( 0.5, ClientCmd, "gibme;sc_st_timescale 0.1");
    CreateTimer( 0.5, ClientCmd, "gibme");
    CreateTimer( 0.92, ClientCmd, "sc_strafe_type 1");
    CreateTimer( 1.0, ClientCmd, "gibme");
    CreateTimer( 1.0, ClientCmd, "gibme");
    CreateTimer( 1.25, ClientCmd, "sc_strafe_yaw -120");
    CreateTimer( 1.4, ClientCmd, "gibme");
    CreateTimer( 1.4, ClientCmd, "gibme");
    CreateTimer( 1.6, ClientCmd, "sc_strafe_yaw -145");
    CreateTimer( 1.8, ClientCmd, "sc_strafe_yaw -179");
    CreateTimer( 1.9, ClientCmd, "gibme");
    CreateTimer( 1.9, ClientCmd, "gibme");
    CreateTimer( 2.0, ClientCmd, "sc_Strafe_yaw -100");
    CreateTimer( 2.7, ClientCmd, "sc_Strafe_type 2");
    CreateTimer( 2.79, ClientCmd, "sc_Strafe_type 0");
    CreateTimer( 3.0, ClientCmd, "sc_strafe_yaw -160");
    CreateTimer( 3.15, ClientCmd, "sc_Strafe_type 0;sc_strafe 0;+back;+moveright");
    CreateTimer( 3.6, ClientCmd, "-back;-moveright");
    CreateTimer( 4.3, ClientCmd, "sc_strafe_yaw -20;sc_strafe 1");
    CreateTimer( 4.38, ClientCmd, "gibme");
    CreateTimer( 4.38, ClientCmd, "gibme");
    CreateTimer( 4.38, ClientCmd, "gibme");
    CreateTimer( 4.49, ClientCmd, "sc_strafe_yaw -50");
    CreateTimer( 4.8, ClientCmd, "sc_strafe_yaw -110");
    CreateTimer( 4.8, ClientCmd, "gibme");
    CreateTimer( 4.8, ClientCmd, "gibme");
    CreateTimer( 4.8, ClientCmd, "gibme");
    CreateTimer( 4.8, ClientCmd, "gibme");
    CreateTimer( 4.8, ClientCmd, "gibme");
    CreateTimer( 4.8, ClientCmd, "gibme");
    CreateTimer( 4.8, ClientCmd, "gibme");
    CreateTimer( 4.8, ClientCmd, "gibme");
    CreateTimer( 4.8, ClientCmd, "gibme");
    CreateTimer( 4.8, ClientCmd, "gibme");
    CreateTimer( 4.8, ClientCmd, "gibme");
    CreateTimer( 4.8, ClientCmd, "gibme");
    CreateTimer( 5.05, ClientCmd, "sc_strafe_yaw 190;sc_Strafe_type 1");
    CreateTimer( 5.3, ClientCmd, "gibme");
    CreateTimer( 5.3, ClientCmd, "gibme");
    CreateTimer( 5.7, ClientCmd, "sc_strafe_yaw -170");
    CreateTimer( 5.9, ClientCmd, "+duck");
    CreateTimer( 6.0, ClientCmd, "-duck");
    CreateTimer( 6.1, ClientCmd, "sc_st_setangles 0 -90 60");
    CreateTimer( 6.2, ClientCmd, "gibme");
    CreateTimer( 6.2, ClientCmd, "gibme");
    CreateTimer( 6.3, ClientCmd, "gibme");
    CreateTimer( 6.3, ClientCmd, "gibme");
    CreateTimer( 6.3, ClientCmd, "sc_strafe_type 1;sc_strafe_yaw -90;");
    CreateTimer( 6.6, ClientCmd, "gibme");
    CreateTimer( 6.66, ClientCmd, "gibme;+attack2;setang -30 90 0;+duck");
    CreateTimer( 6.67, ClientCmd, "wait;-attack2;wait;setang 0 -90 0;sc_strafe_type 0");
    CreateTimer( 6.68, ClientCmd, "-duck");
    CreateTimer( 7.0, ClientCmd, "sc_strafe_yaw -95");
    CreateTimer( 7.75, ClientCmd, "gibme;+attack2;setang 0 -100 0");
    CreateTimer( 7.76, ClientCmd, "wait;-attack2;wait;setang 0 -90 0");
    CreateTimer( 7.77, ClientCmd, "sc_st_setangles 0 0 60");
    CreateTimer( 7.76, ClientCmd, "sc_Strafe_yaw 0;sc_strafe_type 1");
    CreateTimer( 8.0, ClientCmd, "gibme");
    CreateTimer( 8.1, ClientCmd, "+duck");
    CreateTimer( 8.15, ClientCmd, "-duck");
    CreateTimer( 8.5, ClientCmd, "+duck");
    CreateTimer( 8.6, ClientCmd, "-duck");
    CreateTimer( 8.7, ClientCmd, "sc_strafe_yaw 80;sc_strafe_type 0;sc_st_setangles 0 180 60");
    CreateTimer( 9.0, ClientCmd, "+duck");
    CreateTimer( 9.2, ClientCmd, "-duck");
    CreateTimer( 9.1, ClientCmd, "+attack2;setang -40 166 0");
    CreateTimer( 9.11, ClientCmd, "wait;-attack2;wait;setang 0 180 0");
    CreateTimer( 9.65, ClientCmd, "sc_strafe_yaw -118;sc_st_setangles 0 -118 60");
    CreateTimer( 9.95, ClientCmd, "+sc_ducktap");
    CreateTimer( 10.1, ClientCmd, "-sc_ducktap");
    CreateTimer( 10.1, ClientCmd, "+duck")
    CreateTimer( 10.2, ClientCmd, "+jump");
    CreateTimer( 10.2, ClientCmd, "-duck");
    CreateTimer( 10.21, ClientCmd, "+attack2;setang 22 63 0");
    CreateTimer( 10.22, ClientCmd, "wait;-attack2;wait;setang 0 -118 0");
    CreateTimer( 10.3, ClientCmd, "gibme;-jump");
    CreateTimer( 10.42, ClientCmd, "+sc_ducktap");
    CreateTimer( 10.7, ClientCmd, "sc_selfsink2");
    CreateTimer( 10.8, DisableSurvivalMode);
    CreateTimer( 10.8, EnableSurvivalMode);
end
 --66 --aim 64
function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
    printl( "OnPlayerSpawn()" );

    local sPlayerName = pPlayerEdict.vars.netname;

    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) );

    if ( spawns_state == 0 ) then
        if ( sPlayerName == "BotSkipper" ) then
            pPlayerEdict.vars.origin = Vector( -188, 2890, -539 );
            pPlayerEdict.vars.angles = Vector( 0, 0, 0 );
        elseif ( sPlayerName == "QEES" ) then
            pPlayerEdict.vars.origin = Vector( -188, 2890, -539 );
            pPlayerEdict.vars.angles = Vector( 0, -50, 0 );
        end
    end
end

function OnClientKill( pPlayerEdict )
    printl( "OnClientKill( " .. tostring( pPlayerEdict.vars.netname ) .. " )" );

    if ( pPlayerEdict.vars.netname == "BotSkipper" ) then

        CreateTimer( 0.0, function()
            CreateTimer( 0.65, ClientCmd, "fps_max 20" );
        end );

            for t = 0.8, 0.0, -0.1 do
                CreateTimer( t, ClientCmd, string.format( "say Observer mode in %.1f seconds", 0.8 - t ) );

        end
    end
end


function PrintTime()
    PrintChatText( string.format( "%.3f (%d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

function OnSpecialSpawn( pPlayerEdict )
    printl( "OnSpecialSpawn()" );
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" has been revived at " .. tostring( pPlayerEdict.vars.origin ) );
    if ( revive_state == 0 ) then
        pPlayerEdict.vars.origin = Vector(-2345.023193, -1478.093262, -604.654358);
    end    
end
spawns_state = 0;
revive_state = 0;


function SpeedrunStart()
    start_time = SegmentCurrentTime();

	EnableSurvivalMode();
    RemoveAllTimers();

    SetTimescale( 0.1 );

    ClientCmd( "sv_cheats 0;setvel 0 0 0;sc_strafe_yaw \"\";sc_strafe_type 0;sc_strafe 0;-jump;pausable 0;-duck;sc_strafe_ignore_ground 1;sc_st_legit_mode_ignore_freeze 1;-sc_ducktap;sc_strafe_vectorial_increment 0" );
    ClientCmd( "sc_st_setangles_stop; sc_st_setangles2_stop; sc_st_follow_point_stop; -jump; -duck; -attack;-attack2; -moveleft; -right; -moveright;-back; -sc_ducktap; sc_aimbot_scripts_filter_targets 1" );
    ClientCmd( "sc_strafe 1; sc_strafe_dir 3; sc_strafe_ignore_ground 1; sc_strafe_vectorial 1; sc_strafe_vectorial_increment 0; sc_strafe_vectorial_snap 0; sc_aimbot 0; sc_st_disable_spread 0; sc_jumpbug_min_fall_velocity 580" );
    ClientCmd( "clockwindow 0; cl_smoothtime 0; mp_respawndelay 0; mp_classic_mode 1; fps_max 200; sc_jumpbug_min_fall_velocity 580; sc_st_legit_mode_ignore_freeze 1; sc_aimbot_change_angles_back 1" );
    
    -- СТАРТ КАРРТЫ
    CreateTimer( 0.01, ClientCmd, "weapon_crossbow;setvel 0 0 0;sc_Strafe_type 0;sc_strafe 1;sc_strafe_ignore_ground 0;sc_im_play of4a1" );




end

function OnFireTargets( targetname, activator, caller, usetype, value, delay )
    if ( targetname == "cavegrating2" ) then
        ClientCmd("sc_script PrintTime()");
        revive_state = 1
    end
end

function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
    printl( "OnPlayerSpawn()" );

    local sPlayerName = pPlayerEdict.vars.netname;

    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) );

    if ( spawns_state == 0 ) then
        if ( sPlayerName == "kolokola777" ) then
            pPlayerEdict.vars.origin = Vector( -589, 2217, 61 );
            pPlayerEdict.vars.angles = Vector( 0, 0, 0 );
        elseif ( sPlayerName == "QEES" ) then
            pPlayerEdict.vars.origin = Vector( -591, 2144, 61 );
            pPlayerEdict.vars.angles = Vector( 0, 10, 0 );
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
        pPlayerEdict.vars.origin = Vector(-2866.598877, 917.745544, 459.455566);
    end    
end
connected = false;
spawned = false;
start_time = 0.0;

function SpeedrunInit()
    SetTimescale( 0.25 );

    RemoveAllTimers();

    ClientCmd("-sc_ducktap; -jump; -duck; -forward; -back; -moveleft; -moveright; sc_strafe 0; sc_strafe_yaw -30; sc_strafe_ignore_ground 1");
    ClientCmd("sc_strafe_type 0; sc_strafe_dir 3; sc_st_setangles_stop; sc_ducktap_adjust_fps 10000; sc_autojump_inconsistent 0; sc_strafe_vectorial_increment 0.5; fps_max 500; mp_classic_mode 1; clockwindow 0");
end

function SpeedrunStart()
    SpeedrunStartCustom();
    -- connected = true;
end

function SpeedrunStartCustom()
    start_time = SegmentCurrentTime();

    -- InputManager.Record( "c10" );

    CreateTimer( 0.1, EnableSurvivalMode );
    CreateTimer( 0.15, DisableSurvivalMode );

    ClientCmd("sc_strafe 1; sc_strafe_yaw -30; sc_st_setangles 0 -120 25");
    CreateTimer(0.01, ClientCmd,"weapon_357");
    CreateTimer(0.100, ClientCmd,"sc_st_setangles_stop");
    CreateTimer(0.100, ClientCmd,"sc_strafe_ignore_ground 0");
    CreateTimer(0.600, ClientCmd,"+jump; sc_st_setangles 89 0 60");
    CreateTimer(0.640, ClientCmd,"-jump");
    CreateTimer(0.870, ClientCmd,"+moveright; +back");
    CreateTimer(0.870, ClientCmd,"sc_strafe_yaw -77");
    CreateTimer(1.700, ClientCmd,"+duck; -moveright; -back; sc_st_setangles 20 -90 120");
    CreateTimer(1.790, ClientCmd,"-duck");
    CreateTimer(2.150, ClientCmd,"+sc_ducktap");
    CreateTimer(2.156, ClientCmd,"sc_strafe_yaw -90; sc_st_setangles_stop");
    CreateTimer(2.410, ClientCmd,"sc_strafe_yaw 148; sc_strafe_vectorial_increment 1");
    CreateTimer(2.85, ClientCmd,"sc_strafe_yaw -90; sc_strafe_type 3; sc_strafe_dir 0");
    CreateTimer(3.0, ClientCmd,"sc_strafe_yaw -90; sc_strafe_type 0; sc_strafe_dir 3");
    CreateTimer(3.45, ClientCmd,"sc_strafe_yaw 0; sc_strafe_type 1; sc_strafe_dir 0");
    CreateTimer(3.65, ClientCmd,"sc_strafe_type 0; sc_strafe_dir 3");
   
    -- CreateTimer(2.878, ClientCmd,"sc_strafe_yaw -115");
    -- CreateTimer(2.898, ClientCmd,"sc_strafe_yaw -90");
    -- CreateTimer(3.150, ClientCmd,"sc_st_setangles 0 0 100");
    -- CreateTimer(3.440, ClientCmd,"sc_strafe_yaw 47");
    -- CreateTimer(3.550, ClientCmd,"sc_strafe_type 1");
    -- CreateTimer(3.650, ClientCmd,"sc_strafe_yaw 0; sc_strafe_type 0");

    -- ClientCmd( "sc_strafe 1; sc_strafe_yaw -30; sc_strafe_type 0; sc_strafe_dir 3; sc_strafe_ignore_ground 0; sc_strafe_vectorial_increment 0.5" );
    -- CreateTimer( 0.4, ClientCmd, "+jump; sc_strafe_ignore_ground 1" );
    -- CreateTimer( 0.84, ClientCmd, "-jump; setang 89 0; +back; +moveright" );
    -- CreateTimer( 1.7, ClientCmd, "setang 20 -80; -back; -moveright; +duck; sc_strafe 1; sc_strafe_yaw -80; sc_strafe_ignore_ground 0" );
    -- CreateTimer( 1.77, ClientCmd, "-duck" );
end

-- function OnGameFrame(state, frametime, postruncmd)
--     if ( not postruncmd ) then return end;

--     if ( connected and not spawned ) then
--         if ( ( PlayerMove.flags & FL_ONGROUND ) == FL_ONGROUND ) then
--             SpeedrunStartCustom();
--             spawned = true;
--         end
--     end
-- end

function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
    printl( "OnPlayerSpawn()" );
    
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) .. ", viewangles: " .. tostring(pPlayerEdict.vars.angles) .. "" );

    local sPlayerName = pPlayerEdict.vars.netname;

    if ( sPlayerName == "Sw1ft" ) then
        pPlayerEdict.vars.origin = Vector( 3464.000000, 1813.000000, -511.000000 );
        pPlayerEdict.vars.angles = Vector( 0.000000, 300.000000, 0.000000 );
    end
end

function PrintTime()
    PrintChatText( string.format( "%.3f (IM frames: %d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

SpeedrunInit();
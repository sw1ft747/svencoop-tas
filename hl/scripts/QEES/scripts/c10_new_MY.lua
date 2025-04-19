connected = false;
spawned = false;
start_time = 0.0;

function SpeedrunInit()
    SetTimescale( 0.25 );

    RemoveAllTimers();

    ClientCmd(" sc_st_disable_spread 1; default_fov 120; -sc_ducktap; -jump; -duck; -forward; -back; -moveleft; -moveright; sc_strafe 0; sc_strafe_yaw \"\"; sc_strafe_ignore_ground 1; -attack; sc_im_stop");
    ClientCmd("sc_strafe_type 0; sc_strafe_dir 3; sc_st_setangles_stop; sc_ducktap_adjust_fps 10000; sc_autojump_inconsistent 0; sc_strafe_vectorial_increment 0.5; fps_max 500; mp_classic_mode 1; clockwindow 0");
    ClientCmd("fps_max 20");
    CreateTimer(0.2, ClientCmd,"fps_max 500");
end

function SpeedrunStart()
    SpeedrunStartCustom();
    -- connected = true;
end

function SpeedrunStartCustom()
    start_time = SegmentCurrentTime();

    --InputManager.Record( "c10_new" );
    InputManager.Playback( "c10_new" );

    CreateTimer( 0.15, EnableSurvivalMode );
    CreateTimer( 0.1, DisableSurvivalMode );

    CreateTimer( 4.768, EnableSurvivalMode );
    CreateTimer( 4.768, DisableSurvivalMode );

    CreateTimer(7.790, ClientCmd,"fps_max 1000");
    CreateTimer(7.880, ClientCmd,"fps_max 500");
    CreateTimer(11.800, ClientCmd,"fps_max 200");
    CreateTimer(10.0, ClientCmd,"sc_strafe_vectorial_increment 0; sc_st_disable_spread 0");
    --ClientCmd("sc_strafe 1; sc_strafe_yaw -30; sc_st_setangles 0 -120 25");
    --[[CreateTimer(0.01, ClientCmd,"weapon_357");
    CreateTimer(0.100, ClientCmd,"sc_st_setangles_stop");
    CreateTimer(0.100, ClientCmd,"sc_strafe_ignore_ground 0");
    CreateTimer(0.600, ClientCmd,"+jump; sc_st_setangles 89 0 60; sc_strafe_vectorial_increment 0");
    CreateTimer(0.640, ClientCmd,"-jump");
    CreateTimer(0.870, ClientCmd,"+moveright; +back");
    CreateTimer(0.870, ClientCmd,"sc_strafe_yaw -77");
    CreateTimer(1.700, ClientCmd,"+duck; -moveright; -back; sc_st_setangles 0 -90 120");
    CreateTimer(1.790, ClientCmd,"-duck");
    CreateTimer(2.150, ClientCmd,"+sc_ducktap");
    CreateTimer(2.156, ClientCmd,"sc_strafe_yaw -90");
    CreateTimer(2.408, ClientCmd,"sc_strafe_yaw 148; sc_st_setangles 0 159 120");
    CreateTimer(2.803, ClientCmd,"sc_strafe_yaw 179; sc_st_setangles 0 -90 120");
    CreateTimer(2.900, ClientCmd,"sc_strafe_yaw -72");
    CreateTimer(2.952, ClientCmd,"-sc_ducktap; +jump");
    CreateTimer(2.968, ClientCmd,"+sc_ducktap; -jump; sc_strafe_yaw -90");
    CreateTimer(3.350, ClientCmd,"sc_strafe_yaw 34; sc_st_setangles 0 0 120")
    CreateTimer(3.700, ClientCmd,"sc_strafe_yaw 0");
    CreateTimer(3.840, ClientCmd,"-sc_ducktap; +jump; sc_st_setangles -90 -90 120; weapon_crowbar");
    CreateTimer(3.840, ClientCmd,"weapon_crowbar");
    CreateTimer(4.000, ClientCmd,"-jump");
    CreateTimer(4.080, ClientCmd,"+moveleft; +forward");
    CreateTimer(4.348, ClientCmd,"+attack");
    CreateTimer(4.378, ClientCmd,"-attack");
    CreateTimer(4.360, ClientCmd,"weapon_357");
    CreateTimer(4.768, ClientCmd,"sc_st_setangles_stop; setang 89 210; -forward; +back; sc_strafe_yaw -94");
    CreateTimer(4.768, ClientCmd,"sc_strafe_yaw -94; -back; +duck");
    CreateTimer(4.790, ClientCmd,"sc_st_setangles 0 -179 90");
    CreateTimer(4.972, ClientCmd,"-duck; sc_strafe_yaw -179; -moveleft");
    CreateTimer(5.084, ClientCmd,"+jump; sc_strafe_yaw -144; sc_autojump_inconsistent 1");
    CreateTimer(5.840, ClientCmd,"sc_autojump_inconsistent 0");
    CreateTimer(5.870, ClientCmd,"sc_strafe_yaw -90; sc_st_setangles 0 -90 90");
    CreateTimer(6.010, ClientCmd,"+duck; -jump; +sc_ducktap");
    CreateTimer(6.028, ClientCmd,"-duck");
    CreateTimer(6.096, ClientCmd,"sc_strafe_yaw -46");
    CreateTimer(6.424, ClientCmd,"sc_strafe_yaw -90; +sc_ducktap");
    CreateTimer(6.788, ClientCmd,"sc_strafe_yaw 176; sc_st_setangles 0 176 90");
    CreateTimer(7.300, ClientCmd,"sc_st_setangles 1.162592 -100.02065 90");
    CreateTimer(7.700, ClientCmd,"sc_st_timescale 0.01");
    CreateTimer(7.700, ClientCmd,"default_fov 1");
    CreateTimer(7.790, ClientCmd,"+duck; fps_max 1000");
    CreateTimer(7.790, ClientCmd,"fps_max 1000");
    CreateTimer(7.804, ClientCmd,"+attack");
    CreateTimer(7.900, ClientCmd,"sc_st_setangles 0 -71 90; default_fov 120");
    CreateTimer(7.880, ClientCmd,"-attack; -sc_ducktap; -duck; fps_max 500");
    CreateTimer(7.880, ClientCmd,"fps_max 500");
    CreateTimer(8.550, ClientCmd,"sc_strafe_yaw -71");
    CreateTimer(8.910, ClientCmd,"+jump");
    CreateTimer(9.160, ClientCmd,"sc_strafe_yaw -60");
    CreateTimer(9.560, ClientCmd,"sc_strafe_yaw -90; sc_st_setangles 0 -90 90");
    CreateTimer(10.150, ClientCmd,"sc_strafe_yaw 179; sc_st_setangles 0 179 100");
    CreateTimer(10.900, ClientCmd,"sc_strafe_yaw 90; sc_st_setangles 0 90 100");
    CreateTimer(11.100, ClientCmd,"sc_strafe_yaw 65");
    CreateTimer(11.800, ClientCmd,"sc_strafe_yaw 90");
    CreateTimer(11.800, ClientCmd,"fps_max 200");
    CreateTimer(11.940, ClientCmd,"sc_strafe_yaw -179; sc_st_setangles 0 179 100");
    CreateTimer(12.400, ClientCmd,"sc_strafe_yaw -90");
    CreateTimer(12.680, ClientCmd,"sc_strafe_yaw -179");
    CreateTimer(12.680, ClientCmd,"+jump; sc_strafe 1; sc_strafe_yaw 179 sc_strafe_vectorial_increment 0");
    CreateTimer(12.920, ClientCmd,"sc_strafe_yaw 165");
    --CreateTimer(13.380, ClientCmd,"sc_strafe_yaw -179");
    CreateTimer(13.344, ClientCmd,"sc_strafe_yaw -80; sc_st_setangles 0 -90 70");
    CreateTimer(14.060, ClientCmd,"sc_strafe_dir 1; sc_strafe_type 3; sc_strafe_yaw 179; sc_st_setangles 0 179 50");
    CreateTimer(14.714, ClientCmd,"+duck");
    CreateTimer(14.820, ClientCmd,"sc_strafe_dir 3; sc_strafe_type 0");
    CreateTimer(14.784, ClientCmd,"-duck");
    CreateTimer(14.869, ClientCmd,"+duck");
    CreateTimer(14.910, ClientCmd,"-duck");
    CreateTimer(15.079, ClientCmd,"+duck");
    CreateTimer(15.129, ClientCmd,"-duck");
    CreateTimer(15.169, ClientCmd,"sc_strafe_dir 0; sc_strafe_type 1; sc_strafe_yaw -70; sc_st_setangles 0 -90 70");
    CreateTimer(15.289, ClientCmd,"+back");
    CreateTimer(15.310, ClientCmd,"-back");
    CreateTimer(15.854, ClientCmd,"sc_strafe_dir 3; sc_strafe_type 1; sc_strafe_yaw 159; sc_st_setangles 0 179 50; sc_st_disable_spread 1");
    CreateTimer(16.004, ClientCmd,"sc_st_setangles -6.044801 132.776337 70");
    --CreateTimer(16.004, ClientCmd,"sc_st_timescale 0.05");
    --CreateTimer(16.004, ClientCmd,"default_fov 25");]]
    CreateTimer(15.854, ClientCmd,"sc_st_disable_spread 1");
    CreateTimer(16.340, ClientCmd,"fps_max 1000");
    --CreateTimer(16.397, ClientCmd,"+attack");
    CreateTimer(16.400, ClientCmd,"weapon_9mmhandgun; fps_max 200");
    CreateTimer(16.420, ClientCmd,"-attack; sc_st_disable_spread 0");
    --CreateTimer(16.619, ClientCmd,"sc_strafe_yaw -75; sc_st_setangles 0 -90 50");
    --CreateTimer(17.180, ClientCmd,"+duck; -jump");
    CreateTimer(17.313, ClientCmd,"kill; -duck");
    CreateTimer(17.313, ClientCmd,"fps_max 20");
    CreateTimer(18.320, ClientCmd,"fps_max 200");
    CreateTimer(18.400, ClientCmd,"sc_strafe_yaw \"\"");


end

function OnSpecialSpawn(pPlayerEdict)
    if ( pPlayerEdict.vars.netname == "QEES51" ) then
        ClientCmd( "weapon_crowbar" );
    end
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

    if ( sPlayerName == "QEES51" ) then
        pPlayerEdict.vars.origin = Vector( 3464.000000, 1813.000000, -511.000000 );
        pPlayerEdict.vars.angles = Vector( 0.000000, 300.000000, 0.000000 );
    elseif ( sPlayerName == "Sw1ft" ) then
        pPlayerEdict.vars.origin = Vector( 3776, 1200, 53 );
        pPlayerEdict.vars.angles = Vector( 0.000000, 270.000000, 0.000000 );
    end
    elseif ( sPlayerName == "BotSkipper" ) then
        pPlayerEdict.vars.origin = Vector( 3648, 1200, 53 );
        pPlayerEdict.vars.angles = Vector( 0.000000, 270.000000, 0.000000 );
    end
end

function PrintTime()
    PrintChatText( string.format( "%.3f (IM frames: %d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

SpeedrunInit();
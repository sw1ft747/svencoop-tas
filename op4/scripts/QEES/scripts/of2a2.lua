connected = false;
spawned = false;
start_time = 0.0;
spawns_state = 0
OnSpecialSpawn = true;

--BOT BANE HAS "ialex"

function SpeedrunInit()
    SetTimescale( 0.25 );

    RemoveAllTimers();

    ClientCmd(" sc_st_disable_spread 1; default_fov 100; -sc_ducktap; -jump; -duck; -forward; -back; -moveleft; -moveright; sc_strafe 0; sc_strafe_yaw \"\"; sc_strafe_ignore_ground 1; -attack; sc_im_stop");
    ClientCmd("sc_strafe_type 0; sc_strafe_dir 3; sc_st_setangles_stop; sc_ducktap_adjust_fps 0; sc_autojump_inconsistent 0; sc_strafe_vectorial_increment 0; fps_max 200; mp_classic_mode 1; clockwindow 0");
    
end

function SpeedrunStart()
    SpeedrunStartCustom();
    -- connected = true;
end

function SpeedrunStartCustom()
    start_time = SegmentCurrentTime();

    --CreateTimer(0.000, ClientCmd,"sc_im_record of2a2vv");
    --CreateTimer(0.000, ClientCmd,"sc_im_play of2a2vv");
    --CreateTimer(0.000, ClientCmd,"sv_cheats 1");

    CreateTrigger("1", Vector(-1204.219, 850.125, 761.469), Vector(0, 0, -118.000), Vector(100.156, 105.312, 0));
    CreateTrigger("2", Vector(-1703.500, 902.812, 643.344), Vector(0, 0, 0), Vector(28.062, 47.531, 152.938));
    CreateTrigger("5", Vector(-2036.656, 1088.844, 677.875), Vector(0, 0, 0), Vector(84.688, 68.781, 95.125));
    CreateTrigger("3", Vector(-2157.531, 1412.844, 647.656), Vector(0, 0, 0), Vector(89.594, 80.875, 101.281));
    CreateTrigger("4", Vector(-3477.500, -2587.438, 390.906), Vector(0, 0, 0), Vector(97.281, 27.125, 103.531));


    CreateTimer( 4.00, DisableSurvivalMode );
    CreateTimer( 4.05, EnableSurvivalMode );

    CreateTimer(0.000, ClientCmd,"sc_strafe 1");


    CreateTimer(7.300, ClientCmd,".tas_bm_spawnbot");
    --CreateTimer(0.300, ClientCmd,".tas_bm_startbot");
    
    --[[CreateTimer(0.000, ClientCmd,"setang 0 179 0");
    --CreateTimer(0.300, ClientCmd,"sc_st_timescale 0.1");
    CreateTimer(0.100, ClientCmd,"kill");
    CreateTimer(0.400, ClientCmd,"reviveme");]]

    CreateTimer(0.000, ClientCmd,"weapon_shotgun");
    CreateTimer(0.000, ClientCmd,"sc_strafe 1");
    CreateTimer(0.000, ClientCmd,"sc_strafe_ignore_ground 0");
    CreateTimer(0.0, ClientCmd,"sc_strafe_yaw 40");
    CreateTimer(0.200, ClientCmd,"gibme");
    CreateTimer(0.200, ClientCmd,"gibme");
    CreateTimer(0.200, ClientCmd,"gibme");
    CreateTimer(0.200, ClientCmd,"gibme");
    CreateTimer(0.200, ClientCmd,"gibme");
    CreateTimer(0.200, ClientCmd,"gibme");
    CreateTimer(0.200, ClientCmd,"gibme");
    CreateTimer(0.200, ClientCmd,"sc_strafe_yaw -51");
    CreateTimer(0.550, ClientCmd,"+sc_ducktap");
    CreateTimer(0.819, ClientCmd,"sc_strafe_yaw 0");
    CreateTimer(1.405, ClientCmd,"sc_strafe_yaw 110");
    CreateTimer(1.400, ClientCmd,"+reload");
    CreateTimer(1.450, ClientCmd,"-reload");
    CreateTimer(1.150, ClientCmd,"sc_st_setangles 0 90 100");
    CreateTimer(1.050, ClientCmd,"sc_strafe_type 1");
    CreateTimer(1.550, ClientCmd,"-sc_ducktap; +jump");
    CreateTimer(2.400, ClientCmd,"sc_strafe_yaw 35; -jump; +sc_ducktap");
    CreateTimer(3.000, ClientCmd,"-sc_ducktap; +jump");
    CreateTimer(3.105, ClientCmd,"sc_strafe_yaw 145");
    CreateTimer(3.105, ClientCmd,"sc_st_setangles 36 146 100");
    CreateTimer(4.035, ClientCmd,"sc_strafe_yaw 0");
    CreateTimer(4.040, ClientCmd,"+use");
    CreateTimer(4.060, ClientCmd,"-use");
    CreateTimer(4.040, ClientCmd,"sc_st_setangles 0 179 100");
    CreateTimer(4.180, ClientCmd,"sc_strafe_yaw -90");
    CreateTimer(4.440, ClientCmd,"+sc_ducktap; -jump");
    CreateTimer(4.480, ClientCmd,"sc_strafe_yaw 179");
    CreateTimer(5.005, ClientCmd,"sc_strafe_yaw 65");
    CreateTimer(5.770, ClientCmd,"sc_strafe_yaw 179");
    CreateTimer(5.770, ClientCmd,"sc_st_setangles 26 90 100");
    CreateTimer(6.070, ClientCmd,"+duck; +jump");
    CreateTimer(6.000, ClientCmd,"sc_strafe_type 0");
    CreateTimer(6.200, ClientCmd,"-duck; -sc_ducktap");
    CreateTimer(6.150, ClientCmd,"sc_strafe_yaw 143");
    CreateTimer(6.315, ClientCmd,"gibme");
    CreateTimer(6.550, ClientCmd,"sc_strafe_yaw 90");
    CreateTimer(6.870, ClientCmd,"sc_strafe_yaw 0");
    CreateTimer(7.150, ClientCmd,"gibme");
    CreateTimer(7.460, ClientCmd,"sc_strafe_yaw 90");
    CreateTimer(7.730, ClientCmd,"gibme");
    CreateTimer(7.680, ClientCmd,"+attack2");
    CreateTimer(7.680, ClientCmd,"sc_st_setangles 0 179 100");
    CreateTimer(7.780, ClientCmd,"-attack2");
    CreateTimer(7.760, ClientCmd,"sc_strafe_yaw 179");
    CreateTimer(7.680, ClientCmd,"sc_st_setangles 0 179 100");
    CreateTimer(8.260, ClientCmd,"gibme");
    CreateTimer(8.260, ClientCmd,"gibme");
    CreateTimer(8.260, ClientCmd,"gibme");
    CreateTimer(8.260, ClientCmd,"gibme");
    CreateTimer(8.605, ClientCmd,"sc_strafe_yaw 5");
    CreateTimer(8.210, ClientCmd,"sc_st_setangles 0 0 100");
    CreateTimer(9.028, ClientCmd,"sc_strafe_yaw -22");
    CreateTimer(9.190, ClientCmd,"+duck");
    CreateTimer(9.340, ClientCmd,"-duck");
    CreateTimer(9.320, ClientCmd,"gibme");
    CreateTimer(9.320, ClientCmd,"gibme");
    CreateTimer(9.320, ClientCmd,"gibme");
    CreateTimer(9.320, ClientCmd,"gibme");
    CreateTimer(9.320, ClientCmd,"gibme");
    CreateTimer(9.320, ClientCmd,"gibme");
    CreateTimer(9.320, ClientCmd,"gibme");
    CreateTimer(9.348, ClientCmd,"gibme");
    CreateTimer(9.348, ClientCmd,"gibme");
    CreateTimer(9.348, ClientCmd,"gibme");
    CreateTimer(9.280, ClientCmd,"sc_strafe_yaw 70");
    CreateTimer(9.280, ClientCmd,"setang 0.262241 90.236206 0.000000");
    CreateTimer(9.645, ClientCmd,"sc_strafe_yaw 92");
    CreateTimer(9.210, ClientCmd,"sc_st_setangles 0 -152 120");
    CreateTimer(9.954, ClientCmd,"sc_strafe_yaw 90");
    CreateTimer(10.074, ClientCmd,"sc_strafe_yaw 179");
    CreateTimer(10.101, ClientCmd,"setang 0.524480 -162.191162 0.000000; +attack2; +duck");
    CreateTimer(10.124, ClientCmd,"-attack2; sc_st_setangles_stop");
    CreateTimer(10.390, ClientCmd,"gibme");
    CreateTimer(10.400, ClientCmd,"say freeze");
    CreateTimer(10.655, ClientCmd,"kill");
    CreateTimer(10.655, ClientCmd,"fps_max 20");
    CreateTimer(10.685, ClientCmd,"-duck");
    CreateTimer(11.000, ClientCmd,"sc_strafe_yaw \"\"");
    CreateTimer(11.355, ClientCmd,"+back");
    CreateTimer(11.650, ClientCmd,"-back");
    CreateTimer(11.550, ClientCmd,"fps_max 200");
    CreateTimer(11.550, ClientCmd,"-jump");
    CreateTimer(11.675, ClientCmd,"setang 0 179 0");
    CreateTimer(11.600, ClientCmd,"sc_strafe_ignore_ground 1");
    CreateTimer(11.675, ClientCmd,"sc_strafe 0");
    --CreateTimer(12.675, ClientCmd,"reviveme");]]

end


function OnTouchTrigger( name )
    if ( name == "1" ) then
        spawns_state = 1;
        CreateTimer( 0.080, DisableSurvivalMode );
        CreateTimer( 0.150, EnableSurvivalMode );
        CreateTimer(0.080, ClientCmd,".tas_bm_startbot");
        CreateTimer(0.190, ClientCmd,".tas_bm_suicide");
        CreateTimer(1.190, ClientCmd,".tas_bm_setbuttons 2");
    elseif (name == "2") then
        OnSpecialSpawn = false;
        --spawns_state = 2;
        --CreateTimer(0.000, ClientCmd,"sc_im_record of2a2V2");
        --CreateTimer(0.000, ClientCmd,"sc_im_play of2a2V2");
        CreateTimer(0.000, ClientCmd,"weapon_crowbar");
        --CreateTimer(0.000, ClientCmd,"-1670.093750, 920.437500, 731.718750; setang 0 179 0");
        --CreateTimer(3.200, ClientCmd,"kill; sc_st_setangles_stop");
        CreateTimer( 0.000, DisableSurvivalMode );
        CreateTimer( 0.000, EnableSurvivalMode );
        CreateTimer(0.010, ClientCmd,".tas_bm_startbot");
        CreateTimer(0.120, ClientCmd,".tas_bm_suicide");
        CreateTimer(1.120, ClientCmd,".tas_bm_setbuttons 2");
        CreateTimer(0.105, ClientCmd,"sc_strafe 1");
        CreateTimer(0.100, ClientCmd,"sc_strafe_yaw -130");
        CreateTimer(0.100, ClientCmd,"sc_strafe_ignore_ground 0");
        CreateTimer(0.500, ClientCmd,"sc_strafe_yaw 120");
        CreateTimer(0.305, ClientCmd,"+sc_ducktap");
        CreateTimer(0.100, ClientCmd,"sc_st_setangles 38 90 120");
        CreateTimer(0.760, ClientCmd,"sc_strafe_yaw 90");
        CreateTimer(0.775, ClientCmd,"+jump");
        CreateTimer(0.775, ClientCmd,"-sc_ducktap");
        CreateTimer(0.775, ClientCmd,"+duck");
        CreateTimer(0.875, ClientCmd,"-jump");
        CreateTimer(0.690, ClientCmd,"+alt1");
        CreateTimer(0.960, ClientCmd,"+back");
        CreateTimer(0.960, ClientCmd,"-duck");
        CreateTimer(0.960, ClientCmd,"sc_st_setangles 0 90 120");
        CreateTimer(1.060, ClientCmd,"sc_strafe_yaw -90");
        CreateTimer(1.060, ClientCmd,"-back");
        CreateTimer(1.315, ClientCmd,"+forward");
        CreateTimer(1.475, ClientCmd,"-forward");
        CreateTimer(1.475, ClientCmd,"sc_strafe_yaw 85");
        CreateTimer(1.675, ClientCmd,"sc_st_setangles 0 -179 120");
        CreateTimer(1.850, ClientCmd,"+jump");
        CreateTimer(1.890, ClientCmd,"-alt1");
        CreateTimer(1.875, ClientCmd,"sc_strafe_yaw 169");
        CreateTimer(2.150, ClientCmd,"+duck");
        CreateTimer(2.178, ClientCmd,"sc_st_setangles 24.978394 -115.773926 80");
        CreateTimer(2.370, ClientCmd,"+use");
        CreateTimer(2.380, ClientCmd,"sc_st_setangles 0 90 80");
        CreateTimer(2.460, ClientCmd,"-use");
        CreateTimer(2.400, ClientCmd,"sc_strafe_yaw 105");
        CreateTimer(2.580, ClientCmd,"-duck");
        CreateTimer(2.580, ClientCmd,"-jump");
        CreateTimer(2.935, ClientCmd,"+duck");
        CreateTimer(2.850, ClientCmd,"say freeze");
        CreateTimer(3.048, ClientCmd,"kill");
        CreateTimer(3.576, ClientCmd,"fps_max 20");
        CreateTimer(3.686, ClientCmd,"+back");
        CreateTimer(4.006, ClientCmd,"fps_max 200");
        CreateTimer(4.056, ClientCmd,"-back");
        CreateTimer(4.056, ClientCmd,"-duck");
        CreateTimer(4.056, ClientCmd,"sc_strafe_yaw \"\"");

    elseif (name == "3") then
        CreateTimer(0.000, ClientCmd,".tas_bm_startbot");
        CreateTimer(0.110, ClientCmd,".tas_bm_suicide");
        CreateTimer(1.110, ClientCmd,".tas_bm_setbuttons 2");
    elseif (name == "4") then
        CreateTimer(0.000, ClientCmd,".tas_bm_startbot");
        CreateTimer(0.000, ClientCmd,".tas_bm_suicide");
    elseif (name == "5") then
        OnSpecialSpawn = true;
    end

    return true;
end

function OnFireCrossbowSpread(entity, entindex)
    return true, 1.0, true, 1.0;
end

function OnSpecialSpawn( pPlayerEdict )
    printl( "OnSpecialSpawn()" );
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" has been revived at " .. tostring( pPlayerEdict.vars.origin ) );

    if ( pPlayerEdict.vars.netname == "QEES" ) then
        pPlayerEdict.vars.origin = Vector( -1670.093750, 920.437500, 731.718750 );
    elseif ( pPlayerEdict.vars.netname == "BotSkipper" ) then
        pPlayerEdict.vars.origin = Vector( -3330.125000, 1884.000000, 676.031250 );
    end
end

function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
    printl( "OnPlayerSpawn()" );

    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) .. ", viewangles: " .. tostring(pPlayerEdict.vars.angles) .. "" );

    local sPlayerName = pPlayerEdict.vars.netname;

    if ( spawns_state == 0 ) then
        if ( sPlayerName == "ialex" ) then
            pPlayerEdict.vars.origin = Vector( -3376, -2768, 432 );
            pPlayerEdict.vars.angles = Vector( 0.000000, 0.000000, 0.000000 );
        elseif ( sPlayerName == "QEES" ) then
            pPlayerEdict.vars.origin = Vector( 122, 736, -280 ); 
            pPlayerEdict.vars.angles = Vector( 0.000000, 0.000000, 0.000000 );
        elseif ( sPlayerName == "BotSkipper" ) then
            pPlayerEdict.vars.origin = Vector( -3456, -2832, 432 ); 
            pPlayerEdict.vars.angles = Vector( 0.000000, 0.000000, 0.000000 );
        elseif ( sPlayerName == "kolokola777" ) then
            pPlayerEdict.vars.origin = Vector( -3456, -2912, 432 );
            pPlayerEdict.vars.angles = Vector( 0.000000, -90.000000, 0.000000 );
        end
    elseif ( spawns_state == 1 ) then -- спавн после
        if ( sPlayerName == "kolokola777" ) then    
            pPlayerEdict.vars.origin = Vector( -3376, -2768, 432 );
            pPlayerEdict.vars.angles = Vector( 0.000000, 90.000000, 0.000000 );
        elseif ( sPlayerName == "BotSkipper" ) then
            pPlayerEdict.vars.origin = Vector( -1141, 336, 696 ); 
            pPlayerEdict.vars.angles = Vector( 0.000000, 90.000000, 0.000000 );
        elseif ( sPlayerName == "ialex" ) then
            pPlayerEdict.vars.origin = Vector( -1212, 337, 696 ); 
            pPlayerEdict.vars.angles = Vector( 0.000000, 90.000000, 0.000000 );
        elseif ( sPlayerName == "QEES" ) then
            pPlayerEdict.vars.origin = Vector( -3376, -2512, 432 ); 
            pPlayerEdict.vars.angles = Vector( 0.000000, -90.000000, 0.000000 );
        end
    end
end



function PrintTime()
    PrintChatText( string.format( "%.3f (IM frames: %d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

SpeedrunInit();
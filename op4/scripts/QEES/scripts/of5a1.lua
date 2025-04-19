connected = false;
spawned = false;
start_time = 0.0;
spawns_state = 0

function SpeedrunInit()
    SetTimescale( 0.5 );

    RemoveAllTimers();

    ClientCmd(" sc_st_disable_spread 1; -attack; -attack2; default_fov 100; -sc_ducktap; -jump; -duck; -forward; -back; -moveleft; -moveright; sc_strafe 0; sc_strafe_yaw \"\"; sc_strafe_ignore_ground 1; -attack; sc_im_stop");
    ClientCmd("sc_strafe_type 0; sc_strafe_dir 3; sc_st_setangles_stop; sc_ducktap_adjust_fps 0; sc_jumpbug_legit 0; sc_autojump_inconsistent 0; sc_strafe_vectorial_increment 0; fps_max 200; mp_classic_mode 1; clockwindow 0");
    
end

function SpeedrunStart()
    SpeedrunStartCustom();
    -- connected = true;
end

function SpeedrunStartCustom()
    start_time = SegmentCurrentTime();

    --CreateTimer(0.000, ClientCmd,"sc_im_record of5a1");
    --CreateTimer(0.000, ClientCmd,"sc_im_play of5a1");
    
    --CreateTimer(0.040, EnableSurvivalMode );
    --CreateTimer(0.020, DisableSurvivalMode );

    
    CreateTimer(0.000, ClientCmd,"weapon_9mmAR");
    CreateTimer(0.000, ClientCmd,"sc_strafe 1");
    CreateTimer(0.000, ClientCmd,"sc_strafe_ignore_ground 0");
    CreateTimer(0.000, ClientCmd,"sc_st_setangles 0 90 70");
    CreateTimer(0.000, ClientCmd,"sc_strafe_yaw 144");
    CreateTimer(0.245, ClientCmd,"sc_strafe_yaw 90");
    CreateTimer(0.360, ClientCmd,"+back");
    CreateTimer(0.450, ClientCmd,"sc_strafe_yaw -90");
    CreateTimer(0.450, ClientCmd,"-back");
    CreateTimer(0.740, ClientCmd,"+forward");
    CreateTimer(0.910, ClientCmd,"sc_strafe_yaw 87");
    CreateTimer(0.920, ClientCmd,"-forward");
    CreateTimer(1.000, ClientCmd,"+sc_ducktap");
    CreateTimer(1.020, ClientCmd,"+duck");
    CreateTimer(1.050, ClientCmd,"setang -15.004810 -90.043945 0.000000");
    CreateTimer(1.050, ClientCmd,"+attack2");
    CreateTimer(1.070, ClientCmd,"setang 0 90 0.000000");
    CreateTimer(1.220, ClientCmd,"gibme");
    CreateTimer(1.340, ClientCmd,"-duck");
    CreateTimer(1.340, ClientCmd,"-sc_ducktap");
    CreateTimer(1.150, ClientCmd,"-attack2");
    CreateTimer(1.150, ClientCmd,"+jump");
    CreateTimer(2.480, ClientCmd,"gibme");
    CreateTimer(2.622, ClientCmd,"sc_strafe_yaw -10");
    CreateTimer(2.600, ClientCmd,"sc_st_setangles 0 0 120");
    CreateTimer(3.100, ClientCmd,"+duck");
    CreateTimer(3.100, ClientCmd,"-jump");
    --CreateTimer(3.225, ClientCmd,"setang 55 90 0");
    CreateTimer(3.170, ClientCmd,"-duck");
    CreateTimer(3.275, ClientCmd,"+jump");
    CreateTimer(3.275, ClientCmd,"+attack2");
    CreateTimer(3.280, ClientCmd,"weapon_satchel");
    CreateTimer(3.275, ClientCmd,"setang 0 -90 0");
    CreateTimer(3.380, ClientCmd,"-attack2");
    CreateTimer(3.280, ClientCmd,"sc_strafe_yaw -90");
    CreateTimer(3.580, ClientCmd,"gibme");
    CreateTimer(3.720, ClientCmd,"sc_strafe_yaw -179");
    CreateTimer(3.760, ClientCmd,"+duck");
    CreateTimer(3.760, ClientCmd,"sc_st_setangles 0 90 120");
    CreateTimer(3.810, ClientCmd,"-duck");
    CreateTimer(4.375, ClientCmd,"setang 0 90 0");
    CreateTimer(4.375, ClientCmd,"gibme");
    CreateTimer(4.350, ClientCmd,"sc_strafe_yaw 130");
    CreateTimer(4.935, ClientCmd,"setang 0 -86 0");
    CreateTimer(4.830, ClientCmd,"sc_strafe_yaw 90");
    CreateTimer(4.950, ClientCmd,"gibme");
    CreateTimer(4.950, ClientCmd,"gibme");
    CreateTimer(5.080, ClientCmd,"sc_strafe_yaw 179");
    CreateTimer(5.400, ClientCmd,"sc_strafe_yaw 24");
    CreateTimer(5.400, ClientCmd,"setang 22 100 0");
    --CreateTimer(5.525, ClientCmd,"sc_strafe_yaw 0");
    CreateTimer(5.900, ClientCmd,"setang 7 168 0");
    CreateTimer(5.400, ClientCmd,"+attack2");
    CreateTimer(5.415, ClientCmd,"+duck");
    CreateTimer(5.900, ClientCmd,"-duck");
    CreateTimer(5.800, ClientCmd,"-jump");
    CreateTimer(5.900, ClientCmd,"sc_strafe 0");
    CreateTimer(6.400, ClientCmd,"setang 7 150 0");
    CreateTimer(6.480, ClientCmd,"setang 10 -179 0");
    CreateTimer(6.600, ClientCmd,"-attack2");
    CreateTimer(6.500, ClientCmd,"sc_strafe_yaw 179");
    CreateTimer(6.700, ClientCmd,"sc_strafe 1");
    CreateTimer(6.880, ClientCmd,"+jump");
    CreateTimer(6.885, ClientCmd,"+duck");
    CreateTimer(7.070, ClientCmd,"sc_strafe_yaw -146");
    CreateTimer(7.070, ClientCmd,"sc_st_setangles 0 -146 120");
    CreateTimer(7.140, ClientCmd,"+attack");
    CreateTimer(7.460, ClientCmd,"weapon_9mmAR");
    CreateTimer(7.770, ClientCmd,"gibme");
    CreateTimer(7.540, ClientCmd,"-attack");
    CreateTimer(7.540, ClientCmd,"-duck");
    CreateTimer(8.060, ClientCmd,"sc_strafe_yaw -90");
    CreateTimer(8.060, ClientCmd,"sc_st_setangles 0 -50 120");
    CreateTimer(8.685, ClientCmd,"sc_strafe_yaw -40");
    CreateTimer(9.730, ClientCmd,"gibme");
    CreateTimer(9.980, ClientCmd,"sc_strafe_yaw \"\"");
    CreateTimer(9.980, ClientCmd,"sc_st_timescale 0.05");




    --[[CreateTimer(6.140, ClientCmd,"+attack2");
    CreateTimer(7.100, ClientCmd,"sc_strafe_yaw -144");
    CreateTimer(7.240, ClientCmd,"-attack2");
    CreateTimer(7.500, ClientCmd,"sc_strafe 1");
    CreateTimer(7.750, ClientCmd,"+jump");
    CreateTimer(7.760, ClientCmd,"+duck");
    CreateTimer(8.180, ClientCmd,"+attack");
    CreateTimer(8.200, ClientCmd,"weapon_9mmAR");
    CreateTimer(8.280, ClientCmd,"-attack");
    CreateTimer(8.900, ClientCmd,"-duck");
    CreateTimer(9.000, ClientCmd,"sc_strafe_yaw -90");
    CreateTimer(9.000, ClientCmd,"sc_st_setangles 0 -40 120");
    CreateTimer(9.650, ClientCmd,"sc_strafe_yaw -50");
    CreateTimer(10.000, ClientCmd,"gibme");
    CreateTimer(10.200, ClientCmd,"sc_st_setangles 0 -50 120");
    CreateTimer(9.650, ClientCmd,"sc_strafe_yaw -50");
    CreateTimer(10.475, ClientCmd,"gibme");
    CreateTimer(12.555, ClientCmd,"setang -7 -126 0");
    CreateTimer(12.565, ClientCmd,"+attack2");
    CreateTimer(12.570, ClientCmd,"sc_strafe_type 1");
    CreateTimer(12.570, ClientCmd,"setang 0 30");
    CreateTimer(12.665, ClientCmd,"-attack2");
    CreateTimer(12.640, ClientCmd,"sc_strafe_yaw 30");
    CreateTimer(13.100, ClientCmd,"sc_st_setangles 0 0 120");
    CreateTimer(13.100, ClientCmd,"sc_strafe_yaw 50");
    CreateTimer(13.185, ClientCmd,"sc_strafe_yaw 0");
 
    --CreateTimer(22.550, ClientCmd,"-attack2");]]
   
end

function OnTouchTrigger( name )
    if ( name == "1" ) then
        spawns_state = 1;
    elseif (name == "2") then
        spawns_state = 2;
    elseif (name == "3") then
        spawns_state = 3;
    end

    return true;
end

function OnFireCrossbowSpread(entity, entindex)
    return true, 1.0, true, 1.0;
end

function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
    printl( "OnPlayerSpawn()" );

    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) .. ", viewangles: " .. tostring(pPlayerEdict.vars.angles) .. "" );

    local sPlayerName = pPlayerEdict.vars.netname;

    if ( spawns_state == 0 ) then
        if ( sPlayerName == "QEES" ) then -- HOST
            pPlayerEdict.vars.origin = Vector( -1359, 923, -856 );
            pPlayerEdict.vars.angles = Vector( -4, 145, 0 );
        elseif ( sPlayerName == "2" ) then
            pPlayerEdict.vars.origin = Vector( -1861, 184, -88 ); 
            pPlayerEdict.vars.angles = Vector( 0, 165, 0);
        elseif ( sPlayerName == "3" ) then
            pPlayerEdict.vars.origin = Vector( -1807, 297, -88 );
            pPlayerEdict.vars.angles = Vector( 0, 165, 0);
        elseif ( sPlayerName == "4" ) then
            pPlayerEdict.vars.origin = Vector( -1769, 184, -88 );
            pPlayerEdict.vars.angles = Vector( 0, 165, 0);
        end
    end
end


function PrintTime()
    PrintChatText( string.format( "%.3f (IM frames: %d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

SpeedrunInit();
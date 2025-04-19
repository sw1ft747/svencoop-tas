connected = false;
spawned = false;
start_time = 0.0;
spawns_state = 0
OnSpecialSpawn = true;

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

    --CreateTimer(0.000, ClientCmd,"sc_im_record of5a2_v2");
    --CreateTimer(0.000, ClientCmd,"sc_im_play of5a2_v1");
    

    
    CreateTimer(0.000, ClientCmd,"sc_strafe 1");
    CreateTimer(0.000, ClientCmd,"sc_strafe_ignore_ground 0");
    CreateTimer(0.000, ClientCmd,"sc_strafe_yaw -87");
    CreateTimer(0.360, ClientCmd,"+back");
    CreateTimer(0.360, ClientCmd,"+moveleft");
    CreateTimer(0.380, ClientCmd,"-moveleft");
    CreateTimer(0.300, ClientCmd,"sc_strafe 0");
    CreateTimer(0.420, ClientCmd,"-back");
    CreateTimer(0.460, ClientCmd,"+jump");
    CreateTimer(0.470, ClientCmd,"gibme");
    CreateTimer(0.470, ClientCmd,"gibme");
    CreateTimer(0.470, ClientCmd,"gibme");
    CreateTimer(0.470, ClientCmd,"sc_strafe 1");
    CreateTimer(0.275, ClientCmd,"sc_strafe_yaw -20");
    CreateTimer(0.770, ClientCmd,"+duck");
    CreateTimer(0.810, ClientCmd,"-duck");
    CreateTimer(0.810, ClientCmd,"sc_strafe_yaw -40");
    CreateTimer(2.330, ClientCmd,"gibme");
    CreateTimer(2.855, ClientCmd,"+duck");
    CreateTimer(2.975, ClientCmd,"sc_strafe_yaw 179");
    CreateTimer(3.080, ClientCmd,"setang 20 0");
    CreateTimer(3.085, ClientCmd,"+attack2");
    CreateTimer(3.090, ClientCmd,"setang 0 179");
    CreateTimer(3.165, ClientCmd,"-attack2");
    CreateTimer(3.900, ClientCmd,"+jump");
    CreateTimer(4.900, ClientCmd,"+sc_ducktap");
    CreateTimer(4.900, ClientCmd,"+sc_ducktap");
    CreateTimer(5.000, ClientCmd,"sc_st_setangles 0 -50 120");
    CreateTimer(5.000, ClientCmd,"sc_strafe_yaw -50");
    CreateTimer(5.000, ClientCmd,"-jump");
    --CreateTimer(6.300, ClientCmd,"sc_strafe_yaw 0");
    CreateTimer(6.200, ClientCmd,"-sc_ducktap");
    CreateTimer(6.500, ClientCmd,"sc_strafe_yaw \"\"");
    CreateTimer(5.000, ClientCmd,"sc_st_setangles_stop");
    CreateTimer(6.000, ClientCmd,"sc_st_timescale 0.05");
    --[[CreateTimer(6.300, ClientCmd,"sc_st_setangles 0 90 160");
    CreateTimer(6.600, ClientCmd,"+jump");
    CreateTimer(6.600, ClientCmd,"-sc_ducktap");
    CreateTimer(7.120, ClientCmd,"sc_strafe_yaw 90");
    CreateTimer(7.600, ClientCmd,"sc_strafe_yaw 110");
    CreateTimer(8.300, ClientCmd,"gibme");
    CreateTimer(8.410, ClientCmd,"gibme");
    CreateTimer(9.190, ClientCmd,"gibme");
    CreateTimer(9.290, ClientCmd,"sc_strafe_yaw 90");
    CreateTimer(9.340, ClientCmd,"+duck");
    CreateTimer(9.380, ClientCmd,"gibme");
    CreateTimer(9.660, ClientCmd,"sc_strafe_yaw -42");
    CreateTimer(9.820, ClientCmd,"weapon_9mmAR");
    CreateTimer(9.660, ClientCmd,"-duck");
    CreateTimer(9.000, ClientCmd,"sc_st_timescale 0.05");
    CreateTimer(9.900, ClientCmd,"sc_strafe_yaw  \"\"");
    --[[CreateTimer(9.800, ClientCmd,"-attack");
    CreateTimer(9.665, ClientCmd,"setang -1.114532 143.506104 0.000000");
    CreateTimer(9.810, ClientCmd,"setang 0 -43.506104 0.000000");
    CreateTimer(10.150, ClientCmd,"sc_strafe_yaw 0");
    CreateTimer(10.885, ClientCmd,"sc_strafe_yaw -90");
    CreateTimer(10.860, ClientCmd,"setang 0 90 0.000000");
    CreateTimer(10.885, ClientCmd,"+attack2");
    CreateTimer(10.985, ClientCmd,"-attack2");
    
    --[[CreateTimer(0.000, ClientCmd,"weapon_9mmAR");
    CreateTimer(0.000, ClientCmd,"sc_strafe 1");
    CreateTimer(0.000, ClientCmd,"sc_strafe_ignore_ground 0");
    CreateTimer(0.000, ClientCmd,"sc_strafe_yaw 90");
    CreateTimer(0.280, ClientCmd,"+forward");
    CreateTimer(0.300, ClientCmd,"+jump");
    CreateTimer(0.305, ClientCmd,"gibme");
    CreateTimer(0.305, ClientCmd,"gibme");
    CreateTimer(0.305, ClientCmd,"gibme");
    CreateTimer(0.305, ClientCmd,"gibme");
    CreateTimer(0.300, ClientCmd,"sc_strafe_yaw -90");
    CreateTimer(0.310, ClientCmd,"-forward");
    CreateTimer(0.430, ClientCmd,"gibme");

    --CreateTimer(0.725, ClientCmd,"setang 19 90");
    --[[CreateTimer(0.000, ClientCmd,"sc_strafe_ignore_ground 0");
    CreateTimer(0.000, ClientCmd,"sc_strafe 1");
    CreateTimer(0.000, ClientCmd,"sc_strafe_yaw -24");
    CreateTimer(0.000, ClientCmd,"sc_st_setangles 15 116 120");
    CreateTimer(0.530, ClientCmd,"+jump");
    CreateTimer(0.720, ClientCmd,"+duck");
    CreateTimer(0.840, ClientCmd,"+attack2");
    CreateTimer(0.840, ClientCmd,"sc_st_setangles 65 156 120");
    CreateTimer(0.840, ClientCmd,"sc_strafe_yaw -36");
    CreateTimer(0.920, ClientCmd,"-duck");
    CreateTimer(1.900, ClientCmd,"+duck");
    CreateTimer(1.970, ClientCmd,"-duck");
    CreateTimer(1.970, ClientCmd,"-attack2")
    CreateTimer(1.970, ClientCmd,"sc_st_setangles 0 -36 120");
    CreateTimer(1.900, ClientCmd,"sc_strafe_yaw -37");
    CreateTimer(2.000, ClientCmd,"gibme");
    CreateTimer(3.035, ClientCmd,"sc_strafe_yaw -38");
    CreateTimer(4.030, ClientCmd,"+duck");
    CreateTimer(3.655, ClientCmd,"sc_st_setangles 0 -90 120");
    CreateTimer(4.230, ClientCmd,"-duck");
    CreateTimer(4.230, ClientCmd,"-jump");
    CreateTimer(4.230, ClientCmd,"-jump");
    CreateTimer(4.230, ClientCmd,"sc_strafe_yaw \"\"");
    --CreateTimer(4.950, ClientCmd,"sc_strafe_yaw \"\"");
 
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

function OnFireTargets( targetname, activator, caller, usetype, value, delay )
    if ( targetname == "jygant_kill" ) then
        spawns_state = 1;
        CreateTimer( 0.0, ClientCmd, "kill");
        CreateTimer(0.160, EnableSurvivalMode );
        CreateTimer(0.140, DisableSurvivalMode );
        CreateTimer(0.000, ClientCmd,"-jump");
        CreateTimer(0.000, ClientCmd,"-duck");
        CreateTimer(0.000, ClientCmd,"sc_strafe_yaw 0");
    end

    -- printl( "OnFireTargets :: " .. targetname .. " : " .. value .. " : " .. delay );
end

function OnFireCrossbowSpread(entity, entindex)
    return true, 1.0, true, 1.0;
end

function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
    printl( "OnPlayerSpawn()" );

    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) .. ", viewangles: " .. tostring(pPlayerEdict.vars.angles) .. "" );

    local sPlayerName = pPlayerEdict.vars.netname;

    if ( spawns_state == 0 ) then
        if ( sPlayerName == "void" ) then
            pPlayerEdict.vars.origin = Vector( 1770, 665, 229 );
            pPlayerEdict.vars.angles = Vector( 0, -141, 0 );
        elseif ( sPlayerName == "QEES" ) then
            pPlayerEdict.vars.origin = Vector( -872, 3080, -16 ); 
            pPlayerEdict.vars.angles = Vector( 0, -90, 0 );
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
            pPlayerEdict.vars.origin = Vector( 14, 1101, -25 ); 
            pPlayerEdict.vars.angles = Vector( 0.000000, 0.000000, 0.000000 );
        end
    end
end

function PrintTime()
    PrintChatText( string.format( "%.3f (IM frames: %d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

SpeedrunInit();
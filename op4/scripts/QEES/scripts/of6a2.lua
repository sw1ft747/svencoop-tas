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
    
    --CreateTimer(0.040, EnableSurvivalMode );
    --CreateTimer(0.020, DisableSurvivalMode );

    CreateTimer(0.000, ClientCmd,"weapon_9mmAR");

    --CreateTimer(0.725, ClientCmd,"setang 19 90");
    CreateTimer(0.000, ClientCmd,"sc_strafe_ignore_ground 0");
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
    CreateTimer(4.230, ClientCmd,"sc_st_timescale 0.05");
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
            pPlayerEdict.vars.origin = Vector( -1646, -55, 9 ); 
            pPlayerEdict.vars.angles = Vector( 0, 0, 0 );
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
            pPlayerEdict.vars.origin = Vector( 1401, -524, -8 ); 
            pPlayerEdict.vars.angles = Vector( 0.000000, -179.000000, 0.000000 );
        end
    end
end

function PrintTime()
    PrintChatText( string.format( "%.3f (IM frames: %d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

SpeedrunInit();
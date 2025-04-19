connected = false;
spawned = false;
start_time = 0.0;
spawns_state = 0

-- HOST NAME HAS "BotSkipper"
-- BOT NAME HAS "QEES"

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

    CreateTimer(0.000, ClientCmd,"sc_im_record of4a3_12bot");
    --CreateTimer(0.000, ClientCmd,"sc_im_play of4a3V1");

    CreateServerTrigger("22", Vector(405.875, -2417.375, 392.625), Vector(0, 0, 0), Vector(117.375, 40.344, 149.906));

    --[[CreateTimer(0.000, ClientCmd,".tas_bm_spawnbot");
    CreateTimer(0.000, ClientCmd,".tas_bm_startbot");
    --CreateTimer(0.000, ClientCmd,".tas_bm_drawmedkit");
    CreateTimer(0.000, ClientCmd,".tas_bm_drawshotgun");
    --CreateTimer(0.550, ClientCmd,".tas_bm_drawhandgrenade");
    --CreateTimer(3.160, ClientCmd,".tas_bm_drawmedkit");
    CreateTimer(1.395, ClientCmd,".tas_bm_suicide");
    CreateTimer(2.195, ClientCmd,".tas_bm_setbuttons 4");--]]
    CreateTimer(0.140, EnableSurvivalMode );
    CreateTimer(0.120, DisableSurvivalMode );
    CreateTimer(0.000, ClientCmd,".tas_bm_spawnbot");
    CreateTimer(0.000, ClientCmd,".tas_bm_startbot");
    CreateTimer(0.000, ClientCmd,".tas_bm_drawshotgun");
    CreateTimer(1.000, ClientCmd,".tas_bm_setbuttons 2048");
    CreateTimer(1.055, ClientCmd,".tas_bm_drawmedkit");
    --CreateTimer(0.550, ClientCmd,".tas_bm_drawhandgrenade");
    --CreateTimer(3.160, ClientCmd,".tas_bm_drawmedkit");--]]



    --CreateTimer(3.180, ClientCmd,"fps_max 20");
    --CreateTimer(3.470, ClientCmd,"fps_max 200");

    --[[CreateTimer(0.000, ClientCmd,"weapon_shotgun");
    CreateTimer(0.000, ClientCmd,"sc_strafe 1");
    CreateTimer(0.000, ClientCmd,"sc_strafe_ignore_ground 0");]]

    CreateTimer(0.000, ClientCmd,"weapon_shotgun");
    CreateTimer(0.000, ClientCmd,"sc_st_setangles 0 -60 120");
    CreateTimer(0.000, ClientCmd,"sc_strafe 1");
    CreateTimer(0.000, ClientCmd,"sc_strafe_ignore_ground 0");
    CreateTimer(0.000, ClientCmd,"sc_strafe_type 0");
    CreateTimer(0.000, ClientCmd,"sc_strafe_yaw -80");
    CreateTimer(0.410, ClientCmd,"+jump");
    CreateTimer(0.520, ClientCmd,"+duck");
    CreateTimer(0.510, ClientCmd,"sc_strafe_yaw 5");
    CreateTimer(0.510, ClientCmd,"sc_st_setangles 0 0 120");
    CreateTimer(0.300, ClientCmd,"+attack2");
    CreateTimer(0.600, ClientCmd,"-attack2");
    CreateTimer(0.670, ClientCmd,"-duck");
    CreateTimer(1.320, ClientCmd,"sc_strafe_yaw 90");
    CreateTimer(1.395, ClientCmd,"kill");
    CreateTimer(1.270, ClientCmd,"-jump");
    CreateTimer(1.310, ClientCmd,"+duck");

    --[[CreateTimer(33.850, ClientCmd,"+attack");
    CreateTimer(34.525, ClientCmd,"setang 0 178");
    CreateTimer(35.160, ClientCmd,"setang -90 90");
    CreateTimer(35.800, ClientCmd,"setang 0 90");
    CreateTimer(37.185, ClientCmd,"-forward");
    CreateTimer(37.185, ClientCmd,"sc_strafe 1");
    --CreateTimer(37.350, ClientCmd,"-attack");
    CreateTimer(37.420, ClientCmd,"+jump");
    CreateTimer(37.500, ClientCmd,"sc_st_setangles 0 179 120");
    CreateTimer(37.550, ClientCmd,"sc_strafe_yaw 179");
    CreateTimer(38.050, ClientCmd,"sc_strafe_yaw \"\"");
    CreateTimer(38.050, ClientCmd,"sc_st_setangles_stop");
    CreateTimer(37.900, ClientCmd,"-jump");
    --CreateTimer(39.410, ClientCmd,"sc_im_split");
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

function OnTouchServerTrigger(activator, name)
    printl( "Touched trigger: \"" .. name .. "\"" );

    if ( activator.vars.deadflag ~= 0 or activator.vars.iuser1 ~= 0 ) then
        return false;
    end

    if (activator.vars.netname == "BotSkipper" and name == "22") then
        spawned = true;
        --ClientCmd( "say 1" );
        --CreateTimer( 1.5, SendCommandToClientByName, "QEES", "setang 3.181950 89.362793 0.000000" );
        skopper_revived = true;
        return true;
    elseif (activator.vars.netname == "BotSkipper" and name == "33") then
        spawned = true;
        --CreateTimer( 0.000, SendCommandToClientByName, "BotSkipper", "kill" );
        return true;
    end

    return false;
end  

function OnFireCrossbowSpread(entity, entindex)
    return true, 1.0, true, 1.0;
end

function OnFireTargets( targetname, activator, caller, usetype, value, delay )
    if ( targetname == "1off_2on_mm" ) then
        spawns_state = 1;
        --CreateTimer( 2.4, ClientCmd, "sc_im_record of1a3_next");
        --CreateTimer( 2.4, ClientCmd, "sc_im_play of1a3_next");
        ClientCmd("kill");
        CreateTimer(0.100, DisableSurvivalMode );
        CreateTimer(0.110, EnableSurvivalMode );
        ClientCmd("sc_strafe_yaw \"\"");
        ClientCmd("sc_st_setangles_stop");
        ClientCmd("-duck");
        ClientCmd("sc_st_timescale 0.05");
        ClientCmd(".tas_bm_suicide");
        CreateTimer(0.400, DisableSurvivalMode );
        CreateTimer(0.410, EnableSurvivalMode );
        CreateTimer(0.290, ClientCmd,".tas_bm_suicide");
        CreateTimer(0.790, ClientCmd,".tas_bm_suicide");
        CreateTimer(0.900, DisableSurvivalMode );
        CreateTimer(0.910, EnableSurvivalMode );
        CreateTimer(1.290, ClientCmd,".tas_bm_suicide");
        CreateTimer(1.400, DisableSurvivalMode );
        CreateTimer(1.410, EnableSurvivalMode );
    end

    -- printl( "OnFireTargets :: " .. targetname .. " : " .. value .. " : " .. delay );
end 

function OnSpecialSpawn( pPlayerEdict )
    printl( "OnSpecialSpawn()" );
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" has been revived at " .. tostring( pPlayerEdict.vars.origin ) );

    if ( pPlayerEdict.vars.netname == "BotSkipper" ) then
        pPlayerEdict.vars.origin = Vector( -63.968750, -2236.968750, 332.031250 );
    end
end

function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
    printl( "OnPlayerSpawn()" );

    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) .. ", viewangles: " .. tostring(pPlayerEdict.vars.angles) .. "" );

    local sPlayerName = pPlayerEdict.vars.netname;

    if ( spawns_state == 0 ) then
        if ( sPlayerName == "QEES" ) then
            pPlayerEdict.vars.origin = Vector( -480, -2749, 424 );
            pPlayerEdict.vars.angles = Vector( 0.000000, 90.000000, 0.000000 );
        elseif ( sPlayerName == "BotSkipper" ) then
            pPlayerEdict.vars.origin = Vector( -467, -1973, 421 ); 
            pPlayerEdict.vars.angles = Vector( 0.000000, -74.000000, 0.000000 );
        elseif ( sPlayerName == "123" ) then
            pPlayerEdict.vars.origin = Vector( -3456, -2832, 432 ); 
            pPlayerEdict.vars.angles = Vector( 0.000000, 0.000000, 0.000000 );
        elseif ( sPlayerName == "kolokola777" ) then
            pPlayerEdict.vars.origin = Vector( -3456, -2912, 432 );
            pPlayerEdict.vars.angles = Vector( 0.000000, -90.000000, 0.000000 );
        end
    elseif ( spawns_state == 1 ) then -- спавн после
        if ( sPlayerName == "QEES" ) then    
            pPlayerEdict.vars.origin = Vector( 207.968750, -1631.968750, 188.000000 );
            pPlayerEdict.vars.angles = Vector( 0.000000, 90.000000, 0.000000 );
        elseif ( sPlayerName == "123" ) then
            pPlayerEdict.vars.origin = Vector( -1141, 336, 696 ); 
            pPlayerEdict.vars.angles = Vector( 0.000000, 90.000000, 0.000000 );
        elseif ( sPlayerName == "123" ) then
            pPlayerEdict.vars.origin = Vector( -1212, 337, 696 ); 
            pPlayerEdict.vars.angles = Vector( 0.000000, 90.000000, 0.000000 );
        elseif ( sPlayerName == "BotSkipper" ) then
            pPlayerEdict.vars.origin = Vector( 28, -1781, 335 ); 
            pPlayerEdict.vars.angles = Vector( 0.000000, -90.000000, 0.000000 );
        end
    end
end

function PrintTime()
    PrintChatText( string.format( "%.3f (IM frames: %d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

SpeedrunInit();
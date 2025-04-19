connected = false;
spawned = false;
start_time = 0.0;
spawns_state = 0

-- BOT NAME HAS "iMicro"

function SpeedrunInit()
    SetTimescale( 0.25 );

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

    --CreateTimer(0.000, ClientCmd,"sc_im_record of4a2_bot");
    --CreateTimer(0.000, ClientCmd,"sc_im_play of4a2V1");

    CreateServerTrigger("22", Vector(-1899.156, -242.688, 390.812), Vector(0, 0, 0), Vector(88.531, 81.281, 142.125));

    --CreateTimer(0.000, ClientCmd,"sc_im_experimental 1");
    CreateTimer(0.000, ClientCmd,".tas_bm_spawnbot");
    CreateTimer(0.000, ClientCmd,".tas_bm_startbot");
    CreateTimer(0.000, ClientCmd,".tas_bm_drawmedkit");
    CreateTimer(0.000, ClientCmd,".tas_bm_drawshotgun");
    CreateTimer(0.550, ClientCmd,".tas_bm_drawhandgrenade");
    --CreateTimer(3.160, ClientCmd,".tas_bm_drawmedkit");
    CreateTimer(2.380, ClientCmd,".tas_bm_suicide");
    CreateTimer(3.360, ClientCmd,".tas_bm_setbuttons 2");
    
    CreateTimer(0.140, EnableSurvivalMode );
    CreateTimer(0.120, DisableSurvivalMode );
    CreateTimer(3.180, ClientCmd,"fps_max 20");
    CreateTimer(3.470, ClientCmd,"fps_max 200");



    CreateTimer(0.000, ClientCmd,"sc_strafe_ignore_ground 0");
    CreateTimer(0.000, ClientCmd,"sc_strafe_type 0");
    CreateTimer(0.000, ClientCmd,"setang 35 -46")
    CreateTimer(0.000, ClientCmd,"weapon_9mmAR");
    CreateTimer(0.010, ClientCmd,"dropsecammo");
    CreateTimer(0.020, ClientCmd,"drop");
    CreateTimer(0.020, ClientCmd,"kill");
    CreateTimer(0.020, EnableSurvivalMode );
    CreateTimer(0.140, DisableSurvivalMode );
    CreateTimer(0.160, EnableSurvivalMode );
    CreateTimer(0.160, ClientCmd,"weapon_9mmAR");
    CreateTimer(0.160, ClientCmd,"setang -1.048959 -46.408325 0.000000");
    CreateTimer(0.170, ClientCmd,"drop");
    CreateTimer(0.180, ClientCmd,"weapon_handgrenade");
    CreateTimer(0.490, ClientCmd,"sc_strafe 1");
    CreateTimer(2.760, ClientCmd,"weapon_medkit");
    --CreateTimer(0.500, ClientCmd,"sc_strafe_yaw -46");

    --[[CreateTimer(0.000, ClientCmd,"setang 70.665699 -75.201416 0.000000");
    CreateTimer(0.000, ClientCmd,"dropsecammo");
    CreateTimer(0.010, ClientCmd,"kill");
    CreateTimer(0.125, ClientCmd,"setang 70.665699 -75.201416 0.000000");
    CreateTimer(0.130, ClientCmd,"weapon_9mmAR");
    CreateTimer(0.150, ClientCmd,"drop");

    --[[CreateTimer(0.000, ClientCmd,"sc_strafe_ignore_ground 0");
    CreateTimer(0.000, ClientCmd,"sc_strafe 1");
    CreateTimer(0.000, ClientCmd,"sc_strafe_yaw 165");
    CreateTimer(0.290, ClientCmd,"+jump");
    CreateTimer(0.335, ClientCmd,"sc_strafe_yaw 90");
    CreateTimer(0.100, ClientCmd,"sc_st_setangles 40 90 120");
    CreateTimer(0.620, ClientCmd,"+use");
    CreateTimer(0.620, ClientCmd,"sc_st_setangles 0 -90 120");
    CreateTimer(0.670, ClientCmd,"-use");
    CreateTimer(0.670, ClientCmd,"-jump");
    CreateTimer(0.670, ClientCmd,"sc_strafe 0");

    --[[CreateTimer(0.000, ClientCmd,"weapon_handgrenade");
    CreateTimer(0.000, ClientCmd,"sc_strafe 1");
    CreateTimer(0.000, ClientCmd,"sc_strafe_ignore_ground 0");
    CreateTimer(0.000, ClientCmd,"sc_strafe_yaw -80");
    CreateTimer(0.000, ClientCmd,"+attack");
    CreateTimer(0.350, ClientCmd,"+jump");
    CreateTimer(0.670, ClientCmd,"sc_strafe_yaw 179");
    CreateTimer(0.700, ClientCmd,"-attack");
    CreateTimer(1.030, ClientCmd,"sc_strafe_yaw -90");
    CreateTimer(1.000, ClientCmd,"-jump");
    CreateTimer(1.000, ClientCmd,"+sc_ducktap");
    CreateTimer(1.000, ClientCmd,"setang 0 0");
    CreateTimer(1.060, ClientCmd,"setang 0 -90");
    CreateTimer(1.205, ClientCmd,"-sc_ducktap");
    CreateTimer(1.270, ClientCmd,"sc_strafe_yaw 90");
    CreateTimer(1.285, ClientCmd,"+back");
    CreateTimer(1.285, ClientCmd,"+moveleft");
    CreateTimer(1.375, ClientCmd,"-moveleft");
    CreateTimer(1.450, ClientCmd,"-back");
    CreateTimer(1.350, ClientCmd,"+forward");
    CreateTimer(1.350, ClientCmd,"sc_strafe_yaw -88");
    CreateTimer(1.585, ClientCmd,"-forward");
    CreateTimer(1.680, ClientCmd,"+jump");
    CreateTimer(1.690, ClientCmd,"sc_strafe_yaw -90");
    CreateTimer(2.050, ClientCmd,"+duck");
    CreateTimer(2.380, ClientCmd,"kill");

    
    
    

    --CreateTimer(33.850, ClientCmd,"+attack");
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

function OnFireCrossbowSpread(entity, entindex)
    return true, 1.0, true, 1.0;
end

function OnTouchServerTrigger(activator, name)
    printl( "Touched trigger: \"" .. name .. "\"" );

    if ( activator.vars.deadflag ~= 0 or activator.vars.iuser1 ~= 0 ) then
        return false;
    end

    if (activator.vars.netname == "iMicro" and name == "22") then
        spawned = true;
        --CreateTimer( 0.1, SendCommandToClientByName, "QEES", ".tas_bm_suicide" );
        CreateTimer(0.100, ClientCmd,".tas_bm_suicide" );
        return true;
    elseif (activator.vars.netname == "iMicro" and name == "33") then
        spawned = true;
        --CreateTimer( 0.000, SendCommandToClientByName, "iMicro", "kill" );
        return true;
    end

    return false;
end  

function OnSpecialSpawn( pPlayerEdict )
    printl( "OnSpecialSpawn()" );
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" has been revived at " .. tostring( pPlayerEdict.vars.origin ) );

    if ( pPlayerEdict.vars.netname == "iMicro" ) then
        pPlayerEdict.vars.origin = Vector( -1851.937500, -171.431250, 420.031250 );
    end
end

function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
    printl( "OnPlayerSpawn()" );

    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) .. ", viewangles: " .. tostring(pPlayerEdict.vars.angles) .. "" );

    local sPlayerName = pPlayerEdict.vars.netname;

    if ( spawns_state == 0 ) then
        if ( sPlayerName == "QEES" ) then -- HOST
            pPlayerEdict.vars.origin = Vector( -1790, 560, 421 );
            pPlayerEdict.vars.angles = Vector( 0, -90, 0 );
        elseif ( sPlayerName == "iMicro" ) then
            pPlayerEdict.vars.origin = Vector( -1694, 560, 421 );  
            pPlayerEdict.vars.angles = Vector( 0, 0, 0);
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
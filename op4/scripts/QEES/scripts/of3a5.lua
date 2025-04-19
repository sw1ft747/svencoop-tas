connected = false;
spawned = false;
start_time = 0.0;
spawns_state = 0

-- просто залупа

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

    CreateTimer(0.000, ClientCmd,"sc_strafe 1");
    --CreateTimer(0.000, ClientCmd,"kill");
    --[[CreateTimer(0.000, ClientCmd,"sc_im_record of3a5");
    --CreateTimer(0.000, ClientCmd,"sc_im_play of3a5");

    --CreateTimer(0.000, ClientCmd,"sc_im_experimental 1");
    --CreateTimer(0.000, ClientCmd,".tas_bm_spawnbot");
    --CreateTimer(0.000, ClientCmd,".tas_bm_startbot");
    --CreateTimer(0.000, ClientCmd,".tas_bm_drawmedkit");
    --CreateTimer(2.200, ClientCmd,".tas_bm_drawhandgrenade");
    --CreateTimer(3.160, ClientCmd,".tas_bm_drawmedkit");
    --CreateTimer(1.750, ClientCmd,".tas_bm_suicide");
    --CreateTimer(2.680, ClientCmd,".tas_bm_setbuttons 2");
    --CreateTimer(2.200, ClientCmd,".tas_bm_drawhandgrenade");
    --CreateTimer(3.200, ClientCmd,".tas_bm_drawmedkit");
    --CreateTimer(2.690, ClientCmd,"setpos -584.500000 -274.312500 -117.468750");
    --[[
    CreateTimer(1.750, ClientCmd,".tas_bm_suicide");
    CreateTimer(1.750, ClientCmd,".tas_bm_moveforward");
    --CreateTimer(2.750, ClientCmd,".tas_bm_setbuttons 2");
    
    CreateTrigger("1", Vector(-1642.531, -670.750, -102.281), Vector(0, 0, 0), Vector(69.938, 90.062, 153.062));
    CreateTrigger("2", Vector(-2251.656, -130.875, 201.156), Vector(0, 0, -120.281), Vector(32.406, 66.750, 0));
    --CreateTrigger("1", Vector(-647.281, -290.406, -123.812), Vector(0, 0, 0), Vector(43.344, 75.062, 89.562));
    
    
    CreateTimer(0.040, EnableSurvivalMode );
    CreateTimer(0.020, DisableSurvivalMode );

    
    CreateTimer(0.000, ClientCmd,"weapon_shotgun");
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

function OnFireTargets( targetname, activator, caller, usetype, value, delay )
    if ( targetname == "ootw_eventmm" ) then
        --CreateTimer(0.000, ClientCmd,"say starting");
    end

    -- printl( "OnFireTargets :: " .. targetname .. " : " .. value .. " : " .. delay );
end

function OnTouchTrigger( name )
    if ( name == "1" ) then
        spawns_state = 1;
        --CreateTimer(0.000, ClientCmd,"weapon_handgrenade");
        CreateTimer(0.000, ClientCmd,"sc_strafe 0");
        CreateTimer(0.000, ClientCmd,"impulse 100");
        CreateTimer(0.400, ClientCmd,"impulse 201");
        CreateTimer(0.400, ClientCmd,"+back");
        CreateTimer(0.550, ClientCmd,"-back");
        --CreateTimer(4.550, ClientCmd,"sc_st_timescale 0.25");
    elseif (name == "2") then
        spawns_state = 2;
        --CreateTimer(0.000, ClientCmd,"say 2");
        CreateTimer(0.000, ClientCmd,"setang 15 -179");
        CreateTimer(0.400, ClientCmd,"impulse 201");
        --CreateTimer(0.000, ClientCmd,"+forward");

    elseif (name == "3") then
        spawns_state = 3;
    end

    return true;
end

function OnFireCrossbowSpread(entity, entindex)
    return true, 1.0, true, 1.0;
end

function OnSpecialSpawn( pPlayerEdict )
    printl( "OnSpecialSpawn()" );
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" has been revived at " .. tostring( pPlayerEdict.vars.origin ) );

    if ( pPlayerEdict.vars.netname == "iMicro" ) then
        pPlayerEdict.vars.origin = Vector( -604.125000, -255.875000, -91.968750 );
    end
end

function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
    printl( "OnPlayerSpawn()" );

    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) .. ", viewangles: " .. tostring(pPlayerEdict.vars.angles) .. "" );

    local sPlayerName = pPlayerEdict.vars.netname;

    if ( spawns_state == 0 ) then
        if ( sPlayerName == "QEES" ) then -- HOST
            pPlayerEdict.vars.origin = Vector( -1962, 177, -88 );
            pPlayerEdict.vars.angles = Vector( -3, -175, 0 );
        elseif ( sPlayerName == "2" ) then
            pPlayerEdict.vars.origin = Vector(  );  --1861, 184, -88
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
connected = false;
spawned = false;
start_time = 0.0;
spawns_state = 0
OnSpecialSpawn = true;

-- BOT NAME HAS "void"

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
    
    CreateTimer(0.040, EnableSurvivalMode );
    CreateTimer(0.020, DisableSurvivalMode );

    CreateTimer(0.000, ClientCmd,".tas_bm_spawnbot");
    CreateTimer(0.000, ClientCmd,".tas_bm_startbot");
    CreateTimer(0.000, ClientCmd,".tas_bm_drawmedkit");
    CreateTimer(1.110, ClientCmd,".tas_bm_drawhandgrenade");
    CreateTimer(3.000, ClientCmd,".tas_bm_drawmedkit");
    --CreateTimer(1.115, ClientCmd,".tas_bm_setbuttons 2");
    --CreateTimer(0.400, ClientCmd,".tas_bm_suicide");

    CreateTrigger("1", Vector(1856.469, 446.812, 160.938), Vector(0, 0, -161.344), Vector(62.938, 64.625, 0));


    CreateTimer(0.000, ClientCmd,"weapon_medkit");

    

    CreateTimer(1.200, ClientCmd,"fps_max 20");
    CreateTimer(3.150, ClientCmd,"fps_max 200");


    --CreateTimer(0.000, ClientCmd,"sc_strafe_ignore_ground 0");
    --CreateTimer(0.000, ClientCmd,"sc_strafe 1");

    CreateTimer(0.000, ClientCmd,"sc_strafe 1");
    CreateTimer(0.000, ClientCmd,"sc_strafe_ignore_ground 0");
    CreateTimer(0.000, ClientCmd,"sc_strafe_yaw -25");
    CreateTimer(0.115, ClientCmd,"+sc_ducktap");
    CreateTimer(0.125, ClientCmd,"-sc_ducktap");
    CreateTimer(0.145, ClientCmd,"+duck");
    CreateTimer(0.400, ClientCmd,"kill");
    CreateTimer(0.400, ClientCmd,"sc_st_setangles 23 -161 720");
    CreateTimer(1.115, ClientCmd,"+attack");
    CreateTimer(1.465, ClientCmd,"-attack");
    CreateTimer(0.645, ClientCmd,"-duck");
    CreateTimer(3.970, ClientCmd,"sc_strafe_yaw -84");
    CreateTimer(4.575, ClientCmd,"+jump");
    CreateTimer(4.640, ClientCmd,"+duck");
    CreateTimer(5.040, ClientCmd,"-duck");
    CreateTimer(4.900, ClientCmd,"sc_strafe_yaw -79");
    CreateTimer(5.980, ClientCmd,"sc_strafe_yaw 179");
    CreateTimer(5.870, ClientCmd,"sc_st_setangles_stop");
    CreateTimer(5.890, ClientCmd,"setang 10 -165 0");
    CreateTimer(6.005, ClientCmd,"-attack");
    CreateTimer(6.150, ClientCmd,"setang 0 179 0");
    CreateTimer(6.010, ClientCmd,"weapon_displacer");
    CreateTimer(6.200, ClientCmd,"+attack");
    CreateTimer(7.865, ClientCmd,"-attack");
    CreateTimer(7.550, ClientCmd,"setang 0 -22 0");
    CreateTimer(7.720, ClientCmd,"sc_strafe_yaw \"\"");
    CreateTimer(7.600, ClientCmd,"kill");
    CreateTimer(7.750, ClientCmd,"-jump");
    CreateTimer(7.800, ClientCmd,"sc_strafe_yaw -3");
    CreateTimer(7.840, EnableSurvivalMode );
    CreateTimer(7.820, DisableSurvivalMode );
    CreateTimer(10.000, ClientCmd,"impulse 100");
    CreateTimer(7.830, ClientCmd,"weapon_handgrenade");
    CreateTimer(8.380, ClientCmd,"+forward");
    CreateTimer(8.585, ClientCmd,"+jump");
    CreateTimer(8.590, ClientCmd,"-forward");
    CreateTimer(8.540, ClientCmd,"sc_strafe_yaw -179");
    CreateTimer(8.630, ClientCmd,"+duck");
    CreateTimer(9.745, ClientCmd,"-duck");
    CreateTimer(9.760, ClientCmd,"sc_strafe_yaw 178");
    CreateTimer(9.760, ClientCmd,"sc_st_setangles 0 90 90");
    CreateTimer(10.375, ClientCmd,"sc_strafe_type 1");
    CreateTimer(10.395, ClientCmd,"sc_strafe_yaw 90");
    CreateTimer(11.000, ClientCmd,"sc_st_setangles 0 -179 90");
    CreateTimer(10.645, ClientCmd,"sc_strafe_yaw 60");
    CreateTimer(11.000, ClientCmd,"sc_strafe_yaw -179");
    CreateTimer(10.310, ClientCmd,"+attack");
    CreateTimer(10.825, ClientCmd,"gibme");
    CreateTimer(11.640, ClientCmd,"sc_strafe_type 0");
    CreateTimer(11.545, ClientCmd,"gibme");
    CreateTimer(11.545, ClientCmd,"gibme");
    CreateTimer(11.690, ClientCmd,"sc_strafe_yaw -159");
    CreateTimer(11.690, ClientCmd,"sc_st_setangles 0 -159 90");
    CreateTimer(11.615, ClientCmd,"+duck");
    CreateTimer(11.750, ClientCmd,"-duck");
    CreateTimer(12.200, ClientCmd,"+duck");
    CreateTimer(12.275, ClientCmd,"-duck");
    CreateTimer(12.345, ClientCmd,"gibme");
    CreateTimer(12.400, ClientCmd,"+duck");
    CreateTimer(12.605, ClientCmd,"gibme");
    CreateTimer(12.690, ClientCmd,"sc_st_setangles 0 -179 90");
    CreateTimer(12.600, ClientCmd,"sc_strafe_type 1");
    CreateTimer(12.600, ClientCmd,"-duck");
    CreateTimer(13.220, ClientCmd,"sc_strafe_yaw 90");
    CreateTimer(13.220, ClientCmd,"sc_st_setangles 0 90 90");
    CreateTimer(13.640, ClientCmd,"sc_strafe_type 0");
    CreateTimer(13.830, ClientCmd,"sc_strafe_yaw 111");
    CreateTimer(14.000, ClientCmd,"sc_strafe_yaw 50");
    CreateTimer(14.000, ClientCmd,"setang 0 63 0");
    CreateTimer(14.310, ClientCmd,"-attack");
    CreateTimer(14.320, ClientCmd,"weapon_9mmAR");
    CreateTimer(14.320, ClientCmd,"sc_st_setangles 0 90 160");
    CreateTimer(14.310, ClientCmd,"+duck");
    CreateTimer(14.665, ClientCmd,"-duck");
    CreateTimer(14.800, ClientCmd,"sc_strafe_type 1");
    CreateTimer(14.965, ClientCmd,"-jump");
    CreateTimer(14.965, ClientCmd,"-sc_ducktap");
    CreateTimer(14.940, ClientCmd,"sc_strafe_yaw 90");
    CreateTimer(15.110, ClientCmd,"sc_strafe_yaw 114");
    CreateTimer(15.300, ClientCmd,"sc_strafe_yaw 0");
    CreateTimer(15.220, ClientCmd,"sc_st_setangles 0 0 120");
    CreateTimer(15.430, ClientCmd,"gibme");
    CreateTimer(15.430, ClientCmd,"gibme");
    CreateTimer(15.580, ClientCmd,"setang 0 163 0");
    CreateTimer(15.590, ClientCmd,"+attack2");
    CreateTimer(15.590, ClientCmd,"+jump");
    CreateTimer(15.600, ClientCmd,"setang 0 0 0");
    CreateTimer(15.610, ClientCmd,"-attack2");
    --CreateTimer(15.335, ClientCmd,"+duck");


    --[[CreateTimer(0.000, ClientCmd,"weapon_9mmAR");
    CreateTimer(0.000, ClientCmd,"sc_st_setangles 0 90 70");
    CreateTimer(0.000, ClientCmd,"sc_strafe_yaw 144");
    CreateTimer(0.245, ClientCmd,"sc_strafe_yaw 90");
    CreateTimer(0.360, ClientCmd,"+back");
 
    --CreateTimer(22.550, ClientCmd,"-attack2");]]
   
end

function OnTouchTrigger( name )
    if ( name == "1" ) then
        spawns_state = 1;
        CreateTimer(0.000, ClientCmd,"weapon_handgrenade");
        CreateTimer(0.960, ClientCmd,"+attack");
        CreateTimer(0.020, ClientCmd,"-duck");
        --CreateTimer(0.000, ClientCmd,"sc_st_setangles 23 -149 220");
        --CreateTimer(0.000, ClientCmd,"sc_st_timescale 0.1");
    elseif (name == "2") then
        spawns_state = 2;
    elseif (name == "3") then
        spawns_state = 3;
    end

    return true;
end

function OnSpecialSpawn( pPlayerEdict )
    printl( "OnSpecialSpawn()" );
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" has been revived at " .. tostring( pPlayerEdict.vars.origin ) );

    if ( pPlayerEdict.vars.netname == "QEES" ) then
        pPlayerEdict.vars.origin = Vector( 1922.399414, 450.575470, 100.838753 );
    elseif ( pPlayerEdict.vars.netname == "2" ) then
        pPlayerEdict.vars.origin = Vector( 0, 0, 0 );
    end
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
            pPlayerEdict.vars.origin = Vector( 1787, 504, 229 ); 
            pPlayerEdict.vars.angles = Vector( 0, -25, 0 );
        elseif ( sPlayerName == "3" ) then
            pPlayerEdict.vars.origin = Vector( -3456, -2832, 432 ); 
            pPlayerEdict.vars.angles = Vector( 0.000000, 0.000000, 0.000000 );
        elseif ( sPlayerName == "4" ) then
            pPlayerEdict.vars.origin = Vector( -3456, -2912, 432 );
            pPlayerEdict.vars.angles = Vector( 0.000000, -90.000000, 0.000000 );
        end
    elseif ( spawns_state == 1 ) then -- спавн после
        if ( sPlayerName == "1" ) then    
            pPlayerEdict.vars.origin = Vector( -3376, -2768, 432 );
            pPlayerEdict.vars.angles = Vector( 0.000000, 90.000000, 0.000000 );
        elseif ( sPlayerName == "2" ) then
            pPlayerEdict.vars.origin = Vector( -1141, 336, 696 ); 
            pPlayerEdict.vars.angles = Vector( 0.000000, 90.000000, 0.000000 );
        elseif ( sPlayerName == "3" ) then
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
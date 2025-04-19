connected = false;
spawned = false;
start_time = 0.0;
spawns_state = 0

-- HOST NAME HAS "iMicro"
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

    --CreateTimer(0.000, ClientCmd,"sc_im_record of3a4");
    CreateTimer(0.000, ClientCmd,"sc_im_play of3a4");

    --CreateTimer(0.000, ClientCmd,"sc_im_experimental 1");
    CreateTimer(0.000, ClientCmd,".tas_bm_spawnbot");
    CreateTimer(0.000, ClientCmd,".tas_bm_startbot");
    CreateTimer(0.000, ClientCmd,".tas_bm_drawmedkit");
    CreateTimer(2.200, ClientCmd,".tas_bm_drawhandgrenade");
    CreateTimer(3.160, ClientCmd,".tas_bm_drawmedkit");

    --CreateTimer(1.750, ClientCmd,".tas_bm_suicide");
    --CreateTimer(2.680, ClientCmd,".tas_bm_setbuttons 2");
    --CreateTimer(2.200, ClientCmd,".tas_bm_drawhandgrenade");
    --CreateTimer(3.200, ClientCmd,".tas_bm_drawmedkit");
    --CreateTimer(2.690, ClientCmd,"setpos -584.500000 -274.312500 -117.468750");
    --[[
    CreateTimer(1.750, ClientCmd,".tas_bm_suicide");
    CreateTimer(1.750, ClientCmd,".tas_bm_moveforward");
    --CreateTimer(2.750, ClientCmd,".tas_bm_setbuttons 2");]]
    
    CreateTrigger("1", Vector(-647.281, -290.406, -123.812), Vector(0, 0, 0), Vector(43.344, 75.062, 89.562));
    
    
    CreateTimer(0.040, EnableSurvivalMode );
    CreateTimer(0.020, DisableSurvivalMode );

    CreateTimer(0.000, ClientCmd,"weapon_handgrenade");
    CreateTimer(0.000, ClientCmd,"sc_strafe 1");
    CreateTimer(0.000, ClientCmd,"sc_strafe_ignore_ground 0");
    


    CreateTimer(2.355, ClientCmd,"fps_max 20");
    CreateTimer(2.720, ClientCmd,"fps_max 200");
    CreateTimer(0.000, ClientCmd,"sc_strafe 1");
    CreateTimer(0.000, ClientCmd,"+attack");
    CreateTimer(1.100, ClientCmd,"-attack");
    CreateTimer(0.000, ClientCmd,"sc_strafe_yaw -110");
    CreateTimer(0.000, ClientCmd,"sc_strafe_ignore_ground 0");
    CreateTimer(0.300, ClientCmd,"+jump");
    CreateTimer(0.400, ClientCmd,"-jump");
    CreateTimer(0.600, ClientCmd,"+sc_ducktap");
    CreateTimer(0.850, ClientCmd,"sc_strafe_yaw 179");
    CreateTimer(0.300, ClientCmd,"sc_st_setangles 0 179 120");
    CreateTimer(1.510, ClientCmd,"+duck");
    CreateTimer(1.640, ClientCmd,"weapon_9mmAR");
    CreateTimer(1.750, ClientCmd,"kill");
    CreateTimer(1.810, ClientCmd,"-duck");
    CreateTimer(2.355, ClientCmd,"fps_max 20");
    CreateTimer(2.355, ClientCmd,"+attack");
    CreateTimer(2.720, ClientCmd,"fps_max 200");
    CreateTimer(2.600, ClientCmd,"-sc_ducktap");
    CreateTimer(2.605, ClientCmd,"-attack");
    --CreateTimer(4.000, ClientCmd,"sc_st_timescale 0.1");

    
    CreateTimer(4.800, ClientCmd,"+jump");
    CreateTimer(4.800, ClientCmd,"sc_st_setangles 0 -90 180");
    CreateTimer(5.150, ClientCmd,"sc_strafe_yaw 179");
    CreateTimer(5.650, ClientCmd,"sc_strafe_yaw -90");
    CreateTimer(5.900, ClientCmd,"+duck");
    CreateTimer(6.050, ClientCmd,"-duck");
    CreateTimer(6.155, ClientCmd,"-jump");
    CreateTimer(6.205, ClientCmd,"setang 90 179.993916 0.000000");
    CreateTimer(6.210, ClientCmd,"+moveleft");
    CreateTimer(6.210, ClientCmd,"+back");
    CreateTimer(6.490, ClientCmd,"+duck");
    CreateTimer(6.500, ClientCmd,"-moveleft");
    CreateTimer(6.500, ClientCmd,"-back");
    CreateTimer(6.500, ClientCmd,"sc_strafe_yaw 179");
    CreateTimer(6.530, ClientCmd,"-duck");
    CreateTimer(6.490, ClientCmd,"sc_st_setangles 0 0 100");
    CreateTimer(7.060, ClientCmd,"+forward");
    CreateTimer(7.220, ClientCmd,"sc_strafe_yaw 0");
    CreateTimer(7.220, ClientCmd,"-forward");
    CreateTimer(7.340, ClientCmd,"+jump");
    CreateTimer(7.355, ClientCmd,"sc_strafe_yaw 35");
    CreateTimer(7.305, ClientCmd,"sc_st_setangles 1 7 120");
    CreateTimer(7.670, ClientCmd,"+duck");
    CreateTimer(7.845, ClientCmd,"+attack2");
    CreateTimer(7.890, ClientCmd,"-attack2");
    CreateTimer(7.815, ClientCmd,"sc_strafe_yaw 0");
    CreateTimer(7.846, ClientCmd,"sc_st_setangles 17 95 120");
    CreateTimer(8.190, ClientCmd,"-duck");
    CreateTimer(8.270, ClientCmd,"-jump");
    CreateTimer(8.270, ClientCmd,"sc_strafe 0");
    CreateTimer(8.900, ClientCmd,"sc_strafe_yaw 95");
    CreateTimer(9.000, ClientCmd,"sc_strafe 1");
    CreateTimer(9.530, ClientCmd,"+attack");
    CreateTimer(9.580, ClientCmd,"-attack");
    CreateTimer(9.535, ClientCmd,"sc_st_setangles 5 -164 120");
    CreateTimer(9.635, ClientCmd,"+jump");
    CreateTimer(9.645, ClientCmd,"sc_strafe_yaw 178");
    CreateTimer(9.965, ClientCmd,"+duck");
    CreateTimer(10.380, ClientCmd,"+attack2");
    CreateTimer(10.400, ClientCmd,"sc_st_setangles 0 90 120");
    CreateTimer(10.500, ClientCmd,"sc_strafe_yaw -176");
    CreateTimer(10.770, ClientCmd,"-duck");
    CreateTimer(10.770, ClientCmd,"-jump");
    CreateTimer(10.770, ClientCmd,"+sc_ducktap");
    CreateTimer(10.940, ClientCmd,"sc_strafe_type 1");
    CreateTimer(10.940, ClientCmd,"+duck");
    CreateTimer(11.000, ClientCmd,"-attack2");
    CreateTimer(10.855, ClientCmd,"sc_strafe_yaw 170");
    CreateTimer(10.945, ClientCmd,"sc_strafe_yaw 60");
    CreateTimer(11.120, ClientCmd,"+jump");
    CreateTimer(11.360, ClientCmd,"sc_strafe_type 0");
    CreateTimer(11.755, ClientCmd,"-duck");
    CreateTimer(11.755, ClientCmd,"-jump");
    CreateTimer(11.670, ClientCmd,"sc_strafe_type 1");
    CreateTimer(11.670, ClientCmd,"sc_strafe_yaw 179");
    CreateTimer(11.700, ClientCmd,"sc_st_setangles 0 179 120");
    CreateTimer(11.900, ClientCmd,"sc_strafe_type 0");
    CreateTimer(12.065, ClientCmd,"+duck");
    CreateTimer(12.065, ClientCmd,"+jump");
    
    --CreateTimer(22.550, ClientCmd,"-attack2");]]
   
end

function OnFireTargets( targetname, activator, caller, usetype, value, delay )
    if ( targetname == "breakingshit" ) then
        --CreateTimer(1.570, ClientCmd,"say open");
    end

    -- printl( "OnFireTargets :: " .. targetname .. " : " .. value .. " : " .. delay );
end

function OnTouchTrigger( name )
    if ( name == "1" ) then
        spawns_state = 1;
        CreateTimer(0.000, ClientCmd,"sc_strafe 1");
        CreateTimer(0.000, ClientCmd,"sc_strafe_yaw 118");
        CreateTimer(0.000, ClientCmd,"sc_st_timescale 0.25");
        CreateTimer(0.000, ClientCmd,"weapon_shotgun");
        CreateTimer(0.000, ClientCmd,"sc_st_setangles 0 129 120");
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
        if ( sPlayerName == "void" ) then
            pPlayerEdict.vars.origin = Vector( -19, 182, -56 );                 
            pPlayerEdict.vars.angles = Vector( 0, -119.256592, 0 );
        elseif ( sPlayerName == "iMicro" ) then
            pPlayerEdict.vars.origin = Vector( -19, 76, -56 );  --585.312500, -275.750000, -89.437500
            pPlayerEdict.vars.angles = Vector( 0, -119.256592, 0);
        end
    end
end


function PrintTime()
    PrintChatText( string.format( "%.3f (IM frames: %d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

SpeedrunInit();
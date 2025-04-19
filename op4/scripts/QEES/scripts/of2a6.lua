connected = false;
spawned = false;
start_time = 0.0;
spawns_state = 0

function SpeedrunInit()
    SetTimescale( 0.75 );

    RemoveAllTimers();

    ClientCmd(" sc_st_disable_spread 1; -attack1; -attack2; default_fov 100; -sc_ducktap; -jump; -duck; -forward; -back; -moveleft; -moveright; sc_strafe 0; sc_strafe_yaw \"\"; sc_strafe_ignore_ground 1; -attack; sc_im_stop");
    ClientCmd("sc_strafe_type 0; sc_strafe_dir 3; sc_st_setangles_stop; sc_ducktap_adjust_fps 0; sc_jumpbug_legit 0; sc_autojump_inconsistent 0; sc_strafe_vectorial_increment 0; fps_max 200; mp_classic_mode 1; clockwindow 0");
    
end

function SpeedrunStart()
    SpeedrunStartCustom();
    -- connected = true;
end

function SpeedrunStartCustom()
    start_time = SegmentCurrentTime();

    --CreateTimer(0.000, ClientCmd,"sc_im_record of2a6");
    --CreateTimer(0.000, ClientCmd,"sc_im_play of2a6");
    
    CreateTimer(0.000, ClientCmd,"sc_strafe 1");
    CreateTimer(0.000, ClientCmd,"weapon_9mmAR");
    CreateTimer(0.000, ClientCmd,"sc_strafe_ignore_ground 0");
    CreateTimer(0.000, ClientCmd,"sc_strafe_yaw -179");
    CreateTimer(0.100, ClientCmd,"sc_st_setangles 0 -90 120");
    CreateTimer(0.200, ClientCmd,"+sc_ducktap");
    CreateTimer(0.540, ClientCmd,"sc_strafe_yaw -90");
    CreateTimer(0.540, ClientCmd,"sc_st_setangles 0 179 120");
    CreateTimer(1.050, ClientCmd,"sc_strafe_yaw -162");
    CreateTimer(1.000, ClientCmd,"sc_st_setangles 0 -90 120");
    CreateTimer(1.600, ClientCmd,"-sc_ducktap");
    CreateTimer(1.550, ClientCmd,"sc_strafe_yaw -90");
    CreateTimer(1.600, ClientCmd,"+jump");
    CreateTimer(1.920, ClientCmd,"setang -25 90");
    CreateTimer(1.925, ClientCmd,"+attack2");
    CreateTimer(1.930, ClientCmd,"weapon_satchel");
    CreateTimer(1.935, ClientCmd,"setang 0 -90");
    CreateTimer(2.000, ClientCmd,"-attack2");
    CreateTimer(2.450, ClientCmd,"sc_strafe_yaw -45");
    CreateTimer(2.450, ClientCmd,"gibme");
    CreateTimer(2.500, ClientCmd,"sc_st_setangles 28.525000 -45.274658 120");
    CreateTimer(3.320, ClientCmd,"+use");
    CreateTimer(3.700, ClientCmd,"-jump");
    CreateTimer(3.400, ClientCmd,"-use");
    CreateTimer(3.700, ClientCmd,"sc_strafe 0");
    CreateTimer(3.500, ClientCmd,"setang 66 -17");
    CreateTimer(3.600, ClientCmd,"+attack2");
    CreateTimer(4.200, ClientCmd,"-attack2");
    CreateTimer(5.530, ClientCmd,"+attack");
    CreateTimer(5.550, ClientCmd,"weapon_handgrenade");
    CreateTimer(5.660, ClientCmd,"-attack");
    CreateTimer(6.000, ClientCmd,"sc_st_setangles 0 179 120");
    CreateTimer(6.210, ClientCmd,"sc_strafe_yaw -170");
    CreateTimer(6.454, ClientCmd,"-duck");
    CreateTimer(6.720, ClientCmd,"-jump");
    CreateTimer(6.720, ClientCmd,"+sc_ducktap");
    CreateTimer(7.200, ClientCmd,"sc_st_setangles 0 90 120");
    CreateTimer(7.300, ClientCmd,"-sc_ducktap");
    CreateTimer(7.300, ClientCmd,"+jump");
    CreateTimer(7.400, ClientCmd,"sc_strafe_yaw 90");
    CreateTimer(7.400, ClientCmd,"sc_strafe_type 1");
    CreateTimer(7.850, ClientCmd,"sc_strafe_yaw 77");
    CreateTimer(7.850, ClientCmd,"sc_st_setangles 48 77 200");
    CreateTimer(8.200, ClientCmd,"sc_strafe_type 0");
    CreateTimer(8.800, ClientCmd,"sc_strafe_yaw 60");
    CreateTimer(8.900, ClientCmd,"gibme");
    CreateTimer(9.300, ClientCmd,"sc_strafe_type 1");
    CreateTimer(9.310, ClientCmd,"sc_strafe_yaw -93");
    CreateTimer(9.330, ClientCmd,"+use");
    CreateTimer(9.300, ClientCmd,"+attack");
    CreateTimer(9.400, ClientCmd,"-use");
    CreateTimer(9.310, ClientCmd,"sc_strafe_yaw -91");
    CreateTimer(9.800, ClientCmd,"sc_st_setangles 0 -90 200");
    CreateTimer(9.760, ClientCmd,"sc_strafe_type 1");
    CreateTimer(10.100, ClientCmd,"sc_strafe_yaw 165");
    CreateTimer(10.700, ClientCmd,"-jump");
    CreateTimer(10.700, ClientCmd,"sc_strafe_yaw -90");
    CreateTimer(11.125, ClientCmd,"sc_strafe 0");
    CreateTimer(11.170, ClientCmd,"+back");
    CreateTimer(11.310, ClientCmd,"-back");
    CreateTimer(11.319, ClientCmd,"sc_st_setangles -2 90 120");
    CreateTimer(12.000, ClientCmd,"sc_strafe_type 0")
    CreateTimer(12.000, ClientCmd,"sc_strafe 1");
    CreateTimer(12.000, ClientCmd,"sc_strafe_yaw 90");
    CreateTimer(12.200, ClientCmd,"+jump");
    CreateTimer(12.500, ClientCmd,"sc_strafe_yaw 26");
    CreateTimer(12.500, ClientCmd,"sc_st_setangles 0 0 120");
    CreateTimer(13.030, ClientCmd,"+duck");
    CreateTimer(13.500, ClientCmd,"-attack");
    CreateTimer(13.425, ClientCmd,"sc_strafe_yaw -10");
    CreateTimer(13.550, ClientCmd,"-duck");
    CreateTimer(15.870, ClientCmd,"+attack");
    CreateTimer(14.625, ClientCmd,"sc_strafe_yaw 6");
    CreateTimer(15.065, ClientCmd,"sc_st_setangles 0 90 120");
    CreateTimer(15.065, ClientCmd,"sc_strafe_yaw 90");
    CreateTimer(15.750, ClientCmd,"sc_st_setangles 0 0 120");
    CreateTimer(15.600, ClientCmd,"sc_strafe_type 1")
    CreateTimer(15.750, ClientCmd,"sc_strafe_yaw 0");
    CreateTimer(16.160, ClientCmd,"sc_strafe_type 0")
    CreateTimer(16.350, ClientCmd,"sc_strafe_yaw -20");
    CreateTimer(16.870, ClientCmd,"sc_strafe_yaw 0");
    CreateTimer(18.500, ClientCmd,"sc_st_setangles 0 91 120");
    CreateTimer(18.500, ClientCmd,"sc_strafe_yaw 86");
    CreateTimer(19.250, ClientCmd,"-attack");
    CreateTimer(19.255, ClientCmd,"weapon_shotgun");
    CreateTimer(18.890, ClientCmd,"+duck");
    CreateTimer(19.000, ClientCmd,"-duck");
    CreateTimer(19.610, ClientCmd,"sc_strafe_yaw 155");
    CreateTimer(19.610, ClientCmd,"sc_st_setangles 0 179 120");
    CreateTimer(19.930, ClientCmd,"sc_strafe_yaw 179");
    CreateTimer(19.900, ClientCmd,"sc_st_setangles -2 -150 80");
    CreateTimer(20.290, ClientCmd,"sc_strafe_yaw -90");
    CreateTimer(20.365, ClientCmd,"+duck");
    CreateTimer(20.500, ClientCmd,"-duck");
    CreateTimer(20.600, ClientCmd,"gibme");
    CreateTimer(20.760, ClientCmd,"gibme");
    CreateTimer(20.850, ClientCmd,"+attack2");
    CreateTimer(20.850, ClientCmd,"sc_st_setangles 0 -90 120");
    CreateTimer(20.855, ClientCmd,"weapon_9mmAR");
    CreateTimer(20.950, ClientCmd,"-attack2");
    CreateTimer(20.920, ClientCmd,"sc_strafe_yaw -177");
    CreateTimer(21.004, ClientCmd,"+duck");
    CreateTimer(21.204, ClientCmd,"-duck");
    CreateTimer(22.460, ClientCmd,"sc_strafe_yaw 90");
    CreateTimer(22.500, ClientCmd,"+attack2");
    CreateTimer(22.510, ClientCmd,"setang 0 90");
    CreateTimer(22.550, ClientCmd,"-attack2");
   
end

function OnFireTargets( targetname, activator, caller, usetype, value, delay )
    if ( targetname == "bigaccessdoor" ) then
        CreateTimer(0.000, ClientCmd,"sc_strafe 1");
        CreateTimer(0.000, ClientCmd,"sc_strafe_yaw 132");
        CreateTimer(0.150, ClientCmd,"sc_st_setangles 0 133 120");
        CreateTimer(0.040, ClientCmd,"+jump");
        CreateTimer(0.045, ClientCmd,"+duck");
    end

    -- printl( "OnFireTargets :: " .. targetname .. " : " .. value .. " : " .. delay );
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
        if ( sPlayerName == "ialex" ) then
            pPlayerEdict.vars.origin = Vector( -560, 500, 40 );
            pPlayerEdict.vars.angles = Vector( 0.000000, -90.000000, 0.000000 );
        elseif ( sPlayerName == "QEES" ) then
            pPlayerEdict.vars.origin = Vector( 122, 736, -280 ); 
            pPlayerEdict.vars.angles = Vector( -2, 173, 0);
        end
    end
end


function PrintTime()
    PrintChatText( string.format( "%.3f (IM frames: %d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

SpeedrunInit();
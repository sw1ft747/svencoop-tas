connected = false;
spawned = false;
start_time = 0.0;
spawns_state = 0

function SpeedrunInit()
    SetTimescale( 0.75 );

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

    --CreateTimer(0.000, ClientCmd,"sc_im_record of3a6");
    --CreateTimer(0.000, ClientCmd,"sc_im_play of3a6");
    CreateTimer(0.000, ClientCmd,"sc_strafe 1");
    CreateTimer(0.000, ClientCmd,"weapon_displacer");
    CreateTimer(0.000, ClientCmd,"+attack2");
    CreateTimer(0.000, ClientCmd,"sc_st_setangles -90 90 420");
    CreateTimer(1.490, ClientCmd,"weapon_9mmAR");
    CreateTimer(1.490, ClientCmd,"sc_st_setangles_stop");
    CreateTimer(1.490, ClientCmd,"setang 40 -90 0.000000");
    CreateTimer(1.490, ClientCmd,"sc_strafe_yaw 80");
    CreateTimer(1.490, ClientCmd,"+jump");
    CreateTimer(1.805, ClientCmd,"+duck");
    CreateTimer(2.100, ClientCmd,"-attack2");
    CreateTimer(2.020, ClientCmd,"setang 0 80 0.000000");
    CreateTimer(2.020, ClientCmd,"weapon_displacer");
    CreateTimer(2.095, ClientCmd,"-duck");
    CreateTimer(3.380, ClientCmd,"setang 0 -90 0.000000");
    CreateTimer(3.380, ClientCmd,"sc_strafe_yaw 42");
    CreateTimer(3.395, ClientCmd,"sc_strafe_ignore_ground 0");
    CreateTimer(3.380, ClientCmd,"-jump");
    CreateTimer(3.840, ClientCmd,"sc_strafe 0");
    CreateTimer(4.375, ClientCmd,"+moveleft");
    CreateTimer(4.410, ClientCmd,"-moveleft");
    CreateTimer(4.500, ClientCmd,"sc_strafe_yaw -90");
    CreateTimer(5.140, ClientCmd,"gibme");
    CreateTimer(5.140, ClientCmd,"gibme");
    CreateTimer(5.140, ClientCmd,"gibme");
    CreateTimer(5.150, ClientCmd,"sc_strafe 1");
    CreateTimer(5.500, ClientCmd,"+sc_ducktap");
    CreateTimer(5.670, ClientCmd,"sc_strafe_yaw -88");
    CreateTimer(5.960, ClientCmd,"+back");
    CreateTimer(6.000, ClientCmd,"-sc_ducktap");
    CreateTimer(6.245, ClientCmd,"sc_strafe 0");
    CreateTimer(6.245, ClientCmd,"sc_strafe_yaw 113");
    CreateTimer(6.245, ClientCmd,"-back");
    CreateTimer(6.245, ClientCmd,"setang 0 0 0.000000");
    CreateTimer(6.540, ClientCmd,"+forward");
    CreateTimer(6.695, ClientCmd,"+attack");
    CreateTimer(6.815, ClientCmd,"-attack");
    CreateTimer(6.915, ClientCmd,"setang -35 15 0.000000");
    CreateTimer(7.715, ClientCmd,"setang -73 38 0.000000");
    CreateTimer(7.775, ClientCmd,"weapon_9mmAR");
    CreateTimer(8.100, ClientCmd,"setang -90 90 0.000000");
    CreateTimer(8.240, ClientCmd,"gibme");
    CreateTimer(8.240, ClientCmd,"gibme");
    CreateTimer(8.240, ClientCmd,"gibme");
    CreateTimer(8.240, ClientCmd,"gibme");
    CreateTimer(8.300, ClientCmd,"setang -45 -90 0.000000");
    CreateTimer(8.310, ClientCmd,"+attack2");
    CreateTimer(8.380, ClientCmd,"sc_strafe 1");
    CreateTimer(8.340, ClientCmd,"-forward");
    CreateTimer(8.390, ClientCmd,"+duck");
    CreateTimer(8.460, ClientCmd,"setang 0 90 0.000000");
    CreateTimer(8.500, ClientCmd,"-attack2");
    CreateTimer(8.505, ClientCmd,"-duck");
    CreateTimer(8.505, ClientCmd,"+jump");
    CreateTimer(8.950, ClientCmd,"sc_strafe_yaw 90");
    CreateTimer(9.000, ClientCmd,"gibme");
    CreateTimer(9.000, ClientCmd,"gibme");
    CreateTimer(9.000, ClientCmd,"gibme");
    CreateTimer(9.035, ClientCmd,"+duck");
    CreateTimer(9.105, ClientCmd,"-duck");
    CreateTimer(8.970, ClientCmd,"sc_strafe_type 1");
    CreateTimer(9.300, ClientCmd,"sc_strafe_yaw 97");
    CreateTimer(9.385, ClientCmd,"+duck");
    CreateTimer(9.465, ClientCmd,"-duck");
    CreateTimer(9.500, ClientCmd,"setang -25 -90 0.000000");
    CreateTimer(9.520, ClientCmd,"+attack2");
    CreateTimer(9.530, ClientCmd,"setang 0 90 0.000000");
    CreateTimer(9.550, ClientCmd,"-attack2");

    --[[CreateTimer(8.500, ClientCmd,"sc_im_stop");]]
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
            pPlayerEdict.vars.origin = Vector( -128, 1, 39 );
            pPlayerEdict.vars.angles = Vector( 0.000000, 90.000000, 0.000000 );
        elseif ( sPlayerName == "QEES" ) then
            pPlayerEdict.vars.origin = Vector( -2429, 2191, -264 ); 
            pPlayerEdict.vars.angles = Vector( 0.000000, 0.000000, 0.000000 );
        end
    end
end



function PrintTime()
    PrintChatText( string.format( "%.3f (IM frames: %d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

SpeedrunInit();
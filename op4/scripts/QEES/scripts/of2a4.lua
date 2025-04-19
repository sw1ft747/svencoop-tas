connected = false;
spawned = false;
start_time = 0.0;
spawns_state = 0

function SpeedrunInit()
    SetTimescale( 0.75 );

    RemoveAllTimers();

    ClientCmd(" sc_st_disable_spread 1; default_fov 100; -sc_ducktap; -jump; -duck; -forward; -back; -moveleft; -moveright; sc_strafe 0; sc_strafe_yaw \"\"; sc_strafe_ignore_ground 1; -attack; sc_im_stop");
    ClientCmd("sc_strafe_type 0; sc_strafe_dir 3; sc_st_setangles_stop; sc_ducktap_adjust_fps 0; sc_jumpbug_legit 0; sc_autojump_inconsistent 0; sc_strafe_vectorial_increment 0; fps_max 200; mp_classic_mode 1; clockwindow 0");
    
end

function SpeedrunStart()
    SpeedrunStartCustom();
    -- connected = true;
end

function SpeedrunStartCustom()
    start_time = SegmentCurrentTime();

    --CreateTimer(0.000, ClientCmd,"sc_im_record of2a4");
    --CreateTimer(0.000, ClientCmd,"sc_im_play of2a4");

    --CreateTimer(0.000, ClientCmd,"sc_im_experimental 1");
    --CreateTimer(2.800, ClientCmd,".tas_bm_spawnbot");
    --CreateTimer(2.800, ClientCmd,".tas_bm_startbot");

    --CreateTimer(0.000, ClientCmd,"sc_spam_use");
    CreateTimer(0.000, ClientCmd,"sc_strafe_ignore_ground 0");
    CreateTimer(0.000, ClientCmd,"sc_strafe_type 0");
    CreateTimer(0.000, ClientCmd,"setang 35 -16")
    CreateTimer(0.000, ClientCmd,"weapon_9mmAR");
    CreateTimer(0.010, ClientCmd,"dropsecammo");
    CreateTimer(0.020, ClientCmd,"drop");
    CreateTimer(0.020, ClientCmd,"kill");
    CreateTimer(0.020, EnableSurvivalMode );
    CreateTimer(0.240, DisableSurvivalMode );
    CreateTimer(0.260, ClientCmd,"weapon_9mmAR");
    CreateTimer(0.270, ClientCmd,"drop");
    CreateTimer(0.260, ClientCmd,"sc_strafe_yaw -6");
    CreateTimer(0.280, ClientCmd,"weapon_handgrenade");
    CreateTimer(0.410, ClientCmd,"sc_strafe 1");
    CreateTimer(0.720, ClientCmd,"setang 54.449 164.882 0.000");
    CreateTimer(0.722, ClientCmd,"+use");
    CreateTimer(0.725, ClientCmd,"sc_st_setangles 0 -90 120");
    CreateTimer(0.725, ClientCmd,"+jump");
    CreateTimer(1.060, ClientCmd,"sc_strafe_yaw -99");
    CreateTimer(1.060, ClientCmd,"-use");
    CreateTimer(1.080, ClientCmd,"gibme");
    CreateTimer(1.740, ClientCmd,"+attack");
    CreateTimer(1.600, ClientCmd,"sc_st_setangles 0 0 120");
    CreateTimer(1.570, ClientCmd,"+duck");
    CreateTimer(1.670, ClientCmd,"-duck");
    CreateTimer(1.930, ClientCmd,"sc_strafe_yaw -70");
    CreateTimer(1.980, ClientCmd,"+duck");
    CreateTimer(2.000, ClientCmd,"sc_strafe_type 1");
    CreateTimer(2.070, ClientCmd,"-duck");
    CreateTimer(2.090, ClientCmd,"gibme");
    CreateTimer(2.090, ClientCmd,"gibme");
    CreateTimer(2.100, ClientCmd,"sc_strafe_yaw 10");
    CreateTimer(2.095, ClientCmd,"gibme");
    CreateTimer(2.100, ClientCmd,"gibme");
    CreateTimer(2.120, ClientCmd,"+duck");
    CreateTimer(2.290, ClientCmd,"-duck");
    CreateTimer(2.450, ClientCmd,"-jump");
    CreateTimer(2.450, ClientCmd,"+sc_ducktap");
    CreateTimer(2.450, ClientCmd,"sc_strafe_type 0");
    CreateTimer(2.900, ClientCmd,"-sc_ducktap");
    CreateTimer(3.100, ClientCmd,"sc_strafe_yaw 179");
    CreateTimer(3.100, ClientCmd,"-back");
    CreateTimer(3.257, ClientCmd,"+forward");
    CreateTimer(3.400, ClientCmd,"sc_strafe_yaw 2");
    CreateTimer(3.400, ClientCmd,"-forward");
    CreateTimer(3.730, ClientCmd,"+jump");
    CreateTimer(3.935, ClientCmd,"sc_strafe_yaw -30");
    CreateTimer(3.925, ClientCmd,"sc_st_setangles 0 -90 120");
    CreateTimer(4.500, ClientCmd,"sc_strafe_yaw -90");
    CreateTimer(4.710, ClientCmd,"+back");
    CreateTimer(4.720, ClientCmd,"-jump");
    CreateTimer(5.200, ClientCmd,"-back");
    CreateTimer(5.200, ClientCmd,"+forward");
    CreateTimer(5.250, ClientCmd,"-forward");
    CreateTimer(5.250, ClientCmd,"sc_st_setangles 0 -58 120");
    CreateTimer(5.660, ClientCmd,"+sc_ducktap");
    CreateTimer(5.660, ClientCmd,"sc_strafe_yaw -58");
    CreateTimer(5.740, ClientCmd,"-attack");
    CreateTimer(5.745, ClientCmd,"sc_st_setangles 0 -120 120");
    CreateTimer(5.750, ClientCmd,"weapon_9mmAR");
    CreateTimer(6.480, ClientCmd,"+attack2");
    CreateTimer(6.500, ClientCmd,"sc_strafe_yaw 40");
    CreateTimer(6.500, ClientCmd,"setang 0 40");
    CreateTimer(6.500, ClientCmd,"sc_st_setangles 0 0 120");
    CreateTimer(6.530, ClientCmd,"-attack2");
    CreateTimer(6.600, ClientCmd,"sc_strafe_yaw 70");
    CreateTimer(6.550, ClientCmd,"sc_strafe_type 1");
    CreateTimer(6.805, ClientCmd,"+jump");
    CreateTimer(6.805, ClientCmd,"sc_strafe_yaw 0");
    CreateTimer(6.805, ClientCmd,"sc_strafe_type 0");
   
end

function OnFireTargets( targetname, activator, caller, usetype, value, delay )
    if ( targetname == "adoor03" ) then
        --CreateTimer( 2.4, ClientCmd, "sc_im_record of1a3_next");
        --CreateTimer( 2.4, ClientCmd, "sc_im_play of1a3_next");
        CreateTimer( 0.0, ClientCmd,"+back");
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
            pPlayerEdict.vars.origin = Vector( -128, 1, 39 );
            pPlayerEdict.vars.angles = Vector( 0.000000, 90.000000, 0.000000 );
        elseif ( sPlayerName == "QEES" ) then
            pPlayerEdict.vars.origin = Vector( -1324, 513, 40 ); 
            pPlayerEdict.vars.angles = Vector( -6, -22, 0 );
        end
    end
end


function PrintTime()
    PrintChatText( string.format( "%.3f (IM frames: %d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

SpeedrunInit();
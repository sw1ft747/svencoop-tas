connected = false;
spawned = false;
start_time = 0.0;
spawns_state = 0

function SpeedrunInit()
    SetTimescale( 0.25 );

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

    CreateTrigger("1", Vector(-459.594, 1888.844, -868.000), Vector(0, 0, -97.562), Vector(40.000, 48.188, 0));

    --CreateTimer(0.000, ClientCmd,"sc_im_record of2a1bvoid");
    --CreateTimer(0.000, ClientCmd,"sc_im_play of2a1b2");

    --CreateTimer(0.000, ClientCmd,"sc_im_experimental 1");
    --CreateTimer(0.000, ClientCmd,".tas_bm_spawnbot");
    --CreateTimer(0.100, ClientCmd,".tas_bm_startbot");
    

    --CreateTimer(1.000, ClientCmd,".tas_c05a3_spawnbot");
    --CreateTimer(1.400, ClientCmd,".tas_c05a3_suicide");

    --CreateTimer( 0.60, DisableSurvivalMode );
    --CreateTimer( 0.65, EnableSurvivalMode );
    CreateTimer(0.0, ClientCmd, "sc_im_record of2a1b123");
    CreateTimer(0.0, ClientCmd,"weapon_medkit;sc_st_legit_mode 1");

    --part 1

    --[[CreateTimer(0.1, ClientCmd,"sc_strafe 1");
    CreateTimer(0.1, ClientCmd,"sc_strafe_ignore_ground 0");
    CreateTimer(0.1, ClientCmd,"sc_strafe_yaw 90");
    CreateTimer(0.1, ClientCmd,"sc_st_setangles 0 0 120");
    CreateTimer(0.500, ClientCmd,"sc_strafe_yaw 10");
    CreateTimer(0.365, ClientCmd,"gibme");
    CreateTimer(0.500, ClientCmd,"gibme");
    CreateTimer(0.500, ClientCmd,"gibme");
    CreateTimer(0.500, ClientCmd,"gibme");
    CreateTimer(0.500, ClientCmd,"gibme");
    CreateTimer(0.900, ClientCmd,"gibme");
    CreateTimer(0.80, ClientCmd,"sc_st_setangles 15 60 120");
    --CreateTimer(1.122, ClientCmd,"+attack");
    --CreateTimer(1.130, ClientCmd,"weapon_shotgun");
    CreateTimer(1.300, ClientCmd,"-attack");
    CreateTimer(1.300, ClientCmd,"sc_strafe_yaw 100");
    CreateTimer(1.300, ClientCmd,"-jump");
    CreateTimer(1.300, ClientCmd,"+sc_ducktap");
    CreateTimer(1.650, ClientCmd,"+duck");
    CreateTimer(1.650, ClientCmd,"+jump");
    CreateTimer(1.800, ClientCmd,"sc_st_setangles 23 34 120");
    CreateTimer(2.100, ClientCmd,"sc_strafe_yaw 90");
    CreateTimer(2.190, ClientCmd,"sc_strafe_yaw 0");
   -- CreateTimer(2.255, ClientCmd,"+attack2");
    --CreateTimer(2.260, ClientCmd,"weapon_9mmhandgun");
    CreateTimer(2.255, ClientCmd,"sc_st_setangles 0 0 120");
    --CreateTimer(2.265, ClientCmd,"-attack2");
    CreateTimer(2.540, ClientCmd,"gibme");
    CreateTimer(2.500, ClientCmd,"-sc_ducktap");
    CreateTimer(2.740, ClientCmd,"sc_strafe_yaw -80");
    CreateTimer(2.630, ClientCmd,"gibme");
    CreateTimer(2.650, ClientCmd,"+back");
    CreateTimer(2.720, ClientCmd,"-back");
    CreateTimer(3.1, ClientCmd,"-duck");
    CreateTimer(3.1, ClientCmd,"sc_strafe_yaw 0");
    CreateTimer(3.1, ClientCmd,"-jump");
    CreateTimer(3.330, ClientCmd,"+jump");
    CreateTimer(4.145, ClientCmd,"sc_strafe_yaw 90");
    CreateTimer(4.145, ClientCmd,"sc_st_setangles 0 90 120");
    CreateTimer(4.500, ClientCmd,"sc_st_setangles 0 -179 120");
    CreateTimer(5.370, ClientCmd,"gibme");
    CreateTimer(5.300, ClientCmd,"sc_strafe_yaw -179"); 
    CreateTimer(5.400, ClientCmd,"-jump");
    CreateTimer(5.839, ClientCmd,"gibme");
    CreateTimer(5.900, ClientCmd,"sc_strafe_yaw \"\"");
    --CreateTimer(5.969, ClientCmd,"gibme");
    --CreateTimer(6.149, ClientCmd,"sc_strafe_yaw -130");
    CreateTimer(7.150, ClientCmd,"sc_strafe_yaw \"\"");
    --CreateTimer(6.690, ClientCmd,"+duck");
    --CreateTimer(6.738, ClientCmd,"kill");
    --[[CreateTimer(6.800, ClientCmd,"-duck");
    CreateTimer(6.800, ClientCmd,"-duck");
    CreateTimer(7.459, ClientCmd,"+back");
    CreateTimer(7.300, ClientCmd,"fps_max 20");
    CreateTimer(7.300, ClientCmd,"sc_strafe 0");
    CreateTimer(7.400, ClientCmd,"sc_im_stop");
    CreateTimer(7.800, ClientCmd,"sc_strafe_yaw \"\"");
    CreateTimer(7.800, ClientCmd,"-back");
    CreateTimer(7.800, ClientCmd,"setang 0 90 0");
    CreateTimer(8.700, ClientCmd,"sc_st_timescale 0.1");
    CreateTimer(8.900, ClientCmd,"fps_max 200");
    CreateTimer(9.000, ClientCmd,"reviveme");]]

    --part 2

    --[[CreateTimer(0.0, ClientCmd,"sc_strafe 1");
    CreateTimer(0.0, ClientCmd,"weapon_eagle");
    CreateTimer(0.0, ClientCmd,"sc_strafe_ignore_ground 0");
    CreateTimer(0.0, ClientCmd,"sc_strafe_yaw 90");
    CreateTimer(0.350, ClientCmd,"sc_strafe_yaw 0");
    CreateTimer(0.0, ClientCmd,"sc_st_setangles 0 0 120");
    CreateTimer(0.0, ClientCmd,"+jump");
    CreateTimer(0.350, ClientCmd,"sc_strafe_yaw -30");
    CreateTimer(1.070, ClientCmd,"sc_strafe_yaw 0");
    CreateTimer(1.075, ClientCmd,"+duck");
    CreateTimer(1.240, ClientCmd,"-duck");
    CreateTimer(1.500, ClientCmd,"sc_strafe_yaw -12");
    CreateTimer(1.685, ClientCmd,"setang 15.144355 -16.116943 0.000000");
    CreateTimer(1.685, ClientCmd,"+attack2");
    CreateTimer(1.690, ClientCmd,"setang 0 0 0");
    CreateTimer(1.690, ClientCmd,"-attack2");
    CreateTimer(2.310, ClientCmd,"sc_strafe_yaw -5");
    CreateTimer(2.310, ClientCmd,"sc_st_setangles 20 -35 120");
    CreateTimer(2.690, ClientCmd,"+duck");
    CreateTimer(2.855, ClientCmd,"-duck");
    CreateTimer(3.060, ClientCmd,"+duck");
    CreateTimer(3.830, ClientCmd,"-duck");
    CreateTimer(3.870, ClientCmd,"sc_strafe_yaw -32");
    CreateTimer(2.310, ClientCmd,"sc_st_setangles 20 -37 120");
    CreateTimer(4.035, ClientCmd,"+duck");
    CreateTimer(4.200, ClientCmd,"+back");
    CreateTimer(4.310, ClientCmd,"-back");
    CreateTimer(4.255, ClientCmd,"+attack2");
    CreateTimer(4.255, ClientCmd,"sc_st_setangles 0 0 120");
    CreateTimer(4.265, ClientCmd,"-attack2");
    CreateTimer(4.620, ClientCmd,"sc_strafe_yaw -52");
    CreateTimer(4.700, ClientCmd,"sc_strafe_yaw 0");]]

end


function OnTouchTrigger( name )
    if ( name == "1" ) then
        --CreateTimer(0.00, ClientCmd,"setpos -434.093750 1913.562500 -868.468750");
        CreateTimer(0.0, ClientCmd,"weapon_shotgun");
        CreateTimer(0.000, ClientCmd,"sc_im_play of2a1b_2V2");
        --СТАРТ НА 9 СЕКУНДЕ
        --[[CreateTimer(0.000, ClientCmd,"sc_im_record of2a1b_2V2");
        CreateTimer(0.0, ClientCmd,"sc_strafe 1");
        CreateTimer(0.0, ClientCmd,"weapon_shotgun");
        CreateTimer(0.0, ClientCmd,"sc_strafe_ignore_ground 0");
        CreateTimer(0.0, ClientCmd,"sc_strafe_yaw 90");
        CreateTimer(0.0, ClientCmd,"sc_st_setangles 0 0 120");
        CreateTimer(0.0, ClientCmd,"+jump");
        CreateTimer(0.350, ClientCmd,"sc_strafe_yaw -40");
        CreateTimer(0.500, ClientCmd,"+duck");
        CreateTimer(0.700, ClientCmd,"-duck");
        CreateTimer(0.986, ClientCmd,"+duck");
        CreateTimer(0.986, ClientCmd,"sc_strafe_yaw 0");
        CreateTimer(1.100, ClientCmd,"-duck");
        CreateTimer(1.500, ClientCmd,"sc_strafe_yaw -13");
        CreateTimer(1.980, ClientCmd,"setang 19 -18 0");
        CreateTimer(1.982, ClientCmd,"+attack");
        CreateTimer(2.000, ClientCmd,"setang 0 0 0");
        CreateTimer(2.002, ClientCmd,"-attack");
        CreateTimer(2.602, ClientCmd,"-jump");
        CreateTimer(2.602, ClientCmd,"+sc_ducktap");
        CreateTimer(3.159, ClientCmd,"sc_strafe_yaw \"\"");
        CreateTimer(3.159, ClientCmd,"sc_st_setangles_stop");]]
        

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
        pPlayerEdict.vars.origin = Vector( -433.718750, 1913.562500, -888.156250 );
    end
end

function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
    printl( "OnPlayerSpawn()" );

    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) .. ", viewangles: " .. tostring(pPlayerEdict.vars.angles) .. "" );

    local sPlayerName = pPlayerEdict.vars.netname;

    if ( spawns_state == 0 ) then
        if ( sPlayerName == "QEES" ) then
            pPlayerEdict.vars.origin = Vector( -1029, 431, -614 );
            pPlayerEdict.vars.angles = Vector( 0.000000, 90.000000, 0.000000 );
        elseif ( sPlayerName == "void" ) then
            pPlayerEdict.vars.origin = Vector( -1100, 646, -632 );
            pPlayerEdict.vars.angles = Vector( 0, 90, 0 );
        elseif ( sPlayerName == "BotSkipper" ) then
            pPlayerEdict.vars.origin = Vector( -1029, 431, -614 );
            pPlayerEdict.vars.angles = Vector( 0, 90, 0 );
        end
    end
end


function PrintTime()
    PrintChatText( string.format( "%.3f (IM frames: %d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

SpeedrunInit();
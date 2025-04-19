connected = false;
spawned = false;
start_time = 0.0;
spawns_state = 0

function SpeedrunInit()
    SetTimescale( 0.25 );

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

    --CreateTimer(0.000, ClientCmd,"sc_im_record of1a3b");
    --CreateTimer(0.000, ClientCmd,"sc_im_play of1a3");

    --CreateTimer(0.000, ClientCmd,"sc_im_play of1a3bot");

    --CreateTimer(0.300, ClientCmd,".tas_bm_spawnbot");
    --CreateTimer(0.300, ClientCmd,".tas_bm_startbot");
    CreateTrigger("1", Vector(-101.906, -718.531, 23.594), Vector(0, 0, 0), Vector(200.500, 88.625, 142.875));

    CreateTrigger("2", Vector(94.781, -16.625, -2.156), Vector(0, 0, 0), Vector(40.469, 30.281, 82.438));

    CreateTimer( 0.90, DisableSurvivalMode );
    CreateTimer( 0.95, EnableSurvivalMode );
    
    CreateTimer(0.000, ClientCmd,"sc_strafe 1");

    CreateTimer(0.000, ClientCmd,"sc_st_setangles 0 -90 100");
    CreateTimer(0.000, ClientCmd,"sc_strafe 1");
    CreateTimer(0.000, ClientCmd,"sc_strafe_yaw -180");
    CreateTimer(0.000, ClientCmd,"sc_strafe_ignore_ground 0");
    CreateTimer(0.180, ClientCmd,"sc_strafe_yaw -115");
    CreateTimer(0.250, ClientCmd,"+jump");
    CreateTimer(0.524, ClientCmd,"sc_st_setangles 50 90 200");
    CreateTimer(1.190, ClientCmd,"sc_strafe_yaw -180");
    CreateTimer(1.600, ClientCmd,"sc_strafe_yaw 90");
    CreateTimer(1.400, ClientCmd,"-jump");
    CreateTimer(1.400, ClientCmd,"+duck");
    CreateTimer(1.460, ClientCmd,"-duck");
    CreateTimer(1.830, ClientCmd,"sc_strafe 0");
    CreateTimer(1.900, ClientCmd,"+back");
    CreateTimer(2.050, ClientCmd,"-back");
    CreateTimer(2.080, ClientCmd,"sc_strafe 1");
    CreateTimer(2.070, ClientCmd,"sc_st_setangles 0 90 140");
    CreateTimer(2.140, ClientCmd,"sc_strafe_yaw 108");
    CreateTimer(2.660, ClientCmd,"sc_jumpbug_legit 1");
    CreateTimer(2.860, ClientCmd,"sc_jumpbug_legit 0");
    CreateTimer(2.910, ClientCmd,"sc_strafe_yaw 90");
    CreateTimer(3.715, ClientCmd,"+jump");
    CreateTimer(3.870, ClientCmd,"sc_strafe_yaw 0");
    CreateTimer(3.870, ClientCmd,"sc_st_setangles 17 26 100");
    CreateTimer(4.700, ClientCmd,"sc_strafe_yaw 90");
    CreateTimer(4.540, ClientCmd,"sc_st_setangles 0 90 100");
    CreateTimer(5.320, ClientCmd,"sc_st_setangles 0 165 100");
    CreateTimer(5.335, ClientCmd,"+duck");
    CreateTimer(5.360, ClientCmd,"-duck");
    CreateTimer(5.360, ClientCmd,"sc_strafe_yaw 165");
    CreateTimer(6.650, ClientCmd,"sc_strafe_yaw 90");
    CreateTimer(6.650, ClientCmd,"sc_st_setangles 0 90 100");
    CreateTimer(7.100, ClientCmd,"-jump");
    CreateTimer(7.100, ClientCmd,"+sc_ducktap");
    CreateTimer(7.200, ClientCmd,"-sc_ducktap");
    CreateTimer(7.200, ClientCmd,"+jump");
    CreateTimer(7.400, ClientCmd,"sc_strafe_yaw 65");
    CreateTimer(8.500, ClientCmd,"sc_im_stop");

end


function OnTouchTrigger( name )
    if ( name == "1" ) then
        spawns_state = 1;
    elseif (name == "2") then

        spawns_state = 2;
        
        --movement for suicide
        CreateTimer( 0.0, ClientCmd, "sc_im_play of1a3_next2");

    elseif (name == "3") then
        spawns_state = 3;
    end

    return true;
end

function OnFireCrossbowSpread(entity, entindex)
    return true, 1.0, true, 1.0;
end

function OnFireTargets( targetname, activator, caller, usetype, value, delay )
    if ( targetname == "init_master_mgr" ) then
        CreateTimer( 2.0, ClientCmd, "sc_st_timescale 0.1" );
        CreateTimer( 2.0, ClientCmd, "say 1 s" );
        CreateTimer( 1.0, ClientCmd, "say 2 s" );
        CreateTimer( 0.0, ClientCmd, "say 3 s" );
    end

    -- printl( "OnFireTargets :: " .. targetname .. " : " .. value .. " : " .. delay );
end

function OnClientKill( pPlayerEdict )
    printl( "OnClientKill( " .. tostring( pPlayerEdict.vars.netname ) .. " )" );

    if ( pPlayerEdict.vars.netname == "BotSkipper" ) then
   
        CreateTimer( 0.1, ClientCmd, "fps_max 20" );
        CreateTimer( 0.1, ClientCmd, "sc_st_timescale 0.1" );

    end
end

function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
    printl( "OnPlayerSpawn()" );

    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) .. ", viewangles: " .. tostring(pPlayerEdict.vars.angles) .. "" );

    local sPlayerName = pPlayerEdict.vars.netname;

    if ( spawns_state == 0 ) then
        if ( sPlayerName == "BotSkipper" ) then
            pPlayerEdict.vars.origin = Vector( 1066, -1863, 872 );
            pPlayerEdict.vars.angles = Vector( 0.000000, 180.000000, 0.000000 );
        elseif ( sPlayerName == "kolokola777" ) then
            pPlayerEdict.vars.origin = Vector( 980, -1859, 872 ); 
            pPlayerEdict.vars.angles = Vector( 0.000000, 180.000000, 0.000000 );
        elseif ( sPlayerName == "QEES" ) then
            pPlayerEdict.vars.origin = Vector( 1133, -1869, 872 ); 
            pPlayerEdict.vars.angles = Vector( 0.000000, 180.000000, 0.000000 );
        elseif ( sPlayerName == "ialex" ) then
                pPlayerEdict.vars.origin = Vector( 980, -1859, 872 ); 
                pPlayerEdict.vars.angles = Vector( 0.000000, 180.000000, 0.000000 );
        end
    elseif ( spawns_state == 1 ) then -- спавн после
        if ( sPlayerName == "kolokola777" ) then    
            pPlayerEdict.vars.origin = Vector( -128, 1, 39 );
            pPlayerEdict.vars.angles = Vector( 0.000000, 90.000000, 0.000000 );
        elseif ( sPlayerName == "BotSkipper" ) then
            pPlayerEdict.vars.origin = Vector( -116, -82, 39 ); 
            pPlayerEdict.vars.angles = Vector( 0.000000, 90.000000, 0.000000 );
        elseif ( sPlayerName == "QEES" ) then
            pPlayerEdict.vars.origin = Vector( 116, 4, 40 ); 
            pPlayerEdict.vars.angles = Vector( 0.000000, 90.000000, 0.000000 );
        elseif ( sPlayerName == "ialex" ) then
            pPlayerEdict.vars.origin = Vector( 108, -87, 39 ); 
            pPlayerEdict.vars.angles = Vector( 0.000000, 90.000000, 0.000000 );
        end
    end
end


function PrintTime()
    PrintChatText( string.format( "%.3f (IM frames: %d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

SpeedrunInit();
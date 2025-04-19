connected = false;
spawned = false;
start_time = 0.0;

function SpeedrunInit()
    SetTimescale( 0.1 );

    RemoveAllTimers();

    ClientCmd(" sc_st_disable_spread 0; default_fov 120; -sc_ducktap; -jump; -duck; -forward; -back; -moveleft; -moveright; sc_strafe 0; sc_strafe_yaw \"\"; sc_strafe_ignore_ground 1; -attack; sc_im_stop");
    ClientCmd("sc_strafe_type 0; sc_strafe_dir 3; sc_st_setangles_stop; sc_ducktap_adjust_fps 10000; sc_autojump_inconsistent 0; sc_strafe_vectorial_increment 0; mp_classic_mode 1; clockwindow 0");
    ClientCmd("fps_max 200; sc_jumpbug_legit 0; sc_jumpbug 0");
end

function SpeedrunStart()
    SpeedrunStartCustom();
    -- connected = true;
end

function SpeedrunStartCustom()
    start_time = SegmentCurrentTime();

    CreateTrigger("123", Vector(-131.625, 4329.625, -3174.031), Vector(0, 0, 0), Vector(95.438, 60.531, 179.125));
    CreateServerTrigger("cp", Vector(-2841.281, 1081.406, -1696.406), Vector(0, 0, 0), Vector(129.656, 105.594, 200.531));
    --CreateTimer(0.000, ClientCmd,"sc_im_record c05_a2_newV2");
    CreateTimer(0.000, ClientCmd,"sc_im_play c05_a2_newV2");

    CreateTimer( 7.75, EnableSurvivalMode );
    CreateTimer( 7.7, DisableSurvivalMode );

    ClientCmd("sc_strafe 1; sc_strafe_ignore_ground 0");
    CreateTimer(0.370, ClientCmd,"+jump");
    CreateTimer(0.492, ClientCmd,"-jump");
    CreateTimer(0.492, ClientCmd,"sc_jumpbug_legit 1");
    CreateTimer(3.560, ClientCmd,"fps_max 20");
    CreateTimer(3.620, ClientCmd,"fps_max 200");
    CreateTimer(3.580, ClientCmd,"sc_strafe_yaw 84");
    CreateTimer(3.800, ClientCmd,"sc_strafe_yaw \"\"");
    CreateTimer(5.005, ClientCmd,"fps_max 1000");
    CreateTimer(5.070, ClientCmd,"fps_max 200");
    CreateTimer(10.680, ClientCmd,"fps_max 1000");
    CreateTimer(10.720, ClientCmd,"fps_max 200");


    CreateTimer(1.75, ClientCmd,"sc_st_timescale 0.25");
    --CreateTimer(10.600, ClientCmd,"sc_im_split");
    --CreateTimer(3.482, ClientCmd,"fps_max 20");
    --CreateTimer(3.300, ClientCmd,"fps_max 1000");
    --CreateTimer(3.600, ClientCmd,"fps_max 200");
    --CreateTimer(10.950, ClientCmd,"fps_max 1000");
    --CreateTimer(11.064, ClientCmd,"fps_max 200");
    --CreateTimer(11.264, ClientCmd,"sc_strafe_ignore_ground 1");
end

function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "123") then
        ClientCmd("say power_up");
        --ClientCmd("sc_im_stop");
        ClientCmd("sc_strafe 0");
    end
    return true;
end

function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
    printl( "OnPlayerSpawn()" );
    
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) .. ", viewangles: " .. tostring(pPlayerEdict.vars.angles) .. "" );

    if ( spawned ) then
        return;
    end

    local sPlayerName = pPlayerEdict.vars.netname;

    if ( sPlayerName == "QEES" ) then
        pPlayerEdict.vars.origin = Vector( -792.000000, -865.000000, -1465.000000 );
        pPlayerEdict.vars.angles = Vector( 0.000000, 90.000000, 0.000000 );
    elseif ( sPlayerName == "Sw1ft" ) then
        pPlayerEdict.vars.origin = Vector( -704.000000, -929.000000, -1465.000000 );
        pPlayerEdict.vars.angles = Vector( 0.000000, 90.000000, 0.000000 );
    elseif ( sPlayerName == "iMicro" ) then
        pPlayerEdict.vars.origin = Vector( -704.000000, -865.000000, -1465.000000 );
        pPlayerEdict.vars.angles = Vector( 0.000000, 90.000000, 0.000000 );
    elseif ( sPlayerName == "kolokola777" ) then
        pPlayerEdict.vars.origin = Vector( -792.000000, -928.000000, -1465.000000 );
        pPlayerEdict.vars.angles = Vector( 0.000000, 90.000000, 0.000000 );
    end
end

function OnTouchServerTrigger(activator, name)
    printl( "Touched trigger: \"" .. name .. "\"" );

    if ( activator.vars.deadflag ~= 0 or activator.vars.iuser1 ~= 0 ) then
        return false;
    end

    if (activator.vars.netname == "kolokola777" and name == "cp") then
        spawned = true;
        ClientCmd( "say suicide" );
        CreateTimer( 0.5, SendCommandToClientByName, "iMicro", "kill" );
        return true;
    end

    return false;
end  

function SendCommandToClientByName( sPlayerName, sCommand )
    local pPlayer = GetPEntityFromPlayerName( sPlayerName );
    if ( pPlayer ~= nil ) then
        SendCommandToClient( pPlayer, sCommand );
    end
end

function PrintTime()
    PrintChatText( string.format( "%.3f (IM frames: %d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

SpeedrunInit();
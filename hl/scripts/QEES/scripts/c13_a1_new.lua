connected = false;
spawned = false;
start_time = 0.0;
spawns_state = 0;


function SpeedrunInit()
    SetTimescale( 0.1 );

    RemoveAllTimers();

    ClientCmd(" sc_st_disable_spread 0; default_fov 120; -sc_ducktap; -jump; -duck; -forward; -back; -moveleft; -moveright; sc_strafe 0; sc_strafe_yaw \"\"; sc_strafe_ignore_ground 1; -attack; sc_im_stop");
    ClientCmd("sc_strafe_type 0; sc_strafe_dir 3; sc_st_setangles_stop; sc_ducktap_adjust_fps 0; sc_autojump_inconsistent 0; sc_strafe_vectorial_increment 0; fps_max 200; mp_classic_mode 1; clockwindow 0");
    ClientCmd("sc_aimbot 0; sc_aimbot_change_angles_back 0");
    
   
end

function OnRestart()
    pb_save();
end

function SpeedrunStart()
    SpeedrunStartCustom();
    -- connected = true;
end

function SpeedrunStartCustom()
    start_time = SegmentCurrentTime();


    CreateTimer( 1.45, EnableSurvivalMode );
    CreateTimer( 1.4, DisableSurvivalMode );
    --ClientCmd("sc_im_record c13_a1_new");
    ClientCmd("sc_im_play c13_a1_new");
    --CreateTimer(0.900, ClientCmd,".tas_c05a3_spawnbot");
    --CreateTimer(0.900, ClientCmd,".tas_c05a3_spawnbot");

    ClientCmd("sc_strafe 1");
    ClientCmd("sc_strafe_ignore_ground 0");
    CreateTimer(0.400, ClientCmd,"sc_st_timescale 0.25");
    CreateTimer(5.000, ClientCmd,"sc_st_timescale 0.2");
    CreateTimer(9.900, ClientCmd,"sc_st_disable_spread 1");
    CreateTimer(10.100, ClientCmd,"sc_st_disable_spread 1");
    --CreateTimer(9.000, ClientCmd,"sc_im_split");
    CreateTimer(11.000, ClientCmd,"kill");
    CreateTimer(11.700, ClientCmd,"fps_max 20");
    CreateTimer(11.700, ClientCmd,"+forward");
    CreateTimer(12.000, ClientCmd,"-forward");
    CreateTimer(12.000, ClientCmd,"fps_max 200");
    CreateTimer(12.100, ClientCmd,"fps_max 500");
    CreateTimer(12.150, ClientCmd,"fps_max 250");
    CreateTimer(12.500, ClientCmd,"sc_st_timescale 0.2");
    CreateTimer(17.000, ClientCmd,"sc_st_timescale 0.1");

    CreateServerTrigger("cp", Vector(-515.344, -1253.594, -285.000), Vector(0, 0, 0), Vector(260.844, 257.812, 249.750));















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

function OnSpecialSpawn( pPlayerEdict )
    printl( "OnSpecialSpawn()" );
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" has been revived at " .. tostring( pPlayerEdict.vars.origin ) );

    if ( pPlayerEdict.vars.netname == "QEES" ) then
        pPlayerEdict.vars.origin = Vector( -51.322865, -781.412415, -205.669037 );
    end
end

function OnTouchServerTrigger(activator, name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (activator.vars.netname == "Sw1ft" and name == "endtrigger") then
        SendCommandToClient(activator, "sc_selfsink2");
        ClientCmd("fps_max 500");
        return true;
    end

    if ( activator.vars.deadflag ~= 0 or activator.vars.iuser1 ~= 0 ) then
        return false;
    end

	if (activator.vars.netname == "void" and name == "cp") then
        ClientCmd("say ОНИ ЗАСПАВНИЛИСЬ!!!");
        ClientCmd("kill");
        return true;
    end

    return false;
end	


-- function OnGameFrame(state, frametime, postruncmd)
--     if ( not postruncmd ) then return end;

--     if ( connected and not spawned ) then
--         if ( ( PlayerMove.flags & FL_ONGROUND ) == FL_ONGROUND ) then
--             SpeedrunStartCustom();
--             spawned = true;
--         end
--     end
-- end

function OnFireCrossbowSpread(entity, entindex)
    return true, 1.0, true, 1.0;
end

function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
    printl( "OnPlayerSpawn()" );
    
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) .. ", viewangles: " .. tostring(pPlayerEdict.vars.angles) .. "" );

    local sPlayerName = pPlayerEdict.vars.netname;

    if ( spawns_state == 0 ) then
        if ( sPlayerName == "QEES" ) then
            pPlayerEdict.vars.origin = Vector( -250.000000, -1068.000000, 1765.000000 );     
            pPlayerEdict.vars.angles = Vector( 0.000000, 90.000000, 0.000000 );
        elseif ( sPlayerName == "Sw1ft" ) then
            pPlayerEdict.vars.origin = Vector( -102.000000, -1073.000000, 1765.000000 );    
            pPlayerEdict.vars.angles = Vector( 0.000000, 90.000000, 0.000000 );  
        elseif ( sPlayerName == "BotSkipper" ) then
            pPlayerEdict.vars.origin = Vector( -179.000000, -1072.000000, 1765.000000 );
            pPlayerEdict.vars.angles = Vector( 0.000000, 90.000000, 0.000000 );
        elseif ( sPlayerName == "kolokola777" ) then
            pPlayerEdict.vars.origin = Vector( -179.000000, -1072.000000, 1765.000000 );
            pPlayerEdict.vars.angles = Vector( 0.000000, 90.000000, 0.000000 );
        elseif ( sPlayerName == "void" ) then
            pPlayerEdict.vars.origin = Vector( -179.000000, -1072.000000, 1765.000000 );
            pPlayerEdict.vars.angles = Vector( 0.000000, 90.000000, 0.000000 );
        end
    elseif ( spawns_state == 1 ) then
        if ( sPlayerName == "void" ) then
            pPlayerEdict.vars.origin = Vector( 206.000000, -152.000000, 1905.000000 );     
            pPlayerEdict.vars.angles = Vector( 0.000000, 180.000000, 0.000000 );
            spawns_state = 2;
        elseif ( sPlayerName == "BotSkipper" ) then
            pPlayerEdict.vars.origin = Vector( 206, 72, 1905 );
            pPlayerEdict.vars.angles = Vector( 0.000000, 180.000000, 0.000000 );
        end
    end
end


function PrintTime()
    PrintChatText( string.format( "%.3f (IM frames: %d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

SpeedrunInit();


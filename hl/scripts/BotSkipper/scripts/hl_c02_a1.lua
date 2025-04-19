IncludeScript( "pb" );

function OnRestart()
    pb_save();
end

function OnTouchTrigger( name )
    printl( "Touched trigger: \"" .. name .. "\"" );

    if ( name == "yaetooknoeba" ) then
        pb_check( "yaetooknoeba", SegmentCurrentTime(), "Trigger activation" );
    end

    return true;
end

function SpeedrunStart()
    pb_register( "yaetooknoeba" );
    pb_load();
    start_time = SegmentCurrentTime();

    CreateTrigger("yaetooknoeba", Vector(1509.781, 256.062, -113.500), Vector(0, 0, 0), Vector(7.750, 209.906, 79.156));

    ClientCmd( "setvel 0 0 0;sc_strafe_yaw \"\";sc_strafe_type 0;sc_strafe 1;-jump;pausable 0;-duck;sc_strafe_ignore_ground 1;sc_st_legit_mode_ignore_freeze 1;-sc_ducktap;sc_strafe_vectorial_increment 0" );
    ClientCmd("-forward;-moveleft;-back;-attack;-jump;-use;sc_st_setangles_stop;-duck;-sc_ducktap;-alt1");
end

function PrintTime()
    PrintChatText( string.format( "%.3f (%d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

function OnFireTargets( targetname, activator, caller, usetype, value, delay )
    if ( targetname == "4_control_beam_entity_1mm" ) then
        PrintChatText( "kms activator 111111111111111111111111" );
        CreateTimer( 4.0, ClientCmd, "sc_st_setangles 0 -97 200");
        CreateTimer( 6.16, ClientCmd, "sc_im_play c2a1");
    elseif ( targetname == "labs1" ) then
        PrintChatText( "dver uspeshna razblokirovano");
    end

    --printl( "OnFireTargets :: " .. targetname .. " : " .. value .. " : " .. delay );
end

function OnClientPutInServer( pPlayerEdict )
    printl( "OnClientPutInServer( " .. pPlayerEdict.vars.netname .. " )" );

    SendCommandToClient( pPlayerEdict, "sc_st_legit_mode" );
end

function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
    printl( "OnPlayerSpawn()" );
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) .. ", viewangles: " .. tostring(pPlayerEdict.vars.angles) .. "" );

    if ( UTIL_IsPointInsideAABB( pPlayerEdict.vars.origin,
                                Vector(-57.938, 1862.469, 1626.375),
                                Vector(-57.938, 1862.469, 1626.375) + Vector(256.500, 193.656, 213.125)) ) then

        if ( pPlayerEdict.vars.netname == "QEES" ) then
            pPlayerEdict.vars.origin = Vector( 52, 1908, 1703 );
            pPlayerEdict.vars.angles = Vector( 0, 0, 0 );
        elseif ( pPlayerEdict.vars.netname == "BotSkipper") then
            pPlayerEdict.vars.origin = Vector( 100, 1940, 1704 );
            pPlayerEdict.vars.angles = Vector( 0, 0, 0 );
        end
    end
end

function OnPlayInput(filename, frame, cmd)
    if ( filename == "с2a1" ) then
        if ( frame == 5209 ) then
            cmd.buttons = cmd.buttons | IN_USE;
        end
    end
end

function UTIL_IsAABBIntersectingAABB( boxmins1, boxmaxs1, boxmins2, boxmaxs2 )
    return ( boxmins1.x <= boxmaxs2.x and boxmaxs1.x >= boxmins2.x ) and
            ( boxmins1.y <= boxmaxs2.y and boxmaxs1.y >= boxmins2.y ) and
            ( boxmins1.z <= boxmaxs2.z and boxmaxs1.z >= boxmins2.z );
end

function UTIL_IsPointInsideAABB( point, mins, maxs )
    return UTIL_IsAABBIntersectingAABB( point, point, mins, maxs )
end
--]]

--[[    

    last govno--
    CreateTimer( 7.08, ClientCmd, "sc_strafe_yaw -90");
    CreateTimer( 7.8, ClientCmd, "+duck");
    CreateTimer( 7.9, ClientCmd, "sc_strafe_yaw 0")
    CreateTimer( 8.0, ClientCmd, "-duck")

    
    CreateTimer( 7.08, ClientCmd, "sc_strafe_yaw -90");
    CreateTimer( 7.9, ClientCmd, "sc_strafe_yaw -20;sc_strafe_type 1");
    CreateTimer( 8.15, ClientCmd, "sc_strafe_type 2");
    CreateTimer( 8.3, ClientCmd, "sc_Strafe_type 1");
    CreateTimer( 7.84, ClientCmd, "+duck");
    CreateTimer( 7.9, ClientCmd, "-duck");


    CreateTimer( 6.7, ClientCmd, "sc_strafe_yaw 171;sc_st_timescale 0.25");
    CreateTimer( 7.08, ClientCmd, "sc_strafe_yaw -90");
    CreateTimer( 7.8, ClientCmd, "+duck;sc_st_setangles 0 -50 100");
    CreateTimer( 7.9, ClientCmd, "sc_strafe_yaw 0");
    CreateTimer( 8.1, ClientCmd, "sc_strafe_type 2");
    CreateTimer( 8.2, ClientCmd, "sc_strafe_type 0");
    CreateTimer( 8.0, ClientCmd, "-duck");



    CreateTimer( 0.2, ClientCmd, "setang 0 -97 0");
    CreateTimer( 0.3, ClientCmd, "sc_im_record c2a1");
    CreateTimer( 0.6, ClientCmd, "sc_strafe_yaw -97;sc_strafe_ignore_ground 0");
    CreateTimer( 1.105, ClientCmd, "+jump;wait;sc_strafe_ignore_ground 1");
    CreateTimer( 1.3, ClientCmd, "sc_strafe_yaw 80;sc_st_setangles 0 101 200");
    CreateTimer( 2.3, ClientCmd, "sc_strafe_yaw -160;sc_st_setangles 0 140 200");
    CreateTimer( 2.8, ClientCmd, "sc_strafe_yaw 120");
    CreateTimer( 3.45, ClientCmd, "sc_strafe_type 1;sc_Strafe_yaw -150;sc_st_setangles 0 180 100");
    CreateTimer( 4.0, ClientCmd, "sc_strafe_yaw 180");
    CreateTimer( 4.0, ClientCmd, "+duck;sc_st_setangles 0 90 150");
    CreateTimer( 4.1, ClientCmd, "sc_strafe_type 0")
    CreateTimer( 4.16, ClientCmd, "-duck");
    CreateTimer( 4.2, ClientCmd, "sc_strafe_type 1")
    CreateTimer( 4.4, ClientCmd, "sc_strafe_yaw 85");
    CreateTimer( 4.9, ClientCmd, "sc_im_record_command \"sc_freeze2\";sc_freeze2;sc_strafe_type 0");
    CreateTimer( 5.05, ClientCmd, "sc_im_record_command \"sc_freeze2\";sc_freeze2;+duck;sc_strafe_vectorial_increment 2;sc_st_setangles_stop");
    CreateTimer( 5.1, ClientCmd, "-duck");
    CreateTimer( 5.2, ClientCmd, "sc_strafe_yaw 20");
    CreateTimer( 6.4, ClientCmd, "sc_Strafe_yaw 2");
    CreateTimer( 6.7, ClientCmd, "sc_strafe_yaw -2");
    CreateTimer( 7.1, ClientCmd, "sc_strafe_yaw 67;-jump;+sc_ducktap;+attack;sc_strafe_ignore_ground 0");
    CreateTimer( 7.5, ClientCmd, "-sc_ducktap");
    CreateTimer( 7.6, ClientCmd, "sc_strafe_yaw -130");
    CreateTimer( 7.85, ClientCmd, "+sc_ducktap;sc_strafe_yaw 85");
    CreateTimer( 7.9, ClientCmd, "sc_strafe_type 1")
    CreateTimer( 8.0, ClientCmd, "-sc_ducktap;+duck");
    CreateTimer( 8.18, ClientCmd, "sc_Strafe_type 0;-duck;+jump;-attack");
    CreateTimer( 8.4, ClientCmd, "sc_strafe_yaw 160;+alt1");
    CreateTimer( 8.64, ClientCmd, "setang -10 170 0;sc_strafe_vectorial_increment 0");
    CreateTimer( 8.66, ClientCmd, "setang 0 160 0;sc_strafe_vectorial_increment 2");
    CreateTimer( 9.4, ClientCmd, "+sc_ducktap;-jump");
    CreateTimer( 9.55, ClientCmd, "sc_strafe_yaw 180");
    CreateTimer( 9.8, ClientCmd, "-sc_ducktap;+jump");
    CreateTimer( 10.3, ClientCmd, "+duck");
    CreateTimer( 10.4, ClientCmd, "-duck");



    --verhnie steklo
    ClientCmd("-forward;-moveleft;-back;-attack;-jump;sc_st_setangles_stop;-duck;-sc_ducktap;-alt1");
    CreateTimer( 0.3, ClientCmd, "sc_im_play c2a1");
    CreateTimer( 0.4, ClientCmd, "sc_im_goto 1400");
    CreateTimer( 3.0, ClientCmd, "sc_im_split");
    CreateTimer( 3.0, ClientCmd, "+jump");
    CreateTimer( 3.1, ClientCmd, "sc_strafe_yaw 178");
    CreateTimer( 3.41, ClientCmd, "+duck");
    CreateTimer( 3.42, ClientCmd, "sc_strafe_yaw 180");
    CreateTimer( 3.47, ClientCmd, "-jump;-duck;sc_strafe_yaw -80");
    CreateTimer( 3.56, ClientCmd, "+jump");
    CreateTimer( 3.57, ClientCmd, "-jump");
    CreateTimer( 3.66, ClientCmd, "sc_strafe_type 1;-jump");
    CreateTimer( 3.5, ClientCmd, "sc_st_setangles 89 180 100;-jump");
    CreateTimer( 3.9, ClientCmd, "+moveleft;+back");
    CreateTimer( 6.65, ClientCmd, "sc_strafe_type 0;-moveleft;-back;sc_strafe_yaw 90;+jump;sc_st_setangles 0 0 100");
    CreateTimer( 6.92, ClientCmd, "sc_Strafe_yaw 0");
    CreateTimer( 7.32, ClientCmd, "sc_Strafe_yaw -90;sc_st_setangles 0 -180 100");
    CreateTimer( 7.74, ClientCmd, "sc_strafe_yaw -180");
    CreateTimer( 8.8, ClientCmd, "sc_Strafe_yaw 145");
    CreateTimer( 9.0, ClientCmd, "+sc_ducktap;-jump");
    CreateTimer( 9.4, ClientCmd, "-sc_ducktap;+jump");
    CreateTimer( 9.53, ClientCmd, "sc_strafe_yaw 180");
    CreateTimer( 9.76, ClientCmd, "+duck");
    CreateTimer( 9.8, ClientCmd, "-duck");

    --posle stekla
    CreateTimer( 0.3, ClientCmd, "sc_im_play c2a1");
    CreateTimer( 0.4, ClientCmd, "sc_im_goto 3200");
    CreateTimer( 0.9, ClientCmd, "sc_im_split");
    CreateTimer( 1.05, ClientCmd, "sc_strafe_yaw 90;sc_st_setangles 0 90 100;+jump;sc_st_timescale 0.6");
    CreateTimer( 1.9, ClientCmd, "sc_strafe_yaw 0;sc_st_setangles 0 0 100");
    CreateTimer( 2.9, ClientCmd, "sc_Strafe_yaw 20");
    CreateTimer( 3.3, ClientCmd, "sc_strafe_yaw 90");
    CreateTimer( 3.54, ClientCmd, "sc_strafe_yaw -10;sc_strafe_type 1");
    CreateTimer( 4.11, ClientCmd, "sc_strafe_yaw 110;sc_strafe_vectorial_increment 2");
    CreateTimer( 4.58, ClientCmd, "sc_strafe_type 0;sc_strafe_yaw -2");
    CreateTimer( 5.1, ClientCmd, "sc_strafe_yaw 0");
    CreateTimer( 5.6, ClientCmd, "sc_strafe_type 2");
    CreateTimer( 5.63, ClientCmd, "sc_strafe_type 0");
    CreateTimer( 5.805, ClientCmd, "sc_strafe_yaw 180;sc_strafe_type 1;setang 20");
    CreateTimer( 6.1, ClientCmd, "+sc_ducktap;-jump");
    CreateTimer( 6.4, ClientCmd, "-sc_ducktap;sc_strafe_type 0;sc_strafe_vectorial_increment 0");
    CreateTimer( 6.5, ClientCmd, "+dd");
    CreateTimer( 6.5, ClientCmd, "+jump");
    CreateTimer( 6.7, ClientCmd, "-dd;sc_st_setangles 0 -90 200");
    CreateTimer( 6.7, ClientCmd, "sc_strafe_yaw 171;sc_st_timescale 0.25");
    CreateTimer( 7.08, ClientCmd, "sc_strafe_yaw -90");
    CreateTimer( 7.8, ClientCmd, "+duck;sc_st_setangles 0 -50 100");
    CreateTimer( 7.9, ClientCmd, "sc_strafe_yaw 0");
    CreateTimer( 8.1, ClientCmd, "sc_strafe_type 2");
    CreateTimer( 8.2, ClientCmd, "sc_strafe_type 0");
    CreateTimer( 8.0, ClientCmd, "-duck");


    --konec?
    CreateTimer( 0.3, ClientCmd, "sc_im_play c2a1");
    CreateTimer( 0.4, ClientCmd, "sc_im_goto 3200");
    CreateTimer( 0.9, ClientCmd, "sc_im_split");
    CreateTimer( 1.05, ClientCmd, "sc_strafe_yaw 90;sc_st_setangles 0 90 100;+jump;sc_st_timescale 0.6");
    CreateTimer( 1.9, ClientCmd, "sc_strafe_yaw 0;sc_st_setangles 0 0 100");
    CreateTimer( 2.9, ClientCmd, "sc_Strafe_yaw 20");
    CreateTimer( 3.3, ClientCmd, "sc_strafe_yaw 90");
    CreateTimer( 3.54, ClientCmd, "sc_strafe_yaw -10;sc_strafe_type 1");
    CreateTimer( 4.11, ClientCmd, "sc_strafe_yaw 110;sc_strafe_vectorial_increment 2");
    CreateTimer( 4.58, ClientCmd, "sc_strafe_type 0;sc_strafe_yaw -2");
    CreateTimer( 5.1, ClientCmd, "sc_strafe_yaw 0");
    CreateTimer( 5.6, ClientCmd, "sc_strafe_type 2");
    CreateTimer( 5.63, ClientCmd, "sc_strafe_type 0");
    CreateTimer( 5.805, ClientCmd, "sc_strafe_yaw 180;sc_strafe_type 1;setang 20");
    CreateTimer( 6.1, ClientCmd, "+sc_ducktap;-jump");
    CreateTimer( 6.4, ClientCmd, "-sc_ducktap;sc_strafe_type 0;sc_strafe_vectorial_increment 0");
    CreateTimer( 6.5, ClientCmd, "+dd");
    CreateTimer( 6.5, ClientCmd, "+jump");
    CreateTimer( 6.7, ClientCmd, "-dd;sc_st_setangles 0 -90 200");
    CreateTimer( 6.7, ClientCmd, "sc_strafe_yaw 171;sc_st_timescale 0.25");
    CreateTimer( 7.08, ClientCmd, "sc_strafe_yaw -90");
    CreateTimer( 7.7, ClientCmd, "sc_strafe_type 2");
    CreateTimer( 7.743, ClientCmd, "sc_strafe_type 0");
    CreateTimer( 7.8, ClientCmd, "+duck;sc_st_setangles 0 -50 100");
    CreateTimer( 7.89, ClientCmd, "-duck;sc_strafe_yaw 0;sc_strafe_type 1");
    CreateTimer( 8.39, ClientCmd, "+duck;sc_strafe_type 0;sc_strafe_yaw -91;sc_st_setangles 0 -90 50");
    CreateTimer( 8.43, ClientCmd, "-duck");
    CreateTimer( 9.0, ClientCmd, "sc_st_setangles 0 0 100");
    CreateTimer( 9.38, ClientCmd, "sc_strafe_yaw 7;+sc_ducktap;-jump");
    CreateTimer( 9.945, ClientCmd, "sc_Strafe 1");
    CreateTimer( 10, ClientCmd, "sc_st_setangles -10 27 100");
    CreateTimer( 10.2, ClientCmd, "+duck;-jump;-sc_ducktap");
    CreateTimer( 10.4595, ClientCmd, "+use;wait;-use");


]]
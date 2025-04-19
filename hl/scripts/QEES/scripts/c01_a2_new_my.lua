connected = false;
spawned = false;
start_time = 0.0;
spawns_state = 0;


function SpeedrunInit()
    SetTimescale( 0.25 );

    RemoveAllTimers();

    ClientCmd(" sc_st_disable_spread 0; default_fov 120; -sc_ducktap; -jump; -duck; -forward; -back; -moveleft; -moveright; sc_strafe 0; sc_strafe_yaw \"\"; sc_strafe_ignore_ground 1; -attack; sc_im_stop");
    ClientCmd("sc_strafe_type 0; sc_strafe_dir 3; sc_st_setangles_stop; sc_ducktap_adjust_fps 0; sc_autojump_inconsistent 0; sc_strafe_vectorial_increment 0; fps_max 200; mp_classic_mode 1; clockwindow 0");
    ClientCmd("sc_aimbot 0; sc_aimbot_change_angles_back 0");
    ClientCmd("sc_st_transmit_timescale 1; sc_st_transmit_timer 1");
    
   
end


function SpeedrunStart()
    SpeedrunStartCustom();
    -- connected = true;
end

function SpeedrunStartCustom()
    start_time = SegmentCurrentTime();


    --ClientCmd("sc_im_record c01_a2_newV2");
    ClientCmd("sc_im_play c01_a2_newV2");

    CreateTrigger("1", Vector(1545.156, -97.094, -356.594), Vector(0, 0, 0), Vector(228.000, 68.938, 139.000));
    CreateTrigger("2", Vector(1544.344, -200.125, -358.469), Vector(0, 0, 0), Vector(60.062, 85.906, 137.844));
    
    --CreateTimer(0.200, ClientCmd,".tas_c05a3_spawnbot");
    --CreateTimer(0.200, ClientCmd,".tas_c05a3_spawnbot");
    CreateTimer(3.600, ClientCmd,"kill");
    --CreateTimer(4.200, ClientCmd,"sc_st_Timescale 0.05");
    CreateTimer(4.600, ClientCmd,"+attack");
    CreateTimer(4.550, ClientCmd,"sc_im_split");
    CreateTimer(4.610, ClientCmd,"npc_moveto");
    CreateTimer(4.620, ClientCmd,"sc_im_stop");

    --[[CreateTimer(1.900, ClientCmd,"sc_strafe_ignore_ground 0");
    CreateTimer(1.900, ClientCmd,"sc_strafe 1");
    CreateTimer(1.900, ClientCmd,"sc_strafe_yaw 90");
    CreateTimer(2.300, ClientCmd,"sc_strafe_yaw \"\"");
    CreateTimer(2.300, ClientCmd,"sc_strafe_ignore_ground 1");
    CreateTimer(2.300, ClientCmd,"sc_strafe 0");
    --CreateTimer(1.900, ClientCmd,"sc_st_setangles -50 -90 200");
    
    CreateTimer(3.600, ClientCmd,"default_fov 1");
    CreateTimer(4.600, ClientCmd,"+attack");
    CreateTimer(4.610, ClientCmd,"npc_moveto");]]
   
end


function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "1") then
        spawns_state = 1;
	elseif (name == "2") then
		spawns_state = 2;  
    end

    return true;
end	



function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
    printl( "OnPlayerSpawn()" );
    
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) .. ", viewangles: " .. tostring(pPlayerEdict.vars.angles) .. "" );

    local sPlayerName = pPlayerEdict.vars.netname;

    if ( spawns_state == 0 ) then
        if ( sPlayerName == "QEES" ) then
            pPlayerEdict.vars.origin = Vector( 1696.000000, -160.000000, -319.000000 );     
            pPlayerEdict.vars.angles = Vector( 0.000000, 90.000000, 0.000000 );
        elseif ( sPlayerName == "void" ) then
            pPlayerEdict.vars.origin = Vector( 1760.000000, -160.000000, -319.000000 );           --1568.000000, -160.000000,  1839.968750 -183.968750 -323.968750
            pPlayerEdict.vars.angles = Vector( 0.000000, 90.000000, 0.000000 );  
        elseif ( sPlayerName == "Sw1ft" ) then
            pPlayerEdict.vars.origin = Vector( 1568.000000, -160.000000, -319.000000 );        --1568.000000, -160.000000, -319.000000
            pPlayerEdict.vars.angles = Vector( 0.000000, 90.000000, 0.000000 );
        end
    elseif ( spawns_state == 1 ) then
        if ( sPlayerName == "QEES" ) then
            pPlayerEdict.vars.origin = Vector( 1568.000000, -160.000000, -319.000000 );     
            pPlayerEdict.vars.angles = Vector( 17.627432, 81.112061, 0.000000 );
            spawns_state = 2;
        end
    elseif ( spawns_state == 2 ) then
        if ( sPlayerName == "QEES" ) then    
            pPlayerEdict.vars.origin = Vector( 1696.000000, 192.000000, -319.000000 );
            pPlayerEdict.vars.angles = Vector( 0.000000, 90.000000, 0.000000 );
        elseif ( sPlayerName == "void" ) then
            pPlayerEdict.vars.origin = Vector( 1632.000000, 192.000000, -319.000000 ); 
            pPlayerEdict.vars.angles = Vector( 0.000000, 90.000000, 0.000000 );
        elseif ( sPlayerName == "Sw1ft" ) then
            pPlayerEdict.vars.origin = Vector( 1568.000000, 192.000000, -319.000000 ); 
            pPlayerEdict.vars.angles = Vector( 0.000000, 90.000000, 0.000000 );
        end
    end
end


function PrintTime()
    PrintChatText( string.format( "%.3f (IM frames: %d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

SpeedrunInit();


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

    CreateTimer(0.000, ClientCmd,"sc_im_record of1a2");
    --CreateTimer(0.000, ClientCmd,"sc_im_play of1a2");

    CreateTimer(0.000, ClientCmd,"sc_strafe 1");
    CreateTimer(0.000, ClientCmd,"+jump");
    CreateTimer(0.200, ClientCmd,"sc_strafe_yaw 49");
    CreateTimer(0.700, ClientCmd,"+duck");
    CreateTimer(0.800, ClientCmd,"-duck");
    CreateTimer(1.620, ClientCmd,"sc_strafe_yaw -37");
    CreateTimer(1.100, ClientCmd,"sc_st_setangles 50 -35 120");
    CreateTimer(2.370, ClientCmd,"sc_freeze2");
    CreateTimer(2.400, ClientCmd,"-jump");
    CreateTimer(3.170, ClientCmd,"sc_freeze2");
    CreateTimer(3.170, ClientCmd,"sc_jumpbug_legit 1");
    CreateTimer(3.220, ClientCmd,"fps_max 1000");
    CreateTimer(3.260, ClientCmd,"fps_max 200");
    CreateTimer(3.170, ClientCmd,"+jump");
    CreateTimer(3.200, ClientCmd,"sc_strafe_yaw -90");
    CreateTimer(3.240, ClientCmd,"sc_st_setangles 0 -90 120");
    CreateTimer(3.270, ClientCmd,"+duck");
    CreateTimer(3.270, ClientCmd,"-jump");
    CreateTimer(3.70, ClientCmd,"-duck");
    CreateTimer(3.70, ClientCmd,"sc_strafe_ignore_ground 0");
    CreateTimer(4.040, ClientCmd,"+jump");
    CreateTimer(4.040, ClientCmd,"sc_strafe_ignore_ground 1");
    CreateTimer(4.270, ClientCmd,"sc_strafe_yaw -180");
    CreateTimer(4.270, ClientCmd,"sc_st_setangles 0 -180 120");



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
        if ( sPlayerName == "QEES" ) then
            pPlayerEdict.vars.origin = Vector( -859.000, -2579.000, 144.031 );
            pPlayerEdict.vars.angles = Vector( 0.000000, 0.000000, 0.000000 );
        elseif ( sPlayerName == "void" ) then
            pPlayerEdict.vars.origin = Vector( 544.000000, 1248.000000, 597.000000 ); 
            pPlayerEdict.vars.angles = Vector( 0.000000, 277.000000, 0.000000 );
        end
    end
end



function PrintTime()
    PrintChatText( string.format( "%.3f (IM frames: %d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

SpeedrunInit();
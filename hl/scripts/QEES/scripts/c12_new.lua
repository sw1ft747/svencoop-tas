connected = false;
spawned = false;
start_time = 0.0;
spawns_state = 0

function SpeedrunInit()
    SetTimescale( 0.5 );

    RemoveAllTimers();

    ClientCmd(" sc_st_disable_spread 1; default_fov 120; -sc_ducktap; -jump; -duck; -forward; -back; -moveleft; -moveright; sc_strafe 0; sc_strafe_yaw \"\"; sc_strafe_ignore_ground 1; -attack; sc_im_stop");
    ClientCmd("sc_strafe_type 0; sc_strafe_dir 3; sc_st_setangles_stop; sc_ducktap_adjust_fps 0; sc_autojump_inconsistent 0; sc_strafe_vectorial_increment 0; fps_max 200; mp_classic_mode 1; clockwindow 0");
    
end

function SpeedrunStart()
    SpeedrunStartCustom();
    -- connected = true;
end

function SpeedrunStartCustom()
    start_time = SegmentCurrentTime();

    --CreateTimer(0.000, ClientCmd,"sc_im_record c12_new");
    CreateTimer(0.000, ClientCmd,"sc_im_play c12_new");

    CreateTrigger("1", Vector(-2063.938, -52.062, 65.406), Vector(0, 0, 0), Vector(82.281, 123.250, 51.938));
    CreateTrigger("2", Vector(-3314.906, -1815.281, -192.062), Vector(0, 0, 0), Vector(95.250, 322.750, 138.500));
    CreateTrigger("3", Vector(-3619.062, -1207.688, -213.656), Vector(0, 0, 0), Vector(78.125, 335.594, 184.844));

    CreateTimer(0.000, ClientCmd,"sc_strafe 1");
    CreateTimer(0.000, ClientCmd,"sc_strafe_ignore_ground 0");
    CreateTimer(0.900, ClientCmd,".tas_c05a3_spawnbot");
    CreateTimer(12.600, ClientCmd,"sc_st_timescale 0.1");
    --CreateTimer(13.970, ClientCmd,"sc_im_split");
    CreateTimer(20.270, ClientCmd,"sc_im_stop");
    
    CreateTimer(8.510, ClientCmd,"toggle_survival_mode");
    CreateTimer(8.555, ClientCmd,"kill");

    CreateTimer(8.600, ClientCmd,"toggle_survival_mode");
    CreateTimer(8.660, ClientCmd,"toggle_survival_mode");
    CreateTimer(8.662, ClientCmd,"weapon_crossbow; weapon_gauss");
    CreateTimer(8.665, ClientCmd,"toggle_survival_mode");



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
            pPlayerEdict.vars.origin = Vector( 640.000000, 1248.000000, 597.000000 );
            pPlayerEdict.vars.angles = Vector( 0.000000, 277.000000, 0.000000 );
        elseif ( sPlayerName == "void" ) then
            pPlayerEdict.vars.origin = Vector( 544.000000, 1248.000000, 597.000000 ); 
            pPlayerEdict.vars.angles = Vector( 0.000000, 277.000000, 0.000000 );
        end
    elseif ( spawns_state == 1 ) then 
        if ( sPlayerName == "QEES" ) then    
            pPlayerEdict.vars.origin = Vector( -1947.000000, -39.000000, -199.000000 );
            pPlayerEdict.vars.angles = Vector( 0.000000, 180.000000, 0.000000 );
        elseif ( sPlayerName == "void" ) then
            pPlayerEdict.vars.origin = Vector( 2528.000000, -4256.000000, -735.000000 ); 
            pPlayerEdict.vars.angles = Vector( 0.000000, 0.000000, 0.000000 );
        end
    elseif ( spawns_state == 2 ) then
        if ( sPlayerName == "QEES" ) then    
            pPlayerEdict.vars.origin = Vector( -3467.000000, -1143.000000, -179.000000 );
            pPlayerEdict.vars.angles = Vector( 0.000000, 90.000000, 0.000000 );
        elseif ( sPlayerName == "void" ) then
            pPlayerEdict.vars.origin = Vector( 2528.000000, -4256.000000, -735.000000 ); 
            pPlayerEdict.vars.angles = Vector( 0.000000, 0.000000, 0.000000 );
        end
    elseif ( spawns_state == 3 ) then
        if ( sPlayerName == "QEES" ) then    
            pPlayerEdict.vars.origin = Vector( -2802.000000, 986.000000, -1087.000000 );
            pPlayerEdict.vars.angles = Vector( 0.000000, 270.000000, 0.000000 );
        elseif ( sPlayerName == "void" ) then
            pPlayerEdict.vars.origin = Vector( 2528.000000, -4256.000000, -735.000000 ); 
            pPlayerEdict.vars.angles = Vector( 0.000000, 0.000000, 0.000000 );
        end
    end
end



function PrintTime()
    PrintChatText( string.format( "%.3f (IM frames: %d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

SpeedrunInit();
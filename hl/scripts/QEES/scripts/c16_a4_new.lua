connected = false;
spawned = false;
start_time = 0.0;
spawns_state = 0;


function SpeedrunInit()
    SetTimescale( 0.5 );

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


    --CreateTimer( 1.45, EnableSurvivalMode );
    --CreateTimer( 1.4, DisableSurvivalMode );
    ClientCmd("sc_im_record c16_a4_new");
    ClientCmd("weapon_crossbow; weapon_gauss");
    --ClientCmd("sc_im_play c16_a4_new");
    CreateTimer(8.400, ClientCmd,"sc_st_timescale 0.05");
    CreateTimer(8.720, ClientCmd,"sc_strafe 1");
    --CreateTimer(0.900, ClientCmd,".tas_c05a3_spawnbot");
    CreateTimer(0.900, ClientCmd,".tas_c05a3_spawnbot");
    --CreateTimer(8.420, ClientCmd,"sc_strafe_ignore_ground 0");
    CreateTimer(8.730, ClientCmd,"+jump");
    --CreateTimer(8.870, ClientCmd,"+duck");
    CreateTimer(5.0, ClientCmd,"+tau");
    --CreateTimer(8.729, ClientCmd,"-tau");
    CreateTimer(10.400, ClientCmd,"-jump");
    




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


function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
    printl( "OnPlayerSpawn()" );
    
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) .. ", viewangles: " .. tostring(pPlayerEdict.vars.angles) .. "" );

    local sPlayerName = pPlayerEdict.vars.netname;

    if ( spawns_state == 0 ) then
        if ( sPlayerName == "QEES11" ) then
            pPlayerEdict.vars.origin = Vector( -250.000000, -1068.000000, 1765.000000 );     
            pPlayerEdict.vars.angles = Vector( 0.000000, 90.000000, 0.000000 );
        elseif ( sPlayerName == "Sw1ft22" ) then
            pPlayerEdict.vars.origin = Vector( -102.000000, -1073.000000, 1765.000000 );    
            pPlayerEdict.vars.angles = Vector( 0.000000, 90.000000, 0.000000 );  
        elseif ( sPlayerName == "BotSkipper22" ) then
            pPlayerEdict.vars.origin = Vector( -179.000000, -1072.000000, 1765.000000 );
            pPlayerEdict.vars.angles = Vector( 0.000000, 90.000000, 0.000000 );
        elseif ( sPlayerName == "kolokola77722" ) then
            pPlayerEdict.vars.origin = Vector( -179.000000, -1072.000000, 1765.000000 );
            pPlayerEdict.vars.angles = Vector( 0.000000, 90.000000, 0.000000 );
        elseif ( sPlayerName == "void22" ) then
            pPlayerEdict.vars.origin = Vector( -179.000000, -1072.000000, 1765.000000 );
            pPlayerEdict.vars.angles = Vector( 0.000000, 90.000000, 0.000000 );
        end
    elseif ( spawns_state == 1 ) then
        if ( sPlayerName == "void22" ) then
            pPlayerEdict.vars.origin = Vector( 206.000000, -152.000000, 1905.000000 );     
            pPlayerEdict.vars.angles = Vector( 0.000000, 180.000000, 0.000000 );
            spawns_state = 2;
        elseif ( sPlayerName == "BotSkipper22" ) then
            pPlayerEdict.vars.origin = Vector( 206, 72, 1905 );
            pPlayerEdict.vars.angles = Vector( 0.000000, 180.000000, 0.000000 );
        end
    end
end


function PrintTime()
    PrintChatText( string.format( "%.3f (IM frames: %d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

SpeedrunInit();


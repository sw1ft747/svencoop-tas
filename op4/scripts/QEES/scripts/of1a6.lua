connected = false;
spawned = false;
start_time = 0.0;
spawns_state = 0

-- HOST NAME HAS "Sw1ft"

function SpeedrunInit()
    SetTimescale( 0.1 );

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

    --CreateTimer(0.000, ClientCmd,"sc_im_record of1a6");
    CreateTimer(0.000, ClientCmd,"sc_im_play of1a6");

    --CreateTimer(0.000, ClientCmd,"sc_im_experimental 1");
    --CreateTimer(0.000, ClientCmd,".tas_bm_spawnbot");
    --CreateTimer(0.000, ClientCmd,".tas_bm_startbot");
    --CreateTimer(0.900, ClientCmd,".tas_c05a3_spawnbot");

    
    CreateTimer( 0.40, DisableSurvivalMode );
    CreateTimer( 0.45, EnableSurvivalMode );

    --[[CreateTimer(0.0, ClientCmd,"sc_strafe 1");
    CreateTimer(0.0, ClientCmd,"weapon_shotgun");
    CreateTimer(0.0, ClientCmd,"sc_strafe_ignore_ground 0");
    CreateTimer(0.0, ClientCmd,"sc_strafe_yaw 94");
    CreateTimer(0.40, ClientCmd,"sc_strafe_yaw 90");
    CreateTimer(0.40, ClientCmd,"+sc_ducktap");
    CreateTimer(0.61, ClientCmd,"-sc_ducktap");
    CreateTimer(0.704, ClientCmd,"+back");
    CreateTimer(0.900, ClientCmd,"-back; +forward");
    CreateTimer(0.944, ClientCmd,"-forward");
    CreateTimer(1.250, ClientCmd,"+jump");
    CreateTimer(1.25, ClientCmd,"sc_strafe_yaw 44");
    CreateTimer(1.60, ClientCmd,"-jump");
    CreateTimer(1.65, ClientCmd,"sc_strafe_yaw 90");
    CreateTimer(1.60, ClientCmd,"+sc_ducktap");
    CreateTimer(2.1, ClientCmd,"-sc_ducktap");
    CreateTimer(2.159, ClientCmd,"+back");
    CreateTimer(2.430, ClientCmd,"-back; +forward");
    CreateTimer(2.534, ClientCmd,"-forward");
    CreateTimer(2.770, ClientCmd,"+jump");
    CreateTimer(3.60, ClientCmd,"-jump");
    CreateTimer(3.60, ClientCmd,"+sc_ducktap");
    CreateTimer(3.70, ClientCmd,"sc_strafe_yaw 18");
    CreateTimer(3.70, ClientCmd,"sc_st_setangles 0 18 100");
    CreateTimer(3.90, ClientCmd,"+jump");
    CreateTimer(3.90, ClientCmd,"-sc_ducktap");
    CreateTimer(3.714, ClientCmd,"sc_strafe_type 1");
    CreateTimer(4.270, ClientCmd,"+duck");
    CreateTimer(4.380, ClientCmd,"-duck");
    CreateTimer(4.389, ClientCmd,"sc_strafe_yaw 80");
    CreateTimer(4.389, ClientCmd,"sc_st_setangles 0 179 200");
    CreateTimer(4.864, ClientCmd,"+duck");
    CreateTimer(4.864, ClientCmd,"sc_strafe_type 0");
    CreateTimer(4.930, ClientCmd,"-duck");
    CreateTimer(4.930, ClientCmd,"sc_strafe_yaw 133");
    CreateTimer(5.50, ClientCmd,"+sc_ducktap");
    CreateTimer(5.50, ClientCmd,"-jump");
    CreateTimer(5.930, ClientCmd,"sc_strafe_yaw 148");
    CreateTimer(6.0, ClientCmd,"-sc_ducktap");
    CreateTimer(6.0, ClientCmd,"+jump");
    CreateTimer(6.67, ClientCmd,"sc_strafe_yaw 179");
    CreateTimer(6.67, ClientCmd,"+sc_ducktap");
    CreateTimer(6.67, ClientCmd,"-jump");
    CreateTimer(7.370, ClientCmd,"+duck");
    CreateTimer(7.300, ClientCmd, "say freeze");
    CreateTimer(7.430, ClientCmd,"kill");
    CreateTimer(7.430, ClientCmd,"fps_max 20");
    CreateTimer(7.448, ClientCmd,"+forward");
    CreateTimer(7.495, ClientCmd,"-duck")
    CreateTimer(8.399, ClientCmd,"fps_max 200");
    CreateTimer(8.399, ClientCmd,"-forward");
    CreateTimer(8.400, ClientCmd,"sc_strafe_yaw \"\"");
    CreateTimer(8.400, ClientCmd,"sc_st_setangles_stop");]]

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
            pPlayerEdict.vars.origin = Vector( 485, -1732, -8 );
            pPlayerEdict.vars.angles = Vector( 0.000000, 90.000000, 0.000000 );
        elseif ( sPlayerName == "Sw1ft" ) then
            pPlayerEdict.vars.origin = Vector( 420, -1719, -8 ); 
            pPlayerEdict.vars.angles = Vector( 0.000000, 90.000000, 0.000000 );
        elseif ( sPlayerName == "BotSkipper" ) then
            pPlayerEdict.vars.origin = Vector( 421, -1799, -8 ); 
            pPlayerEdict.vars.angles = Vector( 0.000000, 90.000000, 0.000000 );
        end
    end
end


function PrintTime()
    PrintChatText( string.format( "%.3f (IM frames: %d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

SpeedrunInit();
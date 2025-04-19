connected = false;
spawned = false;
start_time = 0.0;
spawns_state = 0

function SpeedrunInit()
    SetTimescale( 0.5 );

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

    CreateTimer(0.000, ClientCmd,"sc_im_record of2a1");
    --CreateTimer(0.000, ClientCmd,"sc_im_play of2a1");

    --CreateTimer(0.000, ClientCmd,"sc_im_experimental 1");
    --CreateTimer(2.800, ClientCmd,".tas_bm_spawnbot");
    --CreateTimer(2.800, ClientCmd,".tas_bm_startbot");

    CreateTimer(0.0, ClientCmd,"sc_strafe 1");
    CreateTimer(0.0, ClientCmd,"weapon_shotgun");
    CreateTimer(0.0, ClientCmd,"sc_strafe_ignore_ground 0");
    CreateTimer(0.0, ClientCmd,"sc_strafe_yaw -107");
    CreateTimer(0.204, ClientCmd,"+sc_ducktap");
    CreateTimer(0.224, ClientCmd,"-sc_ducktap");
    CreateTimer(0.214, ClientCmd,"+duck");
    CreateTimer(0.214, ClientCmd,"+jump");
    CreateTimer(0.670, ClientCmd,"sc_strafe_yaw -90");
    CreateTimer(0.535, ClientCmd,"gibme");
    CreateTimer(0.565, ClientCmd,"gibme");
    CreateTimer(0.745, ClientCmd,"gibme");
    CreateTimer(1.374, ClientCmd,"sc_strafe_yaw -151");
    CreateTimer(1.374, ClientCmd,"sc_st_setangles 0 -179 120");
    CreateTimer(1.385, ClientCmd,"setang -16 -151 0");
    CreateTimer(1.386, ClientCmd,"+attack");
    CreateTimer(1.390, ClientCmd,"weapon_eagle");
    CreateTimer(1.450, ClientCmd,"-attack");
    CreateTimer(1.390, ClientCmd,"setang 0 -90 0");
    CreateTimer(1.605, ClientCmd,"gibme");
    CreateTimer(1.605, ClientCmd,"gibme");
    CreateTimer(1.605, ClientCmd,"gibme");
    CreateTimer(1.605, ClientCmd,"gibme");
    CreateTimer(1.755, ClientCmd,"gibme");
    CreateTimer(1.760, ClientCmd,"sc_strafe_yaw -155")
    CreateTimer(1.9, ClientCmd,"sc_st_setangles 18 -179 60");
    CreateTimer(1.970, ClientCmd,"gibme");
    CreateTimer(2.010, ClientCmd,"sc_strafe_yaw 170")
    CreateTimer(2.135, ClientCmd,"gibme");
    CreateTimer(2.205, ClientCmd,"+attack");
    CreateTimer(2.210, ClientCmd,"weapon_shotgun");
    CreateTimer(2.200, ClientCmd,"sc_st_setangles 0 -90 60");
    CreateTimer(2.225, ClientCmd,"-attack");
    CreateTimer(2.250, ClientCmd,"sc_strafe_yaw 179");
    CreateTimer(2.300, ClientCmd,"sc_strafe_yaw -90");
    CreateTimer(2.595, ClientCmd,"-duck");
    CreateTimer(2.595, ClientCmd,"sc_strafe_yaw -93");
    CreateTimer(2.800, ClientCmd,"sc_strafe_yaw -90");
    CreateTimer(2.705, ClientCmd,"-jump");
    CreateTimer(3.220, ClientCmd,"+jump");
    CreateTimer(3.520, ClientCmd,"+duck");
    CreateTimer(3.595, ClientCmd,"gibme");
    CreateTimer(3.595, ClientCmd,"gibme");
    CreateTimer(3.595, ClientCmd,"gibme");
    CreateTimer(3.695, ClientCmd,"-duck");
    CreateTimer(3.660, ClientCmd,"sc_strafe_yaw -118");
    CreateTimer(3.995, ClientCmd,"+duck");
    CreateTimer(4.450, ClientCmd,"sc_strafe_yaw -90");
    CreateTimer(4.565, ClientCmd,"-duck");
    CreateTimer(4.595, ClientCmd,"+back");
    CreateTimer(4.635, ClientCmd,"-back");
    CreateTimer(4.624, ClientCmd,"sc_strafe_type 1");
    CreateTimer(4.960, ClientCmd,"sc_strafe_yaw 179");
    CreateTimer(4.960, ClientCmd,"sc_st_setangles 0 179 60");
    CreateTimer(5.240, ClientCmd,"sc_strafe_yaw 90");
    CreateTimer(5.240, ClientCmd,"sc_st_setangles 0 90 60");
    CreateTimer(5.240, ClientCmd,"-jump");
    CreateTimer(5.240, ClientCmd,"+sc_ducktap");
    CreateTimer(5.340, ClientCmd,"sc_st_setangles 0 -127 460");
    CreateTimer(5.640, ClientCmd,"sc_strafe_type 0");
    CreateTimer(5.650, ClientCmd,"sc_strafe_yaw 70");
    CreateTimer(5.860, ClientCmd,"+duck");
    CreateTimer(6.0, ClientCmd,"sc_strafe_yaw 90");
    CreateTimer(6.10, ClientCmd,"-sc_ducktap");
    CreateTimer(6.10, ClientCmd,"+jump");
    CreateTimer(6.059, ClientCmd,"-duck");
    CreateTimer(6.225, ClientCmd,"sc_strafe_yaw -160");
    CreateTimer(6.594, ClientCmd,"sc_strafe_yaw -130");
    CreateTimer(6.994, ClientCmd,"gibme");
    CreateTimer(7.340, ClientCmd,"sc_st_setangles 0 90 160");
    CreateTimer(7.340, ClientCmd,"sc_strafe_yaw 85");
    CreateTimer(8.450, ClientCmd,"sc_st_setangles 0 179 160");
    CreateTimer(8.450, ClientCmd,"sc_strafe_yaw -179");
    CreateTimer(8.920, ClientCmd,"gibme");
    CreateTimer(8.920, ClientCmd,"gibme");
    CreateTimer(9.074, ClientCmd,"+duck");
    CreateTimer(9.380, ClientCmd,"sc_strafe_yaw 152");
    CreateTimer(9.474, ClientCmd,"-duck");
    CreateTimer(9.474, ClientCmd,"-jump");
    CreateTimer(9.475, ClientCmd,"sc_strafe_yaw \"\"");
   
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
            pPlayerEdict.vars.origin = Vector( -128, 1, 39 );
            pPlayerEdict.vars.angles = Vector( 0.000000, 90.000000, 0.000000 );
        elseif ( sPlayerName == "QEES" ) then
            pPlayerEdict.vars.origin = Vector( 1884, 1880, 40 ); 
            pPlayerEdict.vars.angles = Vector( 0, -90, 0 );
        end
    end
end


function PrintTime()
    PrintChatText( string.format( "%.3f (IM frames: %d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

SpeedrunInit();
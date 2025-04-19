connected = false;
spawned = false;
start_time = 0.0;
spawns_state = 0

-- залупа скрипт, тут ничего нет интересного

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

    --CreateTimer(0.000, ClientCmd,"sc_im_record of1a5bot1");
    --CreateTimer(0.000, ClientCmd,"sc_im_play of1a5bot1");

    CreateTimer(68.000, ClientCmd,"votekill ialex");
    --CreateTimer(0.000, ClientCmd,"sc_im_experimental 1");
    --CreateTimer(2.800, ClientCmd,".tas_bm_spawnbot");
    --CreateTimer(2.800, ClientCmd,".tas_bm_startbot");

    
    --[[CreateTimer(0.000, ClientCmd,"sc_strafe 0");
    CreateTimer(0.350, ClientCmd,"sc_strafe 1");
    CreateTimer(0.350, ClientCmd,"sc_strafe_ignore_ground 0");
    CreateTimer(0.350, ClientCmd,"sc_strafe_yaw -90");
    CreateTimer(0.750, ClientCmd,"+jump");
    CreateTimer(1.095, ClientCmd,"sc_strafe_yaw -156");
    CreateTimer(0.950, ClientCmd,"sc_st_setangles 0 -180 160");
    CreateTimer(0.950, ClientCmd,"sc_st_setangles 0 90 260");
    CreateTimer(1.850, ClientCmd,"sc_strafe_yaw 93");
    CreateTimer(2.720, ClientCmd,"+duck");
    CreateTimer(2.850, ClientCmd,"-duck");
    CreateTimer(4.000, ClientCmd,"sc_strafe_yaw -5");
    CreateTimer(4.000, ClientCmd,"sc_st_setangles 0 0 260");
    CreateTimer(5.200, ClientCmd,"sc_strafe_yaw 0");
    CreateTimer(5.400, ClientCmd,"sc_strafe_yaw 59");
    CreateTimer(5.400, ClientCmd,"sc_st_setangles 0 59 80");
    CreateTimer(6.720, ClientCmd,"+duck");
    CreateTimer(6.790, ClientCmd,"-duck");
    CreateTimer(7.000, ClientCmd,"sc_strafe_yaw 63");
    CreateTimer(7.390, ClientCmd,"+duck");
    CreateTimer(7.474, ClientCmd,"-duck");
    CreateTimer(7.324, ClientCmd,"+back");
    CreateTimer(7.450, ClientCmd,"-back");
    CreateTimer(7.270, ClientCmd,"sc_strafe_type 1");
    CreateTimer(7.370, ClientCmd,"sc_strafe_yaw -45");
    CreateTimer(7.370, ClientCmd,"sc_st_setangles 0 0 80");
    CreateTimer(7.810, ClientCmd,"sc_strafe_type 0");
    CreateTimer(7.370, ClientCmd,"sc_strafe_yaw 3");
    CreateTimer(7.589, ClientCmd,"+back");
    CreateTimer(7.788, ClientCmd,"-back");
    CreateTimer(7.589, ClientCmd,"+moveright");
    CreateTimer(7.790, ClientCmd,"-moveright");
    CreateTimer(8.110, ClientCmd,"sc_strafe_yaw 28");
    CreateTimer(8.110, ClientCmd,"-jump");
    CreateTimer(8.110, ClientCmd,"+duck");
    CreateTimer(8.500, ClientCmd,"-duck");]]



    --[[CreateTimer(0.000, ClientCmd,"sc_st_setangles 0 -4 160");
    CreateTimer(0.000, ClientCmd,"sc_strafe_yaw -110");
    CreateTimer(0.290, ClientCmd,"+jump");
    CreateTimer(0.645, ClientCmd,"sc_strafe_yaw -179");
    CreateTimer(0.699, ClientCmd,"+attack");
    CreateTimer(0.799, ClientCmd,"-attack");
    CreateTimer(0.699, ClientCmd,"sc_st_setangles 40 144 230");
    CreateTimer(1.100, ClientCmd,"sc_strafe_yaw 146");
    CreateTimer(1.848, ClientCmd,"+use");
    CreateTimer(1.890, ClientCmd,"-use");
    CreateTimer(1.890, ClientCmd,"-jump");
    CreateTimer(1.890, ClientCmd,"sc_strafe_ignore_ground 1");
    CreateTimer(1.890, ClientCmd,"sc_strafe 0");
    CreateTimer(1.890, ClientCmd,"sc_st_setangles 0 0 160");
    CreateTimer(1.890, ClientCmd,"sc_strafe_yaw \"\"");]]

   


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




function PrintTime()
    PrintChatText( string.format( "%.3f (IM frames: %d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

SpeedrunInit();
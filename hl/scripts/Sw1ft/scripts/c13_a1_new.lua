

function SpeedrunInit()
    RemoveAllTimers();

    ClientCmd(" sc_st_disable_spread 0; default_fov 85; -sc_ducktap; -jump; -duck; -forward; -back; -moveleft; -moveright; sc_strafe 0; sc_strafe_yaw \"\"; sc_strafe_ignore_ground 1; -attack; sc_im_stop");
    ClientCmd("sc_strafe_type 0; sc_strafe_dir 3; sc_st_setangles_stop; sc_ducktap_adjust_fps 0; sc_autojump_inconsistent 0; sc_strafe_vectorial_increment 0; fps_max 200; mp_classic_mode 1; clockwindow 0");
    ClientCmd("sc_aimbot 0; sc_aimbot_change_angles_back 0");
    
   
end

function OnBeginLoading()
    SpeedrunInit();
end

function SpeedrunStart()
    SpeedrunStartCustom();
    -- connected = true;
end

function SpeedrunStartCustom()
    start_time = SegmentCurrentTime();


    ClientCmd("weapon_medkit");
    -- ClientCmd("weapon_gauss");
    -- ClientCmd("sc_im_record c13_a1_sw1ft");
    ClientCmd("sc_im_play c13_a1_sw1ft; ");

    CreateTimer( 1.0, ClientCmd, "sc_strafe 1" );
end

function PrintTime()
    PrintChatText( string.format( "%.3f (IM frames: %d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

SpeedrunInit();


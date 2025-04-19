connected = false;
spawned = false;
start_time = 0.0;
postspawn = false;

function SpeedrunInit()
    ClientCmd( "fps_max 200; sc_st_timescale 0.2" );
    ClientCmd(" sc_st_disable_spread 0; -sc_ducktap; -jump; -duck; -forward; -back; -moveleft; -moveright; sc_strafe 0; sc_strafe_dir 3; sc_strafe_yaw \"\"; sc_strafe_ignore_ground 0; -attack; sc_im_stop");
    ClientCmd("sc_strafe_type 0; sc_strafe_dir 3; sc_st_setangles_stop; sc_ducktap_adjust_fps 0; sc_autojump_inconsistent 0; fps_max 200; mp_classic_mode 1; clockwindow 0");
end

function OnBeginLoading()
    ClientCmd( "fps_max 200; sc_st_timescale 0.2" );
end

function SpeedrunStart()
    SpeedrunStartCustom();
    -- connected = true;
end

function SpeedrunStartCustom()
    start_time = SegmentCurrentTime();

    ClientCmd("sc_im_play c01_a2_sw1ft");
    -- ClientCmd("sc_im_record c01_a2_sw1ft");

    CreateTimer( 3.5, ClientCmd, "sc_im_stop" );
end

function PrintTime()
    PrintChatText( string.format( "%.3f (IM frames: %d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

SpeedrunInit();
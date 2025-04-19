function InitTriggers()
    ClearTriggers();
    ClearServerTriggers();

    
end

function OnDisconnect()
    ClientCmd( "bind MOUSE1 +attack" );
end

function SpeedrunInit()
    -- CreateTimer(1e-6, SetTimescale, 0.25 );

    -- ClientCmd( "sv_cheats 0; wait; sc_script \"SetTimescale(0.25)\"" );
    ClientCmd( "sc_st_setangles_stop; sc_st_setangles2_stop; sc_st_follow_point_stop; -jump; -duck; -attack; -moveleft; -right; -moveright; -sc_ducktap; sc_aimbot_scripts_filter_targets 1" );
    ClientCmd( "sc_strafe 0; sc_strafe_dir 3; sc_strafe_ignore_ground 1; sc_strafe_vectorial 1; sc_strafe_vectorial_increment 1; sc_strafe_vectorial_snap 170; sc_aimbot 0; sc_st_disable_spread 0; sc_jumpbug_min_fall_velocity 580" );
    ClientCmd( "clockwindow 0; cl_smoothtime 0; mp_respawndelay 0; mp_classic_mode 1; fps_max 200; sc_jumpbug_min_fall_velocity 580; sc_st_legit_mode_ignore_freeze 1; sc_aimbot_change_angles_back 1; sc_ducktap_adjust_fps 10000" );

    ClientCmd( "bind MOUSE1 \"sc_aimbot 1; sc_st_disable_spread 1; +attack; wait; -attack; wait; sc_st_disable_spread 0; sc_aimbot 0\"" );
end

function SpeedrunStart()
    start_time = SegmentCurrentTime();

    InitTriggers();

    ClientCmd( "sc_im_play c07a2_skopper" );
    -- ClientCmd( "sc_im_record c07a2_skopper" );
    ClientCmd( "sc_strafe 1" );
end

function PrintTime()
    PrintChatText( string.format( "%.3f", SegmentCurrentTime() - start_time ) );
end

function OnBeginLoading()
    SpeedrunInit();
end

SpeedrunInit();

printl( "Executed c07_a2_skopper" );
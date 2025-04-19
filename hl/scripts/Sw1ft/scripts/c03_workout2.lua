local start_time = 0;

RemoveAllTimers();

ClientCmd( "reviveme;wait;give item_healthkit;give item_healthkit;give item_healthkit;give item_healthkit;weapon_9mmhandgun" );
ClientCmd( "toggle_survival_mode;toggle_survival_mode;sc_im_stop; sc_st_setangles_stop; sc_st_setangles2_stop; sc_st_follow_point_stop; sc_aimbot_scripts_filter_targets 1" );
ClientCmd( "setpos 2337.625000 -814.062500 -537.180355" );
ClientCmd( "setvel 0 0 0; -jump; -duck; -attack; -attack2; -sc_ducktap; -forward; -moveleft; -moveright; -back; sc_strafe 0; sc_strafe_type 0; sc_strafe_dir 3; sc_strafe_vectorial 1; sc_strafe_ignore_ground 1; sc_aimbot 0; sc_strafe_vectorial_increment 1; sc_strafe_vectorial_snap 170" );
ClientCmd( "sc_st_legit_mode_ignore_freeze 1; sc_st_timescale 0.25" );

function StartShit()
    start_time = SegmentCurrentTime();

    PrintChatText( "START" );

    ClientCmd( "sc_im_play c03_elevskip_qees" );
    -- ClientCmd( "sc_im_record c03_elevskip_qees" );

    -- ClientCmd( "setang 10 157; sc_strafe 1; sc_strafe_dir 3; sc_strafe_ignore_ground 0; sc_strafe_yaw 157" );
    -- CreateTimer( 0.4, ClientCmd, "+jump; wait; sc_strafe_ignore_ground 1" );
    -- CreateTimer( 0.47, ClientCmd, "sc_strafe_yaw 180" );
    -- CreateTimer( 1.7, ClientCmd, "setang 35 180; sc_strafe_yaw 151.5" );
    -- CreateTimer( 1.75, ClientCmd, "-jump; +sc_ducktap" );
    -- CreateTimer( 1.89, ClientCmd, "-sc_ducktap" );
    -- CreateTimer( 2.0, ClientCmd, "+duck; +jump" );
    -- CreateTimer( 2.12, ClientCmd, "sc_strafe_yaw -142; -duck" );
    -- CreateTimer( 2.4, ClientCmd, "-jump; +sc_ducktap" );
    -- CreateTimer( 2.8, ClientCmd, "-sc_ducktap" );
end

CreateTimer( 0.39, ClientCmd, "sc_st_timescale 0.25" );
CreateTimer( 0.4, StartShit );

function PrintTime()
    PrintChatText( string.format( "%.3f (%d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

printl( "Executed c03_workout2" );
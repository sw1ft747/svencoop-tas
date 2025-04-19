local playback_only = false;
local start_time = 0;
local start_onground = false;

RemoveAllTimers();

PrintChatText( "APTECHKU V RUCHKI" );

ClientCmd( "weapon_crowbar" );
ClientCmd( "setvel 0 0 0; setpos 1951.156250 -20.750000 332.031250; wait; kill" );
ClientCmd( "sc_im_stop; sc_st_setangles_stop; sc_st_setangles2_stop; sc_st_follow_point_stop" );
ClientCmd( "setvel 0 0 0; -jump; -duck; -attack; -attack2; -sc_ducktap; -forward; -moveleft; -moveright; -back; sc_strafe 0; sc_strafe_type 0; sc_strafe_dir 3; sc_strafe_vectorial 1; sc_strafe_ignore_ground 1; sc_aimbot 0; sc_strafe_vectorial_increment 1; sc_strafe_vectorial_snap 170" );
ClientCmd( "sc_ducktap_adjust_fps 10000; sc_st_legit_mode_ignore_freeze 1; sc_st_timescale 0.1" );

function OnSpecialSpawn( pPlayerEdict )
    RemoveAllTimers();

    start_time = SegmentCurrentTime();

    printl( "OnSpecialSpawn()" );
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" has been revived at " .. tostring( pPlayerEdict.vars.origin ) );

    pPlayerEdict.vars.origin = Vector( 1968.628174, -19.179653, 333.310822 );

    -- ClientCmd( "sc_im_play c7a2_postrevive" );
    ClientCmd( "sc_im_record c7a2_postrevive; sc_strafe 1; sc_strafe_vectorial 1; sc_strafe_ignore_ground 0; sc_strafe_dir 3; sc_strafe_vectorial_increment 1" );
    ClientCmd( "setang 25 57" );
    ClientCmd( "sc_strafe_yaw 57" );

    CreateTimer( 0.219, ClientCmd, "+jump" );
    CreateTimer( 0.87, ClientCmd, "-jump; +sc_ducktap; sc_strafe_yaw 90" );
    CreateTimer( 1.08, ClientCmd, "+duck" );
    CreateTimer( 1.14, ClientCmd, "-duck" );

    -- CreateTimer( 1.85, ClientCmd, "sc_strafe_yaw 90" );
    -- CreateTimer( 2.04, ClientCmd, "+duck" );
    -- CreateTimer( 2.1, ClientCmd, "-duck" );
    -- CreateTimer( 2.32, ClientCmd, "+duck" );
    -- CreateTimer( 2.4, ClientCmd, "-duck; sc_strafe_yaw 111.5; sc_strafe_type 1; -jump" );
    -- CreateTimer( 2.53, ClientCmd, "sc_st_setangles 50 111.5 50" );
    -- CreateTimer( 2.85, ClientCmd, "+back; sc_st_setangles_stop" );
    -- CreateTimer( 2.98, ClientCmd, "-back; sc_strafe 0" );
    -- CreateTimer( 2.9745, ClientCmd, "+moveleft;+forward;+jump" );
    -- CreateTimer( 3.17, ClientCmd, "-moveleft;-forward; sc_strafe_vectorial_snap 90; sc_strafe 1; sc_strafe_type 0; sc_strafe_yaw -45" );
    -- CreateTimer( 3.18, ClientCmd, "-jump; +sc_ducktap" );
    -- CreateTimer( 3.6, ClientCmd, "+duck" );
    -- CreateTimer( 3.65, ClientCmd, "-duck" );
    -- CreateTimer( 3.9, ClientCmd, "sc_strafe_yaw -90" );
    -- CreateTimer( 4.07, ClientCmd, "sc_strafe_yaw 115" );
    -- CreateTimer( 4.78, ClientCmd, "sc_strafe_yaw 90" );
    -- CreateTimer( 4.95, ClientCmd, "sc_strafe_yaw -80" );
    -- CreateTimer( 5.68, ClientCmd, "sc_strafe_yaw 80" );
    -- CreateTimer( 6.5, ClientCmd, "sc_st_timescale 0.25" );
    -- CreateTimer( 6.2, ClientCmd, "sc_strafe_type 1; sc_strafe_dir 4; sc_strafe_point_x -1210.493896; sc_strafe_point_y 268.230377; -sc_ducktap; sc_strafe_vectorial_snap 170" );
    -- CreateTimer( 6.48, ClientCmd, "sc_strafe_type 2" );
    -- CreateTimer( 6.7, ClientCmd, "sc_strafe 0; sc_strafe_type 0; sc_st_setangles 89 -90 50" );
    -- CreateTimer( 7.4, ClientCmd, "sc_st_setangles_stop; setang 89 -90; +forward" );
    -- CreateTimer( 9.14, ClientCmd, "setang 0" );
    -- CreateTimer( 9.75, ClientCmd, "setang -70" );
end

CreateTimer( 0.39, ClientCmd, "reviveme" );

function PrintTime()
    PrintChatText( string.format( "%.3f (%d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

printl( "Executed c07_a2_workout" );
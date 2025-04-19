local playback_only = false;
local start_time = 0;

RemoveAllTimers();

PrintChatText( "APTECHKU V RUCHKI" );

-- ClientCmd( "weapon_medkit" );
ClientCmd( "weapon_hl357" );
ClientCmd( "sc_st_setangles_stop; sc_st_setangles2_stop; sc_st_follow_point_stop" );
ClientCmd( "setvel 0 0 0; -jump; -duck; -attack; -attack2; -sc_ducktap; sc_strafe 0; sc_strafe_type 0; sc_strafe_dir 3; sc_strafe_ignore_ground 1; sc_aimbot 0" );

function SplitShit()
    start_time = SegmentCurrentTime();

    InputManager.Stop();

    InputManager.Playback( "c07a2_bunnyrun" );

    ClientCmd( "sc_im_goto 7550" );
    -- InputManager.Goto( 90 );
    -- InputManager.Split();

    -- ClientCmd( "sc_strafe 1; sc_strafe_dir 3; sc_strafe_vectorial 0; sc_strafe_ignore_ground 0; sc_strafe_yaw 141.5" );
    -- CreateTimer( 0.4, ClientCmd, "+jump; sc_strafe_yaw 180" );
    -- CreateTimer( 0.8, ClientCmd, "+duck" );
    -- CreateTimer( 0.85, ClientCmd, "weapon_hl357" );
    -- CreateTimer( 0.9, ClientCmd, "-duck" );
    -- CreateTimer( 1.5, ClientCmd, "-jump; +sc_ducktap" );
    -- CreateTimer( 2.3, ClientCmd, "+jump; -sc_ducktap" );
    -- CreateTimer( 4.5, ClientCmd, "sc_strafe_yaw 178" );
    -- CreateTimer( 5.0, ClientCmd, "sc_strafe_yaw 180" );
    -- CreateTimer( 5.65, ClientCmd, "sc_strafe_yaw -90" );
    -- CreateTimer( 7.66, ClientCmd, "sc_strafe_yaw 0" );
    

    -- InputManager.Goto( 2000 );
    -- InputManager.Split();

    -- ClientCmd( "sc_strafe 1; sc_strafe_yaw 0.35; +sc_ducktap" );
    -- CreateTimer( 0.565, ClientCmd, "+duck" );
    -- CreateTimer( 0.62, ClientCmd, "-duck" );
    -- CreateTimer( 0.69, ClientCmd, "-sc_ducktap; +jump" );
    -- CreateTimer( 0.66, ClientCmd, "sc_strafe_yaw 7" );
    -- CreateTimer( 0.9, ClientCmd, "sc_strafe_yaw -25" );
    -- CreateTimer( 1.325, ClientCmd, "sc_strafe_yaw -90.7" );
    -- CreateTimer( 1.58, ClientCmd, "+duck" );
    -- CreateTimer( 1.65, ClientCmd, "-duck" );
    -- CreateTimer( 2.5, ClientCmd, "sc_strafe_yaw -90" );
    -- CreateTimer( 3.4, ClientCmd, "+sc_ducktap; -jump" );
    -- CreateTimer( 3.5, ClientCmd, "-sc_ducktap; +jump" );
    -- CreateTimer( 4.1, ClientCmd, "sc_strafe_yaw -170" );
    -- CreateTimer( 4.8, ClientCmd, "sc_strafe_yaw -180" );
    -- CreateTimer( 5.5, ClientCmd, "sc_strafe_type 3; sc_strafe_yaw 90" );


    -- InputManager.Goto( 3000 );
    -- InputManager.Split();

    -- ClientCmd( "sc_strafe 1; sc_strafe_dir 3; sc_strafe_vectorial 0; sc_strafe_ignore_ground 1; sc_strafe_yaw -180; +jump" );
    -- CreateTimer( 0.38, ClientCmd, "sc_strafe_yaw 100" );
    -- CreateTimer( 1.15, ClientCmd, "-jump; +sc_ducktap" );
    -- CreateTimer( 1.3, ClientCmd, "+jump; -sc_ducktap" );
    -- CreateTimer( 1.69, ClientCmd, "sc_strafe_yaw 90" );
    -- CreateTimer( 2.58, ClientCmd, "sc_strafe_type 1; sc_strafe_yaw -180" );
    -- CreateTimer( 3.35, ClientCmd, "sc_strafe_type 3" );
    -- CreateTimer( 3.36, ClientCmd, "-jump; +sc_ducktap" );
    -- CreateTimer( 3.7, ClientCmd, "+jump; -sc_ducktap" );
    -- CreateTimer( 3.83, ClientCmd, "sc_strafe_type 1; sc_strafe_yaw -90" );
    -- CreateTimer( 4.65, ClientCmd, "sc_strafe_yaw -77" );
    -- CreateTimer( 5.03, ClientCmd, "sc_strafe_type 0; sc_strafe_yaw -90" );
    -- CreateTimer( 5.5, ClientCmd, "+duck" );
    -- CreateTimer( 5.6, ClientCmd, "-duck" );
    -- CreateTimer( 5.95, ClientCmd, "sc_strafe_yaw -180" );
    -- CreateTimer( 6.95, ClientCmd, "-jump; +sc_ducktap" );
    -- CreateTimer( 6.95, ClientCmd, "-jump; +sc_ducktap" );
    -- CreateTimer( 7.05, ClientCmd, "sc_strafe_yaw 173" );
    -- CreateTimer( 7.1, ClientCmd, "-sc_ducktap" );


    -- ClientCmd( "sc_im_goto 4400; sc_im_split" );

    -- ClientCmd( "sc_strafe 1; sc_strafe_dir 3; sc_strafe_vectorial 0; sc_strafe_ignore_ground 1; sc_strafe_yaw 175; sc_st_setangles 90 180 50; +sc_ducktap" );
    -- ClientCmd( "weapon_medkit" );
    -- ClientCmd( "+attack2" );
    -- CreateTimer( 0.195, ClientCmd, "sc_strafe_yaw -180; -sc_ducktap" );
    -- CreateTimer( 0.3, ClientCmd, "sc_st_setangles_stop" );
    -- CreateTimer( 0.5, ClientCmd, "sc_strafe 0; +jump; +back" );
    -- CreateTimer( 0.6, ClientCmd, "-jump; -back; -attack2" );
    -- CreateTimer( 0.6, ClientCmd, "sc_freeze2" );
    -- CreateTimer( 2.05, ClientCmd, "sc_freeze2" );
    -- CreateTimer( 2.1, ClientCmd, "setang 20 0" );
    -- CreateTimer( 2.5, ClientCmd, "sc_strafe 1; sc_strafe_yaw 35" );
    -- CreateTimer( 3.1, ClientCmd, "sc_strafe_yaw -35" );
    -- CreateTimer( 3.29, ClientCmd, "sc_strafe_yaw 0" );
    -- CreateTimer( 3.8, ClientCmd, "+duck" );
    -- CreateTimer( 4.0, ClientCmd, "-duck; +jump" );


    -- ClientCmd( "sc_im_goto 5200; sc_im_split" );
    -- ClientCmd( "sc_strafe 1; sc_strafe_dir 3; sc_strafe_vectorial 0; sc_strafe_ignore_ground 1; sc_strafe_yaw 0; +jump" );
    -- ClientCmd( "weapon_hl357" );
    -- CreateTimer( 0.85, ClientCmd, "-jump; +sc_ducktap" );
    -- CreateTimer( 0.95, ClientCmd, "+jump; -sc_ducktap" );
    -- CreateTimer( 1.25, ClientCmd, "sc_strafe_yaw -33" );
    -- CreateTimer( 1.8, ClientCmd, "sc_strafe_yaw -90" );
    -- CreateTimer( 2.05, ClientCmd, "+duck" );
    -- CreateTimer( 2.25, ClientCmd, "-duck" );


    -- ClientCmd( "sc_im_goto 5750; sc_im_split" );
    -- ClientCmd( "sc_strafe 1; sc_strafe_dir 3; sc_strafe_vectorial 0; sc_strafe_ignore_ground 1; sc_strafe_yaw -90; +jump" );
    -- CreateTimer( 0.88, ClientCmd, "sc_strafe_yaw -10" );
    -- CreateTimer( 1.6, ClientCmd, "sc_strafe_yaw 0" );
    -- CreateTimer( 1.845, ClientCmd, "+duck" );
    -- CreateTimer( 2.05, ClientCmd, "-duck" );
    -- CreateTimer( 2.2, ClientCmd, "+duck" );
    -- CreateTimer( 2.6, ClientCmd, "-duck" );
    -- CreateTimer( 2.66, ClientCmd, "sc_strafe_yaw 90" );


    -- ClientCmd( "sc_im_goto 6405; sc_im_split" );
    -- ClientCmd( "sc_strafe 1; sc_strafe_dir 3; sc_strafe_vectorial 0; sc_strafe_ignore_ground 1; sc_strafe_yaw 90; +jump" );


    -- ClientCmd( "sc_im_goto 6725; sc_im_split" );
    -- ClientCmd( "sc_strafe 1; sc_strafe_dir 3; sc_strafe_vectorial 0; sc_strafe_ignore_ground 1; sc_strafe_yaw 90; +jump; sc_jumpbug_min_fall_velocity 900" );
    -- CreateTimer( 0.135, ClientCmd, "sc_strafe_yaw 25" );
    -- CreateTimer( 0.8, ClientCmd, "sc_strafe_yaw 50" );
    -- CreateTimer( 1.25, ClientCmd, "sc_strafe_yaw -5" );
    -- CreateTimer( 1.9, ClientCmd, "sc_strafe_yaw 0" );
    -- CreateTimer( 2.0, ClientCmd, "+sc_ducktap; -jump" );
    -- CreateTimer( 2.22, ClientCmd, "sc_strafe_yaw -90" );
    -- CreateTimer( 2.25, ClientCmd, "-sc_ducktap; +jump" );
    -- CreateTimer( 2.37, ClientCmd, "sc_strafe_dir 0; sc_strafe_type 1" );
    -- CreateTimer( 2.72, ClientCmd, "sc_strafe_type 1" );
    -- CreateTimer( 3.05, ClientCmd, "sc_strafe_dir 3; sc_strafe_type 0; sc_strafe_yaw 0" );
    -- CreateTimer( 3.2, ClientCmd, "sc_strafe_yaw 30" );
    -- CreateTimer( 3.83, ClientCmd, "+duck" );
    -- CreateTimer( 3.85, ClientCmd, "-duck" );
    -- CreateTimer( 4.15, ClientCmd, "sc_strafe_yaw 0" );
    -- CreateTimer( 4.3, ClientCmd, "sc_strafe_yaw 20" );


    -- ClientCmd( "sc_im_goto 7625; sc_im_split" );
    -- ClientCmd( "sc_strafe 1; sc_strafe_dir 3; sc_strafe_vectorial 0; sc_strafe_ignore_ground 1; sc_strafe_yaw 20; +jump" );
    -- CreateTimer( 0.25, ClientCmd, "sc_strafe_yaw 58" );
    -- CreateTimer( 0.51, ClientCmd, "sc_aimbot 1; +attack; wait; setang 20; -attack; wait; sc_aimbot 0" );
    -- CreateTimer( 0.6, ClientCmd, "sc_strafe_yaw 74" );
    -- CreateTimer( 1.38, ClientCmd, "+duck" );
    -- CreateTimer( 1.415, ClientCmd, "-duck" );
    -- CreateTimer( 1.63, ClientCmd, "+duck" );
    -- CreateTimer( 1.67, ClientCmd, "-duck" );
    -- CreateTimer( 1.33, ClientCmd, "sc_strafe_yaw 10" );
    -- CreateTimer( 1.95, ClientCmd, "sc_strafe_yaw 90" );
    -- CreateTimer( 2.0, ClientCmd, "sc_strafe_yaw 180" );
    -- CreateTimer( 2.47, ClientCmd, "sc_strafe_yaw 90" );


    -- ClientCmd( "sc_im_goto 8115; sc_im_split" );
    -- ClientCmd( "sc_strafe 1; sc_strafe_dir 3; sc_strafe_vectorial 0; sc_strafe_ignore_ground 1; sc_strafe_yaw 35; +jump" );
    -- CreateTimer( 0.35, ClientCmd, "sc_aimbot 1; +attack; wait; setang 20; -attack; wait; sc_aimbot 0" );
    -- CreateTimer( 1.15, ClientCmd, "sc_aimbot 1; +attack; wait; setang 20; -attack; wait; sc_aimbot 0;wait; sc_im_stop" );
    -- CreateTimer( 1.0, ClientCmd, "+sc_ducktap; -jump" );
    -- CreateTimer( 1.3, ClientCmd, "-sc_ducktap" );
end

if ( playback_only ) then
    CreateTrigger("bunnyrun", Vector(528.094, 2411.000, -568.049), Vector(0, 0, -48), Vector(65.094, 57.438, 115.612));
else
    CreateTimer( 0.5, SplitShit );
end

function OnTouchTrigger(name)
    if ( name == "bunnyrun" ) then
        CreateTimer( 0.1, InputManager.Playback, "c07a2_bunnyrun" );
        -- CreateTimer( 0.1, InputManager.Record, "c07a2_bunnyrun" );
    end

    PrintChatText( "Touched trigger \"" .. name .. "\"" );
end

function PrintTime()
    PrintChatText( string.format( "%.3f", SegmentCurrentTime() - start_time ) );
end

printl( "Executed c07_a2_workout" );
local playback_only = false;
local start_time = 0;
local start_onground = false;

func_tank_state = 1;

RemoveAllTimers();

PrintChatText( "APTECHKU V RUCHKI" );

ClientCmd( "reviveme;wait;give item_healthkit;give item_healthkit;give item_healthkit;give item_healthkit;weapon_crowbar" );
ClientCmd( "sc_im_stop; sc_st_setangles_stop; sc_st_setangles2_stop; sc_st_follow_point_stop" );
ClientCmd( "setvel 0 0 0; -jump; -duck; -attack; -attack2; -sc_ducktap; -forward; -moveleft; -moveright; -back; sc_strafe 0; sc_strafe_type 0; sc_strafe_dir 3; sc_strafe_vectorial 1; sc_strafe_ignore_ground 1; sc_aimbot 0; sc_strafe_vectorial_increment 1; sc_strafe_vectorial_snap 170" );
ClientCmd( "sc_st_legit_mode_ignore_freeze 1; sc_st_timescale 0.25" );

function StartShit()
    start_time = SegmentCurrentTime();

    PrintChatText( "START" );

    ClientCmd( "sc_im_play c07a2_skip_v2" );
    -- ClientCmd( "sc_im_record c07a2_skip_v2" );

    -- ClientCmd( "setang 20 0; sc_strafe 1; sc_strafe_dir 3; sc_strafe_ignore_ground 0; sc_strafe_yaw 0" );
    -- CreateTimer( 0.1, ClientCmd, "weapon_357" );
    -- CreateTimer( 0.355, ClientCmd, "+jump" );
    -- CreateTimer( 0.865, ClientCmd, "sc_strafe_yaw 55.5; sc_strafe_ignore_ground 1" );
    -- CreateTimer( 0.98, ClientCmd, "-jump; +sc_ducktap" );
    -- -- CreateTimer( 1.29, ClientCmd, "sc_strafe 0; sc_aimbot 1; sc_st_disable_spread 1; +attack; wait; -attack; wait; sc_st_disable_spread 0; sc_aimbot 0; sc_strafe 1; setang 20 55.5" );
    -- CreateTimer( 1.2875, ClientCmd, "sc_strafe 0; sc_aimbot 1; sc_st_disable_spread 1; +attack; wait; -attack; wait; sc_st_disable_spread 0; sc_aimbot 0; sc_strafe 1; setang 20 55.5" );
    -- CreateTimer( 1.46, ClientCmd, "sc_strafe_yaw 73" );
    -- CreateTimer( 1.55, ClientCmd, "+jump; -sc_ducktap" );
    -- CreateTimer( 2.4, ClientCmd, "+duck; sc_strafe_yaw 1" );
    -- CreateTimer( 2.5, ClientCmd, "-duck" );
    -- CreateTimer( 2.9, ClientCmd, "-jump; +sc_ducktap" );
    -- CreateTimer( 3.005, ClientCmd, "sc_strafe_yaw 155; sc_strafe_type 1; sc_strafe_vectorial_increment 1; +jump; -sc_ducktap" );
    -- CreateTimer( 3.656, ClientCmd, "sc_strafe_yaw 25" );
    -- CreateTimer( 4.17, ClientCmd, "sc_aimbot_change_angles_back 1; sc_strafe 0; sc_aimbot 1; sc_st_disable_spread 1; +attack; wait; -attack; wait; sc_st_disable_spread 0; sc_aimbot 0; sc_strafe 1" );
    -- CreateTimer( 3.95, ClientCmd, "sc_strafe 0; +moveright; +right" );
    -- CreateTimer( 4.17, ClientCmd, "sc_strafe 1; sc_strafe_type 0; sc_strafe_yaw 30; -moveright; -right" );
    -- CreateTimer( 4.23, ClientCmd, "sc_strafe_yaw 54" );
    -- CreateTimer( 4.81, ClientCmd, "sc_strafe_yaw 0; -jump" );
    -- CreateTimer( 4.99, ClientCmd, "sc_aimbot_change_angles_back 1; sc_strafe 0; sc_aimbot 1; sc_st_disable_spread 1; +attack; wait; -attack; wait; sc_st_disable_spread 0; sc_aimbot 0; sc_strafe 1; +sc_ducktap" );
    -- CreateTimer( 5.3, ClientCmd, "-sc_ducktap; sc_selfsink2" );

    -- CreateTimer( 3.97, ClientCmd, "sc_strafe_yaw 60; sc_strafe_type 3; sc_strafe_dir 1; sc_strafe_vectorial_increment 1" );
    -- CreateTimer( 3.28, ClientCmd, "sc_strafe_yaw 137.5; sc_strafe_vectorial_increment 2; +jump; -sc_ducktap" );
    -- CreateTimer( 3.97, ClientCmd, "sc_strafe_yaw 60; sc_strafe_type 3; sc_strafe_dir 1; sc_strafe_vectorial_increment 1" );
end

function TeleportShit()
    local player = GetPEntityFromEntityIndex( 1 );

    player.vars.origin = Vector( 244.000000, -1940.000000, 337.000000 );
    player.vars.angles = Vector( 0.000000, 0.000000, 0.000000 );

    ClientCmd( "setang 0 0 0" );
    PrintChatText( "TELEPORTEDED" );

    start_onground = true;
end

CreateTimer( 0.39, ClientCmd, "sc_st_timescale 0.25" );
CreateTimer( 0.4, TeleportShit );
-- CreateTimer( 0.5, StartShit );

function OnSpecialSpawn( pPlayerEdict )
    printl( "OnSpecialSpawn()" );
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" has been revived at " .. tostring( pPlayerEdict.vars.origin ) );

    pPlayerEdict.vars.origin = Vector( 1968.628174, -19.179653, 333.310822 );

    ClientCmd( "wait;sc_im_play c7a2_postrevive;wait;weapon_crowbar" );
end

function OnGameFrame(state, frametime, postruncmd)
    if ( postruncmd and start_onground and ( PlayerMove.flags & FL_ONGROUND ) == FL_ONGROUND ) then
        -- StartShit();
        CreateTimer( 0.12, StartShit );
        start_onground = false;
    end
end

function PrintTime()
    PrintChatText( string.format( "%.3f (%d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

printl( "Executed c07_a2_workout" );
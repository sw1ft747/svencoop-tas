start_time = 0;

RemoveAllTimers();

function InitTriggers()
    CreateTrigger("post_elevskip_qees", Vector(2207.125, -830.281, -511.969), Vector(0, 0, 0), Vector(278.844, 85.031, 97.875));
    CreateTrigger("pre_ceilclip_qees", Vector(91.375, -678.344, -235.969), Vector(0, 0, -86.156), Vector(23.469, 33.531, 0));
    CreateTrigger("post_ceilclip_qees", Vector(12.469, -710.656, -240.594), Vector(0, 0, 0), Vector(250.406, 165.656, 113.844));
end

function SpeedrunInit()
    ClientCmd( "sc_st_setangles_stop; sc_st_setangles2_stop; sc_st_follow_point_stop; -jump; -duck; -attack; -moveleft; -right; -moveright; -sc_ducktap; sc_aimbot_scripts_filter_targets 1" );
    ClientCmd( "sc_strafe 0; sc_strafe_dir 3; sc_strafe_ignore_ground 1; sc_strafe_vectorial 1; sc_strafe_vectorial_increment 1; sc_strafe_vectorial_snap 170; sc_aimbot 0; sc_st_disable_spread 0; sc_jumpbug_min_fall_velocity 580" );
    ClientCmd( "clockwindow 0; cl_smoothtime 0; mp_respawndelay 0; mp_classic_mode 1; fps_max 200; sc_jumpbug_min_fall_velocity 580; sc_st_legit_mode_ignore_freeze 1; sc_aimbot_change_angles_back 1" );
end

function SpeedrunStart()
    start_time = SegmentCurrentTime();

    InitTriggers();

    ClientCmd( "weapon_medkit" );
end

function OnTouchTrigger(name)
    if ( name == "post_elevskip_qees" ) then
        CreateTimer( 0.1, ClientCmd, "sc_im_play c03_elevskip_qees" );
    elseif ( name == "pre_ceilclip_qees" ) then
        ClientCmd( "sc_auto_ceil_clipping; weapon_crowbar; sc_strafe 0" );
    elseif ( name == "post_ceilclip_qees" ) then
        ClientCmd( "sc_auto_ceil_clipping" );
        CreateTimer( 0.1, ClientCmd, "sc_im_play c03_qees; wait; sc_strafe 1" );
    end

    PrintChatText( "Touched trigger \"" .. name .. "\"" );
    return true;
end

function PrintTime()
    PrintChatText( string.format( "%.3f (%d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

SpeedrunInit();

printl( "Executed c03_qees" );
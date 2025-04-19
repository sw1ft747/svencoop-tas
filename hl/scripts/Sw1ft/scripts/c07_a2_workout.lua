local playback_only = false;
local start_time = 0;

RemoveAllTimers();

PrintChatText( "APTECHKU V RUCHKI" );

ClientCmd( "reviveme;wait;give item_healthkit;give item_healthkit;give item_healthkit;give item_healthkit;weapon_357" );
ClientCmd( "setvel 0 0 0; setpos 623.96875 2460.0 -609.72967529297; setang 20 -90" );
-- ClientCmd( "setvel 0 0 0; setpos 623.96875 2460.0 -609.72967529297; setang 40 -90" );
ClientCmd( "sc_im_stop; sc_st_setangles_stop; sc_st_setangles2_stop; sc_st_follow_point_stop" );
ClientCmd( "setvel 0 0 0; -jump; -duck; -attack; -attack2; -sc_ducktap; -forward; -moveleft; -moveright; -back; sc_strafe 0; sc_strafe_type 0; sc_strafe_dir 3; sc_strafe_vectorial 1; sc_strafe_ignore_ground 1; sc_aimbot 0; sc_strafe_vectorial_increment 1; sc_strafe_vectorial_snap 170" );
ClientCmd( "sc_st_legit_mode_ignore_freeze 1; sc_st_timescale 0.25" );

function SplitShit()
    start_time = SegmentCurrentTime();

    InputManager.Stop();

    -- InputManager.Playback( "c07a2_bunnyrun_new" );

    ClientCmd( "sc_im_play c07a2_bunnyrun_new" );
    -- ClientCmd( "sc_im_record c07a2_bunnyrun_new" );
    -- InputManager.Goto( 90 );
    -- InputManager.Split();

    -- ClientCmd( "setang 20 141.5; sc_strafe 1; sc_strafe_dir 3; sc_strafe_ignore_ground 0; sc_strafe_yaw 141.5" );
    -- CreateTimer( 0.15, ClientCmd, "+attack2" );
    -- CreateTimer( 0.3, ClientCmd, "weapon_357" );
    -- CreateTimer( 0.4, ClientCmd, "+jump; sc_strafe_yaw 180; -attack2" );
    -- CreateTimer( 0.8, ClientCmd, "+duck; sc_strafe_ignore_ground 1" );
    -- CreateTimer( 0.9, ClientCmd, "-duck" );
    -- CreateTimer( 1.5, ClientCmd, "-jump; +sc_ducktap" );
    -- CreateTimer( 2.3, ClientCmd, "+jump; -sc_ducktap" );
    -- CreateTimer( 4.5, ClientCmd, "sc_strafe_yaw 178" );
    -- CreateTimer( 5.0, ClientCmd, "sc_strafe_yaw 180" );
    -- CreateTimer( 5.7, ClientCmd, "sc_strafe_yaw -90" );
    -- CreateTimer( 7.74, ClientCmd, "sc_strafe_yaw 0" );

    -- ClientCmd( "sc_im_goto 2040; sc_im_split" );
    -- ClientCmd( "sc_strafe 1; sc_strafe_dir 3; sc_strafe_yaw 5; +jump" );
    -- CreateTimer( 0.13, ClientCmd, "+duck" );
    -- CreateTimer( 0.25, ClientCmd, "-duck" );
    -- CreateTimer( 0.3, ClientCmd, "sc_strafe_yaw 0" );
    -- CreateTimer( 0.4, ClientCmd, "sc_strafe_yaw -16" );
    -- CreateTimer( 0.75, ClientCmd, "sc_strafe_yaw -95" );
    -- CreateTimer( 1.16, ClientCmd, "+duck" );
    -- CreateTimer( 1.25, ClientCmd, "-duck" );
    -- CreateTimer( 1.75, ClientCmd, "sc_strafe_yaw -90" );
    -- CreateTimer( 2.9, ClientCmd, "+sc_ducktap; -jump" );
    -- CreateTimer( 3.28, ClientCmd, "-sc_ducktap; +jump" );
    -- CreateTimer( 3.65, ClientCmd, "sc_strafe_yaw -170" );
    -- CreateTimer( 4.49, ClientCmd, "sc_strafe_yaw 180" );
    -- CreateTimer( 5.0, ClientCmd, "sc_strafe_yaw 98.5" );
    -- CreateTimer( 6.2, ClientCmd, "sc_strafe 0; sc_aimbot 1; sc_st_disable_spread 1; +attack; wait; -attack; wait; sc_st_disable_spread 0; sc_aimbot 0; sc_strafe 1; setang 20 98.5" );
    -- -- CreateTimer( 6.4, ClientCmd, "sc_strafe 0; sc_aimbot 1; sc_st_disable_spread 1; +attack; wait; -attack; wait; sc_st_disable_spread 0; sc_aimbot 0; sc_strafe 1; setang 20 98.5" );
    -- CreateTimer( 6.51, ClientCmd, "+duck; sc_strafe_yaw 89" );
    -- CreateTimer( 6.52, ClientCmd, "-duck" );
    -- CreateTimer( 7.34, ClientCmd, "sc_strafe_yaw 180; sc_strafe_dir 0; sc_strafe_type 3" );
    -- CreateTimer( 8.07, ClientCmd, "sc_strafe_yaw 180; sc_strafe_dir 3; sc_strafe_type 0" );
    -- CreateTimer( 8.59, ClientCmd, "sc_strafe_yaw -90; sc_strafe_dir 0; sc_strafe_type 3" );
    -- CreateTimer( 9.4, ClientCmd, "sc_strafe_yaw -80; sc_strafe_dir 3; sc_strafe_type 0" );
    -- CreateTimer( 10.0, ClientCmd, "sc_strafe_yaw -89" );
    -- CreateTimer( 10.275, ClientCmd, "+duck" );
    -- CreateTimer( 10.35, ClientCmd, "-duck" );
    -- CreateTimer( 10.61, ClientCmd, "sc_strafe_yaw 180; sc_strafe_dir 1; sc_strafe_type 1; sc_strafe_ignore_ground 0" );
    -- CreateTimer( 11.0, ClientCmd, "sc_strafe_ignore_ground 1" );
    -- CreateTimer( 11.535, ClientCmd, "sc_strafe_yaw 180; sc_strafe_dir 3; sc_strafe_type 0" );

    ClientCmd( "sc_im_goto 4360; sc_im_split" );
    ClientCmd( "sc_strafe 1; sc_strafe_yaw 180; sc_strafe_dir 3; sc_strafe_type 0" );
    CreateTimer( 1.0 / ( 200.0 + 2 ), ClientCmd, "weapon_medkit" );
    CreateTimer( 0.1, ClientCmd, "+attack2" );
    CreateTimer( 0.19, ClientCmd, "sc_strafe_yaw -179.5" );
    -- CreateTimer( 0.19, ClientCmd, "sc_strafe_yaw -179.5; sc_st_setangles 89 180 70" );
    CreateTimer( 0.515, ClientCmd, "-attack2; sc_st_setangles_stop; sc_strafe 0; +jump; +back" );
    CreateTimer( 0.6, ClientCmd, "-jump; -back" );
    CreateTimer( 0.6, ClientCmd, "sc_freeze2" );
    CreateTimer( 2.05, ClientCmd, "sc_freeze2" );
    CreateTimer( 2.1, ClientCmd, "setang 20 0" );
    CreateTimer( 2.1, ClientCmd, "weapon_357" );
    CreateTimer( 2.11, ClientCmd, "sc_im_stop" );
    -- local shift = 2.71;
    -- CreateTimer( 0.25 + shift, ClientCmd, "sc_strafe 1; sc_strafe_yaw 5; sc_strafe_dir 3; sc_strafe_type 0" );
    -- CreateTimer( 1.6 + shift, ClientCmd, "sc_strafe_yaw 0; +sc_ducktap" );
    -- CreateTimer( 2.85 + shift, ClientCmd, "-sc_ducktap; +jump; sc_strafe_yaw -37" );
    -- CreateTimer( 3.375 + shift, ClientCmd, "sc_strafe_yaw -90" );
    -- CreateTimer( 5.17 + shift, ClientCmd, "sc_strafe_yaw 0" );

    -- CreateTimer( 2.5, ClientCmd, "sc_strafe 1; sc_strafe_yaw 35" );
    -- CreateTimer( 3.1, ClientCmd, "sc_strafe_yaw -35" );
    -- CreateTimer( 3.29, ClientCmd, "sc_strafe_yaw 0" );
    -- CreateTimer( 3.8, ClientCmd, "+duck" );
    -- CreateTimer( 4.0, ClientCmd, "-duck; +jump" );

    -- ClientCmd( "sc_im_goto 4900; sc_im_split; sc_ducktap_adjust_fps 10000" );
    -- CreateTimer( 0.25, ClientCmd, "sc_strafe 1; sc_strafe_yaw 5; sc_strafe_dir 3; sc_strafe_type 0" );
    -- CreateTimer( 1.622, ClientCmd, "sc_strafe_yaw 0; +sc_ducktap" );
    -- CreateTimer( 2.85, ClientCmd, "-sc_ducktap; +jump; sc_strafe_yaw -37" );
    -- CreateTimer( 3.395, ClientCmd, "sc_strafe_yaw -90" );
    -- CreateTimer( 5.17, ClientCmd, "sc_strafe_yaw 0" );
end

CreateTimer( 0.48, ClientCmd, "setpos 253.156250 300.937500 -547.048096; setvel 0 0 0" );
CreateTimer( 0.5, SplitShit );

--[[
function OnGameFrame(state, frametime, postruncmd)
    if ( postruncmd ) then
        local frame = InputManager.GetCurrentFrame();

        -- if ( frame >= 4765 and frame <= 4790 ) then
        --     local player = GetPEntityFromEntityIndex( 1 );

        --     if ( player ~= nil ) then
        --         printl( string.format( "[%d] pos: %.12f %.12f %.12f | vel: %.12f %.12f %.12f", frame, player.vars.origin.x, player.vars.origin.y, player.vars.origin.z, player.vars.velocity.x, player.vars.velocity.y, player.vars.velocity.z ) );
        --     end
        -- end

        if ( frame == 4771 ) then
            local player = GetPEntityFromEntityIndex( 1 );

            if ( player ~= nil ) then
                player.vars.origin = Vector( -5324.795410156250, -3269.301025390625, -581.601196289063 );
                player.vars.velocity = Vector( 158.038757324219, 46.067436218262, 1287.923583984375 );
            end
        end
    end
end
]]

function PrintTime()
    PrintChatText( string.format( "%.3f (%d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

printl( "Executed c07_a2_workout" );
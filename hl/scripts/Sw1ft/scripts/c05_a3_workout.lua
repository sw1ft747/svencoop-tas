timer = 0;
activated_level_change = false;

RemoveAllTimers();

PrintChatText( "APTECHKU V RUCHKI" );

-- ClientCmd( "weapon_medkit" );
-- ClientCmd( "weapon_hl357" );
-- ClientCmd( "setpos 0 0 0; kill" );
ClientCmd( "setvel 0 0 0; setpos -1270.812500 -690.281250 -1215.968750" );
ClientCmd( "sc_st_setangles_stop; sc_st_setangles2_stop; sc_st_follow_point_stop" );
ClientCmd( "setvel 0 0 0; -jump; -duck; -attack; -attack2; -sc_ducktap; -forward; -moveleft; -moveright; -back; sc_strafe 0; sc_strafe_type 0; sc_strafe_dir 3; sc_strafe_ignore_ground 1; sc_aimbot 0; sc_strafe_vectorial_snap 170" );
ClientCmd( "sc_spam_hold_mode 0; sc_spam_ctrl 0; fps_max 200; sc_ducktap_adjust_fps 10000; sc_jumpbug_min_fall_velocity 99999" );
ClientCmd( "sc_st_timescale 0.1" );

InputManager.Stop();

CreateTimer( 0.3, ClientCmd, "reviveme" ); -- 0.25

function OnSpecialSpawn( pPlayerEdict )
    RemoveAllTimers();

    timer = SegmentCurrentTime();

    printl( "OnSpecialSpawn()" );
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" has been revived at " .. tostring( pPlayerEdict.vars.origin ) );

    pPlayerEdict.vars.origin = Vector( -1797.632935, 4.815926, 1750.961060 ); -- vrode norm
    -- pPlayerEdict.vars.origin = Vector( -1795.810669, 17.536423, 1750.836548 );

    InputManager.Stop();
    -- InputManager.Record( "c05a3_postrevive" );
    -- InputManager.Playback( "c05a3_postrevive" );

    ClientCmd( "sc_im_play c05a3_postrevive" );
    -- ClientCmd( "sc_im_record c05a3_postrevive; sc_strafe 1; sc_strafe_vectorial 1; sc_strafe_ignore_ground 0; sc_strafe_dir 3; sc_strafe_vectorial_increment 1" );
    -- ClientCmd( "setang 20 -42; +jump" );
    -- ClientCmd( "sc_strafe_yaw -42" );

    -- CreateTimer( 1.4, ClientCmd, "sc_strafe_yaw 0" );
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

function SplitShit()
    StartTimer();
    timer = SegmentCurrentTime();

    InputManager.Stop();
    InputManager.Playback( "c05a3_postrevive" );


    -- ClientCmd( "sc_im_goto 1480; sc_im_split" );
    -- CreateTimer( 0.05, ClientCmd, "setang 89 -90; +forward; fps_max 20; sc_im_record_command \"fps_max 20\"" );
    -- CreateTimer( 1.96, ClientCmd, "setang 0" );
    -- CreateTimer( 2.5, ClientCmd, "setang -40" );
    -- CreateTimer( 3.0, ClientCmd, "setang 0; +jump" );
    -- CreateTimer( 3.55, ClientCmd, "setang -89" );
    -- CreateTimer( 4.2, ClientCmd, "sc_st_setangles 20 -90 20" );
    -- CreateTimer( 4.6, ClientCmd, "fps_max 200; sc_im_record_command \"fps_max 200\"; -forward; sc_strafe 1; sc_strafe_yaw -100" );
    -- CreateTimer( 5.25, ClientCmd, "sc_strafe_yaw -90; sc_st_setangles_stop; setang 20" );

    -- CreateTimer( 2.5, ClientCmd, "setang -50; sc_st_setangles -70 -90 100" );
    -- CreateTimer( 3.6, ClientCmd, "setang -80" );
    -- CreateTimer( 4.4, ClientCmd, "fps_max 200; sc_im_record_command \"fps_max 200\"" );
    -- CreateTimer( 4.1, ClientCmd, "sc_st_setangles 20 -90 70" );
    -- CreateTimer( 4.3, ClientCmd, "-forward; +duck; sc_strafe 1; sc_strafe_yaw -100; +jump" );
    -- CreateTimer( 4.5, ClientCmd, "sc_st_setangles_stop; setang 20 -90" );
    -- CreateTimer( 4.55, ClientCmd, "-duck" );
    -- CreateTimer( 5.65, ClientCmd, "sc_strafe_yaw -90" );


    -- ClientCmd( "sc_im_goto 1480; sc_im_split" );
    -- CreateTimer( 0.05, ClientCmd, "setang 89 -90; +forward" );
    -- CreateTimer( 1.74, ClientCmd, "setang 0" );
    -- CreateTimer( 2.33, ClientCmd, "setang -50; sc_st_setangles -70 -90 150" );
    -- CreateTimer( 2.9, ClientCmd, "sc_st_setangles_stop; setang 0; +jump" );
    -- CreateTimer( 3.9, ClientCmd, "sc_st_setangles 20 -90 70" );

    -- ClientCmd( "sc_im_goto 1480; sc_im_split" );
    -- CreateTimer( 0.05, ClientCmd, "setang 89 -90; +forward" );
    -- CreateTimer( 1.76, ClientCmd, "setang 0" );
    -- CreateTimer( 2.35, ClientCmd, "setang -50; sc_st_setangles -70 -90 150" );
    -- CreateTimer( 4.1, ClientCmd, "sc_st_setangles 20 -90 70" );
    -- CreateTimer( 4.3, ClientCmd, "-forward; +duck; sc_strafe 1; sc_strafe_yaw -100; +jump" );
    -- CreateTimer( 4.5, ClientCmd, "sc_st_setangles_stop; setang 20 -90" );
    -- CreateTimer( 4.55, ClientCmd, "-duck" );
    -- CreateTimer( 5.65, ClientCmd, "sc_strafe_yaw -90" );

    -- ClientCmd( "sc_im_goto 2625; sc_im_split" );
    -- ClientCmd( "sc_strafe_vectorial_increment 1; sc_strafe 1; sc_strafe_yaw -86; +sc_ducktap" );
    -- CreateTimer( 0.675, ClientCmd, "sc_strafe_yaw -40; -sc_ducktap; +jump" );
    -- CreateTimer( 1.25, ClientCmd, "sc_strafe_yaw 0" );
    -- CreateTimer( 1.76, ClientCmd, "sc_strafe 0;sc_spam_ctrl 1; fps_max 4000; sc_im_record_command \"fps_max 4000\"" );
    -- CreateTimer( 1.78, ClientCmd, "sc_spam_ctrl 0; fps_max 200; sc_im_record_command \"fps_max 200\"; sc_strafe 0" );
    -- CreateTimer( 1.85, ClientCmd, "-jump" );
    -- CreateTimer( 1.95, ClientCmd, "+moveleft; sc_st_setangles 20 10 60" );
    -- CreateTimer( 2.3, ClientCmd, "-moveleft; +moveright; sc_st_setangles_stop; setang 30 87; +forward" );
    -- CreateTimer( 2.7, ClientCmd, "setang -89 90" );
    -- CreateTimer( 2.9, ClientCmd, "-moveright" );
    -- CreateTimer( 3.175, ClientCmd, "sc_spam_ctrl 1; fps_max 4000; sc_im_record_command \"fps_max 4000\"" );
    -- CreateTimer( 3.2, ClientCmd, "sc_spam_ctrl 0; fps_max 200; sc_im_record_command \"fps_max 200\"; setang 20 90; -forward; +jump" );
    -- CreateTimer( 3.25, ClientCmd, "sc_strafe 1; sc_strafe_yaw 0; sc_strafe_type 2" );
    -- CreateTimer( 3.4, ClientCmd, "sc_strafe_type 1" );
    -- CreateTimer( 3.62, ClientCmd, "sc_jumpbug_min_fall_velocity 580" );

    ClientCmd( "sc_im_goto 3480; sc_im_split" );
    ClientCmd( "sc_strafe_vectorial_increment 1; sc_strafe 1; sc_strafe_yaw 49.5; +jump" );
    CreateTimer( 0.25, ClientCmd, "+duck; sc_strafe_yaw 0; sc_strafe_vectorial_increment 2; sc_strafe_type 0" );
    CreateTimer( 0.285, ClientCmd, "-duck" );
    CreateTimer( 0.32, ClientCmd, "sc_strafe_yaw -90; sc_strafe_type 3" );
    CreateTimer( 0.78, ClientCmd, "sc_strafe_yaw 0; sc_strafe_type 3" );
    CreateTimer( 0.9825, ClientCmd, "+duck" );
    CreateTimer( 0.99, ClientCmd, "-duck" );
    CreateTimer( 1.15, ClientCmd, "sc_strafe_vectorial_increment 1; sc_strafe_type 0; sc_strafe_yaw 15; -jump; +sc_ducktap" );
    CreateTimer( 1.75, ClientCmd, "sc_strafe_yaw -90; +jump; -sc_ducktap" );
    CreateTimer( 3.1, ClientCmd, "sc_strafe 0; -jump; +back" );
    CreateTimer( 3.32, ClientCmd, "-back" );
    CreateTimer( 4.1, ClientCmd, "sc_jumpbug 0; sc_jumpbug_legit 1; sc_jumpbug_min_fall_velocity 580" );
    CreateTimer( 4.15, ClientCmd, "fps_max 1000; sc_im_record_command \"fps_max 1000\"" );
    CreateTimer( 4.17, ClientCmd, "fps_max 200; sc_im_record_command \"fps_max 200\"" );
    CreateTimer( 4.25, function()
        activated_level_change = true;
        ClientCmd( "sc_strafe 1; sc_strafe_yaw 62; +jump" );
        ClientCmd( "takecover" );
    end );
    CreateTimer( 4.8, ClientCmd, "sc_strafe_yaw 95" );
    CreateTimer( 5.02, ClientCmd, "sc_strafe_dir 0; sc_strafe_type 3" );
    CreateTimer( 5.9, ClientCmd, "sc_strafe_dir 3; sc_strafe_type 0; sc_strafe_yaw 140; sc_st_setangles 20 140 50" );

--[[ 
    20.465 (IM frames: 3478)
setpos 735.319580 136.928268 -1728.292358
setvel 82.237923 1759.822266 85.233559
setang 19.945000 87.176308 -0.000000
20.480 (IM frames: 3481)
setpos 736.890076 172.305923 -1727.103882
setvel 109.190575 1758.227539 73.233559
setang 19.889999 85.510994 -0.000000
20.485 (IM frames: 3482)
setpos 737.436035 184.097061 -1726.747681
setvel 109.190575 1758.227539 69.233559
setang 19.889999 84.506592 -0.000000
20.495 (IM frames: 3483)
setpos 738.033508 195.885574 -1726.411499
setvel 119.498177 1757.702881 65.233559
setang 19.889999 83.501343 -0.000000
20.495 (IM frames: 3483)
setpos 738.033508 195.885574 -1726.411499
setvel 119.498177 1757.702881 65.233559
setang 19.889999 83.501343 -0.000000
20.495 (IM frames: 3484)
setpos 741.642273 205.930038 -1726.095337
setvel 1063.488647 1207.869141 61.233559
setang 19.889999 82.496094 -0.000000
20.500 (IM frames: 3485)
setpos 746.954956 214.961639 -1725.799805
setvel 1064.812866 1210.181885 57.233559
setang 19.889999 81.490845 0.000000
20.505 (IM frames: 3486)
setpos 752.276062 224.007538 -1725.524170
setvel 1066.170898 1212.490601 53.233559
setang 19.889999 80.485596 0.000000
 ]]

    -- ClientCmd( "sc_im_goto 3479; sc_im_split; setpos 735.319580 136.928268 -1728.292358; setvel 82.237923 1759.822266 85.233559; setang 19.945000 87.176308 0.000000" );
    -- ClientCmd( "sc_strafe_vectorial_increment 1; sc_strafe 1; sc_strafe_yaw 49.5; +jump" );
    -- CreateTimer( 0.26, ClientCmd, "+duck; sc_strafe_yaw 0; sc_strafe_vectorial_increment 2; sc_strafe_type 0" );
    -- CreateTimer( 0.27, ClientCmd, "-duck" );
    -- CreateTimer( 0.32, ClientCmd, "sc_strafe_yaw -90; sc_strafe_type 3" );
    -- CreateTimer( 0.57, ClientCmd, "+duck" );
    -- CreateTimer( 0.6, ClientCmd, "-duck" );
    -- CreateTimer( 0.82, ClientCmd, "sc_strafe_yaw 0; sc_strafe_type 3" );
end

CreateTimer( 0.31, SplitShit );

function OnGameFrame(state, frametime, postruncmd)
    if ( not postruncmd and activated_level_change ) then
        local mrCrabs = GetPEntityFromEntityIndex( 189 );

        if ( mrCrabs ~= nil and mrCrabs.vars ~= nil ) then
            LookAt( mrCrabs.vars.origin );
        end

        -- LookAt( Vector( 2447, -926, -2428 ) );
    end
end

function OnEntityTouch(entity, other)
    if ( entity ~= nil and entity.vars.model == "*177" ) then -- trigger_once activates trigger_changelevel in 2 sec
        for t = 2.0, 0.0, -0.2 do -- цикл от 10 до 1 с шагом -1
            CreateTimer( t, ClientCmd, string.format( "say Level change in %.1f seconds", 2.0 - t ) );
        end
    end
end

function OnPlayInput(filename, frame, cmd)
    -- if ( ( cmd.buttons & IN_JUMP ) == IN_JUMP ) then
    --     PrintChatText( "IN_JUMP frame: " .. tostring( frame ) );
    -- end
end

function PrintTime()
    PrintChatText( string.format( "%.3f (IM frames: %d)", SegmentCurrentTime() - timer, InputManager.GetCurrentFrame() ) );
end

printl( "Executed c05_a3_workout" );
timer = 0;

function PrintTime()
    PrintChatText( string.format( "%.3f (frame: %d)", SegmentCurrentTime() - timer, InputManager.GetCurrentFrame() ) );
end

function SpeedrunStart()
    ClientCmd("fps_max 200;sc_strafe 1;setvel 0 0 0;sc_strafe_yaw \"\";sc_strafe_type 0;-jump;-duck;-back;setang 0 28 0;sc_strafe_vectorial_increment 0;sc_im_play c05a1;wait" ); --sc_im_play c05a1;wait
    ClientCmd("-forward;-moveleft;-attack;-jump;sc_st_setangles_stop;-duck;-sc_ducktap;-attack2;sc_aimbot_scripts_filter_targets 1;sc_aimbot_change_angles_back 1");
    CreateTimer(1.3, ClientCmd, "sc_im_play c05a1;wait;sc_im_goto 1400");
    CreateTimer(8.18, ClientCmd, "sc_im_split;+attack2;wait;sc_strafe_yaw -64;+jump");
    CreateTimer(8.19, ClientCmd, "sc_im_record_command \"fps_max 200\";wait;fps_max 200;sc_jumpbug_legit 0;sc_strafe_vectorial_increment 0.4");
    CreateTimer(8.7, ClientCmd, "sc_strafe_yaw -20");
    CreateTimer(9.3, ClientCmd, "sc_strafe_yaw 0");
    CreateTimer(10, ClientCmd, "+duck;-attack2;-attack");
    CreateTimer(10.2, ClientCmd, "weapon_9mmhandgun;-duck;sc_strafe_yaw -10");
    
end

function OnFilterAimbotTarget( entindex )
    PrintChatText( "Aimbot target: " .. entindex );

    if ( entindex ~= 304 ) then
        return false;
    end

    return true;
end

function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
    printl( "OnPlayerSpawn()" );
    
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) );
    
    local sPlayerName = pPlayerEdict.vars.netname;
    
    if ( sPlayerName == "BotSkipper" ) then
        pPlayerEdict.vars.origin = Vector(-3352.000000, 3048.000000, 961.000000);
    end
end

--[[

    1st part------------------------------------------------------------------------------------

    jump - unfinished

    ClientCmd("fps_max 200;sc_strafe 1;setvel 0 0 0;sc_strafe_yaw \"\";sc_strafe_type 0;-jump;-duck;-back;setang 0 28 0;sc_strafe_vectorial_increment 0;sc_im_record c05a1" );
    ClientCmd("-forward;-moveleft;-jump;sc_st_setangles_stop;-duck");
    CreateTimer( 0.05, ClientCmd, "sc_st_setangles 0 -18 20;sc_strafe_yaw 28");
    CreateTimer( 0.15, ClientCmd, "+forward;+moveleft");
    CreateTimer( 0.65, ClientCmd, "-forward;-moveleft;+jump;sc_strafe_vectorial_increment 0.2");
    CreateTimer( 1.15, ClientCmd, "sc_strafe_yaw -44");
    CreateTimer( 1.5, ClientCmd, "sc_strafe_yaw -126");
    CreateTimer( 1.81, ClientCmd, "sc_strafe_yaw 0");
    CreateTimer( 2.2, ClientCmd, "+duck");

    ducktap - lastjump: 584 RNG sooqa - 2.496 stoptime - pos x-2571 y2904 z1056

    ClientCmd("-forward;-moveleft;-jump;sc_st_setangles_stop;-duck;-sc_ducktap;-attack2");
    CreateTimer( 0.05, ClientCmd, "sc_st_setangles 0 -18 20;sc_strafe_yaw 28");
    CreateTimer( 0.15, ClientCmd, "+forward;+moveleft");
    CreateTimer( 0.65, ClientCmd, "-forward;-moveleft;+jump");
    CreateTimer( 1.15, ClientCmd, "sc_strafe_yaw -44");
    CreateTimer( 1.2, ClientCmd, "-jump;+sc_ducktap");
    CreateTimer( 1.5, ClientCmd, "sc_strafe_yaw -122");
    CreateTimer( 1.78, ClientCmd, "sc_strafe_yaw 0");
    CreateTimer( 1.9, ClientCmd, "-sc_ducktap;+jump;setang 0 -7 0");
    CreateTimer( 2.1, ClientCmd, "+attack2;wait;-attack2");
    CreateTimer( 2.2, ClientCmd, "+duck");
    CreateTimer( 2.5, ClientCmd, "-duck");

    2nd part------------------------------------------------------------------------------------

    ClientCmd("wait;sc_im_goto 500");
    CreateTimer( 0.1, ClientCmd, "sc_im_split;sc_strafe_yaw 0;sc_st_setangles 0 0 100;+jump");
    CreateTimer( 0.7, ClientCmd, "sc_strafe_yaw -20; sc_st_setangles 50 0 150");
    CreateTimer( 1.15, ClientCmd, "sc_strafe_yaw 0");
    CreateTimer( 1.6, ClientCmd, "+duck;-jump");
    CreateTimer( 1.68, ClientCmd, "+use");
    CreateTimer( 1.7, ClientCmd, "-duck;-use");
    CreateTimer( 1.71, ClientCmd, "sc_strafe_yaw -145;sc_st_setangles 6 -57 200");
    CreateTimer( 2.3, ClientCmd, "+moveright");
    CreateTimer( 2.5 ,ClientCmd, "-moveright");
    CreateTimer( 3.25, ClientCmd, "+attack2;wait;-attack2");
    CreateTimer( 3.4, ClientCmd, "weapon_crowbar;sc_st_setangles 0 -90 100;+moveleft;+forward;+attack");
    CreateTimer( 4.0, ClientCmd, "-moveleft;-forward;wait;-attack;sc_st_setangles 0 -130 20");
    CreateTimer( 4.1, ClientCmd, "sc_strafe_ignore_ground 0;sc_strafe_yaw -120");
    CreateTimer( 4.8, ClientCmd, "sc_strafe_ignore_ground 1;sc_st_setangles 88 52 200;sc_strafe_yaw 90");
    CreateTimer( 4.8, ClientCmd, "weapon_handgrenade");
    CreateTimer( 5.0, ClientCmd, "+attack" );
    CreateTimer( 5.5, ClientCmd, "-attack");
    CreateTimer( 6.0, ClientCmd, "weapon_medkit;+attack2");
    CreateTimer( 6.8, ClientCmd, "weapon_handgrenade;-attack2;+attack");
    CreateTimer( 7.7, ClientCmd, "+attack2;-attack;+forward");
    CreateTimer( 8.3, ClientCmd, "-forward;+jump;sc_st_setangles 88 90 100");
    CreateTimer( 8.6, ClientCmd, "+duck")
    CreateTimer( 8.9, ClientCmd, "-jump;-duck;sc_strafe_yaw 142");
    CreateTimer( 9.18, ClientCmd, "sc_strafe_yaw 180");
    CreateTimer( 9.3, ClientCmd, "+moveright");
    CreateTimer( 9.41, ClientCmd, "-moveright");
    CreateTimer( 9.8, ClientCmd, "sc_strafe_yaw -130;sc_strafe_type 1");
    CreateTimer( 9.84, ClientCmd, "sc_strafe_yaw 130");
    CreateTimer( 10.16, ClientCmd, "sc_strafe_yaw 90");
    CreateTimer( 10.2, ClientCmd, "sc_strafe_type 0;sc_st_setangles 0 0 100");
    CreateTimer( 10.35, ClientCmd, "sc_strafe_yaw 0");
    CreateTimer( 11.1, ClientCmd, "sc_strafe_yaw -2");
    CreateTimer( 11.2, ClientCmd, "sc_im_record_command \"fps_max 1000\";wait;fps_max 1000;sc_jumpbug_legit 1");
    CreateTimer( 11.4, ClientCmd, "sc_im_record_command \"fps_max 200\";wait;fps_max 200;sc_jumpbug_legit 0");


    3rd part------------------------------------------------------------------------------------

    ClientCmd("fps_max 200;sc_strafe 1;setvel 0 0 0;sc_strafe_yaw \"\";sc_strafe_type 0;-jump;-duck;-back;setang 0 28 0;sc_strafe_vectorial_increment 0" ); --sc_im_play c05a1;wait
    ClientCmd("-forward;-moveleft;-attack;-jump;sc_st_setangles_stop;-duck;-sc_ducktap;-attack2;sc_aimbot_scripts_filter_targets 1;sc_aimbot_change_angles_back 1");
    CreateTimer(1.3, ClientCmd, "sc_im_play c05a1;wait;sc_im_goto 1400");
    CreateTimer(8.18, ClientCmd, "sc_im_split;+attack2;wait;sc_strafe_yaw -64;+jump");
    CreateTimer(8.19, ClientCmd, "sc_im_record_command \"fps_max 200\";wait;fps_max 200;sc_jumpbug_legit 0;sc_strafe_vectorial_increment 0.4");
    CreateTimer(8.7, ClientCmd, "sc_strafe_yaw -20");
    CreateTimer(9.3, ClientCmd, "sc_strafe_yaw 0");
    CreateTimer(10.6, ClientCmd, "+duck;-attack2;-attack");
    CreateTimer(10.8, ClientCmd, "weapon_9mmhandgun;-duck;sc_strafe_yaw -10");
    CreateTimer(11.8, ClientCmd, "sc_strafe_yaw -20");
    CreateTimer(12.1, ClientCmd, "sc_strafe_yaw -36");
    CreateTimer(12.8, ClientCmd, "sc_strafe_yaw -51");
    CreateTimer(13.3, ClientCmd, "sc_strafe_yaw -67");
    CreateTimer(13.9, ClientCmd, "sc_strafe_yaw -87");
    CreateTimer(13.7, ClientCmd, "sc_aimbot 1; sc_st_disable_spread 1; +attack; wait; -attack; wait; sc_st_disable_spread 0; sc_aimbot 0" );
    CreateTimer(14.1, ClientCmd, "sc_aimbot 1; sc_st_disable_spread 1; +attack; wait; -attack; wait; sc_st_disable_spread 0; sc_aimbot 0");
    CreateTimer(14.7, ClientCmd, "sc_strafe_yaw -105");
    CreateTimer(15.3, ClientCmd, "sc_strafe_yaw -130");
    CreateTimer(16.1, ClientCmd, "sc_Strafe_yaw -145");
    CreateTimer(16.8, ClientCmd, "sc_strafe_yaw -173");
    CreateTimer(17.2, ClientCmd, "-jump;+sc_ducktap;sc_strafe_vectorial_increment 0");
    CreateTimer(17.4, ClientCmd, "+jump;-sc_ducktap;sc_strafe_yaw -163");
    CreateTimer(18.4, ClientCmd, "sc_strafe_yaw 105;sc_strafe_vectorial_increment 0.4");
    CreateTimer(20, ClientCmd, "sc_im_stop");


]]


spawns_state = 0;

function SpeedrunStart()
    start_time = SegmentCurrentTime();

	EnableSurvivalMode();

    ClientCmd( "setvel 0 0 0;sc_strafe_yaw \"\";sc_strafe_type 0;sc_strafe 1;-jump;pausable 0;-duck;sc_strafe_ignore_ground 1;sc_st_legit_mode_ignore_freeze 1;-sc_ducktap;sc_strafe_vectorial_increment 0" );
    ClientCmd( "sc_st_setangles_stop; sc_st_setangles2_stop; sc_st_follow_point_stop; -jump; -duck; -attack; -moveleft; -right; -moveright;-back; -sc_ducktap; sc_aimbot_scripts_filter_targets 1" );
    ClientCmd( "sc_strafe 1; sc_strafe_dir 3; sc_strafe_ignore_ground 1; sc_strafe_vectorial 1; sc_strafe_vectorial_increment 0; sc_strafe_vectorial_snap 0; sc_aimbot 0; sc_st_disable_spread 0; sc_jumpbug_min_fall_velocity 580" );
    ClientCmd( "clockwindow 0; cl_smoothtime 0; mp_respawndelay 0; mp_classic_mode 1; fps_max 200; sc_jumpbug_min_fall_velocity 580; sc_st_legit_mode_ignore_freeze 1; sc_aimbot_change_angles_back 1" );
    
    
    --[[CreateTimer( 0.0, ClientCmd, "setang 0 -90 0;sc_im_play of1a1_p2;sc_st_timescale 0.3;sc_strafe 1;sc_strafe_yaw 90" );
    CreateTimer( 0.01, ClientCmd, "sc_im_goto 1000");
    CreateTimer( 0.6, ClientCmd, "sc_im_split;+jump");
    CreateTimer( 0.8, ClientCmd, "sc_strafe_yaw 109");
    CreateTimer( 1.1, ClientCmd, "sc_st_setangles 0 0 60");
    CreateTimer( 1.37, ClientCmd, "sc_Strafe_yaw 30");
    CreateTimer( 2.0, ClientCmd, "-jump;+sc_ducktap");
    CreateTimer( 2.05, ClientCmd, "sc_strafe_yaw 0");
    CreateTimer( 2.1, ClientCmd, "sc_st_setangles 0 179 60");
    CreateTimer( 2.5, ClientCmd, "sc_strafe_yaw -64");
    CreateTimer( 2.6, ClientCmd, "+jump;-sc_ducktap");
    CreateTimer( 2.52, ClientCmd, "sc_strafe_yaw -179");
    CreateTimer( 2.9, ClientCmd, "sc_strafe_type 2");
    CreateTimer( 2.925, ClientCmd, "sc_strafe_Type 0");
    CreateTimer( 3.0, ClientCmd, "-jump;+sc_ducktap");
    CreateTimer( 3.1, ClientCmd, "sc_st_setangles 0 90 60");
    CreateTimer( 3.3, ClientCmd, "sc_strafe_yaw 155");
    CreateTimer( 3.59, ClientCmd, "sc_strafe_yaw 75");
    CreateTimer( 3.5, ClientCmd, "-sc_ducktap;+jump");
    CreateTimer( 4.0, ClientCmd, "-jump;+back");
    CreateTimer( 4.24, ClientCmd, "-back;+forward");
    CreateTimer( 4.37, ClientCmd, "-forward;sc_strafe_ignore_ground 0;sc_strafe_yaw 91");
    CreateTimer( 4.5, ClientCmd, "sc_st_setangles 0 0 60");
    CreateTimer( 4.7, ClientCmd, "+jump;sc_strafe_yaw 0");
    CreateTimer( 5.7, ClientCmd, "-jump;sc_im_stop"); ]]--

     -- СТАРТ КАРРТЫ
     CreateTimer( 0.0, ClientCmd, "setang 0 -90 0;sc_im_play of1a1;sc_st_timescale 0.3;sc_strafe 1" );
     CreateTimer( 0.01, ClientCmd, "sc_im_goto 2");
    
    
    
    --[[CreateTimer( 0.01, ClientCmd, "sc_im_goto 100" );
    CreateTimer( 1.0, ClientCmd, "sc_im_split;sc_strafe 1;sc_strafe_ignore_ground 0;sc_strafe_yaw -134;+jump");
    CreateTimer( 1.1, ClientCmd, "sc_strafe_yaw -89");
    CreateTimer( 1.25, ClientCmd, "sc_strafe_yaw -38");
    CreateTimer( 1.79, ClientCmd, "+duck");
    CreateTimer( 1.88, ClientCmd, "-duck;sc_Strafe_yaw -45");
    CreateTimer( 2, ClientCmd, "sc_strafe_yaw -51");
    CreateTimer( 2.69, ClientCmd, "+duck;sc_strafe_yaw -90");
    CreateTimer( 2.7, ClientCmd, "-duck");
    CreateTimer( 2.75, ClientCmd, "sc_Strafe_yaw 0;sc_st_setangles 0 0 60");
    CreateTimer( 2.87, ClientCmd, "+duck");
    CreateTimer( 2.89, ClientCmd, "-duck");
    CreateTimer( 3.1, ClientCmd, "sc_st_setangles 0 -55 60");
    CreateTimer( 3.15, ClientCmd, "sc_strafe_yaw -81");
    CreateTimer( 3.5, ClientCmd, "sc_st_setangles 0 0 60");
    CreateTimer( 3.6, ClientCmd, "sc_strafe_yaw 0");
    CreateTimer( 4.3, ClientCmd, "sc_st_setangles 0 90 60");
    CreateTimer( 4.5, ClientCmd, "sc_strafe_yaw 90");
    CreateTimer( 5.3, ClientCmd, "sc_im_stop"); ]]--
    
    
    
    --part 2
    --[[CreateTimer( 0.1, ClientCmd, "sc_im_goto 800;sc_st_timescale 0.25");
    CreateTimer( 0.6, ClientCmd, "sc_im_split;sc_strafe_yaw -56;sc_st_setangles 0 -56 20;+jump" );
    CreateTimer( 1.15, ClientCmd, "sc_strafe_yaw -30;sc_st_setangles 0 -30 20" );
    CreateTimer( 1.6, ClientCmd, "sc_st_setangles 0 -90 60" );
    CreateTimer( 1.8, ClientCmd, "sc_strafe_yaw -93" );
    CreateTimer( 2.8, ClientCmd, "sc_st_setangles 0 -179 60" );
    CreateTimer( 3.0, ClientCmd, "sc_strafe_yaw -152" );
    CreateTimer( 3.49, ClientCmd, "sc_strafe_yaw -179");
    CreateTimer( 3.5, ClientCmd, "+duck" );
    CreateTimer( 3.53, ClientCmd, "-duck" );
    CreateTimer( 3.6, ClientCmd, "sc_st_setangles 0 -90 60" );
    CreateTimer( 3.75, ClientCmd, "sc_Strafe_yaw -100;-jump;+sc_ducktap" );
    CreateTimer( 4.3, ClientCmd, "-sc_ducktap;+jump;sensitivity 0.8");
    CreateTimer( 4.25, ClientCmd, "sc_strafe_yaw -123" );
    CreateTimer( 4.6, ClientCmd, "+duck");
    CreateTimer( 4.65, ClientCmd, "-duck");
    CreateTimer( 4.58, ClientCmd, "sc_strafe_yaw 0");]]--


    
    --part 1
    --[[CreateTimer( 0.8, ClientCmd, "sc_strafe_yaw 91" );
    CreateTimer( 0.967, ClientCmd, "+forward;sc_strafe_yaw -90" );
    CreateTimer( 1.15, ClientCmd, "-forward" );
    CreateTimer( 1.460, ClientCmd, "+jump;sc_strafe_yaw -167" );
    CreateTimer( 2.34, ClientCmd, "sc_strafe_yaw -98" );
    CreateTimer( 2.5, ClientCmd, "-jump;+sc_ducktap" );
    CreateTimer( 2.9, ClientCmd, "-sc_ducktap;+back;sc_st_timescale 0.15" );
    CreateTimer( 3.24, ClientCmd, "-back;+forward;sc_strafe_yaw -90" );
    CreateTimer( 3.3, ClientCmd, "-forward" );
    CreateTimer( 3.8, ClientCmd, "+jump;sc_strafe_yaw -24;sc_st_setangles 0 -24 48" );
    CreateTimer( 5.0, ClientCmd, "sc_im_stop");]]--
end

function OnFireTargets( targetname, activator, caller, usetype, value, delay )
    if ( targetname == "spawn02_mm" ) then
        ClientCmd( "-jump;sc_im_stop;gibme;wait;toggle_survival_mode" );
        spawns_state = 1;
    end
end

function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
    printl( "OnPlayerSpawn()" );

    local sPlayerName = pPlayerEdict.vars.netname;

    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) );

    if ( spawns_state == 0 ) then
        if ( sPlayerName == "BotSkipper" ) then
            pPlayerEdict.vars.origin = Vector( -586, 3221, 61 );
            pPlayerEdict.vars.angles = Vector( 0.000000, -80.000000, 0.000000 );
        end
    elseif ( spawns_state == 1 ) then
        if (sPlayerName == "BotSkipper") then
            spawns_state = 2;
            
            CreateTimer( 0.00, ClientCmd, "+forward;sc_im_stop;wait;sc_im_play of1a1_p2"); -- СТАРТ 2
            CreateTimer( 1, ClientCmd, "sc_im_goto 200;-forward"); -- фикс мува
            --[[CreateTimer( 0.615, ClientCmd, "+jump");
            CreateTimer( 0.750, ClientCmd, "sc_st_setangles 0 -38 140");
            CreateTimer( 0.945, ClientCmd, "sc_strafe_yaw -134");
            CreateTimer( 1.5, ClientCmd, "sc_im_stop"); ]]--
        end
    end
end
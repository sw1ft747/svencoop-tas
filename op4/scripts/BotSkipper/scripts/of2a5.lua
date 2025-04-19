--[[ function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "start") then 
		ClientCmd("sc_im_record of2a5p2");
		ClientCmd("sc_Strafe 1;sc_strafe_type 0;sc_strafe_ignore_ground 0;setang 0 -179.99 0;sc_strafe_yaw -179;sc_st_reset_timer");
        CreateTimer( 0.6, ClientCmd, "+jump");
        CreateTimer( 0.48, ClientCmd, "sc_st_setangles 0 130 60");
        CreateTimer( 0.68, ClientCmd, "sc_Strafe_yaw 130");
        CreateTimer( 0.9, ClientCmd, "sc_st_setangles 0 -179 60");
        CreateTimer( 1.16, ClientCmd, "sc_Strafe_yaw -179");
        CreateTimer( 1.7, ClientCmd, "+duck");
        CreateTimer( 1.8, ClientCmd, "-duck");
	return true;

	end
end ]]--

spawns_state = 0;

function SpeedrunStart()
    start_time = SegmentCurrentTime();

    CreateTrigger("start", Vector(459.281, -543.094, 1186.250), Vector(0, 0, 0), Vector(46.000, 121.969, 134.844)); -- clip player

	EnableSurvivalMode();
    RemoveAllTimers();

    SetTimescale( 0.25 );

    ClientCmd( "sv_cheats 0;setvel 0 0 0;sc_strafe_yaw \"\";sc_strafe_type 0;sc_strafe 0;-jump;pausable 0;-duck;sc_strafe_ignore_ground 1;sc_st_legit_mode_ignore_freeze 1;-sc_ducktap;sc_strafe_vectorial_increment 0" );
    ClientCmd( "sc_st_setangles_stop; sc_st_setangles2_stop; sc_st_follow_point_stop; -jump; -duck; -attack; -moveleft; -right; -moveright;-back; -sc_ducktap; sc_aimbot_scripts_filter_targets 1" );
    ClientCmd( "sc_strafe 1; sc_strafe_dir 3; sc_strafe_ignore_ground 1; sc_strafe_vectorial 1; sc_strafe_vectorial_increment 0; sc_strafe_vectorial_snap 0; sc_aimbot 0; sc_st_disable_spread 0; sc_jumpbug_min_fall_velocity 580" );
    ClientCmd( "clockwindow 0; cl_smoothtime 0; mp_respawndelay 0; mp_classic_mode 1; fps_max 200; sc_jumpbug_min_fall_velocity 580; sc_st_legit_mode_ignore_freeze 1; sc_aimbot_change_angles_back 1" );
    
    -- СТАРТ КАРРТЫ
    CreateTimer( 0.01, ClientCmd, "setvel 0 0 0;sc_Strafe_type 0;sc_strafe 1;sc_strafe_ignore_ground 0" );
    CreateTimer( 0.02, ClientCmd, "sc_strafe_yaw -8");
    CreateTimer( 0.2, ClientCmd, "+jump");
    CreateTimer( 0.21, ClientCmd, "toggle_survival_mode;wait;toggle_survival_mode");
    CreateTimer( 0.45, ClientCmd, "+duck;sc_Strafe_yaw 0");
    CreateTimer( 0.6, ClientCmd, "-duck;-jump");
    CreateTimer( 0.6, ClientCmd, "sc_Strafe_type 1;sc_strafe_yaw -90;sc_st_setangles -60 -179 60");
    CreateTimer( 0.8, ClientCmd, "sc_Strafe_type 0; sc_strafe_yaw 169");
    CreateTimer( 0.81, ClientCmd, "+jump");
    CreateTimer( 0.88, ClientCmd, "gibme");
    CreateTimer( 0.89, ClientCmd, "gibme");
    CreateTimer( 0.9, ClientCmd, "-jump");
    CreateTimer( 1.1, ClientCmd, "sc_strafe 0");
    CreateTimer( 1.5, ClientCmd, "sc_strafe_yaw 165;sc_st_setangles 0 -133 100");
    CreateTimer( 1.8, ClientCmd, "sc_strafe 1;sc_strafe_yaw 165");
    CreateTimer( 1.96, ClientCmd, "+duck");
    CreateTimer( 2.2, ClientCmd, "sc_Strafe_yaw -120");
    CreateTimer( 2.3, ClientCmd, "-duck"); --]]
    

end

function OnFireTargets( targetname, activator, caller, usetype, value, delay )
    if ( targetname == "1off_2on_mm_rel" ) then
        spawns_state = 1;
        ClientCmd("sc_st_timescale 0.1;+attack;sc_strafe_yaw \"\";kill;sc_strafe_ignore_ground 0;wait;toggle_survival_mode");
        CreateTimer(0.3, ClientCmd, "-attack");
    end
end

function OnSpecialSpawn( pPlayerEdict )
    printl( "OnSpecialSpawn()" );
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" has been revived at " .. tostring( pPlayerEdict.vars.origin ) );
    pPlayerEdict.vars.origin = Vector(486.127380, -466.620392, 1231.252441);
end

function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
    printl( "OnPlayerSpawn()" );

    local sPlayerName = pPlayerEdict.vars.netname;

    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) );

    if ( spawns_state == 0 ) then
        if ( sPlayerName == "QEES" ) then
            pPlayerEdict.vars.origin = Vector( 649, -840, 173 );
            pPlayerEdict.vars.angles = Vector( 0.000000, 0.000000, 0.000000 );
        end
    end
end
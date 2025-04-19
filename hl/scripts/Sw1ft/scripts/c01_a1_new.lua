connected = false;
spawned = false;
start_time = 0.0;
spawns_state = 0

function SpeedrunInit()
    SetTimescale( 0.25 );

    RemoveAllTimers();

    ClientCmd(" sc_st_disable_spread 1; default_fov 120; -sc_ducktap; -jump; -duck; -forward; -back; -moveleft; -moveright; sc_strafe 0; sc_strafe_yaw \"\"; sc_strafe_ignore_ground 1; -attack; sc_im_stop");
    ClientCmd("sc_strafe_type 0; sc_strafe_dir 3; sc_st_setangles_stop; sc_ducktap_adjust_fps 0; sc_autojump_inconsistent 0; fps_max 200; mp_classic_mode 1; clockwindow 0; sc_st_legit_mode_ignore_freeze 1");
    ClientCmd("sc_jumpbug 0; sc_jumpbug_legit 1");
end

function SpeedrunStart()
    SpeedrunStartCustom();
    -- connected = true;
end

function SpeedrunStartCustom()
    start_time = SegmentCurrentTime();

    --InputManager.Record( "c01_a1_new" );
    InputManager.Playback( "c01_a1_new" );

    --CreateTimer( 0.29, EnableSurvivalMode );
    --CreateTimer( 0.37, DisableSurvivalMode );
    ClientCmd("sc_strafe 0; sc_strafe_yaw \"\"; sc_strafe_ignore_ground 1");

    CreateTrigger("1", Vector(528.094, 341.812, -209.969), Vector(0, 0, 0), Vector(34.906, 58.156, 97.938));
    --CreateTimer(0.940, ClientCmd,"sc_strafe 1");

    --CreateTimer(52.200, ClientCmd,"sc_st_timescale 0.1");
    --CreateTimer(52.300, ClientCmd,"sc_im_split");

    --CreateTimer(0.404, ClientCmd,"fps_max 1000");

    CreateTimer(18.690, ClientCmd,"sc_strafe_yaw 180");
    CreateTimer(18.940, ClientCmd,"sc_strafe 1");
    CreateTimer(19.899, ClientCmd,"sc_strafe_yaw 138");
    CreateTimer(19.899, ClientCmd,"+jump");
    CreateTimer(19.899, ClientCmd,"sc_st_setangles 0 138 20");
    CreateTimer(21.050, ClientCmd,"sc_st_setangles 0 168 20");
    CreateTimer(21.230, ClientCmd,"sc_strafe_yaw 180");
    CreateTimer(21.290, ClientCmd,"sc_st_setangles 0 180 20");
    CreateTimer(22.225, ClientCmd,"sc_strafe_yaw -113");
    CreateTimer(22.225, ClientCmd,"sc_st_setangles 0 -113 20");
    CreateTimer(22.225, ClientCmd,"sc_strafe_type 1");
    CreateTimer(22.636, ClientCmd,"sc_strafe_type 0");
    CreateTimer(22.745, ClientCmd,"sc_st_setangles 0 180 20");
    CreateTimer(22.985, ClientCmd,"sc_strafe_yaw 180");
    CreateTimer(22.985, ClientCmd,"sc_strafe_type 1");
    CreateTimer(23.165, ClientCmd,"sc_strafe_yaw 158");
    CreateTimer(23.385, ClientCmd,"sc_strafe_yaw 180");
    CreateTimer(23.454, ClientCmd,"sc_strafe_yaw \"\"");
    CreateTimer(23.454, ClientCmd,"sc_strafe_type 0");
    CreateTimer(23.604, ClientCmd,"sc_st_setangles_stop");
    CreateTimer(23.660, ClientCmd,"-jump");
    CreateTimer(44.330, ClientCmd,"fps_max 1000");
    CreateTimer(44.332, ClientCmd,"sc_jumpbug_legit 1");
    CreateTimer(44.404, ClientCmd,"fps_max 200");
    --CreateTimer(63.700, ClientCmd,"sc_freeze2");
    --CreateTimer(83.140, ClientCmd,"+forward");




    


end

function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "1") then
        spawns_state = 1;
    end
    return true;
end


function OnFireTargets( targetname, activator, caller, usetype, value, delay )
    if ( targetname == "ctrltalkmm" ) then
        CreateTimer( 24.0, ClientCmd, "say Retina scanner in 1 s" );
        CreateTimer( 23.0, ClientCmd, "say Retina scanner in 2 s" );
        CreateTimer( 22.0, ClientCmd, "say Retina scanner in 3 s" );
        CreateTimer( 21.0, ClientCmd, "say Retina scanner in 4 s" );
        CreateTimer( 20.0, ClientCmd, "say Retina scanner in 5 s" );
        CreateTimer( 19.0, ClientCmd, "say Retina scanner in 6 s" );
        CreateTimer( 18.0, ClientCmd, "say Retina scanner in 7 s" );
        CreateTimer( 17.0, ClientCmd, "say Retina scanner in 8 s" );
        CreateTimer( 16.0, ClientCmd, "say Retina scanner in 9 s" );
        CreateTimer( 15.0, ClientCmd, "say Retina scanner in 10 s" );
    end

    -- printl( "OnFireTargets :: " .. targetname .. " : " .. value .. " : " .. delay );
end


function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
    printl( "OnPlayerSpawn()" );
    
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) .. ", viewangles: " .. tostring(pPlayerEdict.vars.angles) .. "" );

    local sPlayerName = pPlayerEdict.vars.netname;

    if ( spawns_state == 0 ) then -- спавн в начале
        if ( sPlayerName == "QEES" ) then
            pPlayerEdict.vars.origin = Vector( 544.000000, 368.000000, -203.000000 );
            pPlayerEdict.vars.angles = Vector( 0.000000, 180.000000, 0.000000 );
        elseif ( sPlayerName == "BotSkipper" ) then
            pPlayerEdict.vars.origin = Vector( -2304.000000, 896.000000, 97.000000 ); 
            pPlayerEdict.vars.angles = Vector( 0.000000, -90.000000, 0.000000 );
        end
    elseif ( spawns_state == 1 ) then -- спавн после 
        if ( sPlayerName == "QEES" ) then    
            pPlayerEdict.vars.origin = Vector( 656.000000, 272.000000, -203.000000 );
            pPlayerEdict.vars.angles = Vector( 0.000000, 180.000000, 0.000000 );
        elseif ( sPlayerName == "BotSkipper" ) then
            pPlayerEdict.vars.origin = Vector( 2528.000000, -4256.000000, -735.000000 ); 
            pPlayerEdict.vars.angles = Vector( 0.000000, 0.000000, 0.000000 );
        end
    end
end





function PrintTime()
    PrintChatText( string.format( "%.3f (IM frames: %d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end


SpeedrunInit();
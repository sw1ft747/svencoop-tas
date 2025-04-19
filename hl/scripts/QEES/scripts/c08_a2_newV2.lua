connected = false;
spawned = false;
start_time = 0.0;
spawns_state = 0;

IncludeScript( "pb" );

function SpeedrunInit()
    SetTimescale( 0.15 );

    RemoveAllTimers();

    ClientCmd(" sc_st_disable_spread 0; default_fov 120; -sc_ducktap; -jump; -duck; -forward; -back; -moveleft; -moveright; sc_strafe 0; sc_strafe_yaw \"\"; sc_strafe_ignore_ground 1; -attack; sc_im_stop");
    ClientCmd("sc_strafe_type 0; sc_strafe_dir 3; sc_st_setangles_stop; sc_ducktap_adjust_fps 0; sc_autojump_inconsistent 0; sc_strafe_vectorial_increment 0; fps_max 200; mp_classic_mode 1; clockwindow 0");
    ClientCmd("sc_aimbot 0; sc_aimbot_change_angles_back 0");
    
   
end

function OnRestart()
    pb_save();
end

function SpeedrunStart()
    SpeedrunStartCustom();
    -- connected = true;
end

function SpeedrunStartCustom()
    start_time = SegmentCurrentTime();

    pb_register( "scientist_door" );
    pb_register( "frozen_door" );
    pb_register( "ambush" );

    pb_load();

    --InputManager.Record( "c08_a2_newV2" );
    --InputManager.Playback( "c08_a2_newV2" );

    --ClientCmd("sc_im_record c08_a2_newV2");
    ClientCmd("sc_im_play c08_a2_newV2");


    CreateTimer( 12.75, EnableSurvivalMode );
    CreateTimer( 12.7, DisableSurvivalMode );
    

	CreateTrigger("frozen_door", Vector(277.719, 712.281, 2225.219), Vector(0, 0, 0), Vector(76.344, 44.094, 90.125));
	--CreateTrigger("split", Vector(376.750, 689.719, 2223.750), Vector(0, 0, 0), Vector(83.156, 10.875, 147.375));
	CreateTrigger("Survival", Vector(328.688, -67.156, 1972.562), Vector(0, 0, -14.594), Vector(58.344, 59.531, 0));
    CreateTrigger("info", Vector(-1312.875, -1897.594, 2239.438), Vector(0, 0, -45.875), Vector(157.031, 298.031, 0));
    CreateServerTrigger("endtrigger", Vector(-3145.469, 642.906, -1007.500), Vector(0, 0, -326.375), Vector(100.406, 139.594, 0));
    CreateTimer(0.085, ClientCmd,"sc_strafe 1; sc_strafe_ignore_ground 0");
    ClientCmd("sc_strafe 0");
    CreateTimer(12.680, ClientCmd,"sc_im_stop");
    --CreateTimer(5.200, ClientCmd,"weapon_crossbow");

    CreateTimer(2.000, ClientCmd,"sc_st_timescale 0.4");
    CreateTimer(10.000, ClientCmd,"sc_st_timescale 0.25");

    --CreateTimer(12.550, ClientCmd,"sc_ducktap_adjust_fps 10000");
    --CreateTimer(13.685, ClientCmd,"kill");
    --CreateTimer(13.685, ClientCmd,"sc_im_stop");
    --CreateTimer(13.000, ClientCmd,"sc_strafe_ignore_ground 1"); 
    CreateTimer(12.500, ClientCmd,"sc_aimbot 1");
    CreateTimer(12.500, ClientCmd,"sc_aimbot_change_angles_back 1");
    CreateTimer(12.500, ClientCmd,"sc_st_disable_spread 1");
    CreateTimer(13.000, ClientCmd,"sc_strafe_ignore_ground 1"); 
    CreateTimer(16.000, ClientCmd,"sc_aimbot 0");
    CreateTimer(16.000, ClientCmd,"sc_aimbot_change_angles_back 0");
    CreateTimer(16.000, ClientCmd,"sc_st_disable_spread 1");

    

    
   
end


function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "spawnRight") then
		--ClientCmd("sc_im_record c08_a2spawnRight");
		--ClientCmd("setang -2.097920 311.682129 0.000000");
		--CreateTimer(0.105, ClientCmd,"+forward");
		--CreateTimer(0.400, ClientCmd,"-forward");
		--CreateTimer(0.300, ClientCmd,"setang -0.590040 235.508423 0.000000");
		--CreateTimer(0.700, ClientCmd,"setang 0 270 0");

	elseif (name == "frozen_door") then
		CreateTimer(1.6, ClientCmd,"sc_st_setangles 0.871262 206.713257 20");
		CreateTimer(2.99, ClientCmd,"sc_im_play c08_a2_freezedoorV2");    
        CreateTimer(9.00, ClientCmd,"sc_im_stop");

        pb_check( "frozen_door", SegmentCurrentTime(), "Frozen door activation" );
	elseif (name == "split") then
		ClientCmd("sc_im_split; say jopa");

	elseif (name == "Survival") then
        CreateTimer(0.000, ClientCmd,"kill"):
        CreateTimer(0.000, DisableSurvivalMode);
		CreateTimer(0.000, EnableSurvivalMode);

    elseif (name == "info") then
        CreateTimer(0.900, ClientCmd,"-sc_ducktap");
		CreateTimer(1.000, ClientCmd,"sc_script_execute jumpBow");
    end

    return true;
end	


function OnTouchServerTrigger(activator, name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (activator.vars.netname == "Sw1ft" and name == "endtrigger") then
        SendCommandToClient(activator, "sc_selfsink2");
        ClientCmd("fps_max 500");
        return true;
    end

    return false;
end	


-- function OnGameFrame(state, frametime, postruncmd)
--     if ( not postruncmd ) then return end;

--     if ( connected and not spawned ) then
--         if ( ( PlayerMove.flags & FL_ONGROUND ) == FL_ONGROUND ) then
--             SpeedrunStartCustom();
--             spawned = true;
--         end
--     end
-- end

function OnFireCrossbowSpread(entity, entindex)
    return true, 1.0, true, 1.0;
end

function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
    printl( "OnPlayerSpawn()" );
    
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) .. ", viewangles: " .. tostring(pPlayerEdict.vars.angles) .. "" );

    local sPlayerName = pPlayerEdict.vars.netname;

    if ( spawns_state == 0 ) then
        if ( sPlayerName == "QEES51" ) then
            pPlayerEdict.vars.origin = Vector( 3644.000000, 621.000000, 2069.000000 );     
            pPlayerEdict.vars.angles = Vector( 0.000000, -130.000000, 0.000000 );
        elseif ( sPlayerName == "Sw1ft" ) then
            pPlayerEdict.vars.origin = Vector( 3521.000000, 621.000000, 2069.000000 );    
            pPlayerEdict.vars.angles = Vector( 0.000000, -90.000000, 0.000000 );  
        elseif ( sPlayerName == "kolokola777" ) then
            pPlayerEdict.vars.origin = Vector( 3521.000000, 621.000000, 2069.000000 );
            pPlayerEdict.vars.angles = Vector( 0.000000, -90.000000, 0.000000 );
        end
    elseif ( spawns_state == 1 ) then
        if ( sPlayerName == "QEES51" ) then
            pPlayerEdict.vars.origin = Vector( 206.000000, -152.000000, 1905.000000 );     
            pPlayerEdict.vars.angles = Vector( 0.000000, 180.000000, 0.000000 );
            spawns_state = 2;
        elseif ( sPlayerName == "Sw1ft" ) then
            pPlayerEdict.vars.origin = Vector( 206, 72, 1905 );
            pPlayerEdict.vars.angles = Vector( 0.000000, 180.000000, 0.000000 );
        end
    end
end

function OnFireTargets( targetname, activator, caller, usetype, value, delay )
    if ( targetname == "spawns2_mm" ) then
        ClientCmd( "toggle_survival_mode; toggle_survival_mode; gibme" );
        CreateTimer( 0.11, ClientCmd, "toggle_survival_mode; toggle_survival_mode" );
        spawns_state = 1;
    elseif ( targetname == "opendoor" ) then
        CreateTimer( 1.9, ClientCmd, "sc_st_setangles 10 90 60" );
        CreateTimer( 2.35, ClientCmd, "sc_im_play c08_a2_eblan_sosk" );
        pb_check( "scientist_door", SegmentCurrentTime(), "Scientist activation" );
    elseif ( targetname == "ambush_mm" ) then
        pb_check( "ambush", SegmentCurrentTime(), "Ambush" );
        -- CreateTimer( 12.0, ClientCmd, "say wottadrag" );
        CreateTimer( 10.0, ClientCmd, "say Teleport in 1 s" );
        CreateTimer( 9.0, ClientCmd, "say Teleport in 2 s" );
        CreateTimer( 8.0, ClientCmd, "say Teleport in 3 s" );
        CreateTimer( 7.0, ClientCmd, "say Teleport in 4 s" );
        CreateTimer( 6.0, ClientCmd, "say Teleport in 5 s" );
    elseif ( targetname == "wottadrag" ) then
        -- CreateTimer( 24.0, ClientCmd, "say gonebabygone" );
        CreateTimer( 22.0, ClientCmd, "say Teleport in 1 s" );
        CreateTimer( 21.0, ClientCmd, "say Teleport in 2 s" );
        CreateTimer( 20.0, ClientCmd, "say Teleport in 3 s" );
        CreateTimer( 19.0, ClientCmd, "say Teleport in 4 s" );
        CreateTimer( 18.0, ClientCmd, "say Teleport in 5 s" );
    end

    -- printl( "OnFireTargets :: " .. targetname .. " : " .. value .. " : " .. delay );
end

function PrintTime()
    PrintChatText( string.format( "%.3f (IM frames: %d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

SpeedrunInit();


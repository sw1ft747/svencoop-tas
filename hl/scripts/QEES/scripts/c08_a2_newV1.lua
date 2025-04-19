connected = false;
spawned = false;
start_time = 0.0;

function SpeedrunInit()
    SetTimescale( 0.5 );

    RemoveAllTimers();

    ClientCmd(" sc_st_disable_spread 1; default_fov 120; -sc_ducktap; -jump; -duck; -forward; -back; -moveleft; -moveright; sc_strafe 0; sc_strafe_yaw \"\"; sc_strafe_ignore_ground 1; -attack; sc_im_stop");
    ClientCmd("sc_strafe_type 0; sc_strafe_dir 3; sc_st_setangles_stop; sc_ducktap_adjust_fps 0; sc_autojump_inconsistent 0; sc_strafe_vectorial_increment 0; fps_max 200; mp_classic_mode 1; clockwindow 0");
    
end

function SpeedrunStart()
    SpeedrunStartCustom();
    -- connected = true;
end

function SpeedrunStartCustom()
    start_time = SegmentCurrentTime();

    --InputManager.Record( "c08_a2_new" );
    InputManager.Playback( "c08_a2_new" );

    CreateTimer( 0.75, EnableSurvivalMode );
    CreateTimer( 0.7, DisableSurvivalMode );
    

	CreateTrigger("frozen_door", Vector(277.719, 712.281, 2225.219), Vector(0, 0, 0), Vector(76.344, 44.094, 90.125));
	--CreateTrigger("split", Vector(376.750, 689.719, 2223.750), Vector(0, 0, 0), Vector(83.156, 10.875, 147.375));
	CreateTrigger("Survival", Vector(328.688, -67.156, 1972.562), Vector(0, 0, -14.594), Vector(58.344, 59.531, 0));
    ClientCmd("sc_strafe 1; sc_strafe_ignore_ground 0");
    CreateTimer(8.300, ClientCmd,"sc_im_split");
    CreateTimer(5.200, ClientCmd,"weapon_crossbow");
    CreateTimer(8.000, ClientCmd,"sc_st_timescale 0.1");
    
   
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
		CreateTimer(2.95, ClientCmd,"sc_im_play c08_a2_freezedoorV2");

	elseif (name == "split") then
		ClientCmd("sc_im_split; say jopa");

	elseif (name == "Survival") then
		CreateTimer(0.000, DisableSurvivalMode);
		CreateTimer(0.000, EnableSurvivalMode);
    end
    return true;
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
end

function PrintTime()
    PrintChatText( string.format( "%.3f (IM frames: %d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

SpeedrunInit();


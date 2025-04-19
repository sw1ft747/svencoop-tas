connected = false;
spawned = false;
start_time = 0.0;
postspawn = false;

function SpeedrunInit()
    SetTimescale( 0.75 );

    RemoveAllTimers();

    ClientCmd(" sc_st_disable_spread 1; default_fov 120; -sc_ducktap; -jump; -duck; -forward; -back; -moveleft; -moveright; sc_strafe 0; sc_strafe_yaw \"\"; sc_strafe_ignore_ground 1; -attack; sc_im_stop");
    ClientCmd("sc_strafe_type 0; sc_strafe_dir 3; sc_st_setangles_stop; sc_ducktap_adjust_fps 0; sc_autojump_inconsistent 0; fps_max 200; mp_classic_mode 1; clockwindow 0");
end

function SpeedrunStart()
    SpeedrunStartCustom();
    -- connected = true;
end

function SpeedrunStartCustom()
    start_time = SegmentCurrentTime();

    CreateTimer( 0.15, EnableSurvivalMode );
    CreateTimer( 0.1, DisableSurvivalMode );

    ClientCmd("sc_im_record c03_qees");
    -- ClientCmd("sc_im_play c03_qees");
    CreateTimer(0.000, ClientCmd,"sc_strafe 1");
    CreateTimer(0.000, ClientCmd,"sc_strafe_ignore_ground 0");
    CreateTimer(0.464, ClientCmd,"+jump; sc_strafe_yaw -50");
    CreateTimer(0.510, ClientCmd,"-jump; +sc_ducktap");
    CreateTimer(1.0, ClientCmd,"weapon_crowbar");
    CreateTimer(1.110, ClientCmd,"sc_strafe_yaw 25");
    CreateTimer(1.528, ClientCmd,"+jump; -sc_ducktap");
    CreateTimer(2.260, ClientCmd,"+duck");
    CreateTimer(2.350, ClientCmd,"-duck");
    CreateTimer(2.350, ClientCmd,"sc_st_setangles -90 -90 80");
    CreateTimer(2.520, ClientCmd,"sc_strafe_yaw 0");
    CreateTimer(2.590, ClientCmd,"-jump");
    CreateTimer(2.700, ClientCmd,"+attack; sc_strafe_ignore_ground 1; +duck");
    CreateTimer(2.710, ClientCmd,"-attack");
    CreateTimer(2.750, ClientCmd,"+moveleft; +forward");
    CreateTimer(2.800, ClientCmd,"-duck");
    CreateTimer(4.250, ClientCmd,"+duck; -moveleft; -forward; sc_st_setangles 0 0 60");
    CreateTimer(4.252, ClientCmd,"sc_strafe_ignore_ground 0");
    CreateTimer(4.390, ClientCmd,"-duck");
    CreateTimer(4.630, ClientCmd,"+jump; sc_strafe_yaw -45");
    CreateTimer(5.115, ClientCmd,"sc_strafe_yaw 60; sc_st_setangles 0 90 30");
    CreateTimer(5.320, ClientCmd,"+duck");
    CreateTimer(5.470, ClientCmd,"+attack");
    CreateTimer(5.480, ClientCmd,"-duck");
    CreateTimer(5.480, ClientCmd,"-attack");
    CreateTimer(5.605, ClientCmd,"sc_strafe_yaw 179; sc_st_setangles 0 179 60");
    CreateTimer(5.605, ClientCmd,"sc_strafe_type 1");
    CreateTimer(5.969, ClientCmd,"sc_strafe_type 0");
    CreateTimer(6.173, ClientCmd,"sc_strafe_yaw 90; sc_st_setangles 0 90 70");
    CreateTimer(7.010, ClientCmd,"sc_strafe_yaw 55");
    CreateTimer(7.189, ClientCmd,"sc_strafe_yaw 120");
    CreateTimer(7.634, ClientCmd,"sc_strafe_yaw -159; sc_st_setangles 0 179 60");
    CreateTimer(7.884, ClientCmd,"sc_strafe_yaw 179");
    CreateTimer(8.239, ClientCmd,"sc_strafe_yaw 90");
    CreateTimer(8.829, ClientCmd,"sc_strafe_yaw 179");
    CreateTimer(8.771, ClientCmd,"-jump; +sc_ducktap");
    CreateTimer(9.000, ClientCmd,"-sc_ducktap; sc_strafe_yaw 179");
    CreateTimer(9.818, ClientCmd,"+jump");
    CreateTimer(10.089, ClientCmd,"sc_strafe_yaw -90");
    CreateTimer(10.110, ClientCmd,"+duck");
    CreateTimer(10.210, ClientCmd,"-duck; -jump; +sc_ducktap");
    CreateTimer(10.640, ClientCmd,"sc_strafe_yaw -179");
    CreateTimer(10.844, ClientCmd,"-sc_ducktap; +jump");
    CreateTimer(10.900, ClientCmd,"sc_strafe_yaw 90");
    CreateTimer(11.100, ClientCmd,"sc_strafe_yaw 168");
    CreateTimer(11.384, ClientCmd,"sc_strafe_yaw -102; sc_st_setangles 0 -90 70");
    CreateTimer(12.134, ClientCmd,"sc_strafe_yaw -30; +duck");
    CreateTimer(12.175, ClientCmd,"-duck; sc_strafe_yaw -30;");
    CreateTimer(12.675, ClientCmd,"sc_strafe_yaw -90; -jump; +sc_ducktap");
    CreateTimer(12.934, ClientCmd,"+duck");
    CreateTimer(13.144, ClientCmd,"kill");

    --CreateTimer(11.779, ClientCmd,"sc_strafe_yaw -40");
    --CreateTimer(12.200, ClientCmd,"sc_strafe_yaw -90");
    --CreateTimer(12.764, ClientCmd,"+sc_ducktap; -jump");
    --CreateTimer(12.954, ClientCmd,"-sc_ducktap");


    





    --[[
    
    CreateTimer(5.164, ClientCmd,"+forward");
    CreateTimer(5.349, ClientCmd,"-forward");
    CreateTimer(5.349, ClientCmd,"+back; +moveleft");
    CreateTimer(5.764, ClientCmd,"-back; -moveleft; +jump; sc_strafe_yaw -170");
    
    
    
    CreateTimer(5.785, ClientCmd,"+duck");
    CreateTimer(5.790, ClientCmd,"-attack2");
    CreateTimer(5.795, ClientCmd,"-duck");
    CreateTimer(5.792, ClientCmd,"sc_st_setangles 0 -170 35");
    --CreateTimer(6.002, ClientCmd,"sc_st_setangles 35 -0.2 25");
    CreateTimer(6.2, ClientCmd, "sc_strafe 0; sc_aimbot 1; sc_st_disable_spread 1; +attack; wait; -attack; wait; sc_st_disable_spread 0; sc_aimbot 0; sc_strafe 1; setang 20 98.5" );


    
    CreateTimer(5.100, ClientCmd,"sc_strafe_yaw 0; sc_strafe_type 0; sc_st_setangles 0 10 45");
    CreateTimer(5.244, ClientCmd,"+forward");
    CreateTimer(5.349, ClientCmd,"-forward");
    CreateTimer(5.349, ClientCmd,"+back; +moveleft");
    CreateTimer(5.795, ClientCmd,"-back; -moveleft; +jump; sc_strafe_yaw -170");
    
    CreateTimer(5.812, ClientCmd,"sc_st_setangles 0 -170 35");
    CreateTimer(5.890, ClientCmd,"-duck");
    CreateTimer(6.270, ClientCmd,"sc_strafe_yaw -178");]]


end

function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "spawn_force") then
        postspawn = true;

    elseif (name == "trigger1") then


        end
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

function OnFireBulletsSpread(entity, entindex, spread_x, spread_y)
    -- PrintChatText( string.format( "entindex: %d | x: %f | y: %f", entindex, spread_x, spread_y ) );

    if ( entindex == 203 + ( gpGlobals.maxClients - 2 ) ) then
        local angle = RandomFloat( 0, 2 * math.pi );
        local spread_factor = RandomFloat( 0.0, 0.16 );

        spread_x = math.cos( angle ) * spread_factor;
        spread_y = math.sin( angle ) * spread_factor;
    elseif ( entindex == 199 + ( gpGlobals.maxClients - 2 ) ) then
        local angle = RandomFloat( math.pi / 2, 5 * math.pi / 4 );
        local spread_factor = RandomFloat( 0.9, 1.0 );

        spread_x = math.cos( angle ) * spread_factor;
        spread_y = math.sin( angle ) * spread_factor;
    end

    return spread_x, spread_y;
end

function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
    printl( "OnPlayerSpawn()" );
    
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) .. ", viewangles: " .. tostring(pPlayerEdict.vars.angles) .. "" );

    local sPlayerName = pPlayerEdict.vars.netname;

    if ( not postspawn ) then -- спавн в начале
        if ( sPlayerName == "QEES51" ) then
            pPlayerEdict.vars.origin = Vector( 109.687500, -645.750000, -219.968750 );
            pPlayerEdict.vars.angles = Vector( 0.000000, 0.000000, 0.000000 );
        elseif ( sPlayerName == "BotSkipper" ) then
            pPlayerEdict.vars.origin = Vector( -1616.000000, -3760.000000, -63.000000 );
            pPlayerEdict.vars.angles = Vector( 0.000000, 0.000000, 0.000000 );
        end
    else -- спавн после трубы
        if ( sPlayerName == "QEES51" ) then
            -- pPlayerEdict.vars.origin = Vector( -1616.000000, -3696.000000, -63.000000 );
            -- pPlayerEdict.vars.angles = Vector( 0.000000, 0.000000, 0.000000 );
        elseif ( sPlayerName == "BotSkipper" ) then
            -- pPlayerEdict.vars.origin = Vector( -1616.000000, -3760.000000, -63.000000 );
            -- pPlayerEdict.vars.angles = Vector( 0.000000, 0.000000, 0.000000 );
        end
    end
end

function PrintTime()
    PrintChatText( string.format( "%.3f (IM frames: %d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

SpeedrunInit();
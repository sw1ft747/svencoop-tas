connected = false;
spawned = false;
start_time = 0.0;
postspawn = false;

function SpeedrunInit()
    SetTimescale( 0.25 );

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

    InputManager.Record( "c11_a2_new" );
    --InputManager.Playback( "c11_a2_new" );
    ClientCmd("impulse 100");
	CreateTimer(3.100, ClientCmd,"impulse 100");
    CreateTimer( 4.15, EnableSurvivalMode );
    CreateTimer( 4.1, DisableSurvivalMode );
    ClientCmd("weapon_gauss");
    ClientCmd("sc_strafe 1");
    ClientCmd("sc_strafe_ignore_ground 0");
    ClientCmd("+tau");
    CreateTrigger("spawn_force", Vector(-319.844, -4979.938, -89.344), Vector(0, 0, 0), Vector(148.500, 1.844, 89.750));
    CreateTimer(0.475, ClientCmd,"+jump");
    CreateTimer(1.005, ClientCmd,"-tau");
    CreateTimer(1.500, ClientCmd,"sc_strafe_yaw 9");
    CreateTimer(1.675, ClientCmd,"sc_strafe_yaw -120; sc_st_setangles 0 -90 25; sc_strafe_dir 1; sc_strafe_type 1");
    --CreateTimer(1.930, ClientCmd,"sc_st_setangles 20 -90 15");
    CreateTimer(2.290, ClientCmd,"+attack2");
    CreateTimer(2.090, ClientCmd,"+back");
    --CreateTimer(4.590, ClientCmd,"sc_st_timescale 0.05");
    CreateTimer(2.125, ClientCmd,"-back");
    CreateTimer(2.120, ClientCmd,"sc_strafe_yaw -90; sc_strafe_type 0; sc_strafe_dir 3");
    CreateTimer(2.204, ClientCmd,"+duck");
    CreateTimer(2.224, ClientCmd,"-duck");
    CreateTimer(3.009, ClientCmd,"sc_strafe_yaw 13; sc_strafe_type 3; sc_st_setangles 0 0 25");
    CreateTimer(3.390, ClientCmd,"sc_strafe_type 1");
    CreateTimer(3.460, ClientCmd,"sc_strafe_yaw -90; sc_strafe_dir 3; sc_st_setangles 0 -90 25");
    CreateTimer(3.900, ClientCmd,"-jump; +sc_ducktap");
    CreateTimer(3.940, ClientCmd,"sc_strafe_yaw -72");
    CreateTimer(4.039, ClientCmd,"sc_strafe_yaw -90");
    CreateTimer(4.039, ClientCmd,"-sc_ducktap; +jump; +duck");
    CreateTimer(4.195, ClientCmd,"sc_strafe_type 1");
    CreateTimer(4.350, ClientCmd,"-duck");
    CreateTimer(4.540, ClientCmd,"+back");
    CreateTimer(4.885, ClientCmd,"-back; -jump");
    CreateTimer(4.885, ClientCmd,"sc_strafe_yaw 91; sc_st_setangles 0 91 45; sc_strafe_type 0; sc_strafe_ignore_ground 0");
    CreateTimer(5.100, ClientCmd,"sc_strafe_ignore_ground 1; sc_strafe_type 0; sc_strafe_yaw 140; sc_st_setangles 0 10 45; +forward");
    CreateTimer(5.235, ClientCmd,"-forward");
    CreateTimer(5.349, ClientCmd,"+back; +moveleft");
    CreateTimer(5.685, ClientCmd,"+jump; sc_strafe_yaw -170");
    CreateTimer(5.750, ClientCmd,"+duck");
    CreateTimer(5.755, ClientCmd,"-attack2; -back; -moveleft");
    CreateTimer(5.760, ClientCmd,"-duck");
    CreateTimer(5.757, ClientCmd,"sc_st_setangles 0 -173 35");
    --CreateTimer(6.100, ClientCmd,"setang 39.008194 -1.170044 0.000000");
    --CreateTimer(6.100, ClientCmd,"sc_st_timescale 0.05");
    CreateTimer(6.355, ClientCmd,"sc_strafe_yaw -178");


    





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

function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
    printl( "OnPlayerSpawn()" );
    
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) .. ", viewangles: " .. tostring(pPlayerEdict.vars.angles) .. "" );

    local sPlayerName = pPlayerEdict.vars.netname;

    if ( not postspawn ) then -- спавн в начале
        if ( sPlayerName == "QEES51" ) then
            pPlayerEdict.vars.origin = Vector( -1524.000000, -3696.000000, -63.000000 );
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
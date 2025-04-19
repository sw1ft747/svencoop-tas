connected = false;
spawned = false;
start_time = 0.0;
spawns_state = 0;


function SpeedrunInit()
    SetTimescale( 0.25 );

    RemoveAllTimers();

    ClientCmd(" sc_st_disable_spread 0; default_fov 120; -sc_ducktap; -jump; -duck; -forward; -back; -moveleft; -moveright; sc_strafe 0; sc_strafe_yaw \"\"; sc_strafe_ignore_ground 1; -attack; sc_im_stop");
    ClientCmd("sc_strafe_type 0; sc_strafe_dir 3; sc_st_setangles_stop; sc_ducktap_adjust_fps 0; sc_autojump_inconsistent 0; fps_max 200; mp_classic_mode 1; clockwindow 0");
end

function SpeedrunStart()
    SpeedrunStartCustom();
    -- connected = true;
end

function SpeedrunStartCustom()
    start_time = SegmentCurrentTime();

    --InputManager.Record( "c11_a2_new" );
    InputManager.Playback( "c11_a2_new" );
    ClientCmd("impulse 100");
	CreateTimer(3.100, ClientCmd,"impulse 100");
    CreateTimer( 4.15, EnableSurvivalMode );
    CreateTimer( 4.1, DisableSurvivalMode );
    ClientCmd("weapon_gauss");
    ClientCmd("sc_strafe 1");
    ClientCmd("sc_strafe_ignore_ground 0");
    ClientCmd("+tau");
    CreateTrigger("spawn_force", Vector(-319.844, -4979.938, -89.344), Vector(0, 0, 0), Vector(148.500, 1.844, 89.750));
    CreateTrigger("steni_net", Vector(-3983.312, 1391.438, -203.688), Vector(0, 0, 0), Vector(238.500, 289.906, 127.250));
    CreateTimer(0.475, ClientCmd,"+jump");
    CreateTimer(1.005, ClientCmd,"-tau");
    CreateTimer(1.500, ClientCmd,"sc_strafe_yaw 9");
    CreateTimer(1.675, ClientCmd,"sc_strafe_yaw -120; sc_st_setangles 0 -90 25; sc_strafe_dir 1; sc_strafe_type 1");
    --CreateTimer(1.930, ClientCmd,"sc_st_setangles 20 -90 15");
    CreateTimer(2.290, ClientCmd,"+attack2");
    CreateTimer(2.090, ClientCmd,"+back");
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
    CreateTimer(5.100, ClientCmd,"sc_strafe_ignore_ground 1; sc_strafe_type 0; sc_strafe_yaw 140; sc_st_setangles 1 11 45; +forward");
    CreateTimer(5.235, ClientCmd,"-forward");
    CreateTimer(5.349, ClientCmd,"sc_strafe_ignore_ground 0; sc_strafe_yaw 176");
    CreateTimer(5.675, ClientCmd,"+jump; sc_strafe_yaw -170; sc_strafe_ignore_ground 1; +back; +moveleft; sc_strafe_type 0");
    CreateTimer(5.750, ClientCmd,"+duck");
    CreateTimer(5.755, ClientCmd,"-attack2; -back; -moveleft;");
    CreateTimer(5.770, ClientCmd,"-duck");
    CreateTimer(5.757, ClientCmd,"sc_st_setangles 0 -173 35");


    --CreateTimer(8.670, ClientCmd,"sc_st_timescale 0.05"); 
    CreateTimer(5.900, ClientCmd,"sc_strafe_type 1");
    CreateTimer(5.900, ClientCmd,"sc_strafe_yaw -159.4");

    CreateTimer(6.235, ClientCmd,"+tau");
    CreateTimer(6.535, ClientCmd,"sc_st_setangles 0 157 35");
    CreateTimer(6.905, ClientCmd,"-tau");
    CreateTimer(6.907, ClientCmd,"weapon_crossbow");
    CreateTimer(6.805, ClientCmd,"sc_strafe_type 1; sc_strafe_dir 1");
    CreateTimer(7.000, ClientCmd,"sc_strafe_yaw 139; sc_strafe_type 1; sc_st_setangles 0 90 30");
    CreateTimer(7.100, ClientCmd,"sc_strafe_type 1; ; sc_strafe_dir 3");
    CreateTimer(7.309, ClientCmd,"sc_strafe_yaw 100");
    CreateTimer(7.449, ClientCmd,"+duck");
    CreateTimer(7.420, ClientCmd,"setang 11.702893 92.406006 0.000000");
    CreateTimer(7.421, ClientCmd,"+attack");
    CreateTimer(7.471, ClientCmd,"-attack");
    CreateTimer(7.430, ClientCmd,"weapon_gauss");
    CreateTimer(7.449, ClientCmd,"-duck");
    CreateTimer(7.439, ClientCmd,"+tau");
    CreateTimer(7.449, ClientCmd,"sc_st_setangles 0 90 30");
    CreateTimer(7.600, ClientCmd,"sc_strafe_type 0; sc_strafe_dir 3");
    CreateTimer(7.614, ClientCmd,"sc_strafe_yaw 90");
    CreateTimer(7.900, ClientCmd,"sc_st_setangles 0 -0.5 30");
    CreateTimer(8.235, ClientCmd,"sc_strafe_yaw 0");
    CreateTimer(8.210, ClientCmd,"-jump; sc_strafe_ignore_ground 0");
    CreateTimer(8.435, ClientCmd,"+jump");
    CreateTimer(8.454, ClientCmd,"-tau");
    CreateTimer(8.600, ClientCmd,"+tau");
    CreateTimer(9.000, ClientCmd,"sc_st_setangles 0 -90 30");
    CreateTimer(9.535, ClientCmd,"sc_strafe_yaw -115");
    CreateTimer(9.510, ClientCmd,"-jump");
    CreateTimer(9.740, ClientCmd,"+jump");
    CreateTimer(9.750, ClientCmd,"-tau");
    CreateTimer(9.735, ClientCmd,"sc_strafe_yaw -90");
    CreateTimer(9.850, ClientCmd,"+tau");
    CreateTimer(10.000, ClientCmd,"sc_strafe_type 1");
    CreateTimer(10.590, ClientCmd,"sc_strafe_yaw -1");
    CreateTimer(10.550, ClientCmd,"sc_st_setangles 0 -1 30");
    CreateTimer(10.715, ClientCmd,"sc_strafe_type 0");
    CreateTimer(10.804, ClientCmd,"-tau");
    CreateTimer(10.904, ClientCmd,"+tau");
    CreateTimer(11.359, ClientCmd,"sc_strafe_yaw -90; -jump");
    CreateTimer(11.250, ClientCmd,"sc_st_setangles 0 -90 30");
    CreateTimer(11.750, ClientCmd,"+jump");
    CreateTimer(11.860, ClientCmd,"-tau");
    CreateTimer(12.079, ClientCmd,"kill");
    CreateTimer(12.100, ClientCmd,"-jump; sc_strafe_ignore_ground 1");
    CreateTimer(12.100, CVar.SetValue, "sc_strafe_yaw", "" );
    CreateTimer( 12.69, EnableSurvivalMode );
    CreateTimer( 12.169, DisableSurvivalMode );
    CreateTimer(12.179, ClientCmd,"weapon_gauss; weapon_crossbow");

end

function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "steni_net") then
        ClientCmd("say stena_off");

    elseif (name == "123") then

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

function OnFireTargets( targetname, activator, caller, usetype, value, delay )
    if ( targetname == "spawns2_mm" ) then
        ClientCmd( "gibme" );
        CreateTimer( 0.1, ClientCmd, "toggle_survival_mode; toggle_survival_mode" );
        CreateTimer( 0.3, function() spawns_state = 2 end );
        spawns_state = 1;
    end

    printl( "OnFireTargets :: " .. targetname .. " : " .. value .. " : " .. delay );
end

grunt1_shoots = 1;
grunt1_allow_shoot = true;

function OnFireBulletsSpread(entity, entindex, spread_x, spread_y)
    -- PrintChatText( string.format( "entindex: %d | x: %f | y: %f", entindex, spread_x, spread_y ) );

    if ( entindex == 203 + ( gpGlobals.maxClients - 2 ) ) then
        local angle;
        local spread_factor;
        
        if ( grunt1_allow_shoot and ( grunt1_shoots == 1 or grunt1_shoots == 3 ) ) then
            angle = RandomFloat( 3 * math.pi / 4, 2 * math.pi );
            spread_factor = 0.09;
        else
            angle = RandomFloat( 0, 2 * math.pi );
            spread_factor = RandomFloat( 0.9, 1.0 );
        end

        spread_x = math.cos( angle ) * spread_factor;
        spread_y = math.sin( angle ) * spread_factor;

        if ( grunt1_shoots == 3 ) then
            spread_x = 0.089544;
            spread_y = -0.009051;
        elseif ( grunt1_shoots == 1 ) then
            spread_x = 0.078437;
            spread_y = -0.044132;
        end
        
        PrintChatText( string.format( "entindex: %d | x: %f | y: %f", entindex, spread_x, spread_y ) );
        
        grunt1_shoots = grunt1_shoots + 1;
    elseif ( entindex == 199 + ( gpGlobals.maxClients - 2 ) ) then
        local angle = RandomFloat( math.pi / 2, 5 * math.pi / 4 );
        local spread_factor = RandomFloat( 0.9, 1.0  );

        spread_x = math.cos( angle ) * spread_factor;
        spread_y = math.sin( angle ) * spread_factor;
    end

    return spread_x, spread_y;
end

function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
    printl( "OnPlayerSpawn()" );
    
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) .. ", viewangles: " .. tostring(pPlayerEdict.vars.angles) .. "" );

    local sPlayerName = pPlayerEdict.vars.netname;

    if ( spawns_state == 0 ) then -- спавн в начале
        if ( sPlayerName == "QEES51" ) then
            pPlayerEdict.vars.origin = Vector( -1524.000000, -3696.000000, -63.000000 );
            pPlayerEdict.vars.angles = Vector( 0.000000, 0.000000, 0.000000 );
        elseif ( sPlayerName == "BotSkipper" ) then
            pPlayerEdict.vars.origin = Vector( -1616.000000, -3760.000000, -63.000000 );
            pPlayerEdict.vars.angles = Vector( 0.000000, 0.000000, 0.000000 );
        end
    elseif ( spawns_state == 1 ) then -- спавн после трубы
        if ( sPlayerName == "QEES51" ) then    
            pPlayerEdict.vars.origin = Vector( 112.000000, 576.000000, -119.000000 );
            pPlayerEdict.vars.angles = Vector( 0.000000, 270.000000, 0.000000 );
        elseif ( sPlayerName == "BotSkipper" ) then
            pPlayerEdict.vars.origin = Vector( 0.000000, 512.000000, -119.000000 ); 
            pPlayerEdict.vars.angles = Vector( 0.000000, 270.000000, 0.000000 );
        elseif ( sPlayerName == "Sw1ft" ) then
            pPlayerEdict.vars.origin = Vector( 0.000000, 576.000000, -119.000000 ); 
            pPlayerEdict.vars.angles = Vector( 0.000000, 270.000000, 0.000000 );
        end
    end
end


function PrintTime()
    PrintChatText( string.format( "%.3f (IM frames: %d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

SpeedrunInit();
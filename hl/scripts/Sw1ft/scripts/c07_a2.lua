start_time = 0;
spawns_state = 0;
adjust_ques_position = false;
spawns_trigger_activated = false;
ques_player_index = 3;
func_tank_state = 0;
aim_skip_target_once = true;
start_onground = false;

function InitTriggers()
    ClearTriggers();
    ClearServerTriggers();

    CreateTrigger("func_tank_disable_1", Vector(1516.812, 2414.156, -327.719), Vector(0, 0, 0), Vector(166.906, 248.125, 265.312));
    -- CreateTrigger("selfsink", Vector(1615.469, -240.031, 326.031), Vector(0, 0, 0), Vector(290.273, 468.751, 178.495));
    CreateTrigger("fps200", Vector(1929.500, -105.188, 265.812), Vector(0, 0, 0), Vector(38.781, 173.562, 133.938));
    CreateTrigger("dalboeb_mode", Vector(-5284.750, -3387.438, -491.000), Vector(0, 0, 0), Vector(182.094, 301.562, 191.688));

    CreateServerTrigger("ques_triggur_bot", Vector(970.844, 2406.594, -172.781), Vector(0, 0, -173.500), Vector(136.250, 296.344, 0));
    -- CreateServerTrigger("ques_triggur_vel", Vector(-5329.594, -3336.625, -732.188), Vector(0, 0, 0), Vector(455.938, 262.688, 445.469));
    CreateServerTrigger("fastmedkit", Vector(206.469, -2287.969, 328.031), Vector(0, 0, 0), Vector(145.126, 131.406, 83.271));
    CreateServerTrigger("disconnect", Vector(1051.844, -759.469, 355.438), Vector(0, 0, 0), Vector(418.188, 217.781, 145.469));
end

function OnClientKill( pPlayerEdict )
    printl( "OnClientKill( " .. tostring( pPlayerEdict.vars.netname ) .. " )" );

    if ( pPlayerEdict.vars.netname == "Sw1ft" ) then
        ClientCmd( "fps_max 200" );

        CreateTimer( 0.75, ClientCmd, "fps_max 20; +attack2" );
        CreateTimer( 1.15, ClientCmd, "fps_max 200; -attack2" );

        for t = 0.8, 0.0, -0.1 do
            CreateTimer( t, ClientCmd, string.format( "say Observer mode in %.1f seconds", 0.8 - t ) );
        end
    end
end

function OnDisconnect()
    ClientCmd( "bind MOUSE1 +attack" );
end

function SpeedrunInit()
    -- CreateTimer(1e-6, SetTimescale, 0.25 );

    ClientCmd( "sv_cheats 0; wait; sc_script \"SetTimescale(0.35)\"" );
    ClientCmd( "sc_st_setangles_stop; sc_st_setangles2_stop; sc_st_follow_point_stop; -jump; -duck; -attack; -moveleft; -right; -moveright; -sc_ducktap; sc_aimbot_scripts_filter_targets 1" );
    ClientCmd( "sc_strafe 0; sc_strafe_dir 3; sc_strafe_ignore_ground 1; sc_strafe_vectorial 1; sc_strafe_vectorial_increment 1; sc_strafe_vectorial_snap 170; sc_aimbot 0; sc_st_disable_spread 0; sc_jumpbug_min_fall_velocity 580" );
    ClientCmd( "clockwindow 0; cl_smoothtime 0; mp_respawndelay 0; mp_classic_mode 1; fps_max 200; sc_jumpbug_min_fall_velocity 580; sc_st_legit_mode_ignore_freeze 1; sc_aimbot_change_angles_back 1; sc_ducktap_adjust_fps 10000" );

    ClientCmd( "bind MOUSE1 \"sc_aimbot 1; sc_st_disable_spread 1; +attack; wait; -attack; wait; sc_st_disable_spread 0; sc_aimbot 0\"" );
end

function OnPlayInput(filename, frame, cmd)
    if ( ( cmd.buttons & IN_ATTACK ) == IN_ATTACK ) then
        PrintChatText( "IN_ATTACK frame: " .. tostring( frame ) );
    end

    if ( ( cmd.buttons & IN_ATTACK ) == IN_ATTACK ) then
        if ( filename == "c07a2_start_new.bin" ) then
            -- adjust aim angles
            if ( frame == 438 or frame == 1342 ) then
                CVar.SetValue( "sc_st_disable_spread", "1" );
                CreateTimer( CVar.GetFloat( "sc_st_min_frametime" ), CVar.SetValue, "sc_st_disable_spread", "0" );

                Aimbot( cmd, true, false, false, false );
            end
        elseif ( filename == "c07a2_bunnyrun_new.bin" ) then
            -- adjust aim angles
            if ( frame == 3281 ) then
                CVar.SetValue( "sc_st_disable_spread", "1" );
                CreateTimer( CVar.GetFloat( "sc_st_min_frametime" ), CVar.SetValue, "sc_st_disable_spread", "0" );

                Aimbot( cmd, true, false, false, false );
            end
        end
    end
    
    if ( filename == "c07a2_skip_v2.bin" ) then
        -- adjust aim angles
        if ( frame == 261 or frame == 839 or frame == 1003 ) then
            CVar.SetValue( "sc_st_disable_spread", "1" );
            CreateTimer( CVar.GetFloat( "sc_st_min_frametime" ), CVar.SetValue, "sc_st_disable_spread", "0" );

            Aimbot( cmd, true, false, false, false );

            local offset;

            if ( frame == 261 ) then
                offset = Vector( 0.1, 0.2, 0.0 );
            elseif ( frame == 839 ) then
                offset = Vector( -0.1, 0.0, 0.0 );
            else
                offset = Vector( -0.05, -3.0, 0.0 );
            end

            cmd.viewangles = cmd.viewangles + offset;
            SetViewAngles( cmd.viewangles );
        end
    end
end

-- function OnPlayEnd(filename, frames)
--     if ( filename == "c07a2_bunnyrun_new.bin" ) then
--         ClientCmd( "say dalboeb mode is on!! aware!!!" );
--         ClientCmd( "sc_st_timescale 0.15; sc_strafe 0; sc_strafe_vectorial 1; sc_strafe_yaw \"\"; sc_jumpbug_min_fall_velocity 999999" );

--         CreateTimer( 1.5, function()
--             local qees = GetPEntityFromEntityIndex( 2 );
--             local skopper = GetPEntityFromEntityIndex( 3 );

--             if ( qees ~= nil and skopper ~= nil ) then
--                 if ( qees.vars.netname ~= "QEES51" ) then
--                     local tmp = qees;

--                     qees = skopper;
--                     skopper = tmp;
--                 end

--                 SendCommandToClient( qees, "gibme" );
--             end
--         end );
--     end
-- end

function SpeedrunStart()
    start_time = SegmentCurrentTime();

    InitTriggers();

    -- InputManager.Record( "c07a2_start_new" );
    InputManager.Playback( "c07a2_start_new" );
    -- InputManager.Goto( 2000 );
    -- InputManager.Split();

    -- CreateTimer( 1.28, ClientCmd, ".tas_c07a2_spawnbot" );
    -- CreateTimer( 1.7, ClientCmd, ".tas_c07a2_startbot" );

    -- Everything was done frame-by-frame and then recorded via Input Manager

    -- ClientCmd( "sc_strafe 1; sc_strafe_dir 3; sc_strafe_vectorial 1; sc_strafe_ignore_ground 0; sc_strafe_yaw 76" );

    -- CreateTimer( 0.15, ClientCmd, "weapon_357" );
    -- CreateTimer( 0.278, ClientCmd, "+jump; wait; sc_strafe_ignore_ground 1" );
    -- CreateTimer( 0.5, ClientCmd, "sc_strafe_yaw 100" );
    -- CreateTimer( 1.52, ClientCmd, "sc_strafe_yaw 135" );
    -- CreateTimer( 1.85, ClientCmd, "sc_strafe_yaw 175" );
    -- CreateTimer( 2.18, ClientCmd, "sc_strafe 0; sc_aimbot 1; sc_st_disable_spread 1; +attack; wait; -attack; wait; sc_st_disable_spread 0; sc_aimbot 0; sc_strafe 1; setang 0 175" );
    -- CreateTimer( 2.2, ClientCmd, "weapon_shotgun" );
    -- CreateTimer( 2.35, ClientCmd, "sc_strafe_yaw -170" );
    -- CreateTimer( 3.1, ClientCmd, "sc_strafe_yaw -90" );
    -- CreateTimer( 3.39, ClientCmd, "+attack2; wait; -attack2" );
    -- CreateTimer( 3.645, ClientCmd, "sc_strafe_yaw 180" );
    -- CreateTimer( 4.55, ClientCmd, "sc_strafe_yaw -25; setang 40; sc_strafe_vectorial_snap 50; wait; sc_strafe_vectorial_snap 170" );
    -- CreateTimer( 5.05, ClientCmd, "sc_strafe_dir 0; sc_strafe_vectorial 0; sc_strafe_vectorial_increment 2" );
    -- CreateTimer( 5.1, ClientCmd, "weapon_357" );
    -- CreateTimer( 5.2, ClientCmd, "sc_strafe_dir 3; sc_strafe_vectorial 1; sc_strafe_yaw 170" );
    -- CreateTimer( 5.85, ClientCmd, "+duck" );
    -- CreateTimer( 5.95, ClientCmd, "-duck; sc_strafe_vectorial_increment 1; sc_strafe_yaw 130; -jump; +sc_ducktap" );
    -- CreateTimer( 6.35, ClientCmd, "sc_strafe_yaw -170; +jump; -sc_ducktap" );
    -- CreateTimer( 6.7, ClientCmd, "sc_strafe 0; sc_aimbot 1; sc_st_disable_spread 1; +attack; wait; -attack; wait; sc_st_disable_spread 0; sc_aimbot 0; sc_strafe 1; setang 40 -170" );
    -- CreateTimer( 6.7, ClientCmd, "sc_strafe_yaw -145" );
    -- CreateTimer( 7.2, ClientCmd, "weapon_medkit" );
    -- CreateTimer( 7.35, ClientCmd, "-jump; sc_strafe 0; setang 40 -90; +moveleft" );
    -- CreateTimer( 7.72, ClientCmd, "-moveleft; sc_im_stop" );
end

function OnGameFrame(state, frametime, postruncmd)
    if ( postruncmd and start_onground and ( PlayerMove.flags & FL_ONGROUND ) == FL_ONGROUND ) then
        -- StartShit();
        CreateTimer( 0.05, ClientCmd, "sc_im_play c07a2_skip_v2" );
        CreateTimer( 2.5, function() func_tank_state = -1 end );
        start_onground = false;
    end
end

function OnFilterAimbotTarget( entindex )
    PrintChatText( "Aimbot target: " .. entindex );

    if ( aim_skip_target_once and entindex == 243 ) then
        aim_skip_target_once = false;
        return false;
    end

    return true;
end

function OnSpecialSpawn( pPlayerEdict )
    printl( "OnSpecialSpawn()" );
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" has been revived at " .. tostring( pPlayerEdict.vars.origin ) );

    if ( pPlayerEdict.vars.netname == "Sw1ft" ) then
        pPlayerEdict.vars.origin = Vector( 1968.628174, -19.179653, 333.310822 );

        ClientCmd( "fps_max 200;wait;sc_im_play c7a2_postrevive;wait;weapon_crowbar" );
    end
end

--[[
function OnGameFrame(state, frametime, postruncmd)
    if ( postruncmd ) then
        local frame = InputManager.GetCurrentFrame();

        if ( frame == 4771 ) then
            local player = GetPEntityFromEntityIndex( 1 );

            if ( player ~= nil ) then
                player.vars.origin = Vector( -5324.795410156250, -3269.301025390625, -581.601196289063 );
                player.vars.velocity = Vector( 158.038757324219, 46.067436218262, 1287.923583984375 );
            end
        end
    elseif ( adjust_ques_position ) then
        local player = GetPEntityFromEntityIndex( ques_player_index );

        if ( player ~= nil ) then
            if ( player.vars.velocity:LengthSqr() == 0 ) then
                -- this is bullshit.. unfortunately QEES' position at boost spot sometimes is shifted
                player.vars.origin = Vector( -5327.921875, -3270.352051, -607.96875 );
                adjust_ques_position = false;

                PrintChatText( "Adjusted pos" );
            end
        else
            adjust_ques_position = false;
        end
    end
end
]]

function OnFireBulletsSpread(entity, entindex, spread_x, spread_y)
    -- printl( "x: " .. spread_x .. " | y: " .. spread_y );

    if ( func_tank_state == 0 ) then
        if ( entindex == 656 + ( gpGlobals.maxClients - 2 ) ) then
            local angle = RandomFloat( 0, math.pi / 2 );
            local spread_factor = RandomFloat( 0.9, 1.0 );

            spread_x = math.cos( angle ) * spread_factor;
            spread_y = math.sin( angle ) * spread_factor;
        end
    elseif ( func_tank_state == 1 ) then
        if ( entity.vars.classname == "func_tank" ) then
        -- if ( entindex == 177 ) then
        -- if ( entindex == 173 + ( gpGlobals.maxClients - 2 ) ) then
            local angle = RandomFloat( 0, 3 * math.pi / 4 );
            local spread_factor = RandomFloat( 0.9, 1.0 );

            if ( angle > math.pi / 2 ) then
                angle = 2 * math.pi - ( angle - math.pi / 2 );
            end

            spread_x = math.cos( angle ) * spread_factor;
            spread_y = math.sin( angle ) * spread_factor;
        end
    end

    return spread_x, spread_y;
end

function OnEntityTouch(entity, other)
    if ( entity ~= nil and entity.vars.model == "*273" and not spawns_trigger_activated ) then -- trigger_once activates multi_manager -> spawns3_mm
        -- spawns_state = 1;
        spawns_state = 2;
        func_tank_state = 1;
        spawns_trigger_activated = true;

        ClientCmd( "sc_st_timescale 0.25; sc_strafe 0; weapon_crowbar; gibme" );

        CreateTimer( 0.1, ClientCmd, "toggle_survival_mode; toggle_survival_mode" );

        -- respawn players
        -- CreateTimer( 0.05, function() -- next frame
        --     DisableSurvivalMode();

        --     spawns_state = 2;

        --     CreateTimer( 0.1, EnableSurvivalMode );
        --     -- CreateTimer( 1e-6, EnableSurvivalMode );

        --     StartTimer();
        -- end );
    end
end

function OnTouchTrigger(name)
    if ( name == "selfsink" ) then
        ClientCmd( "sc_selfsink2" );
    elseif ( name == "func_tank_disable_1" ) then
        func_tank_state = -1;
    elseif ( name == "fps200" ) then
        ClientCmd( "fps_max 200" );
    elseif ( name == "dalboeb_mode" ) then
        ClientCmd( "say dalboeb mode is on!! aware!!!" );
        ClientCmd( "weapon_357; setang 20 0; sc_st_timescale 0.15; sc_strafe 0; sc_strafe_vectorial 1; sc_strafe_yaw \"\"; sc_jumpbug_min_fall_velocity 999999" );

        CreateTimer( 1.5, function()
            local qees = GetPEntityFromEntityIndex( 2 );
            local skopper = GetPEntityFromEntityIndex( 3 );

            if ( qees ~= nil and skopper ~= nil ) then
                if ( qees.vars.netname ~= "QEES51" ) then
                    local tmp = qees;

                    qees = skopper;
                    skopper = tmp;
                end

                SendCommandToClient( qees, "gibme" );
            end
        end );
    end

    PrintChatText( "Touched trigger \"" .. name .. "\"" );
    return true;
end

function OnTouchServerTrigger(activator, name)
    if ( activator.vars.netname == "QEES51" ) then
        if ( name == "ques_triggur_bot" ) then
            CreateTimer( 1.4, ClientCmd, "sc_im_play c07a2_bunnyrun_new" );
        elseif ( name == "ques_triggur_vel" ) then
            adjust_ques_position = true;
        elseif ( name == "fastmedkit" ) then
            local qees = GetPEntityFromEntityIndex( 2 );
            local skopper = GetPEntityFromEntityIndex( 3 );

            if ( qees ~= nil and skopper ~= nil ) then
                if ( qees.vars.netname ~= "QEES51" ) then
                    local tmp = qees;

                    qees = skopper;
                    skopper = tmp;
                end

                SendCommandToClient( qees, "weapon_medkit" );
                SendCommandToClient( skopper, "kill" );

                SendSignalToClient( qees, 1 );
            end
        elseif ( name == "disconnect" ) then
            local qees = GetPEntityFromEntityIndex( 2 );
            local skopper = GetPEntityFromEntityIndex( 3 );

            if ( qees ~= nil and skopper ~= nil ) then
                if ( qees.vars.netname ~= "QEES51" ) then
                    local tmp = qees;

                    qees = skopper;
                    skopper = tmp;
                end

                -- SendCommandToClient( skopper, "disconnect" );
                SendCommandToClient( skopper, "say V SPEKI" );
            end
        end

        PrintChatText( string.format( "Player %s touched trigger \"%s\"", activator.vars.netname, name ) );

        return true;
    end

    return false;
end

function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
    printl( "OnPlayerSpawn()" );
    
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) );
    
    local sPlayerName = pPlayerEdict.vars.netname;
    
    if ( spawns_state == 0 ) then
        if ( sPlayerName == "Sw1ft" ) then
            pPlayerEdict.vars.origin = Vector( 2913.000000, 2256.000000, -199.000000 );
        elseif ( sPlayerName == "QEES51" ) then
            pPlayerEdict.vars.origin = Vector( 2849.000000, 2256.000000, -199.000000 );
        elseif ( sPlayerName == "BotSkipper" ) then
            pPlayerEdict.vars.origin = Vector( 2913.000000, 2256.000000, -199.000000 );
        end
    elseif ( spawns_state == 2 ) then
        if ( sPlayerName == "Sw1ft" ) then
            pPlayerEdict.vars.origin = Vector( 244.000000, -1940.000000, 337.000000 );
            pPlayerEdict.vars.angles = Vector( 0.000000, 0.000000, 0.000000 );
            start_onground = true;
        elseif ( sPlayerName == "QEES51" ) then
            pPlayerEdict.vars.origin = Vector( 244.000000, -2284.000000, 337.000000 );
            pPlayerEdict.vars.angles = Vector( 0.000000, 0.000000, 0.000000 );
        elseif ( sPlayerName == "BotSkipper" ) then
            pPlayerEdict.vars.origin = Vector( 244.000000, -2236.000000, 337.000000 );
            pPlayerEdict.vars.angles = Vector( 0.000000, 0.000000, 0.000000 );
        end
    end
end

function PrintTime()
    PrintChatText( string.format( "%.3f (%d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

SpeedrunInit();

printl( "Executed c07_a2" );
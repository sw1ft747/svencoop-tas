start_time = 0;
spawns_state = 0;
forced_revives = 2;
skopper_revived = false;

RemoveAllTimers();

function InitTriggers()
    CreateTrigger("post_elevskip_skopper", Vector(2207.125, -830.281, -511.969), Vector(0, 0, 0), Vector(278.844, 85.031, 97.875));
    CreateTrigger("pre_doorskip_skopper", Vector(890.781, -1017.094, -564.625), Vector(0, 0, 0), Vector(144.469, 250.125, 93.344));
    CreateServerTrigger("post_ceilclip_qees", Vector(12.469, -710.656, -240.594), Vector(0, 0, 0), Vector(250.406, 165.656, 113.844));
end

function SpeedrunInit()
    SetTimescale( 0.25 );

    EnableSurvivalMode();

    ClientCmd( "sc_st_setangles_stop; sc_st_setangles2_stop; sc_st_follow_point_stop; -jump; -duck; -attack; -moveleft; -right; -moveright; -sc_ducktap; sc_aimbot_scripts_filter_targets 1" );
    ClientCmd( "sc_strafe 0; sc_strafe_dir 3; sc_strafe_ignore_ground 1; sc_strafe_vectorial 1; sc_strafe_vectorial_increment 1; sc_strafe_vectorial_snap 170; sc_aimbot 0; sc_st_disable_spread 0; sc_jumpbug_min_fall_velocity 580" );
    ClientCmd( "clockwindow 0; cl_smoothtime 0; mp_respawndelay 0; mp_classic_mode 1; fps_max 200; sc_jumpbug_min_fall_velocity 580; sc_st_legit_mode_ignore_freeze 1; sc_aimbot_change_angles_back 1" );
end

function SpeedrunStart()
    start_time = SegmentCurrentTime();

    InitTriggers();

    ClientCmd( "weapon_medkit" );

    CreateTimer( 0.5, ClientCmd, "toggle_survival_mode; toggle_survival_mode" );
end

function OnTouchTrigger(name)
    if ( name == "post_elevskip_skopper" ) then
        CreateTimer( 0.1, ClientCmd, "sc_im_play c03_elevskip_skopper" );
    elseif ( name == "pre_doorskip_skopper" ) then
        SendCommandToClientByName( "QEES51", "sc_freeze2; sc_im_stop" );
    end

    PrintChatText( "Touched trigger \"" .. name .. "\"" );
    return true;
end

function OnTouchServerTrigger(activator, name)
    if ( activator.vars.netname == "QEES51" ) then
        if ( name == "post_ceilclip_qees" ) then
            spawns_state = 1;
        end

        PrintChatText( string.format( "Player %s touched trigger \"%s\"", activator.vars.netname, name ) );

        return true;
    end

    return false;
end

function OnFilterAimbotTarget( entindex )
    PrintChatText( "Aimbot target: " .. entindex );

    if ( entindex == 1168 ) then
    -- if ( entindex == 1166 ) then
        return false;
    end

    return true;
end

function OnPlayInput(filename, frame, cmd)
    if ( ( cmd.buttons & IN_ATTACK ) == IN_ATTACK ) then
        if ( filename == "c03_elevskip_skopper.bin" ) then
            -- if ( ( cmd.buttons & IN_ATTACK ) == IN_ATTACK ) then
            --     ClientCmd( "say IN_ATTACK frame: " .. tostring( frame ) );
            -- end

            if ( frame ~= 442 ) then
                -- CVar.SetValue( "sc_st_disable_spread", "1" );
                -- CreateTimer( CVar.GetFloat( "sc_st_min_frametime" ), CVar.SetValue, "sc_st_disable_spread", "0" );

                Aimbot( cmd, true, false, false, false );
            end
        end
    end
end

function OnClientSignal( pPlayerEdict, value )
    printl( "OnClientSignal( " .. pPlayerEdict.vars.netname .. ", " .. value .. " )" );

    if ( pPlayerEdict.vars.netname == "QEES51" and value == 0 ) then
        SendCommandToClientByName( "Sw1ft", "+attack2; wait; -attack2" );
        SendCommandToClientByName( "iMicro", "+attack2; wait; -attack2" );

        CreateTimer( 0.15, function()
            ClientCmd( "unstuck" );
        end );

        -- CreateTimer( 0.35, function()
        --     local qees = GetPEntityFromPlayerName( "QEES51" );
        --     if ( qees ~= nil ) then
        --         SendCommandToClient( qees, "unstuck" );
        --     end
        -- end );
    end
end

function OnClientKill( pPlayerEdict )
    printl( "OnClientKill( " .. tostring( pPlayerEdict.vars.netname ) .. " )" );

    if ( pPlayerEdict.vars.netname == "BotSkipper" ) then
        if ( not skopper_revived ) then
            -- ClientCmd( "fps_max 200" );

            -- CreateTimer( 0.75, ClientCmd, "fps_max 20; +attack2" );
            -- CreateTimer( 1.15, ClientCmd, "fps_max 200; -attack2" );

            CreateTimer( 1.15, function()
                SendCommandToClientByName( "QEES51", "sc_freeze2" );
                CreateTimer( 0.1, SendCommandToClientByName, "QEES51", "weapon_medkit" );
            end );

            for t = 0.8, 0.0, -0.1 do
                CreateTimer( t, ClientCmd, string.format( "say Observer mode in %.1f seconds", 0.8 - t ) );
            end
        end
    elseif ( pPlayerEdict.vars.netname == "QEES51" and spawns_state == 1 ) then
        -- ClientCmd( "fps_max 200" );

        SendCommandToClientByName( "QEES51", "sc_im_stop; wait; +attack2" );

        -- CreateTimer( 0.75, ClientCmd, "fps_max 20" );
        -- CreateTimer( 1.15, ClientCmd, "fps_max 200" );

        CreateTimer( 1.15, function()
            SendCommandToClientByName( "QEES51", "-attack2" );
        end );

        spawns_state = 2;

        for t = 0.8, 0.0, -0.1 do
            CreateTimer( t, ClientCmd, string.format( "say Observer mode in %.1f seconds", 0.8 - t ) );
        end
    end
end

function OnFireTargets( targetname, activator, caller, usetype, value, delay )
    if ( targetname == "spawns_mm" ) then
        ClientCmd( "toggle_survival_mode; toggle_survival_mode" );
    end

    -- printl( "OnFireTargets :: " .. targetname .. " : " .. value .. " : " .. delay );
end

function OnSpecialSpawn( pPlayerEdict )
    printl( "OnSpecialSpawn()" );
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" has been revived at " .. tostring( pPlayerEdict.vars.origin ) );

    if ( forced_revives == 0 ) then
        return;
    end

    if ( pPlayerEdict.vars.netname == "QEES51" and spawns_state ~= 2 ) then
        pPlayerEdict.vars.origin = Vector( 109.687500, -645.750000, -233.720001 );
    elseif ( pPlayerEdict.vars.netname == "BotSkipper" and not skopper_revived ) then
        pPlayerEdict.vars.origin = Vector( 863.513123, -804.394958, -540.606018 );
        ClientCmd( "sc_strafe 1" );

        skopper_revived = true;
    end

    forced_revives = forced_revives - 1;
end

function OnPlayerUnstuck( pPlayerEdict )
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" unstucked at " .. tostring( pPlayerEdict.vars.origin ) );

    if ( pPlayerEdict.vars.netname == "BotSkipper" ) then
        pPlayerEdict.vars.origin = Vector( 2290.625000, -818.125000, -533.033857 );
    elseif ( pPlayerEdict.vars.netname == "QEES51" ) then
        pPlayerEdict.vars.origin = Vector( 2337.625000, -814.062500, -537.180355 );
    end
end

function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
    printl( "OnPlayerSpawn()" );
    
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) );
    
    local sPlayerName = pPlayerEdict.vars.netname;
    
    if ( spawns_state == 0 ) then
        if ( sPlayerName == "Sw1ft" ) then
            pPlayerEdict.vars.origin = Vector( 2288, -1060, -535 );
            pPlayerEdict.vars.angles = Vector( 0, 90, 0 );
        elseif ( sPlayerName == "QEES51" ) then
            pPlayerEdict.vars.origin = Vector( 2400, -1060, -535 );
            pPlayerEdict.vars.angles = Vector( 0, 90, 0 );
        elseif ( sPlayerName == "BotSkipper" ) then
            pPlayerEdict.vars.origin = Vector( 2240, -1060, -535 );
            pPlayerEdict.vars.angles = Vector( 0, 90, 0 );
        elseif ( sPlayerName == "iMicro" ) then
            pPlayerEdict.vars.origin = Vector( 2352, -1060, -535 );
            pPlayerEdict.vars.angles = Vector( 0, 90, 0 );
        end
    elseif ( spawns_state == 1 ) then
        if ( sPlayerName == "Sw1ft" ) then
            pPlayerEdict.vars.origin = Vector( 177, 361, 109 );
            pPlayerEdict.vars.angles = Vector( 0, -90, 0 );
        elseif ( sPlayerName == "BotSkipper" ) then
            pPlayerEdict.vars.origin = Vector( 272, 361, 109 );
            pPlayerEdict.vars.angles = Vector( 0, -90, 0 );
        elseif ( sPlayerName == "iMicro" ) then
            -- pPlayerEdict.vars.origin = Vector( -64, 641, 108 );
            pPlayerEdict.vars.origin = Vector( 272, 361, 109 );
            pPlayerEdict.vars.angles = Vector( 0, -90, 0 );
        end
    end
end

function SendCommandToClientByName( sPlayerName, sCommand )
    local pPlayer = GetPEntityFromPlayerName( sPlayerName );
    if ( pPlayer ~= nil ) then
        SendCommandToClient( pPlayer, sCommand );
    end
end

function PrintTime()
    PrintChatText( string.format( "%.3f (%d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

SpeedrunInit();

printl( "Executed c03_skopper" );
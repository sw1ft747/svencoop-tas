-- c05_a3 TAS? script

start_time = 0.0;
activated_level_change = false;

function InitTriggers()
    ClearTriggers();
    ClearServerTriggers();
end

function SpeedrunInit()
    EnableSurvivalMode();

    ClearTriggers();
    ClearServerTriggers();

    ClientCmd( "sv_cheats 0; wait; sc_script \"SetTimescale(0.1)\"" );
    ClientCmd( "-jump; -duck; -attack; -forward; -back; -sc_ducktap; sc_strafe 0; sc_strafe_dir 3; sc_strafe_ignore_ground 1; sc_strafe_vectorial_increment 1; sc_jumpbug_min_fall_velocity 99999" );
    ClientCmd( "sc_im_goto_exact 1; sc_im_exact 0; clockwindow 0; cl_smoothtime 0; mp_respawndelay 0; mp_classic_mode 1; fps_max 200" );
end

function SpeedrunStart()
    start_time = SegmentCurrentTime();

    InitTriggers();
    -- DisableSurvivalMode();

    CreateTimer( 1e-6, ClientCmd, "weapon_crowbar" );
    ClientCmd( "sc_strafe 1; sc_strafe_vectorial 1; sc_strafe_ignore_ground 0" );
    ClientCmd( "sc_strafe_dir 4; sc_strafe_point_x -1817.468750; sc_strafe_point_y 40.093750" );

    CreateTimer( 0.3, ClientCmd, "sc_strafe 0; sc_strafe_ignore_ground 1; sc_selfsink2" ); -- 0.25
    CreateTimer( 0.37, ClientCmd, "sc_st_setangles 0 90 50" );

    CreateTimer( 0.44, ClientCmd, ".tas_c05a3_spawnbot" );
    CreateTimer( 0.65, ClientCmd, ".tas_c05a3_setviewangles 20 -75; .tas_c05a3_moveforward; .tas_c05a3_drawmedkit" );
    CreateTimer( 0.95, ClientCmd, ".tas_c05a3_setbuttons 2048" );
    CreateTimer( 1.1, ClientCmd, ".tas_c05a3_moveforward 0" );
    CreateTimer( 1.12, ClientCmd, ".tas_c05a3_setviewangles 89 -50; .tas_c05a3_setbuttons 2052" );

    CreateTimer( 0.5, DisableSurvivalMode );
    CreateTimer( 0.5, EnableSurvivalMode );
end

function OnPlayInput(filename, frame, cmd)
    if ( frame == 2992 ) then
        -- no way to overcome this shit toxic water awqetfruytewtvf
        CVar.SetValue( "sc_im_exact", 1 );
    elseif ( frame == 3482 ) then
        if ( CVar.GetInteger("sc_im_exact") == 1) then
            ClientCmd( "sc_im_exact 0; sc_im_goto_exact 0; sc_im_goto 3482" );
        end
        -- CVar.SetValue( "sc_im_exact", 0 );
        -- ClientCmd( "sc_strafe 0" );
        -- CreateTimer( 1e-6, function()
        --     activated_level_change = false;
        --     ClientCmd( "sc_im_goto 3480; sc_im_stop" );
        --     ClientCmd( "sc_strafe_vectorial_increment 1; sc_strafe 1; sc_strafe_type 0; sc_strafe_dir 3; sc_strafe_yaw 49.5; +jump" );
        --     CreateTimer( 0.25, ClientCmd, "+duck; sc_strafe_yaw 0; sc_strafe_vectorial_increment 2; sc_strafe_type 0" );
        --     CreateTimer( 0.285, ClientCmd, "-duck" );
        --     CreateTimer( 0.32, ClientCmd, "sc_strafe_yaw -90; sc_strafe_type 3" );
        --     CreateTimer( 0.78, ClientCmd, "sc_strafe_yaw 0; sc_strafe_type 3" );
        --     CreateTimer( 0.9825, ClientCmd, "+duck" );
        --     CreateTimer( 0.99, ClientCmd, "-duck" );
        --     CreateTimer( 1.15, ClientCmd, "sc_strafe_vectorial_increment 1; sc_strafe_type 0; sc_strafe_yaw 15; -jump; +sc_ducktap" );
        --     CreateTimer( 1.75, ClientCmd, "sc_strafe_yaw -90; +jump; -sc_ducktap" );
        --     CreateTimer( 3.1, ClientCmd, "sc_strafe 0; -jump; +back" );
        --     CreateTimer( 3.32, ClientCmd, "-back" );
        --     CreateTimer( 4.1, ClientCmd, "sc_jumpbug 0; sc_jumpbug_legit 1; sc_jumpbug_min_fall_velocity 580" );
        --     CreateTimer( 4.15, ClientCmd, "fps_max 1000" );
        --     CreateTimer( 4.17, ClientCmd, "fps_max 200" );
        --     CreateTimer( 4.25, function()
        --         activated_level_change = true;
        --         ClientCmd( "sc_strafe 1; sc_strafe_yaw 62; +jump" );
        --         ClientCmd( "takecover" );
        --     end );
        --     CreateTimer( 4.8, ClientCmd, "sc_strafe_yaw 95" );
        --     CreateTimer( 5.02, ClientCmd, "sc_strafe_dir 0; sc_strafe_type 3" );
        --     CreateTimer( 5.9, ClientCmd, "sc_strafe_dir 3; sc_strafe_type 0; sc_strafe_yaw 140; sc_st_setangles 20 140 50" );
        -- end );
    end
end

function OnGameFrame(state, frametime, postruncmd)
    if ( not postruncmd and activated_level_change ) then
        local mrCrabs = GetPEntityFromEntityIndex( 189 );

        if ( mrCrabs ~= nil and mrCrabs.vars ~= nil ) then
            LookAt( mrCrabs.vars.origin );
        end

        -- LookAt( Vector( 2447, -926, -2428 ) );
    end
end

function OnEntityTouch(entity, other)
    if ( entity ~= nil and entity.vars.model == "*177" ) then -- trigger_once activates trigger_changelevel in 2 sec
        for t = 2.0, 0.0, -0.2 do -- цикл от 10 до 1 с шагом -1
            CreateTimer( t, ClientCmd, string.format( "say Level change in %.1f seconds", 2.0 - t ) );
        end
    end
end

function OnClientKill( pPlayerEdict )
    printl( "OnClientKill( " .. tostring( pPlayerEdict.vars.netname ) .. " )" );

    ClientCmd( "+back" );
    CreateTimer( 0.825, ClientCmd, "fps_max 20" );
    CreateTimer( 1.0, ClientCmd, "-back" );
    CreateTimer( 1.0, ClientCmd, "setang 89 90; +forward" );
    CreateTimer( 1.3, ClientCmd, "setang 0 90" );
    CreateTimer( 1.75, ClientCmd, "-forward; sc_st_setangles 20 -42 12" );
    CreateTimer( 2.7, ClientCmd, "fps_max 200" );
    CreateTimer( 2.3, ClientCmd, "sc_st_setangles_stop; setang 20 -42" );
end

function OnSpecialSpawn( pPlayerEdict )
    printl( "OnSpecialSpawn()" );
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" has been revived at " .. tostring( pPlayerEdict.vars.origin ) );

    CreateTimer( 0.333, ClientCmd, ".tas_c05a3_setbuttons 0; .tas_c05a3_suicide" );

    pPlayerEdict.vars.origin = Vector( -1797.632935, 4.815926, 1750.961060 ); -- vrode norm

    ClientCmd( "wait;sc_im_play c05a3_postrevive;wait;weapon_crowbar" );
end

function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
    printl( "OnPlayerSpawn()" );
    
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) );
    
    -- local sPlayerName = pPlayerEdict.vars.netname;
    
    pPlayerEdict.vars.origin = Vector( -1856.000000, 160.000000, 1877.000000 );

    -- pPlayerEdict.vars.origin = Vector( -1856.000000, 160.000000, 1877.000000 );
end

function PrintTime()
    PrintChatText( string.format( "%.3f (IM frames: %d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

SpeedrunInit();

printl( "Executed c05_a3" );
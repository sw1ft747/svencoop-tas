zalypa = 0
connected = false;
spawned = false;
start_time = 0.0;


function SpeedrunInit()
    SetTimescale( 0.05 );

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

    --InputManager.Record( "c04_run" );
    InputManager.Playback( "c04_run" );

    CreateTimer( 0.29, EnableSurvivalMode );
    CreateTimer( 0.37, DisableSurvivalMode );

    ClientCmd("sc_strafe 1; sc_strafe_yaw 30; sc_strafe_ignore_ground 0");
    ClientCmd("weapon_9mmhandgun");
    --[[CreateTimer(0.280, ClientCmd,"sc_strafe_yaw -39");
    CreateTimer(0.270, ClientCmd,"kill");
    CreateTimer(0.400, ClientCmd,"sc_st_setangles 0 -90 50");
    CreateTimer(0.400, ClientCmd,"weapon_9mmhandgun");
    CreateTimer(0.900, ClientCmd,"+jump");
    CreateTimer(0.900, ClientCmd,"sc_strafe_yaw -83");]]
    CreateTimer( 1.400, EnableSurvivalMode );
    --[[CreateTimer(1.50, ClientCmd,"sc_strafe_yaw 0");
    CreateTimer(1.505, ClientCmd,"+sc_ducktap");
    CreateTimer(1.510, ClientCmd,"-jump");
    CreateTimer(1.500, ClientCmd,"sc_st_setangles 0 0 40");
    CreateTimer(1.800, ClientCmd,"+duck");
    CreateTimer(2.100, ClientCmd,"-duck");
    CreateTimer(2.105, ClientCmd,"-sc_ducktap");
    CreateTimer(2.050, ClientCmd,"kill");]]
    -- CreateTimer(2.260, ClientCmd,"fps_max 20");
    -- CreateTimer(3.120, ClientCmd,"fps_max 200");
    CreateTimer(3.120, ClientCmd,"sc_strafe_yaw \"\"");


    


end

function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
    printl( "OnPlayerSpawn()" );
    
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) );
    
  
    local sPlayerName = pPlayerEdict.vars.netname;
        
    if ( sPlayerName == "QEES51" ) then
        if(zalypa == 0) then
            pPlayerEdict.vars.origin = Vector( 63.000000, 1465.000000, 45.000000 );
            zalypa = 1
        else
            pPlayerEdict.vars.origin = Vector( 63.000000, 1568.000000, 45.000000 ); 
            zalypa = 2;
        end
    elseif ( sPlayerName == "Sw1ft" ) then
        pPlayerEdict.vars.origin = Vector( 8.000000, 1568.000000, 45.000000 );
        pPlayerEdict.vars.angles = Vector( 0.000000, 0.000000, 0.000000 );
    elseif ( sPlayerName == "BotSkipper" ) then
        pPlayerEdict.vars.origin = Vector( 8.000000, 1465.000000, 45.000000 );
        pPlayerEdict.vars.angles = Vector( 0.000000, 0.000000, 0.000000 );
    end
end


function OnClientKill( pPlayerEdict )
    printl( "OnClientKill( " .. tostring( pPlayerEdict.vars.netname ) .. " )" );

    if ( pPlayerEdict.vars.netname == "QEES51" and zalypa == 2 ) then
        -- SendCommandToClientByName( "Sw1ft", "sc_freeze2" );

        CreateTimer( 0.75, ClientCmd, "fps_max 20; +attack2" );
        CreateTimer( 1.0, ClientCmd, "fps_max 200; -attack2" );

        CreateTimer( 1.0, function()
            CVar.SetValue( "sc_strafe_yaw", "" );
            SendCommandToClientByName( "Sw1ft23", "sc_freeze2; wait; weapon_medkit" );
            -- CreateTimer( 0.1, SendCommandToClientByName, "Sw1ft", "weapon_medkit" );
        end );

        for t = 0.8, 0.0, -0.1 do
            CreateTimer( t, ClientCmd, string.format( "say Observer mode in %.1f seconds", 0.8 - t ) );
        end
    end
end

function OnSpecialSpawn( pPlayerEdict )
    printl( "OnSpecialSpawn()" );
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" has been revived at " .. tostring( pPlayerEdict.vars.origin ) );

    if ( pPlayerEdict.vars.netname == "QEES51" ) then
        pPlayerEdict.vars.origin = Vector( 533.156250, 1124.531250, 39.190222 );
    end
end

function OnBeginPlayerRevive( pPlayerEdict )
    printl( "OnBeginPlayerRevive( " .. tostring( pPlayerEdict.vars.netname ) .. " )" );

    if ( pPlayerEdict.vars.netname == "BotSkipper" ) then
        SendCommandToClientByName( "Sw1ft", "weapon_crowbar" );
    end
end

function SendCommandToClientByName( sPlayerName, sCommand )
    local pPlayer = GetPEntityFromPlayerName( sPlayerName );
    if ( pPlayer ~= nil ) then
        SendCommandToClient( pPlayer, sCommand );
    end
end

function PrintTime()
    PrintChatText( string.format( "%.3f (IM frames: %d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end


SpeedrunInit();
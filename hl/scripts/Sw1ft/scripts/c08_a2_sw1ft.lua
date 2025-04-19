connected = false;
spawned = false;
start_time = 0.0;

function SpeedrunInit()
    -- SetTimescale( 0.1 );

    RemoveAllTimers();
    RemoveAllTimers();

    ClientCmd("sc_jumpbug 0; sc_st_disable_spread 0; default_fov 85; -sc_ducktap; -jump; -duck; -forward; -back; -moveleft; -moveright; sc_strafe 0; sc_strafe_yaw \"\"; sc_strafe_ignore_ground 1; -attack; sc_im_stop");
    ClientCmd("sc_strafe_type 0; sc_strafe_dir 3; sc_st_setangles_stop; sc_ducktap_adjust_fps 0; sc_autojump_inconsistent 0; sc_strafe_vectorial_increment 1; fps_max 200; mp_classic_mode 1; clockwindow 0");
end

function InitTriggers()
    ClearTriggers();
    ClearServerTriggers();

    CreateTrigger("rightspawn", Vector(150.000, 27.969, 1976.156), Vector(0, 0, -79.969), Vector(127.281, 101.438, 0));
end

function OnPlayInput(filename, frame, cmd)
    if ( filename == "c08_a2_new_sw1ft2.bin" ) then
        if ( frame >= 2575 and ( cmd.buttons & IN_ATTACK ) == IN_ATTACK ) then
            Aimbot( cmd, true, false, false, false );
        end
    end
end

function OnBeginLoading()
    printl( "OnBeginLoading()" );
    SpeedrunInit();
end

function SpeedrunStart()
    InitTriggers();
    
    -- connected = true;

    if ( IsListenServer() ) then
        for i = 380, 400 do
            local pEntity = GetPEntityFromEntityIndex( i );

            if ( pEntity ~= nil and pEntity.vars.model == "*183" ) then
                pEntity.vars.flags = pEntity.vars.flags | FL_KILLME;
            end
        end
    end

    start_time = SegmentCurrentTime();

    -- ClientCmd("sc_im_record c08_a2_new_sw1ft2");
    -- ClientCmd("sc_im_play c08_a2_new_sw1ft2");
    CreateTimer( 0.0, ClientCmd, "sc_im_play c08_a2_new_sw1ft2" );

    -- ClientCmd( "weapon_crossbow; sc_strafe 1" );
    -- CreateTimer( 0.2, ClientCmd, "sc_im_goto 2000" );
    -- CreateTimer( 0.2, ClientCmd, "sc_strafe 1" );
end


function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );

	if (name == "rightspawn") then
		ClientCmd("weapon_crossbow");
		CreateTimer(0.11, ClientCmd,"sc_im_play c8a2_new_sw1ft_mid");

        -- CreateTimer( 0.1, function()
        --     start_time = SegmentCurrentTime();
        --     -- ClientCmd( "sc_im_play c8a2_new_sw1ft_mid; weapon_crossbow" );
        --     -- ClientCmd( "sc_im_record c8a2_new_sw1ft_mid" );
        --     ClientCmd( "weapon_crossbow; setang 10 -172; sc_strafe 1; sc_strafe_ignore_ground 0; sc_strafe_yaw -172" );
        --     CreateTimer( 0.215, ClientCmd, "+duck; wait; -duck; wait; sc_strafe_ignore_ground 1" );
        --     CreateTimer( 0.78, ClientCmd, "+duck; +jump" );
        --     CreateTimer( 0.97, ClientCmd, "sc_strafe 0; setang 30 8; +attack; wait; -attack; wait; sc_strafe 1; setang 10 -172; wait; -duck" );
        --     CreateTimer( 1.47, ClientCmd, "+duck" );
        --     CreateTimer( 1.5, ClientCmd, "-duck" );
        --     CreateTimer( 1.82, ClientCmd, "sc_strafe_yaw -88" );
        --     CreateTimer( 2.9, ClientCmd, "sc_strafe_yaw -90" );
        --     CreateTimer( 3.1, ClientCmd, "sc_strafe_yaw -96" );
        --     CreateTimer( 3.28, ClientCmd, "sc_st_setangles 35 -96 100" );
        --     CreateTimer( 3.24, ClientCmd, "+attack;wait;-attack" );
        --     CreateTimer( 3.73, ClientCmd, "sc_strafe_yaw -175" );
        -- end );
    end

    return true;
end	

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
        -- pPlayerEdict.vars.origin = Vector( 206, 72, 1905 );
        -- pPlayerEdict.vars.angles = Vector( 0.000000, 180.000000, 0.000000 );
    elseif ( sPlayerName == "kolokola777" ) then
        pPlayerEdict.vars.origin = Vector( 3521.000000, 621.000000, 2069.000000 );
        pPlayerEdict.vars.angles = Vector( 0.000000, -90.000000, 0.000000 );
    end
end

function PrintTime()
    PrintChatText( string.format( "%.3f (IM frames: %d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

SpeedrunInit();


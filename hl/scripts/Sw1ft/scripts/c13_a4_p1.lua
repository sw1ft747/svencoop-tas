p1 = "Sw1ft"; -- obsclip to green room | host
p2 = "void"; -- obsclip near to green room to revive p1
p3 = "QEES51"; -- crouch to let players reach the ceil, revive p2 after their obsclip
p4 = "BotSkipper"; -- suicide in the ceil for obsclip

start_time = 0;
spawns_state = 0;
freeze_sync_tact = 0;
fix_govno = false;

IncludeScript( "pb" );

function InitTriggers()
    ClearTriggers();
    ClearServerTriggers();

    CreateTrigger( "pre_wall_skip", Vector(257.375, -1205.375, -355.000), Vector(0, 0, 0), Vector(135.812, 98.781, 72.625) );
    CreateServerTrigger( "p1_wall_clip", Vector(1003.719, 103.594, -282.812), Vector(0, 0, 0), Vector(471.469, 347.000, 318.156) );
    CreateServerTrigger( "p2_wall_clip", Vector(1003.719, 103.594, -282.812), Vector(0, 0, 0), Vector(471.469, 347.000, 318.156) );
    CreateServerTrigger( "p3_auto_ceil_clip", Vector(1061.781, -114.781, -143.219), Vector(0, 0, 0), Vector(154.469, 103.125, 39.906) );
end

function OnRestart()
    pb_save();
end

function SpeedrunInit()
    CVar.SetValue( "fps_max", 500 );

    SetTimescale( 0.1 );

    ClientCmd("sc_strafe_yaw \"\"; sc_strafe_type 0; sc_strafe 0; sc_strafe_dir 3; sc_st_setangles_stop; -jump; -duck; -forward; -back; -moveleft; -moveright; -tau");
    ClientCmd("fps_max 500; clockwindow 0; mp_classic_mode 1; sc_strafe_vectorial_increment 0; sc_strafe_ignore_ground 1; sc_st_legit_mode_ignore_freeze 1");

    pb_register( "p1_wall_clip_pb" );
    pb_register( "p2_wall_clip_pb" );

    pb_load();
end

function SpeedrunStart()
    start_time = SegmentCurrentTime();

    InitTriggers();
    DrawVisualHints();

    if ( spawns_state == 0 ) then
        InputManager.Playback( "c13_a4" );
        ClientCmd("use weapon_gauss");

        CreateTimer( 3.986, ClientCmd, "weapon_crowbar" );
    end
end

function OnTouchTrigger( name )
	printl( "Touched trigger: \"" .. name .. "\"" );

	if ( name == "pre_wall_skip" ) then
		ClientCmd( "toggle_survival_mode; wait; toggle_survival_mode" );
        CreateTimer( 0.1, SendCommandToClientByName, p3, "gibme; wait; +attack2" );
        CreateTimer( 0.1, SendCommandToClientByName, p2, "gibme; wait; +attack2" );
        CreateTimer( 1.1, SendCommandToClientByName, p3, "-attack2" );
        CreateTimer( 1.1, SendCommandToClientByName, p2, "-attack2" );
    end

    return true;
end

function OnTouchServerTrigger( activator, name )
    if ( activator.vars.deadflag ~= 0 or activator.vars.iuser1 ~= 0 ) then
        return false;
    end

    local playername = activator.vars.netname;

	if ( playername == p1 ) then
        if ( name == "p1_wall_clip" ) then
            pb_check( "p1_wall_clip_pb", SegmentCurrentTime(), "Player \"" .. p1 .. "\" wall clip" );
            return true;
        end
    elseif ( playername == p2 ) then
        if ( name == "p2_wall_clip" ) then
            pb_check( "p2_wall_clip_pb", SegmentCurrentTime(), "Player \"" .. p2 .. "\" wall clip" );
            return true;
        end
    elseif ( playername == p3 and name == "p3_auto_ceil_clip" ) then
        SendCommandToClient( activator, "sc_auto_ceil_clipping" );
        CreateTimer( 5.0, SendCommandToClient, activator, "sc_auto_ceil_clipping" );
        return true;
    end

    return false;
end

function OnFireTargets( targetname, activator, caller, usetype, value, delay )
    if ( targetname == "spawn3_mm" ) then
        ClientCmd( "toggle_survival_mode; toggle_survival_mode" );
        spawns_state = 1;
    end
end

function OnClientSignal( pPlayer, value )
    printl( "OnClientSignal( " .. pPlayer.vars.netname .. ", " .. value .. " )" );

    if ( pPlayer.vars.netname == p3 and value == 0 ) then
        ClientCmd( "say UNFREEZE || SUCCESS P3 FREEZE SYNC" );
    end
end

function OnGameFrame(state, frametime, postruncmd)
    if ( postruncmd ) then
        if ( UTIL_IsPointInsideAABB( PlayerMove.origin,
                                    Vector(1069.781, -18.094, -153.219),
                                    Vector(1069.781, -18.094, -153.219) + Vector(151.094, 124.938, 26.188) ) and spawns_state ~= 0 ) then
            local origin = PlayerMove.origin;
            local velocity = PlayerMove.velocity;

            for i = 1, 2 do
                velocity.z = velocity.z - ( 800.0 * 0.5 * frametime ); -- UTIL_AddCorrectGravity

                local move = velocity * frametime;
                local traceResult = {};

                TraceHull( traceResult, origin, origin + move, PM_NORMAL, PM_HULL_PLAYER, -1 );

                origin = traceResult.endpos;

                if ( traceResult.fraction ~= 1.0 and not traceResult.allsolid and traceResult.plane.normal.y == -1.0 ) then
					ClientCmd( "kill" );
                    break;
                end

                velocity.z = velocity.z - ( 800.0 * frametime * 0.5 ); -- UTIL_FixupGravityVelocity
            end
        end

        local pFreezeSyncTarget = GetPEntityFromPlayerName( p3 );
        if ( pFreezeSyncTarget == nil ) then
            return;
        end

        for i = 1, 4 do
            local pPlayer = GetPEntityFromEntityIndex( i );
            if ( pPlayer ~= nil ) then
                if ( freeze_sync_tact == 0 and pPlayer.vars.netname == p1 and pPlayer.vars.velocity:Length() >= 3400.0 ) then
                    SendCommandToClient( pFreezeSyncTarget, "sc_freeze2" ); -- freeze
                    SendSignalToClient( pFreezeSyncTarget, 0 );
                    freeze_sync_tact = 1;
                    break;
                elseif ( freeze_sync_tact == 1 and pPlayer.vars.netname == p2 and pPlayer.vars.velocity:Length() >= 1800.0 ) then
                    SendCommandToClient( pFreezeSyncTarget, "sc_freeze2" ); -- freeze
                    SendSignalToClient( pFreezeSyncTarget, 0 );
                    freeze_sync_tact = 2;
                    break;
                end
            end
        end
    end
end

function OnClientKill( pPlayer )
    if ( pPlayer.vars.netname == p1 ) then
        if ( fix_govno ) then
            return;
        end

        CreateTimer( 0.75, ClientCmd, "fps_max 20; +attack2" );
        CreateTimer( 1.0, ClientCmd, "fps_max 200; -attack2" );

        for t = 0.8, 0.0, -0.1 do
            CreateTimer( t, ClientCmd, string.format( "say Observer mode in %.1f seconds", 0.8 - t ) );
        end

        if ( not UTIL_IsPointInsideAABB( pPlayer.vars.origin,
                                        Vector(42.406, -1031.281, -281.969),
                                        Vector(42.406, -1031.281, -281.969) + Vector(339.438, 132.031, 195.062) ) ) then
            CreateTimer( 1.0, function()
                SendCommandToClientByName( p2, "sc_freeze2" ); -- unfreeze
                SendCommandToClientByName( p3, "sc_freeze2" ); -- unfreeze
            end );

            fix_govno = true;
        end
    elseif ( pPlayer.vars.netname == p2 ) then
        if ( spawns_state == 0 ) then
            return;
        elseif ( spawns_state == 1 ) then
            CreateTimer( 0.11, ClientCmd, "toggle_survival_mode;toggle_survival_mode" );
            spawns_state = 2;
            return;
        end

        CreateTimer( 0.75, ClientCmd, "fps_max 20" );
        CreateTimer( 1.0, ClientCmd, "fps_max 200" );

        SendCommandToClientByName( p2, "+attack2" );

        for t = 0.8, 0.0, -0.1 do
            CreateTimer( t, ClientCmd, string.format( "say Observer mode in %.1f seconds", 0.8 - t ) );
        end

        CreateTimer( 1.0, function()
            ClientCmd( "GOGOGO REVIVE BLYATTTT" );
            SendCommandToClientByName( p2, "-attack2" );

            SendCommandToClientByName( p3, "sc_freeze2" ); -- unfreeze, draw medkit
            SendCommandToClientByName( p4, "sc_freeze2; wait; weapon_medkit" ); -- unfreeze
        end );
    end
end

function OnSpecialSpawn( pPlayer )
    printl( "OnSpecialSpawn()" );
    printl( "Player \"" .. tostring( pPlayer.vars.netname ) .. "\" has been revived at " .. tostring( pPlayer.vars.origin ) );

    if ( pPlayer.vars.netname == p1 ) then
        if ( spawns_state == 0 ) then
            pPlayer.vars.origin = Vector( 182.554031, -915.483521, -213.976334 );
            ClientCmd( "wait; sc_strafe 0; sc_im_play c13a4_post_wall_skip; weapon_gauss; wait; sc_strafe 1" );
        else
            pPlayer.vars.origin = Vector( 1133.407837, 255.851471, -164.644714 );
        end
    end
end

function OnPlayerSpawn( pSpawnSpot, pPlayer )
    printl( "Player \"" .. tostring( pPlayer.vars.netname ) .. "\" spawned at " .. tostring( pPlayer.vars.origin ) .. ", viewangles: " .. tostring(pPlayer.vars.angles) .. "" );

    local playername = pPlayer.vars.netname;

    if ( spawns_state == 0 ) then
        if ( playername == p1 ) then
            pPlayer.vars.origin = Vector( -32, -769, -719 );
            pPlayer.vars.angles = Vector( 0, 270, 0 );
        elseif ( playername == p2 ) then
            pPlayer.vars.origin = Vector( 32, -769, -719 );
            pPlayer.vars.angles = Vector( 0, 270, 0 );
            -- SendCommandToClient( pPlayer, "kill" );
        elseif ( playername == p3 ) then
            pPlayer.vars.origin = Vector( 32, -704, -719 );
            pPlayer.vars.angles = Vector( 0, 270, 0 );
            -- SendCommandToClient( pPlayer, "kill" );
        elseif ( playername == p4 ) then
            pPlayer.vars.origin = Vector( -32, -704, -719 );
            pPlayer.vars.angles = Vector( 0, 270, 0 );
            SendCommandToClient( pPlayer, "weapon_medkit" );
        end
    else
        if ( playername == p1 ) then
            pPlayer.vars.origin = Vector( 768, -64, -211 );
            pPlayer.vars.angles = Vector( 0, 180, 0 );
        elseif ( playername == p2 ) then
            if ( spawns_state == 1 ) then
                pPlayer.vars.origin = Vector( 768, 64, -211 );
            else
                pPlayer.vars.origin = Vector( 768, -64, -211 );
            end
            pPlayer.vars.angles = Vector( 0, 180, 0 );
            SendCommandToClient( pPlayer, "weapon_medkit" );
        elseif ( playername == p3 ) then
            pPlayer.vars.origin = Vector( 896, -64, -211 );
            pPlayer.vars.angles = Vector( 0, 180, 0 );
            SendCommandToClient( pPlayer, "weapon_medkit" );
        elseif ( playername == p4 ) then
            pPlayer.vars.origin = Vector( 896, 64, -211 );
            pPlayer.vars.angles = Vector( 0, 180, 0 );
        end
    end
end

function SendCommandToClientByName( sPlayerName, sCommand )
    local pPlayer = GetPEntityFromPlayerName( sPlayerName );
    if ( pPlayer ~= nil ) then
        SendCommandToClient( pPlayer, sCommand );
    end
end

function UTIL_IsAABBIntersectingAABB( boxmins1, boxmaxs1, boxmins2, boxmaxs2 )
    return ( boxmins1.x <= boxmaxs2.x and boxmaxs1.x >= boxmins2.x ) and
            ( boxmins1.y <= boxmaxs2.y and boxmaxs1.y >= boxmins2.y ) and
            ( boxmins1.z <= boxmaxs2.z and boxmaxs1.z >= boxmins2.z );
end

function UTIL_IsPointInsideAABB( point, mins, maxs )
    return UTIL_IsAABBIntersectingAABB( point, point, mins, maxs )
end

function DrawVisualHints()
    ClientCmd( "sc_debug_draw_box 1144 -39.968750 -237.968750 -16 -16 -18 16 16 18 0 255 255 90 1 1000000" );
    ClientCmd( "sc_debug_draw_box 1144 -39.968750 -237.968750 -2 -2 -2 2 2 2 0 255 255 90 0 1000000" );
    
    ClientCmd( "sc_debug_draw_box 1144 -64.000000 -183.937500 -16 -16 -32 16 16 32 0 255 255 90 1 1000000" );
    ClientCmd( "sc_debug_draw_box 1144 -64.000000 -183.937500 -2 -2 -2 2 2 2 0 255 255 90 0 1000000" );
    ClientCmd( "sc_debug_draw_line 1144 -79.000000 -300 1144 -79.000000 0 0 255 0 255 3 1000000" );
    ClientCmd( "sc_debug_draw_line 1144 79.000000 -300 1144 79.000000 0 0 255 0 255 3 1000000" );
    ClientCmd( "sc_debug_draw_line 1144 -79.000000 -200 1144 79.000000 -200 0 255 0 255 3 1000000" );
    
    ClientCmd( "sc_debug_draw_box 896 -64 -212 -16 -16 -36 16 16 36 50 0 255 90 1 1000000" );
    ClientCmd( "sc_debug_draw_box 896 64 -212 -16 -16 -36 16 16 36 50 0 255 90 1 1000000" );
    ClientCmd( "sc_debug_draw_box 768 -64 -212 -16 -16 -36 16 16 36 50 0 255 90 1 1000000" );
    ClientCmd( "sc_debug_draw_box 768 64 -212 -16 -16 -36 16 16 36 50 0 255 90 1 1000000" );
end

function PrintTime()
    PrintChatText( string.format( "%.3f (%d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

SpeedrunInit();

printl( "Executed \"c13_a4_p1.lua\"" );
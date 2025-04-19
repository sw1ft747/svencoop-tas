-- local vecIn = Vector( math.sqrt(0.5), math.sqrt(0.5), 0 ) * 220;
-- local vecNormal = Vector( -1, 0, 0 );
-- local vecOut = Vector();
-- local overbounce = 1.0;

-- local backoff = vecIn:Dot( vecNormal ) * overbounce;

-- local change = vecNormal.x * backoff;
-- vecOut.x = vecIn.x - change;
-- change = vecNormal.y * backoff;
-- vecOut.y = vecIn.y - change;
-- change = vecNormal.z * backoff;
-- vecOut.z = vecIn.z - change;

-- printl( tostring( vecOut ) );

-- function OnFireBulletsSpread(entity, entindex, spread_x, spread_y)
--     -- PrintChatText( string.format( "entindex: %d | x: %f | y: %f", entindex, spread_x, spread_y ) );

--     if ( entindex == 587 + ( gpGlobals.maxClients - 2 ) ) then
--         local angle = RandomFloat( 0, 3 * math.pi / 4 );
--         local spread_factor = RandomFloat( 0.9, 1.0 );

--         if ( angle > math.pi / 2 ) then
--             angle = 2 * math.pi - ( angle - math.pi / 2 );
--         end

--         spread_x = math.cos( angle ) * spread_factor;
--         spread_y = math.sin( angle ) * spread_factor;
--     end

--     return spread_x, spread_y;
-- end

-- function OnFireTargets( targetname, activator, caller, usetype, value, delay )
--     -- if ( targetname == "spawn3_mm" ) then
--     --     ClientCmd( "toggle_survival_mode; toggle_survival_mode" );
--     --     postspawn = true;
--     -- end

--     printl( "OnFireTargets :: " .. targetname .. " : " .. value .. " : " .. delay );
-- end

-- CreateTimer( 0.2, function() -- wallstrafe + gauss boost
--     ClientCmd( "setang 0 -6.5" );
--     ClientCmd( "+moveleft; +back" );

--     CreateTimer( 0.7, ClientCmd, "setang 0 20; +jump; -attack2; -moveleft; -back" );
-- end );

-- function OnFireTargets( targetname, activator, caller, usetype, value, delay )
--     PrintChatText( string.format( "targetname: %s | usetype: %d | value: %f | value: %f", targetname, usetype, value, delay ) );
-- end

-- GetPEntityFromEntityIndex(382).vars.flags = FL_KILLME;

-- ClientCmd( "setpos 1501.504395 -923.703491 -1075.757080" );
-- ClientCmd( "give weapon_handgrenade; sc_strafe 0;" );

-- CreateTrigger("triggerpush_skip", Vector(1397.500, -992.219, -1102.375), Vector(0, 0, 0), Vector(92.812, 50.375, 91.094));

-- function OnPlayerUnstuck( pPlayerEdict )
--     printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" unstucked at " .. tostring( pPlayerEdict.vars.origin ) );

--     pPlayerEdict.vars.origin = Vector( 1447.843750, -978.656250, -1111.968750 );
-- end

-- function OnTouchTrigger( name )
--     if ( name == "triggerpush_skip") then
--         -- ClientCmd("sc_im_play c2a2_qees_v2");
--         -- InputManager.Playback("c2a2_qees_v2");
--         -- ClientCmd("sc_st_timescale 0.25");
--         -- ClientCmd("sc_im_record c2a2_qees");
--         ClientCmd("setang 20 180");
--         -- CreateTimer( 0.1, ClientCmd, "sc_strafe 1; sc_strafe_ignore_ground 0; sc_im_record c2a2_qees_v3" );
--         CreateTimer( 0.05, ClientCmd, "sc_im_play c2a2_qees_v3" );
--     end

--     return true;
-- end

local traceResult = {};

TraceHull( traceResult, PlayerMove.origin, PlayerMove.origin + PlayerMove.forward * 8192, PM_NORMAL, PM_HULL_POINT, -1 );

printl( traceResult["endpos"] );

ClientCmd( "sc_epp_start ba.bin 216 162 1662.5 1143.968750 -140.0 90 -90 0 10" );
-- ClientCmd( string.format( "sc_debug_draw_clear; sc_giga_test 100 20 0 %f %f %f 90 -90 0; wait; sc_debug_draw_clear", traceResult["endpos"].x, traceResult["endpos"].y, traceResult["endpos"].z ) );

-- for key, value in pairs(traceResult) do
--     if ( type(value) == "table" ) then
--         printl(key .. " =\n{");
--         for k, v in pairs(traceResult[key]) do
--             printl( k .. " = " .. tostring(v) );
--         end
--         printl("}");
--     else
--         printl( key .. " = " .. tostring(value) );
--     end
-- end

-- function OnGameFrame(state, frametime, postruncmd)
--     if ( postruncmd ) then
--         if ( UTIL_IsPointInsideAABB( PlayerMove.origin,
--                                     Vector(1069.781, -18.094, -153.219),
--                                     Vector(1069.781, -18.094, -153.219) + Vector(151.094, 124.938, 26.188) ) ) then
--             local origin = PlayerMove.origin;
--             local velocity = PlayerMove.velocity;

--             for i = 1, 2 do
--                 velocity.z = velocity.z - ( 800.0 * 0.5 * frametime ); -- UTIL_AddCorrectGravity

--                 local move = velocity * frametime;
--                 local traceResult = {};

--                 TraceHull( traceResult, origin, origin + move, PM_NORMAL, PM_HULL_PLAYER, -1 );

--                 origin = traceResult.endpos;

--                 if ( traceResult.fraction ~= 1.0 and not traceResult.allsolid and traceResult.plane.normal.y == -1.0 ) then
-- 					ClientCmd( "kill" );
--                     break;
--                 end

--                 velocity.z = velocity.z - ( 800.0 * frametime * 0.5 ); -- UTIL_FixupGravityVelocity
--             end
--         end
--     end
-- end

-- start_time = SegmentCurrentTime();

-- function PrintTime()
--     PrintChatText( string.format( "%.3f (%d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
-- end

-- ClientCmd( "weapon_medkit" );
-- ClientCmd( "setpos 1143.968750 -63.968750 -183.937500; setang 0.000000 -90.000000 0.000000" );
-- ClientCmd( "+attack2" );

-- function OnSpecialSpawn( pPlayerEdict )
--     printl( "OnSpecialSpawn()" );
--     printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" has been revived at " .. tostring( pPlayerEdict.vars.origin ) );
-- end
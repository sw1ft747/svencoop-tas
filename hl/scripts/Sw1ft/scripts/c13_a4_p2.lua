function InitTriggers()
    ClearTriggers();
    ClearServerTriggers();
end

function SpeedrunInit()
    ClientCmd("sc_strafe_yaw \"\"; sc_strafe_type 0; sc_strafe 1; sc_strafe_dir 3; sc_st_setangles_stop; -jump; -duck; -forward; -back; -moveleft; -moveright; -tau");
    ClientCmd("sc_strafe_ignore_ground 1");
end

function SpeedrunStart()
    InitTriggers();
    DrawVisualHints();

    ClientCmd("kill");
    -- ClientCmd("use weapon_medkit");
end

function OnGameFrame(state, frametime, postruncmd)
    if ( postruncmd ) then
        if ( UTIL_IsPointInsideAABB( PlayerMove.origin,
                                    Vector(1069.781, -18.094, -153.219),
                                    Vector(1069.781, -18.094, -153.219) + Vector(151.094, 124.938, 26.188) ) ) then
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

SpeedrunInit();

printl( "Executed \"c13_a4_p2.lua\"" );
connected = false;
spawned = false;
start_time = 0.0;
spawns_state = 0;


function SpeedrunInit()
    SetTimescale( 0.5 );

    RemoveAllTimers();

    ClientCmd(" sc_st_disable_spread 0; default_fov 120; -sc_ducktap; -jump; -duck; -forward; -back; -moveleft; -moveright; sc_strafe 0; sc_strafe_yaw \"\"; sc_strafe_ignore_ground 1; -attack; sc_im_stop");
    ClientCmd("sc_strafe_type 0; sc_strafe_dir 3; sc_st_setangles_stop; sc_ducktap_adjust_fps 0; sc_autojump_inconsistent 0; sc_strafe_vectorial_increment 0; fps_max 200; mp_classic_mode 1; clockwindow 0");
    ClientCmd("sc_aimbot 0; sc_aimbot_change_angles_back 0");
    ClientCmd("fps_max 200; sc_jumpbug_legit 0; sc_jumpbug 0");
    
   
end

function OnRestart()
    pb_save();
end

function SpeedrunStart()
    SpeedrunStartCustom();
    -- connected = true;
end

function SpeedrunStartCustom()
    start_time = SegmentCurrentTime();


    --CreateTimer( 5.15, EnableSurvivalMode );
    --CreateTimer( 5.1, DisableSurvivalMode );
    --lientCmd("sc_im_record c14_newV2");
    ClientCmd("sc_im_play c14_newV2");
    CreateTimer(4.970, ClientCmd,"+tau");
    ClientCmd("weapon_crossbow; weapon_gauss");
    CreateTimer(8.410, ClientCmd,"+sc_ducktap");
    CreateTimer(8.140, ClientCmd,"sc_st_timescale 0.1");
    CreateTimer(9.410, ClientCmd,"-sc_ducktap");
    CreateTimer(5.970, ClientCmd,"sc_strafe 1");
    CreateTimer(5.970, ClientCmd,"sc_strafe_type 1");

    --CreateTimer(12.140, ClientCmd,"sc_im_split");

    CreateTimer(11.100, ClientCmd,"fps_max 1000");
    CreateTimer(11.120, ClientCmd,"sc_jumpbug_legit 1");
    CreateTimer(11.370, ClientCmd,"fps_max 200");
    CreateTimer( 1.0, CreateTrigger, "1", Vector(3299.656, 742.719, 9.469), Vector(0, 0, 0), Vector(60.375, 46.125, 136.250));
    CreateTrigger("2", Vector(30.250, 1928.469, 1664.875), Vector(0, 0, 0), Vector(51.188, 62.156, 121.000));




end


function OnTouchTrigger( name )
    if ( name == "1" ) then
        -- spawns_state = 1;
    elseif (name == "2") then
        ClientCmd("-tau");
    elseif (name == "3") then
        -- spawns_state = 3;
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

function OnFireCrossbowSpread(entity, entindex)
    return true, 1.0, true, 1.0;
end

function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
    printl( "OnPlayerSpawn()" );
    
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) .. ", viewangles: " .. tostring(pPlayerEdict.vars.angles) .. "" );

    local sPlayerName = pPlayerEdict.vars.netname;

    if ( spawns_state == 0 ) then
        if ( UTIL_IsPointInsideAABB( pPlayerEdict.vars.origin,
                                    Vector(-83.562, 1736.781, 1844.156) + Vector(0, 0, -297.156),
                                    Vector(-83.562, 1736.781, 1844.156) + Vector(420.688, 380.938, 0) ) ) then
            if ( sPlayerName == "QEES" ) then
                pPlayerEdict.vars.origin = Vector( 53.000000, 1959.000000, 1704.000000 );     
                pPlayerEdict.vars.angles = Vector( 0, -160, 0 );
            elseif ( sPlayerName == "BotSkipper" ) then
                pPlayerEdict.vars.origin = Vector( 100.000000, 1940.000000, 1705.000000 );
                pPlayerEdict.vars.angles = Vector( 0.000000, 0.000000, 0.000000 );
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

function PrintTime()
    PrintChatText( string.format( "%.3f (IM frames: %d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

SpeedrunInit();


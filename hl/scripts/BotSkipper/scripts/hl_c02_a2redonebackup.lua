start_time = 0.0;

local last_qees_position;
local qees_player_index = 3;

ClientCmd( "sc_st_timescale 0.25" );

function SpeedrunStart()
    start_time = SegmentCurrentTime();

    -- CreateTrigger("c02a2_disable_scripted_spawn", Vector(-821.750, -2683.500, 1344.031), Vector(0, 0, 0), Vector(615.444, 384.737, 55.271));
    CreateTrigger("spawn", Vector(-2103.531, -2235.000, 1457.312), Vector(0, 0, -117.406), Vector(65.844, 64.311, 0));
    -- CreateTrigger("alo4", Vector(-366.438, -2632.000, 1312.969), Vector(0, 0, 0), Vector(180.125, 34.406, 73.281));

    ClientCmd( "sc_strafe_yaw \"\";sc_strafe_type 0;-jump;pausable 1;-duck;sc_strafe_ignore_ground 1;-sc_ducktap" );
end

function OnTouchTrigger( name )
    if ( name == "spawn") then
        ClientCmd("+use;wait;-use");
        CreateTimer( 1.6, ClientCmd, "sc_im_play hl_c02_a2ducktap" );
        --[[CreateTimer( 1.7, ClientCmd, "sc_strafe_ignore_ground 0;sc_strafe_vectorial_increment 1");
        CreateTimer( 2.03, ClientCmd, "sc_strafe_ignore_ground 1;+jump");
        CreateTimer( 2.1, ClientCmd, "-jump;+duck");
        CreateTimer( 2.2, ClientCmd, "-duck");
        CreateTimer( 2.26, ClientCmd, "sc_strafe_yaw -74;+jump");
        CreateTimer( 3.18, ClientCmd, "sc_strafe_yaw 47;sc_strafe_type 1");
        CreateTimer( 3.3, ClientCmd, "sc_strafe_type 0");
        CreateTimer( 3.78, ClientCmd, "sc_strafe_yaw -90");
        CreateTimer( 3.9, ClientCmd, "sc_strafe_type 1");
        CreateTimer( 4.1, ClientCmd, "sc_strafe_type 0");
        CreateTimer( 4.3, ClientCmd, "sc_strafe_yaw 0");
        CreateTimer( 4.749, ClientCmd, "sc_strafe_yaw 44");
        CreateTimer( 5.4, ClientCmd, "sc_strafe_yaw -80");]]--
        CreateTimer( 6.0, ClientCmd, "sc_strafe_yaw -15;sc_strafe_vectorial_increment 1;-jump;+sc_ducktap;sc_im_stop");
        CreateTimer( 6.2, ClientCmd, "sc_strafe_vectorial_increment 0")
        CreateTimer( 6.3, ClientCmd, "sc_strafe 0; sc_aimbot 1; +attack; wait; -attack; wait; sc_st_disable_spread 0; sc_aimbot 0; sc_strafe 1;sc_aimbot_change_angles_back 1");
        CreateTimer( 6.31, ClientCmd, "+duck;weapon_crowbar");
        CreateTimer( 6.42, ClientCmd, "kill;fps_max 20;-duck;+attack");
        CreateTimer( 7.5, ClientCmd, "fps_max 500;-attack");
    end

    return true;
end

function OnClientPutInServer( pPlayerEdict )
    printl( "OnClientPutInServer( " .. pPlayerEdict.vars.netname .. " )" );

    SendCommandToClient( pPlayerEdict, "sc_st_legit_mode" );
end

function OnPlayerUnstuck( pPlayerEdict )
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" unstucked at " .. tostring( pPlayerEdict.vars.origin ) );

    if ( pPlayerEdict.vars.netname == "QEES51" ) then
        -- pPlayerEdict.vars.origin = Vector( 1440.428833, -981.990295, -979.512817 );
        -- pPlayerEdict.vars.origin.z = last_qees_position.z + 4.637456;
        
        pPlayerEdict.vars.origin = Vector( 1440.428833, -981.990295, -1038.76925 );

        printl( "QEES51's forced unstuck at " .. tostring( pPlayerEdict.vars.origin ) );
    end
end

function OnGameFrame(state, frametime, postruncmd)
    if ( not postruncmd ) then
        local player = GetPEntityFromEntityIndex( qees_player_index );

        if ( player ~= nil ) then
            last_qees_position = player.vars.origin;
        end
    end
end

function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
    printl( "OnPlayerSpawn()" );
    
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) );

    local sPlayerName = pPlayerEdict.vars.netname;

    if ( UTIL_IsPointInsideAABB( pPlayerEdict.vars.origin,
                                Vector(-2178.156, -2390.000, 1267.562),
                                Vector(-2178.156, -2390.000, 1267.562) + Vector(342.625, 284.406, 216.906) ) ) then

        if ( sPlayerName == "BotSkipper" ) then
            pPlayerEdict.vars.origin = Vector(-2072.000000, -2200.000000, 1365.000000);
        elseif ( sPlayerName == "Sw1ft" ) then
            pPlayerEdict.vars.origin = Vector(-2072.000000, -2280.000000, 1365.000000);
        elseif ( sPlayerName == "kolokola777" ) then
            pPlayerEdict.vars.origin = Vector(-2016.000000, -2280.000000, 1365.000000);
        elseif ( sPlayerName == "void" ) then
            pPlayerEdict.vars.origin = Vector(-2016.000000, -2280.000000, 1365.000000);
        elseif ( sPlayerName == "QEES51" ) then
            pPlayerEdict.vars.origin = Vector(-2072.000000, -2200.000000, 1365.000000);
        end

    elseif ( UTIL_IsPointInsideAABB( pPlayerEdict.vars.origin,
                                    Vector(1223.031, -3346.906, 1039.812),
                                    Vector(1223.031, -3346.906, 1039.812) + Vector(735.594, 610.969, 593.031) ) ) then

        if ( pPlayerEdict.vars.netname ~= "Sw1ft" ) then
            if ( pSpawnSpotEdict.vars.origin.x == 1727.0 and pSpawnSpotEdict.vars.origin.y == -3089.0 and pSpawnSpotEdict.vars.origin.z == 1328.0 ) then
                local spots =
                {
                    Vector( 1727.0, -3152.0, 1329.0 ),
                    Vector( 1536.0, -3089.0, 1329.0 ),
                    Vector( 1536.0, -3152.0, 1329.0 )
                };

                pPlayerEdict.vars.origin = spots[ RandomInt( 1, #spots ) ];
                -- pPlayerEdict.vars.angles = Vector( 0, 90, 0 );
            end
        else
            pPlayerEdict.vars.origin = Vector( 1727.0, -3089.0, 1329.0 );
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
    PrintChatText( string.format( "%.3f (%d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

--[[

    function OnTouchTrigger( name )
        if ( name == "spawn") then
        ClientCmd("+use;wait;-use");
        CreateTimer( 1.6, ClientCmd, "sc_im_record hl_c02_a2ducktap" );
        CreateTimer( 1.7, ClientCmd, "sc_strafe_ignore_ground 0;sc_strafe_vectorial_increment 1");
        CreateTimer( 2.03, ClientCmd, "sc_strafe_ignore_ground 1;+jump");
        CreateTimer( 2.1, ClientCmd, "-jump;+duck");
        CreateTimer( 2.2, ClientCmd, "-duck");
        CreateTimer( 2.26, ClientCmd, "sc_strafe_yaw -74;+jump");
        CreateTimer( 3.18, ClientCmd, "sc_strafe_yaw 47;sc_strafe_type 1");
        CreateTimer( 3.3, ClientCmd, "sc_strafe_type 0");
        CreateTimer( 3.78, ClientCmd, "sc_strafe_yaw -90");
        CreateTimer( 3.9, ClientCmd, "sc_strafe_type 1");
        CreateTimer( 4.1, ClientCmd, "sc_strafe_type 0");
        CreateTimer( 4.3, ClientCmd, "sc_strafe_yaw 0");
        CreateTimer( 4.749, ClientCmd, "sc_strafe_yaw 44");
        CreateTimer( 5.4, ClientCmd, "sc_strafe_yaw -80");
        CreateTimer( 6.0, ClientCmd, "sc_strafe_yaw -15;-jump;+sc_ducktap;sc_im_stop");
        CreateTimer( 6.2, ClientCmd, "sc_strafe_vectorial_increment 0")
        CreateTimer( 6.3, ClientCmd, "sc_strafe 0; sc_aimbot 1; +attack; wait; -attack; wait; sc_st_disable_spread 0; sc_aimbot 0; sc_strafe 1;sc_aimbot_change_angles_back 1");
        CreateTimer( 6.31, ClientCmd, "+duck;weapon_crowbar");
        CreateTimer( 6.42, ClientCmd, "kill;fps_max 20;-duck;+attack");
        CreateTimer( 7.5, ClientCmd, "fps_max 500;-attack");
        end

        return true;
    end


    Time : 7.252
    function OnTouchTrigger( name )
        if ( name == "spawn") then
        ClientCmd("+use;wait;-use");
        CreateTimer( 1.6, ClientCmd, "sc_im_record hl_c02_a2redone" );
        CreateTimer( 1.7, ClientCmd, "sc_strafe_ignore_ground 0;sc_strafe_vectorial_increment 1");
        CreateTimer( 2.03, ClientCmd, "sc_strafe_ignore_ground 1;+jump");
        CreateTimer( 2.1, ClientCmd, "-jump;+duck");
        CreateTimer( 2.2, ClientCmd, "-duck");
        CreateTimer( 2.26, ClientCmd, "sc_strafe_yaw -74;+jump");
        CreateTimer( 3.18, ClientCmd, "sc_strafe_yaw 47;sc_strafe_type 1");
        CreateTimer( 3.3, ClientCmd, "sc_strafe_type 0");
        CreateTimer( 3.78, ClientCmd, "sc_strafe_yaw -90");
        CreateTimer( 3.9, ClientCmd, "sc_strafe_type 1");
        CreateTimer( 4.1, ClientCmd, "sc_strafe_type 0");
        CreateTimer( 4.3, ClientCmd, "sc_strafe_yaw 0");
        CreateTimer( 4.749, ClientCmd, "sc_strafe_yaw 44");
        CreateTimer( 5.4, ClientCmd, "sc_strafe_yaw -80");
        CreateTimer( 6.0, ClientCmd, "sc_strafe_yaw 0");
        CreateTimer( 6.2, ClientCmd, "sc_strafe_vectorial_increment 0")
        CreateTimer( 6.3, ClientCmd, "sc_strafe 1; sc_aimbot 1; +attack; wait; -attack; wait; sc_st_disable_spread 0; sc_aimbot 0; sc_strafe 1;sc_aimbot_change_angles_back 1");
        CreateTimer( 6.34, ClientCmd, "+duck");
        CreateTimer( 6.40, ClientCmd, "kill");
        CreateTimer( 6.5, ClientCmd, "sc_im_stop");
    end

    return true;
end
]]--
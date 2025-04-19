enable_scripted_spawn = true;
local last_qees_position;
local qees_player_index = 2;

function SpeedrunStart()
    CreateTrigger("c02a2_disable_scripted_spawn", Vector(-821.750, -2683.500, 1344.031), Vector(0, 0, 0), Vector(615.444, 384.737, 55.271));
    CreateTrigger("spawn", Vector(-2103.531, -2235.000, 1457.312), Vector(0, 0, -117.406), Vector(65.844, 64.311, 0));
    CreateTrigger("alo4", Vector(-366.438, -2632.000, 1312.969), Vector(0, 0, 0), Vector(180.125, 34.406, 73.281));
end

function OnTouchTrigger( name )
    if ( name == "c02a2_disable_scripted_spawn" ) then
        enable_scripted_spawn = false;
    elseif ( name == "spawn") then
        ClientCmd("+use;wait;-use");
        CreateTimer( 1.6, ClientCmd, "sc_im_play help" );
        return true;
    elseif ( name == "alo4") then
        CreateTimer( 0.46, ClientCmd, "sc_im_stop;+duck");
        CreateTimer( 0.57, ClientCmd, "sc_strafe_yaw \"\";kill;+attack2;-duck;fps_max 20");
        CreateTimer( 1.39, ClientCmd, "fps_max 20")
        CreateTimer( 1.6, ClientCmd, "-attack2;fps_max 500");
        return true;
    end
end

function OnClientPutInServer( pPlayerEdict )
    printl( "OnClientPutInServer( " .. pPlayerEdict.vars.netname .. " )" );

    SendCommandToClient( pPlayerEdict, "sc_st_legit_mode" );
end

function OnPlayerUnstuck( pPlayerEdict )
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" unstucked at " .. tostring( pPlayerEdict.vars.origin ) );

    if ( pPlayerEdict.vars.netname == "QEES51" ) then
        pPlayerEdict.vars.origin = Vector( 1440.428833, -981.990295, -979.512817 );
        pPlayerEdict.vars.origin.z = last_qees_position.z + 5.0;
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
    
    if ( not enable_scripted_spawn ) then
        return
    end;

    local sPlayerName = pPlayerEdict.vars.netname;
    
    if ( sPlayerName == "BotSkipper" ) then
        pPlayerEdict.vars.origin = Vector(-2072.000000, -2200.000000, 1365.000000);
    elseif ( sPlayerName == "Sw1ft" ) then
        pPlayerEdict.vars.origin = Vector(-2072.000000, -2280.000000, 1365.000000);
    elseif ( sPlayerName == "kolokola777" ) then
        pPlayerEdict.vars.origin = Vector(-2016.000000, -2280.000000, 1365.000000);
    elseif ( sPlayerName == "QEES51" ) then
        pPlayerEdict.vars.origin = Vector(-2072.000000, -2200.000000, 1365.000000);
    end
end
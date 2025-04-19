enable_scripted_spawn = true;

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
    elseif ( name == "alo4") then
        CreateTimer( 0.5, ClientCmd, "sc_im_stop;+duck;toggle_survival_mode;wait;toggle_survival_mode");
        CreateTimer( 0.575, ClientCmd, "sc_strafe_yaw \"\";kill;+attack2;-duck");
        CreateTimer( 1.39, ClientCmd, "fps_max 20")
        CreateTimer( 1.6, ClientCmd, "-attack2;fps_max 500");
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
        pPlayerEdict.vars.origin = Vector(-2072.000000, -2200.000000, 1365.000000);
    elseif ( sPlayerName == "kolokola777" ) then
        pPlayerEdict.vars.origin = Vector(-2016.000000, -2280.000000, 1365.000000);
    elseif ( sPlayerName == "QEES51" ) then
        pPlayerEdict.vars.origin = Vector(-2072.000000, -2280.000000, 1365.000000);
    end
end
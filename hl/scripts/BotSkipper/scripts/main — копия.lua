function OnFirstClientdataReceived(receive_time)
	printl( "OnFirstClientdataReceived(" .. receive_time .. ")" );

    if ( SpeedrunStart ~= nil ) then SpeedrunStart() end

    ClientCmd( "stop; record autorecord_skippur_" .. MapName );
    ClientCmd( "wait; use weapon_gauss" );
end

function OnBeginLoading()
	printl( "OnBeginLoading()" );
end

function OnEndLoading()
	printl( "OnEndLoading()" );
end

function OnDisconnect()
	printl( "OnDisconnect()" );
end

function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
    printl( "OnPlayerSpawn()" );
    
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) );
end
function IncludeMapScript( mapname )
    if ( mapname == "hl_c02_a2" ) then
        IncludeScript( mapname );
    elseif (mapname == "hl_c08_a2") then
        IncludeScript( "c08a2" );
    elseif ( mapname == "hl_c08_a1" ) then
        IncludeScript( "c08a1" );
    end

    return false;
end

if ( IncludeMapScript( MapName ) ) then
    printl( "Executed map script \"" .. MapName .. "\"" );
end

printl( "Executed \"main.lua\"" );

--function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
    --printl( "OnPlayerSpawn()" );
    
    --printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) );
    
    --local mapname = GetMapName():lower();

    --if ( mapname == "hl_c09" ) then
        --local sPlayerName = pPlayerEdict.vars.netname;
        
        --if ( sPlayerName == "BotSkipper" ) then
            --pPlayerEdict.vars.origin = Vector (-1552.000000, 72.000000, -31.000000)
        --elseif ( sPlayerName == "Sw1ft" ) then
            --pPlayerEdict.vars.origin = Vector (-1552.000000, 72.000000, -31.000000)
        --elseif ( sPlayerName == "void" ) then
            --pPlayerEdict.vars.origin = Vector (-1552.000000, 72.000000, -31.000000)
        --elseif ( sPlayerName == "QEES51" ) then
            --pPlayerEdict.vars.origin = Vector (-1552.000000, 72.000000, -31.000000)
		--elseif ( sPlayerName == "kolokola777" ) then
			--pPlayerEdict.vars.origin = Vector (-1552.000000, 72.000000, -31.000000)
       -- end
    --end
--end

-- function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
--     printl( "OnPlayerSpawn()" );
    
--     printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) );
    
--     local mapname = GetMapName():lower();

--     if ( mapname == "hl_c06" ) then
--         local sPlayerName = pPlayerEdict.vars.netname;
        
--         if ( sPlayerName == "BotSkipper" ) then
--             pPlayerEdict.vars.origin = Vector( 686, -2010, 46 );
--         elseif ( sPlayerName == "Sw1ft" ) then
--             pPlayerEdict.vars.origin = Vector( 686, -2010, 46 );
--         elseif ( sPlayerName == "void" ) then
--             pPlayerEdict.vars.origin = Vector(742, -1906, 46);
--         elseif ( sPlayerName == "QEES51" ) then
--             pPlayerEdict.vars.origin = Vector( 742, -2010, 46 );
-- 			CreateTimer(0.200, DisableSurvivalMode);
-- 			CreateTimer(0.200, EnableSurvivalMode);
--         end
--     end
-- end

-- function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
--     printl( "OnPlayerSpawn()" );
    
--     printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) );
    
--     local mapname = GetMapName():lower();

--     if ( mapname == "hl_c13_a2" ) then
--         local sPlayerName = pPlayerEdict.vars.netname;
        
--         if ( sPlayerName == "BotSkipper" ) then
--             pPlayerEdict.vars.origin = Vector(-1040.000000, 1186.000000, -703.000000);
--         elseif ( sPlayerName == "Sw1ft" ) then
--             pPlayerEdict.vars.origin = VVector(-1040.000000, 1186.000000, -703.000000);
--         elseif ( sPlayerName == "void" ) then
--             pPlayerEdict.vars.origin = Vector(-1038.000000, 1134.000000, -703.000000);
--         elseif ( sPlayerName == "QEES51" ) then
--             pPlayerEdict.vars.origin = Vector(-1038.000000, 1134.000000, -703.000000);
-- 			CreateTimer(0.200, DisableSurvivalMode);
-- 			CreateTimer(0.200, EnableSurvivalMode);
--         end
--     end
-- end

-- function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
--     printl( "OnPlayerSpawn()" );
    
--     printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) );
    
--     local mapname = GetMapName():lower();

--     if ( mapname == "hl_c07_a1" ) then
--         local sPlayerName = pPlayerEdict.vars.netname;
        
--         if ( sPlayerName == "BotSkipper" ) then
--             pPlayerEdict.vars.origin = Vector(-1535.020020, -2660.229980, -1306.770020); 
--         elseif ( sPlayerName == "QEES51" ) then
--             pPlayerEdict.vars.origin = Vector(-1774.020020, -2660.229980, -1306.770020);
--             --(-1774.020020, -2501.229980, -1306.770020) pered nim
--         end
--     end
-- end

-- function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
--     printl( "OnPlayerSpawn()" );
    
--     printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) );
    
--     local mapname = GetMapName():lower();

--     if ( mapname == "hl_c02_a2" ) then
--         local sPlayerName = pPlayerEdict.vars.netname;
        
--         if ( sPlayerName == "BotSkipper" ) then
--             pPlayerEdict.vars.origin = Vector(-2072.000000, -2200.000000, 1365.000000);
--         elseif ( sPlayerName == "Sw1ft" ) then
--             pPlayerEdict.vars.origin = Vector(-2072.000000, -2200.000000, 1365.000000);
--         elseif ( sPlayerName == "kolokola777" ) then
--             pPlayerEdict.vars.origin = Vector(-2072.000000, -2280.000000, 1365.000000);
--         elseif ( sPlayerName == "QEES51" ) then
--             pPlayerEdict.vars.origin = Vector(-2016.000000, -2280.000000, 1365.000000);
-- 			CreateTimer(0.200, DisableSurvivalMode);
-- 			CreateTimer(0.200, EnableSurvivalMode);
--         end
--     end
-- end
-- NYOOOO :()

function OnFirstClientdataReceived(receive_time)
	printl( "OnFirstClientdataReceived(" .. receive_time .. ")" );
    
   --IncludeScript("c12");


	ClientCmd( "stop; record autorecord_qees" .. MapName );
    ClientCmd( "use weapon_gauss" );

    if ( SpeedrunStart ~= nil ) then SpeedrunStart() end
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

count = 0

function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
    printl( "OnPlayerSpawn()" );
    
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) .. ", viewangles: " .. tostring(pPlayerEdict.vars.angles) .. "" );
    
    if count >= 3 then
        return 
    end

    local mapname = GetMapName():lower();

    if ( mapname == "hl_c01_a1" ) then
        local sPlayerName = pPlayerEdict.vars.netname;
        
        if ( sPlayerName == "BotSkipper" ) then
            pPlayerEdict.vars.origin = Vector( -32.000000, -704.000000, -719.000000 ); 
        elseif ( sPlayerName == "Sw1ft" ) then
            pPlayerEdict.vars.origin = Vector( 32.000000, -769.000000, -719.000000 );
        elseif ( sPlayerName == "void" ) then
            pPlayerEdict.vars.origin = Vector( 32.000000, -769.000000, -719.000000 );
        elseif ( sPlayerName == "QEES51" ) then
            pPlayerEdict.vars.origin = Vector( 544.000000, 272.000000, -203.000000 );
        end
    end

    if ( mapname == "hl_c13_a4" ) then
        local sPlayerName = pPlayerEdict.vars.netname;
        
        if ( sPlayerName == "BotSkipper" ) then
            pPlayerEdict.vars.origin = Vector( -32.000000, -704.000000, -719.000000 ); 
        elseif ( sPlayerName == "Sw1ft" ) then
            pPlayerEdict.vars.origin = Vector( 32.000000, -769.000000, -719.000000 );
        elseif ( sPlayerName == "void" ) then
            pPlayerEdict.vars.origin = Vector( 32.000000, -769.000000, -719.000000 );
        elseif ( sPlayerName == "QEES51" ) then
            pPlayerEdict.vars.origin = Vector( -32.000000, -769.000000, -719.000000 );
        end
    end

    if ( mapname == "hl_c11_a2" ) then
       local sPlayerName = pPlayerEdict.vars.netname;
        
        if ( sPlayerName == "BotSkipper" ) then
            pPlayerEdict.vars.origin = Vector( -1616.000000, -3696.000000, -63.000000 );
       elseif ( sPlayerName == "QEES51" ) then
            pPlayerEdict.vars.origin = Vector( -1524.000000, -3696.000000, -63.000000 );
        end
    end

     if ( mapname == "hl_c13_a1" ) then
        local sPlayerName = pPlayerEdict.vars.netname;
         
         if ( sPlayerName == "BotSkipper" ) then
             pPlayerEdict.vars.origin = Vector( -1616.000000, -3696.000000, -63.000000 );
        elseif ( sPlayerName == "QEES51" ) then
             pPlayerEdict.vars.origin = Vector( -250.000000, -1068.000000, 1765.000000 );
         end
     end

     if ( mapname == "hl_c08_a2" ) then
        local sPlayerName = pPlayerEdict.vars.netname;
         
         if ( sPlayerName == "Sw1ft" ) then
             pPlayerEdict.vars.origin = Vector( 3521.000000, 621.000000, 2069.000000 );
        elseif ( sPlayerName == "QEES51" ) then
             pPlayerEdict.vars.origin = Vector( 3644.000000, 621.000000, 2069.000000 );
         end
     end
     
     if ( mapname == "hl_c12" ) then
        local sPlayerName = pPlayerEdict.vars.netname;
         
         if ( sPlayerName == "BotSkipper" ) then
             pPlayerEdict.vars.origin = Vector( -1616.000000, -3696.000000, -63.000000 );
        elseif ( sPlayerName == "QEES51" ) then
             pPlayerEdict.vars.origin = Vector( 640.000000, 1248.000000, 597.000000 );
         end
     end

    count = count + 1

end

--[[function OnClientKill( pPlayerEdict )
    printl( "OnClientKill()" );
    
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" committed suicide at " .. tostring( pPlayerEdict.vars.origin ) );
    
    local mapname = GetMapName():lower();

    if ( mapname == "hl_c08_a2" ) then
        local sPlayerName = pPlayerEdict.vars.netname;
        
        if ( sPlayerName == "Sw1ft" ) then
            local vecPos = pPlayerEdict.vars.origin;
        
            local vecMins = Vector(-3162.031, 419.500, -1036.875) + Vector(0, 0, -405.000);
            local vecMaxs = Vector(-3162.031, 419.500, -1036.875) + Vector(366.031, 488.531, 0);
            
            if ( vecMins.x <= vecPos.x and vecPos.x <= vecMaxs.x and vecMins.y <= vecPos.y and vecPos.y <= vecMaxs.y and vecMins.z <= vecPos.z and vecPos.z <= vecMaxs.z ) then
                -- vecPos.z = vecPos.z - 3.51001;
                vecPos.z = -1308.458740;
                Player "QEES51" spawned at (Vector : (63.000000, 1465.000000, 45.000000))
            
                pPlayerEdict.vars.origin = vecPos;
            end
        end
    end
end--]]

function OnRestart()
    if ( IncludeMapScript( MapName ) ) then
        printl( "Executed map script \"" .. MapName .. "\"" );
    end
end

function IncludeMapScript( mapname )
    if ( mapname == "hl_c12" ) then
        IncludeScript( "c12_new2" );
        return true;
    elseif ( mapname == "hl_c01_a2" ) then
        IncludeScript( "c01_a2_new" );
        return true;
    elseif ( mapname == "hl_c04" ) then
        IncludeScript( "c04_run_new" );
        return true;
    elseif ( mapname == "hl_c01_a1" ) then
        IncludeScript( "c01_a1_new" );
        return true;
    elseif ( mapname == "hl_c05_a2" ) then
        IncludeScript( "c05_a2_new" );
        return true;
    elseif ( mapname == "hl_c11_a1" ) then
        IncludeScript( "c11_a1_new" );
        return true;
    elseif ( mapname == "hl_c14" ) then
        IncludeScript( "c14_new" );
        return true;
    elseif ( mapname == "hl_c07_a2" ) then
        IncludeScript( "c07_a2_qees" );
        return true;
    elseif ( mapname == "hl_c16_a2" ) then
        IncludeScript( "c16_a2_new" );
        return true;
    elseif ( mapname == "hl_c16_a4" ) then
        IncludeScript( "c16_a4_new" );
        return true;
    elseif ( mapname == "hl_c13_a1" ) then
        IncludeScript( "c13_a1_new" );
        return true;
    elseif ( mapname == "hl_c08_a2" ) then
        IncludeScript( "c08_a2_newV2" );
        return true;
    end

    return false;
end

function OnClientPutInServer( pPlayerEdict )
    printl( "OnClientPutInServer( " .. pPlayerEdict.vars.netname .. " )" );

    SendCommandToClient( pPlayerEdict, "sc_st_legit_mode" );
end

if ( IncludeMapScript( MapName ) ) then
    printl( "Executed map script \"" .. MapName .. "\"" );
end

printl( "Executed \"main.lua\"" );

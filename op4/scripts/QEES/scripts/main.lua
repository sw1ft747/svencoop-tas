function OnFirstClientdataReceived(receive_time)
	printl( "OnFirstClientdataReceived(" .. receive_time .. ")" );
    
   --IncludeScript("c12");


	ClientCmd( "stop; record autorecord_qees" .. MapName );
    ClientCmd( "default_fov 100" );

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

function OnRestart()
    if ( IncludeMapScript( MapName ) ) then
        printl( "Executed map script \"" .. MapName .. "\"" );
    end
end

function IncludeMapScript( mapname )
    if ( mapname == "hl_c04" ) then
        IncludeScript( "c04" );
        return true;
    end

    return false;
end

--[[function IncludeMapScript( mapname )
    if ( mapname == "1111" ) then
        IncludeScript( "1111" );
        return true;
    elseif ( mapname == "of1a2" ) then
        IncludeScript( "of1a2" );
        return true;
    elseif ( mapname == "of1a3" ) then
        IncludeScript( "of1a3" );
        return true;
    elseif ( mapname == "of1a4" ) then
        IncludeScript( "of1a4" );
        return true;
    elseif ( mapname == "of1a4b" ) then
        IncludeScript( "of1a4b" );
        return true;
    elseif ( mapname == "of1a5" ) then
        IncludeScript( "of1a5" );
        return true;
    elseif ( mapname == "of1a5b" ) then
        IncludeScript( "of1a5b22" );
        return true;
    elseif ( mapname == "of1a6" ) then
        IncludeScript( "of1a6" );
        return true;
    elseif ( mapname == "of2a1" ) then
        IncludeScript( "of2a1" );
        return true;
    elseif ( mapname == "of2a1b" ) then
        IncludeScript( "of2a1b" );
        return true;
    elseif ( mapname == "of2a2" ) then
        IncludeScript( "of2a2" );
        return true;
    elseif ( mapname == "of2a4" ) then
        IncludeScript( "of2a4" );
        return true;
    elseif ( mapname == "of2a6" ) then
        IncludeScript( "of2a6" );
        return true;
    elseif ( mapname == "of3a4" ) then
        IncludeScript( "of3a4" );
        return true;
    elseif ( mapname == "of3a5" ) then
        IncludeScript( "of3a5" );
        return true;
    elseif ( mapname == "of3a6" ) then
        IncludeScript( "of3a6" );
        return true;
    elseif ( mapname == "of4a2" ) then
        IncludeScript( "of4a2" );
        return true;
    elseif ( mapname == "of4a3" ) then
        IncludeScript( "of4a3" );
        return true;
    elseif ( mapname == "of4a4" ) then
        IncludeScript( "of4a4" );
        return true;
    elseif ( mapname == "of5a1" ) then
        IncludeScript( "of5a1" );
        return true;
    elseif ( mapname == "of5a2" ) then
        IncludeScript( "of5a2" );
        return true;
    elseif ( mapname == "of5a3" ) then
        IncludeScript( "of5a3" );
        return true;
    elseif ( mapname == "of5a4" ) then
        IncludeScript( "of5a4" );
        return true;
    elseif ( mapname == "of6a1" ) then
        IncludeScript( "of6a1" );
        return true;
    elseif ( mapname == "of6a2" ) then
        IncludeScript( "of6a2" );
        return true;
    elseif ( mapname == "of6a3" ) then
        IncludeScript( "of6a3" );
        return true;
    elseif ( mapname == "of6a4b" ) then
        IncludeScript( "of6a4b" );
        return true;
    elseif ( mapname == "of6a5" ) then
        IncludeScript( "of6a5" );
        return true;
    end

    return false;
end
--]]

function OnClientPutInServer( pPlayerEdict )
    printl( "OnClientPutInServer( " .. pPlayerEdict.vars.netname .. " )" );

    --SendCommandToClient( pPlayerEdict, "sc_st_legit_mode" );
end

if ( IncludeMapScript( MapName ) ) then
    printl( "Executed map script \"" .. MapName .. "\"" );
end

printl( "Executed \"main.lua\"" );

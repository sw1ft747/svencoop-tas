function SpeedrunStart()
    CreateTrigger("trigger", Vector(777.375, -1237.406, -453.062), Vector(0, 0, 0), Vector(49.250, 54.750, 72.531));
    CreateTrigger("trigger1", Vector(1822.406, 1308.531, -807.594), Vector(0, 0, -57.250), Vector(162.938, 149.125, 0));
    CreateTrigger("trigger2", Vector(781.375, -1278.125, -388.625), Vector(0, 0, -55.438), Vector(48.906, 27.000, 0));
    CreateTrigger("surv", Vector(-1297.312, -2172.812, 16.625), Vector(0, 0, -602.188), Vector(1312.469, 383.844, 0));
	ClientCmd("fps_max 200");
end

function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
    printl( "OnPlayerSpawn()" );
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) .. ", viewangles: " .. tostring(pPlayerEdict.vars.angles) .. "" );

    if ( UTIL_IsPointInsideAABB( pPlayerEdict.vars.origin,
                                Vector(991.125, 1470.406, -1097.438),
                                Vector(991.125, 1470.406, -1097.438) + Vector(923.875, 321.031, 288.125) ) ) then

        if ( pPlayerEdict.vars.netname == "QEES51" ) then
            pPlayerEdict.vars.origin = Vector( 1301, 1542, -971 );
            pPlayerEdict.vars.angles = Vector( 0, 90, 0 );
        elseif ( pPlayerEdict.vars.netname == "Sw1ft" ) then
            pPlayerEdict.vars.origin = Vector( 1596, 1539, -971 );
            pPlayerEdict.vars.angles = Vector( 0, 90, 0 );
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

function OnClientPutInServer( pPlayerEdict )
    printl( "OnClientPutInServer( " .. pPlayerEdict.vars.netname .. " )" );

    SendCommandToClient( pPlayerEdict, "sc_st_legit_mode" );
end

printl("rabotaet nahuy??");
CreateTrigger("trigger", Vector(777.375, -1237.406, -453.062), Vector(0, 0, 0), Vector(49.250, 54.750, 72.531));
function OnTouchTrigger(name)
    printl( "Touched trigger: \"" .. name .. "\"" );
    if (name == "trigger") then
		ClientCmd("sc_im_play c1c");
    elseif (name == "surv") then
        ClientCmd("toggle_survival_mode;wait;toggle_survival_mode");
    elseif (name == "trigger1") then
        ClientCmd("sc_im_stop");
    elseif (name == "trigger2") then
        ClientCmd("setang 0 90 0")
    end

    return true;
end
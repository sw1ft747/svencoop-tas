CreateTrigger("trigger", Vector(-250.906, 463.812, 257.469), Vector(0, 0, -14.875), Vector(142.812, 48.969, 0));
CreateTrigger("trigger1", Vector(-136.531, -104.969, 9.375), Vector(0, 0, 0), Vector(39.000, 37.656, 102.000));
revive_state = 0

printl("rabotaem");

function OnTouchTrigger( name )
    printl( "Touched trigger: \"" .. name .. "\"" );

    if ( name == "trigger" ) then
        ClientCmd("kill");
    end
    return true;
end

function OnSpecialSpawn( pPlayerEdict )
    printl( "OnSpecialSpawn()" );
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" has been revived at " .. tostring( pPlayerEdict.vars.origin ) );
    local sPlayerName = pPlayerEdict.vars.netname;
    if ( revive_state == 0 ) then
        if ( sPlayerName == "BotSkipper" ) then
        pPlayerEdict.vars.origin = Vector(-141.829529, 542.088684, 317.907654);
        pPlayerEdict.vars.angles = Vector( 0, 146, 0 );
        end
    end    
end
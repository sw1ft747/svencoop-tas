function SpeedrunStart()
    ClientCmd( "sc_strafe 1;setvel 0 0 0;sc_strafe_yaw \"\";sc_strafe_type 0;-jump;-duck;setang 0.000000 180.000000 0.000000;sc_im_play hl_c08_a1" );
    printl("c08a1");
end


function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
    printl( "OnPlayerSpawn()" );
    
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) );
    
    local sPlayerName = pPlayerEdict.vars.netname;
    
    if ( sPlayerName == "BotSkipper" ) then
        pPlayerEdict.vars.origin = Vector(-864.000000, 1912.000000, 496.000000);
    elseif ( sPlayerName == "jorikgrozniy" ) then
        pPlayerEdict.vars.origin = Vector(-864.000000, 2031.000000, 496.000000);
    end
end
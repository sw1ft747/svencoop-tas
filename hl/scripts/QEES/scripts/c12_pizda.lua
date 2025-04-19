
ClientCmd( "sc_st_timescale 0.1");


function SpeedrunStart()
    InputManager.Playback( "c12_run" );
    ClientCmd( "setang -2.488 287.935");
    CreateTimer(2.970, ClientCmd,"sc_im_split; fps_max 200; sc_strafe_yaw 90");

    --ClientCmd( "sc_im_goto 7550" );
   








    
end

function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
    printl( "OnPlayerSpawn()" );
    
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) );
    
  
    local sPlayerName = pPlayerEdict.vars.netname;
        
    if ( sPlayerName == "QEES51" ) then
        pPlayerEdict.vars.origin = Vector( 640.000000, 1248.000000, 597.000000 );
    end



end

function OnTouchTrigger(name)


    PrintChatText( "Touched trigger \"" .. name .. "\"" );
end


printl( "Executed c12_pizda" );
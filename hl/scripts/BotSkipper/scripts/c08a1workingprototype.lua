function SpeedrunStart()
    ClientCmd( "sc_strafe 1;setvel 0 0 0;sc_strafe_yaw \"\";sc_strafe_type 0;-jump;-duck;-back;setang 0.000000 180.000000 0.000000;sc_strafe_vectorial_increment 1;sc_im_play hl_c08_a1" );
    printl("c08a1");
    CreateTimer( 0.4, ClientCmd, "sc_im_split");
    CreateTimer( 0.5, ClientCmd, "sc_strafe_yaw 153;sc_st_setangles 89 -89 100");
    CreateTimer( 0.75, ClientCmd, "+duck;sc_strafe_yaw \"\";+moveleft;+back");
    CreateTimer( 0.8, ClientCmd, "sc_strafe_yaw \"\"");
    CreateTimer( 0.81, ClientCmd, "-duck;sc_strafe 0");
    CreateTimer( 1.0, ClientCmd, "-moveleft;-back;-jump");
    CreateTimer( 1.6, ClientCmd, "sc_strafe 1;sc_strafe_yaw -121;sc_autojump 0;-jump;sc_st_setangles 26 -32 50;sc_strafe_vectorial_increment 0");
    CreateTimer( 1.795, ClientCmd, "sc_strafe_yaw -32;+jump;sc_strafe_vectorial_increment 0.5");
    CreateTimer( 1.9, ClientCmd, "sc_autojump 1")
    CreateTimer( 2.5, ClientCmd, "sc_strafe_yaw 0");
    CreateTimer( 2.8, ClientCmd, "+attack;wait;-attack;sc_st_setangles 0 -32 200");
    CreateTimer( 3.0, ClientCmd, "sc_strafe_yaw -32;+duck");
    CreateTimer( 3.6, ClientCmd, "-duck;-jump;+sc_ducktap");
    CreateTimer( 3.8, ClientCmd, "-sc_ducktap;+jump");
    CreateTimer( 4.0, ClientCmd, "sc_strafe_yaw -89");
    CreateTimer( 4.9, ClientCmd, "sc_strafe_yaw -42");
    CreateTimer( 5.65, ClientCmd, "sc_strafe_yaw 0");
    CreateTimer( 6.3, ClientCmd, "sc_strafe_yaw -56;toggle_survival_mode;wait;toggle_survival_mode");
    CreateTimer( 6.75, ClientCmd, "-jump;+duck");
    CreateTimer( 6.99, ClientCmd, "kill;-duck;+back")
    CreateTimer( 7.9 ,ClientCmd, "-back")
    CreateTimer( 8.0, ClientCmd, "sc_im_stop");
end
--CreateTimer( 6.3, ClientCmd, "sc_strafe_yaw -68;toggle_survival_mode;wait;toggle_survival_mode");

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

function OnSpecialSpawn( pPlayerEdict )
    printl( "OnSpecialSpawn()" );
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" has been revived at " .. tostring( pPlayerEdict.vars.origin ) );

    --pPlayerEdict.vars.origin = Vector( -1797.632935, 4.815926, 1750.961060 );
end

--[[    
    CreateTimer( 0.4, ClientCmd, "sc_im_split");
    CreateTimer( 0.5, ClientCmd, "sc_strafe_yaw 153;sc_st_setangles 89 -89 100");
    CreateTimer( 0.75, ClientCmd, "+duck;sc_strafe_yaw \"\";+moveleft;+back");
    CreateTimer( 0.8, ClientCmd, "sc_strafe_yaw \"\"");
    CreateTimer( 0.81, ClientCmd, "-duck;sc_strafe 0");
    CreateTimer( 1.0, ClientCmd, "-moveleft;-back");
    CreateTimer( 1.6, ClientCmd, "sc_strafe 1;sc_strafe_yaw -121;-jump;sc_st_setangles 26 -32 50;sc_strafe_vectorial_increment 0");
    CreateTimer( 1.795, ClientCmd, "sc_strafe_yaw -32;+jump;sc_strafe_vectorial_increment 1");
    CreateTimer( 2.5, ClientCmd, "sc_strafe_yaw 0");
    CreateTimer( 2.8, ClientCmd, "+attack;wait;-attack;sc_st_setangles 0 -32 200");
    CreateTimer( 3.0, ClientCmd, "sc_strafe_yaw -32;+duck");
    CreateTimer( 3.6, ClientCmd, "-duck;-jump;+sc_ducktap");
    CreateTimer( 3.8, ClientCmd, "-sc_ducktap;+jump");
    CreateTimer( 4.1, ClientCmd, "sc_strafe_yaw -89");
    CreateTimer( 5.0, ClientCmd, "sc_strafe_yaw -42");
    CreateTimer( 5.75, ClientCmd, "sc_strafe_yaw 0");
    CreateTimer( 6.4, ClientCmd, "sc_strafe_yaw -50;toggle_survival_mode;wait;toggle_survival_mode");
    CreateTimer( 6.75, ClientCmd, "-jump;+duck");
    CreateTimer( 6.97, ClientCmd, "kill;-duck;+back")
    CreateTimer( 7.8 ,ClientCmd, "-back")
    CreateTimer( 7.9, ClientCmd, "sc_im_stop");
--]]
function SpeedrunStart()
    ClientCmd( "sc_strafe 1;setvel 0 0 0;sc_strafe_yaw \"\";sc_strafe_type 0;-jump;-duck;-back;setang 0.000000 180.000000 0.000000;sc_strafe_vectorial_increment 1;sc_im_play hl_c08_a1" );
    printl("c08a1");
    CreateTimer( 6.4, ClientCmd, "toggle_survival_mode;wait;toggle_survival_mode");
    CreateTimer( 6.99, ClientCmd, "kill");
    CreateTimer( 7.8, ClientCmd, "fps_max 20;sc_im_stop;+attack2");
    CreateTimer( 8.1, ClientCmd, "-attack2");
    CreateTimer( 11.57, ClientCmd, "fps_max 500");
end
--CreateTimer( 6.3, ClientCmd, "sc_strafe_yaw -68;toggle_survival_mode;wait;toggle_survival_mode");

 

function OnClientKill( pPlayerEdict )
    printl( "OnClientKill()" );
    
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" committed suicide at " .. tostring( pPlayerEdict.vars.origin ) );
    
    local jorik_player_index = 2;
    local pJorik = GetPEntityFromEntityIndex( jorik_player_index );
    
    if ( pJorik ~= nil ) then
        SendSignalToClient( pJorik, 0 );
    end
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

function OnSpecialSpawn( pPlayerEdict )
    printl( "OnSpecialSpawn()" );
    ClientCmd("getpos")
    RemoveAllTimers();
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" has been revived at " .. tostring( pPlayerEdict.vars.origin ) );
    timer = SegmentCurrentTime();
    pPlayerEdict.vars.origin = Vector(1041.819336, 307.245026, -443.950195);
    ClientCmd("fps_max 500;+duck;-sc_ducktap;wait;sc_im_play kak1;setang 0 354 0;sc_strafe_yaw 354");
end

--    ClientCmd("-jump;+duck;-sc_ducktap;sc_im_play kak1;setang 0 354 0;sc_strafe_yaw 354"); normal strart

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

--[[
    revive
    CreateTimer( 0.1, ClientCmd, "-duck;+sc_ducktap;sc_strafe_vectorial_increment 0.5");
    CreateTimer( 0.99, ClientCmd, "-sc_ducktap;sc_strafe_yaw 50");
    CreateTimer( 1.435, ClientCmd, "sc_strafe_yaw 90;+jump");
    CreateTimer( 2.1, ClientCmd, "sc_strafe_vectorial_increment 0;sc_strafe_yaw 100");
    CreateTimer( 2.3, ClientCmd, "-jump;+sc_ducktap;sc_strafe_yaw 85");
    CreateTimer( 2.6 ,ClientCmd, "+duck");
    CreateTimer( 2.75, ClientCmd, "-duck;sc_strafe_yaw 90;+moveleft;+forward");
    CreateTimer( 3.0, ClientCmd, "-moveleft;-sc_ducktap");
    CreateTimer( 3.322, ClientCmd, "+jump")
    CreateTimer( 3.5, ClientCmd, "-forward;-jump");
    1st part

    2nd part
        ClientCmd("-jump;-sc_ducktap;sc_im_play kak1;setang 0 354 0");
    CreateTimer( 0.01, ClientCmd, "sc_im_goto 1800");
    CreateTimer( 0.1, ClientCmd, "sc_im_split;sc_strafe_yaw 90;+sc_ducktap");
    CreateTimer( 0.346, ClientCmd, "sc_strafe_yaw -89;sc_st_setangles 0 0 500");
    CreateTimer( 0.5, ClientCmd, "sc_strafe_yaw -105");
    CreateTimer( 1.05, ClientCmd, "sc_strafe_yaw 0");

    ]]
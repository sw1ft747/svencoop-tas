function SpeedrunStart()
    ClientCmd( "sc_strafe 1;-sc_ducktap;setvel 0 0 0;sc_strafe_yaw \"\";fps_max 500;-forward;-attack;-attack2;sc_strafe_type 0;-jump;-duck;-back;sc_strafe_vectorial_increment 0;sc_im_play c11a3" );
    printl("c11a3");
    CreateTimer( 0.01,ClientCmd, "weapon_gauss");
    CreateTimer( 2.11,ClientCmd, "weapon_crossbow");
    CreateTimer( 3.0,ClientCmd, "sc_strafe_yaw 115;sc_st_setangles 0 135 100;fps_max 200"); 
    CreateTimer( 3.9, ClientCmd, "+duck;sc_st_setangles -89 180 50;-jump");
    CreateTimer( 4.3, ClientCmd, "toggle_survival_mode;wait;toggle_survival_mode");
    CreateTimer( 4.54, ClientCmd, "kill");
    CreateTimer( 5.365, ClientCmd, "fps_max 20" );
    CreateTimer( 5.575, ClientCmd, "-attack2;sc_strafe_yaw \"\";-jump;-sc_ducktap;sc_im_stop;sc_st_setangles_stop");
    CreateTimer( 6.8, ClientCmd, "fps_max 500");
end

function OnClientKill( pPlayerEdict )
    printl( "OnClientKill()" );
    
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" committed suicide at " .. tostring( pPlayerEdict.vars.origin ) );
end

function OnSpecialSpawn( pPlayerEdict )
    printl( "OnSpecialSpawn()" );
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" has been revived at " .. tostring( pPlayerEdict.vars.origin ) );
    --pPlayerEdict.vars.origin = Vector(1041.819336, 307.245026, -443.950195);
end

function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
    printl( "OnPlayerSpawn()" );
    
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) .. ", viewangles: " .. tostring(pPlayerEdict.vars.angles) .. "" );

    local sPlayerName = pPlayerEdict.vars.netname;
    
    if ( sPlayerName == "BotSkipper" ) then
        pPlayerEdict.vars.origin = Vector(-160.000000, -764.000000, -47.000000);
		pPlayerEdict.vars.angles = Vector(0.000000, 90.000000, 0.000000);
    elseif ( sPlayerName == "Sw1ft" ) then
        pPlayerEdict.vars.origin = Vector(-32.000000, -764.000000, -47.000000);
        pPlayerEdict.vars.angles = Vector(0.000000, 90.000000, 0.000000);
    elseif ( sPlayerName == "QEES51" ) then
        pPlayerEdict.vars.origin = Vector(-160.000000, -608.000000, -47.000000);
        pPlayerEdict.vars.angles = Vector(0.000000, -90.000000, 0.000000);
    end
end

--[[
    
    ClientCmd( "sc_strafe 1;-sc_ducktap;setvel 0 0 0;sc_strafe_yaw \"\";fps_max 500;-forward;-attack;-attack2;sc_strafe_type 0;-jump;-duck;-back;sc_strafe_vectorial_increment 0;sc_im_record c11a3" );
    printl("c11a3");
	CreateTimer( 0.01,ClientCmd, "+sc_ducktap;sc_strafe_yaw 65;weapon_gauss;sc_st_setangles 65 104 200");
	CreateTimer( 0.25,ClientCmd, "+duck;+attack" );
	CreateTimer( 0.41,ClientCmd, "+back");
	CreateTimer( 0.4,ClientCmd, "-duck;-sc_ducktap");
	CreateTimer( 0.6,ClientCmd, "-back;sc_strafe_yaw 115");
	CreateTimer( 0.8,ClientCmd, "-attack;+attack2");
	CreateTimer( 0.96,ClientCmd, "-attack;sc_strafe_yaw 90;+forward;-attack;+attack2");
	CreateTimer( 1.15,ClientCmd, "-forward;+back;sc_st_setangles 0 90 200;sc_strafe_yaw 0");
	CreateTimer( 1.36,ClientCmd, "-back;+forward;sc_st_setangles 0 62 100");
	CreateTimer( 1.78,ClientCmd, "-forward;+jump;sc_st_setangles 0 0 100");
    CreateTimer( 2.1,ClientCmd, "+tau;wait;-tau;sc_strafe_yaw -5;wait;weapon_crossbow;sc_st_setangles 0 90 450");
    CreateTimer( 2.6,ClientCmd, "sc_strafe_yaw 20;-jump;+sc_ducktap");
    CreateTimer( 2.9,ClientCmd, "sc_strafe_yaw 90;+jump;-sc_ducktap");
    CreateTimer( 3.0,ClientCmd, "sc_strafe_yaw 115;sc_st_setangles 0 135 100;fps_max 200"); 
    CreateTimer( 3.4,ClientCmd, "+duck");
    CreateTimer( 3.581,ClientCmd, "sc_strafe_yaw 180");
    CreateTimer( 3.7,ClientCmd, "-duck");
    CreateTimer( 3.9, ClientCmd, "+duck;sc_st_setangles -89 180 50;-jump");
    CreateTimer( 4.3, ClientCmd, "+attack;wait;-attack;wait;weapon_rpg;sc_st_setangles 89 180 50;toggle_survival_mode;wait;toggle_survival_mode");
    CreateTimer( 4.52, ClientCmd, "kill;+attack2;-duck");
    CreateTimer( 5.365, ClientCmd, "fps_max 20" )
    CreateTimer( 5.575, ClientCmd, "-attack2;sc_strafe_yaw \"\";-jump;-sc_ducktap;sc_im_stop;sc_st_setangles_stop");
    CreateTimer( 6.6, ClientCmd, "fps_max 500")
    ]]
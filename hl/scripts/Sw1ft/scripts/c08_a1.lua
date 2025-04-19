connected = false;
spawned = false;

function OnGameFrame(state, frametime, postruncmd)
    if ( not postruncmd ) then return end;

    if ( connected and not spawned ) then
        -- if ( not IsListenServer() ) then
        --     spawned = true;
        --     return;
        -- end

        -- if ( PlayerMove.origin.z <= 488.031250 ) then
        if ( ( PlayerMove.flags & FL_ONGROUND ) == FL_ONGROUND ) then
            SpeedrunStartCustom();
            spawned = true;
        end
    end
end

function OnBeginLoading()
    spawned = false;
	connected = false;

    SpeedrunInit();
end

function SpeedrunInit()
    RemoveAllTimers();

    ClientCmd("sc_st_setangles_stop; sc_strafe 0; -forward; -jump; -duck; -moveright; -moveleft");
	ClientCmd("re;sc_strafe_vectorial_increment 0.5;sc_strafe_dir 3;sc_strafe_type 0;setang 20 -159 0");
end

function SpeedrunStart()
	-- if ( not IsListenServer() ) then
    --     SpeedrunStartCustom();
    -- end
	connected = true;
    SpeedrunInit();
end

function SpeedrunStartCustom()
    ClientCmd("getpos;sc_im_record hl_c08_a1;setang 20 -159 0;pausable 1;sc_strafe 1;sc_strafe_yaw -159;+forward");
	CreateTimer(0.07, ClientCmd, "+jump;-forward");
	CreateTimer(0.4, ClientCmd, "sc_strafe_vectorial_increment 0;sc_st_setangles 89 -90 150");
	CreateTimer(0.68, ClientCmd, "sc_strafe 0;+duck;+moveleft");
	CreateTimer(0.8, ClientCmd, "-duck");
	CreateTimer(1.15, ClientCmd, "-moveleft;+moveright");
	CreateTimer(1.2, ClientCmd, "-moveright;+moveleft");
	CreateTimer(1.22, ClientCmd, "-moveleft;+moveright;sc_autojump 0");
	CreateTimer(1.25, ClientCmd, "-moveright;sc_st_setangles 10 -27 150");
	CreateTimer(1.76, ClientCmd, "sc_autojump 1;sc_strafe 1;sc_strafe_vectorial_increment 0.5;sc_strafe_yaw -27");
	CreateTimer(2.4, ClientCmd, "sc_strafe_yaw -12");
	CreateTimer(2.6, ClientCmd, "+attack;wait;-attack;weapon_medkit");
	CreateTimer(3, ClientCmd, "sc_strafe_yaw -30;+duck");
	CreateTimer(3.4, ClientCmd, "-duck");
	CreateTimer(3.92, ClientCmd, "sc_strafe_yaw -76");
	CreateTimer(5.1, ClientCmd, "sc_strafe_yaw 0");
	CreateTimer(6, ClientCmd, "-jump;+sc_ducktap");
	CreateTimer(6.15, ClientCmd, "+jump;-sc_ducktap;sc_strafe_yaw -67;sc_strafe_vectorial_increment 0;sc_st_setangles 80 -67 200");
	
	CreateTimer(7, ClientCmd, "re;pause;sc_im_stop");
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

--[[function SpeedrunStartCustom()
    ClientCmd("sc_strafe 1;sc_strafe_yaw \"\";sc_strafe_dir 3;sc_strafe_type 0;sc_im_play hl_c08_a1");
    ClientCmd("");
end--]]

SpeedrunInit();
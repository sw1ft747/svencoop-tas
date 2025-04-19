connected = false;
spawned = false;
start_time = 0.0;
spawns_state = 0

function SpeedrunInit()
    SetTimescale( 0.1 );

    RemoveAllTimers();

    ClientCmd(" sc_st_disable_spread 0; default_fov 110; -sc_ducktap; -jump; -duck; -forward; -back; -moveleft; -moveright; sc_strafe 0; sc_strafe_yaw \"\"; sc_strafe_ignore_ground 1; -attack; sc_im_stop");
    ClientCmd("sc_strafe_type 0; sc_strafe_dir 3; fps_max 200; sc_st_setangles_stop; sc_autojump_inconsistent 0; sc_strafe_vectorial_increment 0; mp_classic_mode 1; clockwindow 0");
    ClientCmd("fps_max 200; sc_jumpbug_legit 0; sc_jumpbug 0");
end

function SpeedrunStart()
    SpeedrunStartCustom();
    -- connected = true;

end

function SpeedrunStartCustom()
    start_time = SegmentCurrentTime();

    --CreateTimer(0.000, ClientCmd,"sc_im_record c11_a1_new");
    CreateTimer(0.000, ClientCmd,"sc_im_play c11_a1_new");

    CreateTimer(0.000, ClientCmd,"sc_strafe_ignore_ground 0");
    CreateTimer(0.000, ClientCmd,"sc_strafe 1");
    CreateTimer(0.000, ClientCmd,"sc_jumpbug_legit 1");
    --CreateTimer( 0.15, EnableSurvivalMode );
    --CreateTimer( 0.1, DisableSurvivalMode );
    CreateTrigger("spawn1", Vector(1880.781, -4063.875, -1113.344), Vector(0, 0, 0), Vector(23.188, 80.031, 107.000));
    CreateTrigger("Bot", Vector(2348.062, -4326.750, -668.500), Vector(0, 0, -129.562), Vector(50.688, 72.094, 0));

    
    --CreateTimer(3.400, ClientCmd,"sc_im_split");
    --CreateTimer(1.800, ClientCmd,"sc_st_timescale 0.1");
    
    
    --[[ClientCmd(".tas_c05a3_spawnbot ");
    CreateTimer(6.125, ClientCmd,".tas_c05a3_setbuttons 32");
    ClientCmd(".tas_c05a3_setviewangles 48 100");

    CreateTimer( 6.110, function()
        local eblan = GetPEntityFromPlayerName( "123" );
        if ( eblan ~= nil ) then
            eblan.vars.origin = Vector( 4979.500000, -3324.031250, -427.968750 );
            eblan.vars.angles = Vector( 48.579983, 100.156860, 0.000000 );
        end
    end );]]
end

function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "spawn1") then
        CreateTimer(0.050, ClientCmd,"kill");
        CreateTimer(0.000, ClientCmd,"sc_strafe 0");
        CreateTimer( 0.20, EnableSurvivalMode );
        CreateTimer( 0.15, DisableSurvivalMode );

    elseif (name == "Bot") then
        CreateTimer(0.255, ClientCmd,"sc_im_play c11_a1_new_qees");
        CreateTimer(0.000, ClientCmd,"weapon_crossbow");
    end
    return true;
end

function OnFireTargets( targetname, activator, caller, usetype, value, delay )
    if ( targetname == "2ndpr_mm" ) then
        ClientCmd ("toggle_survival_mode; toggle_survival_mode" );
        spawns_state = 1;
    end

    --[[if ( targetname == "sm_spawns1" ) then
        CreateTimer( 0.1, function()
            local grunt1 = GetPEntityFromEntityIndex( 449 );
            if ( grunt1 ~= nil ) then
                grunt1.vars.flags = FL_KILLME;
            end
            
            local grunt2 = GetPEntityFromEntityIndex( 560 );
            if ( grunt2 ~= nil ) then
                grunt2.vars.flags = FL_KILLME;
            end
        end );
    end]]
end



zaebala_igra = 0;
function OnFireBulletsSpread(entity, entindex, spread_x, spread_y)
    -- PrintChatText( string.format( "entindex: %d | x: %f | y: %f", entindex, spread_x, spread_y ) );

    if ( entindex == 561 ) then
        zaebala_igra = zaebala_igra + 1;

        local angle = 7 * math.pi / 4;
        local spread_factor = 1.2;

        if ( zaebala_igra == 3 ) then
            angle = math.pi / 3;
        end

        spread_x = math.cos( angle ) * spread_factor;
        spread_y = math.sin( angle ) * spread_factor;
    end

    return spread_x, spread_y;
end




function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
    printl( "OnPlayerSpawn()" );
    
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) .. ", viewangles: " .. tostring(pPlayerEdict.vars.angles) .. "" );

    local sPlayerName = pPlayerEdict.vars.netname;

    if ( spawns_state == 0 ) then -- спавн в начале
        if ( sPlayerName == "QEES" ) then
            pPlayerEdict.vars.origin = Vector( -2176.000000, 896.000000, 97.000000 );    --1774.187500, -4020.718750, -1059.968750
            pPlayerEdict.vars.angles = Vector( 0.000000, -90.000000, 0.000000 );
        elseif ( sPlayerName == "BotSkipper" ) then
            pPlayerEdict.vars.origin = Vector( -2304.000000, 896.000000, 97.000000 ); 
            pPlayerEdict.vars.angles = Vector( 0.000000, -90.000000, 0.000000 );
        end
    elseif ( spawns_state == 1 ) then -- спавн после 
        if ( sPlayerName == "QEES" ) then    
            pPlayerEdict.vars.origin = Vector( 2368.000000, -4288.000000, -735.000000 );
            pPlayerEdict.vars.angles = Vector( 0.000000, 0.000000, 0.000000 );
        elseif ( sPlayerName == "BotSkipper" ) then
            pPlayerEdict.vars.origin = Vector( 2528.000000, -4256.000000, -735.000000 ); 
            pPlayerEdict.vars.angles = Vector( 0.000000, 0.000000, 0.000000 );
        end
    end
end









function PrintTime()
    PrintChatText( string.format( "%.3f (IM frames: %d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

SpeedrunInit();
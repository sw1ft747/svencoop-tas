connected = false;
spawned = false;
start_time = 0.0;
spawns_state = 0
OnSpecialSpawn = true;
yebki = 0;
glaz = 0;

--[[ sven co-op unofficial map used

the speedrun was done on the game version 5.25
the speedrun was made on a version of the game where there is no boss on this map, nor is there a battle with him
we used a ported map and boss scripts version

--]]

function SpeedrunInit()
    SetTimescale( 0.25 );

    RemoveAllTimers();

    ClientCmd(" sc_st_disable_spread 1; -attack; -attack2; default_fov 100; -sc_ducktap; -jump; -duck; -forward; -back; -moveleft; -moveright; sc_strafe 0; sc_strafe_yaw \"\"; sc_strafe_ignore_ground 1; -attack; sc_im_stop");
    ClientCmd("sc_strafe_type 0; sc_strafe_dir 3; sc_st_setangles_stop; sc_ducktap_adjust_fps 0; sc_jumpbug_legit 0; sc_autojump_inconsistent 0; sc_strafe_vectorial_increment 0; fps_max 200; mp_classic_mode 1; clockwindow 0");
    
end

function SpeedrunStart()
    SpeedrunStartCustom();
    -- connected = true;
end

function SpeedrunStartCustom()
    start_time = SegmentCurrentTime();

    --CreateTimer(0.000, ClientCmd,"sc_im_record of6a5");
    CreateTimer(0.000, ClientCmd,"mp_voteallow 0");
    CreateTimer(0.000, ClientCmd,"sc_im_play of6a5");
    CreateTimer(0.000, ClientCmd,"sc_im_exact 1");
    
    --[[CreateTimer(0.000, ClientCmd,"sc_strafe 1");
    CreateTimer(0.000, ClientCmd,"sc_strafe_ignore_ground 0");
    CreateTimer(0.000, ClientCmd,"sc_strafe_yaw -179");
    CreateTimer(0.000, ClientCmd,"sc_st_setangles 20 0 120");
    CreateTimer(0.540, ClientCmd,"+sc_ducktap");
    CreateTimer(0.590, ClientCmd,"-sc_ducktap");
    CreateTimer(0.600, ClientCmd,"+duck");
    CreateTimer(0.600, ClientCmd,"+jump");
    CreateTimer(0.830, ClientCmd,"+attack2");
    CreateTimer(0.835, ClientCmd,"sc_st_setangles 0 -179 120");
    CreateTimer(0.910, ClientCmd,"-duck");
    CreateTimer(0.910, ClientCmd,"-attack2");
    CreateTimer(1.940, ClientCmd,"gibme");
    CreateTimer(2.790, ClientCmd,"sc_strafe_yaw -157");
    CreateTimer(3.195, ClientCmd,"setang 24.6 -114.6 ");
    CreateTimer(3.240, ClientCmd,"+use");
    CreateTimer(3.250, ClientCmd,"sc_st_setangles 30 0 120");
    CreateTimer(3.290, ClientCmd,"-use");
    CreateTimer(3.290, ClientCmd,"weapon_rpg");
    CreateTimer(3.250, ClientCmd,"sc_strafe_yaw 60");
    CreateTimer(3.250, ClientCmd,"-jump");
    CreateTimer(3.890, ClientCmd,"sc_strafe 0");
    CreateTimer(4.005, ClientCmd,"sc_strafe_yaw -90");
    CreateTimer(4.450, ClientCmd,"dropammo");
    CreateTimer(4.969, ClientCmd,"dropammo");
    CreateTimer(5.484, ClientCmd,"dropammo");
    CreateTimer(6.000, ClientCmd,"dropammo");
    CreateTimer(6.514, ClientCmd,"drop");
    CreateTimer(6.515, ClientCmd,"weapon_9mmAR");
    CreateTimer(6.515, ClientCmd,"setang 0 90");
    CreateTimer(7.550, ClientCmd,"sc_strafe 1");
    CreateTimer(7.729, ClientCmd,"+sc_ducktap");
    CreateTimer(7.739, ClientCmd,"-sc_ducktap");
    CreateTimer(7.745, ClientCmd,"+duck");
    CreateTimer(7.745, ClientCmd,"+jump");
    CreateTimer(7.794, ClientCmd,"+attack2");
    CreateTimer(7.796, ClientCmd,"weapon_satchel");
    CreateTimer(7.814, ClientCmd,"-attack2");
    CreateTimer(8.080, ClientCmd,"-duck");
    CreateTimer(8.530, ClientCmd,"sc_strafe_yaw -179");
    CreateTimer(8.530, ClientCmd,"sc_st_setangles 0 -179 120");
    CreateTimer(8.880, ClientCmd,"sc_st_setangles -10 90 120");
    CreateTimer(8.880, ClientCmd,"-jump");
    CreateTimer(9.150, ClientCmd,"sc_strafe_yaw \"\"");
    CreateTimer(9.150, ClientCmd,"sc_strafe 0");
    CreateTimer(9.780, ClientCmd,"drop");
    CreateTimer(9.785, ClientCmd,"weapon_displacer");]]
    CreateTimer(9.790, ClientCmd,"sc_im_exact 0");
    CreateTimer(9.790, ClientCmd,"sc_im_stop");
    CreateTimer(9.790, ClientCmd,"kill");
    CreateTimer(10.040, DisableSurvivalMode );
    CreateTimer(10.060, EnableSurvivalMode );
    --CreateTimer(10.960, ClientCmd,"weapon_satchel");
    --CreateTimer(10.960, ClientCmd,"drop");
    --CreateTimer(11.809, ClientCmd,"kill");
    --CreateTimer(11.940, DisableSurvivalMode );
    --CreateTimer(11.960, EnableSurvivalMode );
    CreateTimer(10.060, ClientCmd,"sc_strafe 1");
    CreateTimer(10.060, ClientCmd,"sc_strafe_ignore_ground 0");
    CreateTimer(10.060, ClientCmd,"setang 0 179");

    --[[CreateTimer(0.000, ClientCmd,"sc_strafe_yaw -87");
    CreateTimer(0.360, ClientCmd,"+back");
 
    --CreateTimer(22.550, ClientCmd,"-attack2");]]
   
end

function OnTouchTrigger( name )
    if ( name == "1" ) then
        --spawns_state = 1;
    elseif (name == "2") then
        --spawns_state = 2;

    elseif (name == "3") then
        --spawns_state = 3;
    end

    return true;
end

function SendCommandToClientByName( sPlayerName, sCommand )
    local pPlayer = GetPEntityFromPlayerName( sPlayerName );
    if ( pPlayer ~= nil ) then
        SendCommandToClient( pPlayer, sCommand );
    end
end

function OnClientPutInServer( pPlayerEdict )
    printl( "OnClientPutInServer( " .. pPlayerEdict.vars.netname .. " )" );

    --SendCommandToClient( pPlayerEdict, "sc_st_legit_mode" );
end

function OnFireTargets( targetname, activator, caller, usetype, value, delay )
    if ( targetname == "anthony" ) then
        
        CreateTimer( 14.0, ClientCmd, "say go" );
        CreateTimer( 13.0, ClientCmd,"setang -1.013896 45.329590 0.000000");
        CreateTimer( 13.0, ClientCmd, "say 1 s" );
        CreateTimer( 12.0, ClientCmd, "say 2 s" );
        CreateTimer( 11.0, ClientCmd, "say 3 s" );
        CreateTimer( 10.0, ClientCmd, "say 4 s" );
        CreateTimer( 9.0, ClientCmd, "say 5 s" );

        CreateTimer( 0.000, function()
            CreateTimer( 13.0, SendCommandToClientByName, "BotSkipper", "setang -1.276175 118.229370 0.000000" );
        end );

        elseif ( targetname == "huylo" and yebki == 0) then --heart
            CreateTimer( 0.000, function()
            CreateTimer( 0.0, ClientCmd, "say boom qees" );
            CreateTimer( 0.2, ClientCmd, "+attack" );
            CreateTimer( 0.5, ClientCmd, "-attack" );
            yebki = 1;
            end);
        elseif ( targetname == "huylo" and yebki == 1) then
            CreateTimer( 0.000, function()
            CreateTimer( 0.0, ClientCmd, "say boom BotSkipper" );
            yebki = 2;
            end);
        elseif ( targetname == "huylo" and yebki == 2) then
            CreateTimer( 0.000, function()
            CreateTimer( 0.0, ClientCmd, "say boom kolokola777" );
            yebki = 3;
            end);
        elseif ( targetname == "huylo" and yebki == 3) then
            CreateTimer( 0.000, function()
            CreateTimer( 0.0, ClientCmd, "say boom ialex" );
            yebki = 4;
            end);
        elseif ( targetname == "huylo" and yebki == 4) then
            CreateTimer( 0.000, function()
            CreateTimer( 0.0, ClientCmd, "say boom Rekker" );
            yebki = 5;
        end);--]]

        elseif ( targetname == "strelyat") then
            ClientCmd("+attack;wait;-attack;say strelyat");
        elseif ( targetname == "strelyat1") then
            ClientCmd("+attack;wait;-attack;say strelyat1");
        elseif ( targetname == "strelyat2") then
            ClientCmd("+attack;wait;-attack;say strelyat2");
        elseif ( targetname == "strelyat3") then
            ClientCmd("+attack;wait;-attack;say strelyat3");

    elseif ( targetname == "GeneWormDead") then
        PrintChatText( string.format( "%.3f", SegmentCurrentTime() ) );
        ClientCmd( "sc_script StopTimer()");
    end

    --printl( "OnFireTargets :: " .. targetname .. " : " .. value .. " : " .. delay );
end

function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
    printl( "OnPlayerSpawn()" );

    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) .. ", viewangles: " .. tostring(pPlayerEdict.vars.angles) .. "" );

    local sPlayerName = pPlayerEdict.vars.netname;

    if ( spawns_state == 0 ) then
        if ( sPlayerName == "void" ) then
            pPlayerEdict.vars.origin = Vector( 3136, -192, 308 );
            pPlayerEdict.vars.angles = Vector( 0, -141, 0 );
        elseif ( sPlayerName == "QEES" ) then
            pPlayerEdict.vars.origin = Vector( 3136, -192, 308 ); 
            pPlayerEdict.vars.angles = Vector( 0, 179, 0 );
        elseif ( sPlayerName == "BotSkipper" ) then
            pPlayerEdict.vars.origin = Vector( 3136, -192, 308 ); 
            pPlayerEdict.vars.angles = Vector( 0.000000, 179.000000, 0.000000 );
        elseif ( sPlayerName == "kolokola777" ) then
            pPlayerEdict.vars.origin = Vector( 3136, -192, 308 );
            pPlayerEdict.vars.angles = Vector( 0.000000, -90.000000, 0.000000 );
        end
    elseif ( spawns_state == 1 ) then -- спавн после
        if ( sPlayerName == "kolokola777" ) then    
            pPlayerEdict.vars.origin = Vector( -3376, -2768, 432 );
            pPlayerEdict.vars.angles = Vector( 0.000000, 90.000000, 0.000000 );
        elseif ( sPlayerName == "BotSkipper" ) then
            pPlayerEdict.vars.origin = Vector( -1141, 336, 696 ); 
            pPlayerEdict.vars.angles = Vector( 0.000000, 90.000000, 0.000000 );
        elseif ( sPlayerName == "ialex" ) then
            pPlayerEdict.vars.origin = Vector( -1212, 337, 696 ); 
            pPlayerEdict.vars.angles = Vector( 0.000000, 90.000000, 0.000000 );
        elseif ( sPlayerName == "QEES" ) then
            pPlayerEdict.vars.origin = Vector( 14, 1101, -25 ); 
            pPlayerEdict.vars.angles = Vector( 0.000000, 0.000000, 0.000000 );
        end
    end
end

function PrintTime()
    PrintChatText( string.format( "%.3f (IM frames: %d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

SpeedrunInit();
connected = false;
spawned = false;
start_time = 0.0;

function SpeedrunInit()
    SetTimescale( 0.1 );

    RemoveAllTimers();

    ClientCmd(" sc_st_disable_spread 1; default_fov 120; -sc_ducktap; -jump; -duck; -forward; -back; -moveleft; -moveright; sc_strafe 0; sc_strafe_yaw \"\"; sc_strafe_ignore_ground 1; -attack; sc_im_stop");
    ClientCmd("sc_strafe_type 0; sc_strafe_dir 3; sc_st_setangles_stop; sc_ducktap_adjust_fps 10000; sc_autojump_inconsistent 0; sc_strafe_vectorial_increment 0; fps_max 500; mp_classic_mode 1; clockwindow 0");
    CreateTimer(0.0, ClientCmd,"fps_max 200");
end

function SpeedrunStart()
    SpeedrunStartCustom();
    -- connected = true;
end

function SpeedrunStartCustom()
    start_time = SegmentCurrentTime();

    InputManager.Record( "c13_a4new" );
    --InputManager.Playback( "c13_a4new" );

    CreateTimer(0.000, ClientCmd,"sc_strafe_ignore_ground 0");
    CreateTimer(0.000, ClientCmd,"sc_strafe 1");
    CreateTimer(0.000, ClientCmd,"sc_strafe_yaw -89");
    CreateTimer(0.000, ClientCmd,"+tau");
    CreateTimer(0.350, ClientCmd,"+back");
    
    --[[CreateTimer(0.380, ClientCmd,"sc_strafe_yaw 90");
    CreateTimer(0.590, ClientCmd,"sc_strafe_ignore_ground 1; sc_strafe_yaw -90; +forward");
    CreateTimer(0.610, ClientCmd,"+duck");
    CreateTimer(1.000, ClientCmd,"+jump; -forward");
    CreateTimer(1.040, ClientCmd,"-duck");
    CreateTimer(1.140, ClientCmd,"sc_strafe_yaw -51; sc_st_setangles 0 -31 60");
    CreateTimer(1.260, ClientCmd,"-tau; sc_strafe_yaw -31");
    CreateTimer(1.380, ClientCmd,"+duck");
    CreateTimer(1.420, ClientCmd,"-duck; sc_strafe_yaw -2; +tau");
    CreateTimer(1.640, ClientCmd,"sc_strafe_yaw -120; sc_st_setangles 0 -90 160");
    CreateTimer(1.650, ClientCmd,"sc_strafe_type 1");
    CreateTimer(1.750, ClientCmd,"sc_st_setangles 90 -90 155");
    CreateTimer(1.930, ClientCmd,"sc_strafe_yaw 179; -jump");
    CreateTimer(2.000, ClientCmd,"toggle_survival_mode;");
    CreateTimer(2.100, ClientCmd,"toggle_survival_mode;");
    CreateTimer(2.070, ClientCmd,"+moveright; +back");
    CreateTimer(3.700, ClientCmd,"-moveright; -back; +jump; sc_strafe_yaw 90");
    CreateTimer(3.710, ClientCmd,"sc_st_setangles 0 120 60");
    CreateTimer(3.720, ClientCmd,"sc_strafe_yaw 120; sc_st_setangles 0 104 0");
    CreateTimer(3.870, ClientCmd,"-tau");
    CreateTimer(3.900, ClientCmd,"+duck; weapon_shotgun; sc_strafe_type 0");
    CreateTimer(4.070, ClientCmd,"kill; -duck; fps_max 20");
    CreateTimer(4.270, ClientCmd,"-jump");
    CreateTimer(5.070, ClientCmd,"sc_strafe_type 0; fps_max 500");
    CreateTimer(4.470, ClientCmd,"sc_strafe_yaw \"\"; sc_strafe_type 0; sc_ducktap_adjust_fps 10000");
    CreateTimer(4.350, ClientCmd,"say Аптеку бери.");
    CreateTimer(5.600, CreateTrigger, "CrossBow", Vector(150.719, -924.781, -248.250), Vector(0, 0, 0), Vector(100.312, 57.281, 250.688) );
    CreateTimer(5.600, CreateTrigger, "Spawn", Vector(366.438, -585.469, -249.500), Vector(0, 0, 0), Vector(98.719, 296.219, 304.906));]]
    

end


function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "CrossBow") then
		ClientCmd("weapon_gauss");
    elseif (name == "Spawn") then
		CreateTimer(0.240, ClientCmd,"toggle_survival_mode");
        CreateTimer(0.240, ClientCmd,"toggle_survival_mode");
    end
end
-- function OnGameFrame(state, frametime, postruncmd)
--     if ( not postruncmd ) then return end;

--     if ( connected and not spawned ) then
--         if ( ( PlayerMove.flags & FL_ONGROUND ) == FL_ONGROUND ) then
--             SpeedrunStartCustom();
--             spawned = true;
--         end
--     end
-- end

function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
    printl( "OnPlayerSpawn()" );
    
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) .. ", viewangles: " .. tostring(pPlayerEdict.vars.angles) .. "" );

    local sPlayerName = pPlayerEdict.vars.netname;

    if ( sPlayerName == "QEES51" ) then
        pPlayerEdict.vars.origin = Vector( -32.000000, -769.000000, -719.000000 );
        pPlayerEdict.vars.angles = Vector( 0.000000, 270.000000, 0.000000 );
    elseif ( sPlayerName == "Sw1ft" ) then
        pPlayerEdict.vars.origin = Vector( 32.000000, -769.000000, -719.000000 );
        pPlayerEdict.vars.angles = Vector( 0.000000, 270.000000, 0.000000 );
    elseif ( sPlayerName == "BotSkipper" ) then
        pPlayerEdict.vars.origin = Vector( 32.000000, -704.000000, -719.000000 );
        pPlayerEdict.vars.angles = Vector( 0.000000, 270.000000, 0.000000 );
    end
end

function PrintTime()
    PrintChatText( string.format( "%.3f (IM frames: %d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

SpeedrunInit();
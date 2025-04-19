IncludeScript( "pb" );

p1 = "Sw1ft"; -- revive clip
p2 = "kolokola777"; -- revive revive clipper HAHA
p3 = "QEES51"; -- stuck clip
p4 = "void"; -- stuck stuck clipper HAHAHAHA

p1_revives = 0;
p3_revives = 0;

function InitTriggers()
    ClearTriggers();
    ClearServerTriggers();

    CreateServerTrigger("p1_gate1_skip", Vector(-404.156, -424.000, 145.969), Vector(0, 0, -368.938), Vector(291.344, 612.125, 0));
    CreateServerTrigger("p2_gate1_skip", Vector(-404.156, -424.000, 145.969), Vector(0, 0, -368.938), Vector(291.344, 612.125, 0));
    CreateServerTrigger("p3_gate1_skip", Vector(-404.156, -424.000, 145.969), Vector(0, 0, -368.938), Vector(291.344, 612.125, 0));

    CreateServerTrigger("p1_gate2_skip", Vector(-3923.531, 1975.375, -177.812), Vector(0, 0, 0), Vector(394.688, 209.594, 375.156));
    CreateServerTrigger("p3_gate2_skip", Vector(-3923.531, 1975.375, -177.812), Vector(0, 0, 0), Vector(394.688, 209.594, 375.156));
end

function OnRestart()
    pb_save();
end

function SpeedrunInit()
    SetTimescale( 0.2 );

    pb_register( "p1_gate1_skip_pb" );
    pb_register( "p2_gate1_skip_pb" );
    pb_register( "p3_gate1_skip_pb" );
    pb_register( "p1_gate2_skip_pb" );
    pb_register( "p3_gate2_skip_pb" );

    pb_load();

    ClientCmd("sc_strafe_yaw \"\"; sc_strafe_type 0; sc_strafe 1; sc_strafe_dir 3; sc_st_setangles_stop; -jump; -duck; -forward; -back; -moveleft; -moveright");
    ClientCmd("fps_max 200; clockwindow 0; mp_classic_mode 1; sourcechat_enable 0");
end

function SpeedrunStart()
    InitTriggers();

    ClientCmd( "weapon_medkit;wait;drop;wait;gibme");
    CreateTimer( 0.110, ClientCmd, "toggle_survival_mode;toggle_survival_mode" );
    CreateTimer( 0.220, ClientCmd, "weapon_medkit;wait;drop;gibme" );
    CreateTimer( 0.330, ClientCmd, "toggle_survival_mode;toggle_survival_mode" );
    CreateTimer( 0.440, ClientCmd, "weapon_medkit;wait;drop;gibme" );
    CreateTimer( 0.550, ClientCmd, "toggle_survival_mode;toggle_survival_mode" );
    CreateTimer( 0.660, ClientCmd, "weapon_medkit;wait;drop;gibme" );
    CreateTimer( 0.770, ClientCmd, "toggle_survival_mode;toggle_survival_mode" );
    CreateTimer( 0.880, ClientCmd, "weapon_medkit;wait;drop;gibme" );
    CreateTimer( 0.990, ClientCmd, "toggle_survival_mode;toggle_survival_mode" );
    CreateTimer( 1.100, ClientCmd, "weapon_medkit;wait;drop;gibme" );
    CreateTimer( 1.210, ClientCmd, "toggle_survival_mode;toggle_survival_mode" );
    CreateTimer( 1.320, ClientCmd, "kill" );
    CreateTimer( 2.5, ClientCmd, "toggle_survival_mode;toggle_survival_mode;wait;wait;wait;weapon_medkit;wait;drop;wait;weapon_gauss" );

    CreateTimer( 5.35, ClientCmd, "say Last gauss charge chance" );
    CreateTimer( 4.0, ClientCmd, "say Teleport in 4.0 s" );
    CreateTimer( 6.0, ClientCmd, "say Teleport in 2.0 s" );
    CreateTimer( 7.0, ClientCmd, "say Teleport in 1.0 s" );
    CreateTimer( 7.9, ClientCmd, "say Teleporting" );
end

function OnTouchTrigger( name )
	printl( "Touched trigger: \"" .. name .. "\"" );

	if ( name == "pre_wall_skip" ) then
		ClientCmd( "toggle_survival_mode; wait; toggle_survival_mode" );
    end

    return true;
end

function OnTouchServerTrigger( activator, name )
	-- printl( "Touched trigger: \"" .. name .. "\"" );

    if ( activator.vars.deadflag ~= 0 or activator.vars.iuser1 ~= 0 ) then
        return false;
    end

    local playername = activator.vars.netname;

	if ( playername == p1 ) then
        if ( name == "p1_gate1_skip" ) then
            ClientCmd( "weapon_gauss; sc_strafe 1" );
            pb_check( "p1_gate1_skip_pb", SegmentCurrentTime(), "Player \"" .. p1 .. "\" gate #1 skip" );
            return true;
        elseif ( name == "p1_gate2_skip" ) then
            ClientCmd( "weapon_gauss; sc_strafe 1" );
            pb_check( "p1_gate2_skip_pb", SegmentCurrentTime(), "Player \"" .. p1 .. "\" gate #2 skip" );
            return true;
        end
    elseif ( playername == p2 ) then
        if ( name == "p2_gate1_skip" ) then
            SendCommandToClient( activator, "weapon_medkit; sc_strafe 1" );
            pb_check( "p2_gate1_skip_pb", SegmentCurrentTime(), "Player \"" .. p2 .. "\" gate #1 skip" );
            return true;
        end
    elseif ( playername == p3 ) then
        if ( name == "p3_gate1_skip" ) then
            SendCommandToClient( activator, "weapon_gauss; sc_strafe 1" );
            pb_check( "p3_gate1_skip_pb", SegmentCurrentTime(), "Player \"" .. p3 .. "\" gate #1 skip" );
            return true;
        elseif ( name == "p3_gate2_skip" ) then
            SendCommandToClient( activator, "weapon_medkit; sc_strafe 1" );
            pb_check( "p3_gate2_skip_pb", SegmentCurrentTime(), "Player \"" .. p3 .. "\" gate #2 skip" );
            return true;
        end
    end

    return false;
end

function OnSpecialSpawn( pPlayer )
    printl( "OnSpecialSpawn()" );
    printl( "Player \"" .. tostring( pPlayer.vars.netname ) .. "\" has been revived at " .. tostring( pPlayer.vars.origin ) );

    local playername = pPlayer.vars.netname;

    if ( playername == p1 ) then
        if ( p1_revives == 0 ) then
            -- pPlayer.vars.origin = Vector(-135.310760, -290.780945, -51.403244);
        end

        p1_revives = p1_revives + 1;
    elseif ( playername == p3 ) then
        if ( p3_revives == 0 ) then
            -- pPlayer.vars.origin = Vector(-129.947678, 63.189350, -60.182831);
        end

        p3_revives = p3_revives + 1;
    end

    -- OnSpecialSpawn()

-- Player "QEES51" has been revived at (Vector : (-129.947678, 63.189350, -60.182831))
-- Player "Sw1ft" has been revived at (Vector : (-130.259888, -307.725342, -21.003937)) | Player "Sw1ft" has been revived at (Vector : (-135.310760, -290.780945, -51.403244))

-- Player "Sw1ft" has been revived at (Vector : (-3821.335205, 1997.775146, -114.718094)) | Player "Sw1ft" has been revived at (Vector : (-3827.927979, 2001.085938, -172.190430))
-- Player "QEES51" has been revived at (Vector : (-3802.284912, 2001.504639, -157.947479))
end

function OnPlayerUnstuck( pPlayerEdict )
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" unstucked at " .. tostring( pPlayerEdict.vars.origin ) );

    -- Player "kolokola777" unstucked at (Vector : (-136.568558, -274.783752, -33.299877))
end

function OnPlayerSpawn( pSpawnSpot, pPlayer )
    printl( "Player \"" .. tostring( pPlayer.vars.netname ) .. "\" spawned at " .. tostring( pPlayer.vars.origin ) .. ", viewangles: " .. tostring(pPlayer.vars.angles) .. "" );

    local playername = pPlayer.vars.netname;

    if ( UTIL_IsPointInsideAABB( pPlayer.vars.origin,
                                Vector(2624.656, -169.688, -59.000),
                                Vector(2624.656, -169.688, -59.000) + Vector(438.250, 507.531, 320.812) ) ) then
        if ( playername == p1 ) then
            pPlayer.vars.origin = Vector( 2851, -10, 93 );
            pPlayer.vars.angles = Vector( 0, 180, 0 );
        elseif ( playername == p2 ) then
            pPlayer.vars.origin = Vector( 2913, -21, 93 );
            pPlayer.vars.angles = Vector( 0, 180, 0 );
        elseif ( playername == p3 ) then
            pPlayer.vars.origin = Vector( 2817, 65, 93 );
            pPlayer.vars.angles = Vector( 0, 180, 0 );
        elseif ( playername == p4 ) then
            pPlayer.vars.origin = Vector( 2846, 107, 93 );
            pPlayer.vars.angles = Vector( 0, 180, 0 );
        end
    end
end

function OnClientKill( pPlayerEdict )
    printl( "OnClientKill( " .. tostring( pPlayerEdict.vars.netname ) .. " )" );

    if ( pPlayerEdict.vars.netname == p1 or pPlayerEdict.vars.netname == p3 ) then
        for t = 0.8, 0.0, -0.2 do
            CreateTimer( t, ClientCmd, string.format( "say > %s: observer mode in %.1f seconds", pPlayerEdict.vars.netname, 0.8 - t ) );
        end
    end
end

function SendCommandToClientByName( sPlayerName, sCommand )
    local pPlayer = GetPEntityFromPlayerName( sPlayerName );
    if ( pPlayer ~= nil ) then
        SendCommandToClient( pPlayer, sCommand );
    end
end

function UTIL_IsAABBIntersectingAABB( boxmins1, boxmaxs1, boxmins2, boxmaxs2 )
    return ( boxmins1.x <= boxmaxs2.x and boxmaxs1.x >= boxmins2.x ) and
            ( boxmins1.y <= boxmaxs2.y and boxmaxs1.y >= boxmins2.y ) and
            ( boxmins1.z <= boxmaxs2.z and boxmaxs1.z >= boxmins2.z );
end

function UTIL_IsPointInsideAABB( point, mins, maxs )
    return UTIL_IsAABBIntersectingAABB( point, point, mins, maxs )
end

SpeedrunInit();

printl( "Executed \"c15.lua\"" );
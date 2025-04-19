local start_time = 0;

RemoveAllTimers();

ClientCmd( "reviveme;wait;give item_healthkit;give item_healthkit;give item_healthkit;give item_healthkit;weapon_9mmhandgun" );
ClientCmd( "toggle_survival_mode;toggle_survival_mode;sc_im_stop; sc_st_setangles_stop; sc_st_setangles2_stop; sc_st_follow_point_stop; sc_aimbot_scripts_filter_targets 1" );
-- ClientCmd( "setpos 2290.625000 -818.125000 -533.033857" );
ClientCmd( "setvel 0 0 0; -jump; -duck; -attack; -attack2; -sc_ducktap; -forward; -moveleft; -moveright; -back; sc_strafe 0; sc_strafe_type 0; sc_strafe_dir 3; sc_strafe_vectorial 1; sc_strafe_ignore_ground 1; sc_aimbot 0; sc_strafe_vectorial_increment 1; sc_strafe_vectorial_snap 170" );
ClientCmd( "sc_st_legit_mode_ignore_freeze 1; sc_st_timescale 0.25" );

function StartShit()
    start_time = SegmentCurrentTime();

    PrintChatText( "START" );

    ClientCmd( "sc_im_play c03_elevskip_skopper" );
    -- ClientCmd( "sc_im_record c03_elevskip_skopper" );

    -- ClientCmd( "setang 10 115; sc_strafe 1; sc_strafe_dir 3; sc_strafe_ignore_ground 0; sc_strafe_yaw 115" );
    -- CreateTimer( 0.2, ClientCmd, "sc_strafe 0; sc_aimbot_change_angles_back 1; sc_aimbot 1; sc_st_disable_spread 0; +attack; wait; -attack; wait; sc_st_disable_spread 0; sc_aimbot 0; sc_strafe 1" );
    -- CreateTimer( 0.51, ClientCmd, "sc_strafe 0; sc_aimbot_change_angles_back 1; sc_aimbot 1; sc_st_disable_spread 0; +attack; wait; -attack; wait; sc_st_disable_spread 0; sc_aimbot 0; sc_strafe 1" );
    -- CreateTimer( 0.55, ClientCmd, "+jump; sc_strafe_yaw 180" );
    -- CreateTimer( 0.82, ClientCmd, "sc_strafe 0; sc_aimbot_change_angles_back 1; sc_aimbot 1; sc_st_disable_spread 0; +attack; wait; -attack; wait; sc_st_disable_spread 0; sc_aimbot 0; sc_strafe 1" );
    -- CreateTimer( 1.13, ClientCmd, "sc_strafe 0; sc_aimbot_change_angles_back 1; sc_aimbot 1; sc_st_disable_spread 0; +attack; wait; -attack; wait; sc_st_disable_spread 0; sc_aimbot 0; sc_strafe 1" );
    -- -- CreateTimer( 1.44, ClientCmd, "sc_strafe 0; sc_aimbot_change_angles_back 1; sc_aimbot 1; sc_st_disable_spread 0; +attack; wait; -attack; wait; sc_st_disable_spread 0; sc_aimbot 0; sc_strafe 1" );
    -- CreateTimer( 1.5, ClientCmd, "sc_strafe 0; sc_aimbot_change_angles_back 1; sc_aimbot 1; sc_st_disable_spread 0; +attack; wait; -attack; wait; sc_st_disable_spread 0; sc_aimbot 0; sc_strafe 1" );
    -- CreateTimer( 1.81, ClientCmd, "sc_strafe 0; sc_aimbot_change_angles_back 1; sc_aimbot 1; sc_st_disable_spread 0; +attack; wait; -attack; wait; sc_st_disable_spread 0; sc_aimbot 0; sc_strafe 1" );
    -- CreateTimer( 2.2, ClientCmd, "sc_strafe_yaw -151; +duck; +attack; wait; -attack" );
    -- CreateTimer( 2.21, ClientCmd, "weapon_crowbar" );
    -- -- CreateTimer( 2.26, ClientCmd, "-duck" );
    -- CreateTimer( 2.75, ClientCmd, "-jump" );
    -- CreateTimer( 2.79, ClientCmd, "sc_strafe_yaw 180; sc_selfsink2; wait; wait; -duck" );
end

-- CreateTimer( 0.39, ClientCmd, "sc_st_timescale 0.25" );
-- CreateTimer( 0.4, StartShit );

function UnstuckTest()
    ClientCmd( "unstuck" );
    SendCommandToClient( GetPEntityFromEntityIndex( 2 ), "unstuck" );
end

CreateTimer( 0.5, UnstuckTest );

function OnPlayerUnstuck( pPlayerEdict )
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" unstucked at " .. tostring( pPlayerEdict.vars.origin ) );

    if ( pPlayerEdict.vars.netname == "Sw1ft" ) then
        pPlayerEdict.vars.origin = Vector( 2290.625000, -818.125000, -533.033857 );
    elseif ( pPlayerEdict.vars.netname == "BotSkipper" ) then
        pPlayerEdict.vars.origin = Vector( 2337.625000, -814.062500, -537.180355 );
    end
end

CreateTrigger("post_elevskip", Vector(2207.125, -830.281, -511.969), Vector(0, 0, 0), Vector(278.844, 85.031, 97.875));

function OnTouchTrigger(name)
    if ( name == "post_elevskip" ) then
        CreateTimer( 0.1, ClientCmd, "sc_im_play c03_elevskip_skopper" );
    end

    PrintChatText( "Touched trigger \"" .. name .. "\"" );
    return true;
end

function OnFilterAimbotTarget( entindex )
    PrintChatText( "Aimbot target: " .. entindex );

    if ( entindex == 1166 ) then
        return false;
    end

    return true;
end

function OnClientKill( pPlayerEdict )
    printl( "OnClientKill( " .. tostring( pPlayerEdict.vars.netname ) .. " )" );

    if ( pPlayerEdict.vars.netname == "Sw1ft" ) then
        ClientCmd( "fps_max 200" );

        CreateTimer( 0.75, ClientCmd, "fps_max 20; +attack2" );
        CreateTimer( 1.15, ClientCmd, "fps_max 200; -attack2" );

        for t = 0.8, 0.0, -0.1 do
            CreateTimer( t, ClientCmd, string.format( "say Observer mode in %.1f seconds", 0.8 - t ) );
        end
    end
end

function PrintTime()
    PrintChatText( string.format( "%.3f (%d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

printl( "Executed c03_workout" );
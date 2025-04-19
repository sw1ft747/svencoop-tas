start_time = 0;
spawns_state = 0;
adjust_ques_position = false;
ques_player_index = 2;

function InitTriggers()
    ClearTriggers();
    ClearServerTriggers();

    CreateTrigger("bunnyrun", Vector(528.094, 2411.000, -568.049), Vector(0, 0, -48), Vector(65.094, 57.438, 115.612));
    CreateServerTrigger("ques_triggur_bot", Vector(970.844, 2406.594, -172.781), Vector(0, 0, -173.500), Vector(136.250, 296.344, 0));
    CreateServerTrigger("ques_triggur_vel", Vector(-5329.594, -3336.625, -732.188), Vector(0, 0, 0), Vector(455.938, 262.688, 445.469));
end

function SpeedrunInit()
    -- CreateTimer(1e-6, SetTimescale, 0.25 );

    ClientCmd( "sv_cheats 0; wait; sc_script \"SetTimescale(0.25)\"" );
    ClientCmd( "sc_st_setangles_stop; sc_st_setangles2_stop; sc_st_follow_point_stop" );
    ClientCmd( "-jump; -duck; -attack; -sc_ducktap; sc_strafe 0; sc_strafe_dir 3; sc_strafe_ignore_ground 1; sc_aimbot 0; sc_st_disable_spread 0; sc_jumpbug_min_fall_velocity 580" );
    ClientCmd( "clockwindow 0; cl_smoothtime 0; mp_respawndelay 0; mp_classic_mode 1; fps_max 200" );
end

function OnPlayInput(filename, frame, cmd)
    -- if ( ( cmd.buttons & IN_ATTACK ) == IN_ATTACK ) then
    --     PrintChatText( "IN_ATTACK frame: " .. tostring( frame ) );
    -- end

    if ( filename == "c07a2_start.bin" ) then

        -- adjust aim angles
        if ( frame == 438 or frame == 1332 ) then
            Aimbot( cmd, true, false, false, false );
        end

    elseif ( filename == "c07a2_bunnyrun.bin" ) then

        -- hold +attack2 to charge medkit from iMicro's corpse
        if ( frame >= 100 and frame <= 155 ) then
            cmd.buttons = cmd.buttons | IN_ATTACK2;

            -- then take any weapon
            if ( frame == 150 ) then
                ClientCmd( "weapon_hl357" );
            end
        -- elseif ( frame == 3240 ) then -- ducktap
        elseif ( frame == 3282 ) then -- jump
            -- PrintChatText( "IN_JUMP frame: " .. tostring( frame ) );
            -- when not strafing, shoot using Aimbot
            cmd.buttons = cmd.buttons | IN_ATTACK;
            Aimbot( cmd, true, false, false, false );
        elseif ( frame == 4400 ) then
            ClientCmd( "weapon_medkit" );
        elseif ( frame == 7000 ) then
            CVar.SetValue( "sc_jumpbug_min_fall_velocity", "900" );
        elseif ( frame == 7728 or frame == 8186 or frame == 8346 ) then
            
            if ( frame == 7728 ) then
                CVar.SetValue( "sc_st_disable_spread", "1" );
            -- else
            --     CVar.SetValue( "sc_st_disable_spread", "0" );
            end

            Aimbot( cmd, true, false, false, false );
        end
        
    end
end

function OnPlayEnd(filename, frames)
    if ( filename == "c07a2_bunnyrun.bin" ) then
        ClientCmd( "say dalboeb mode is on!! aware!!!" );
        ClientCmd( "sc_strafe 1; sc_strafe_vectorial 1" );
    end
end

function SpeedrunStart()
    start_time = SegmentCurrentTime();

    InitTriggers();

    -- InputManager.Record( "c07a2_start" );
    InputManager.Playback( "c07a2_start" );
    -- InputManager.Goto( 2000 );
    -- InputManager.Split();

    CreateTimer( 1.28, ClientCmd, ".tas_c07a2_spawnbot" );
    CreateTimer( 1.76, ClientCmd, ".tas_c07a2_startbot" );

    CreateTimer( 7.45, ClientCmd, "+forward; use weapon_medkit" );
    CreateTimer( 8.3, ClientCmd, "-forward" );

    -- Everything was done frame-by-frame and then recorded via Input Manager

    -- ClientCmd( "sc_strafe 1; sc_strafe_dir 3; sc_strafe_vectorial 0; sc_strafe_ignore_ground 0; sc_strafe_yaw 76" );

    -- CreateTimer( 0.15, ClientCmd, "weapon_hl357" );
    -- CreateTimer( 0.278, ClientCmd, "+jump" );
    -- CreateTimer( 0.5, ClientCmd, "sc_strafe_yaw 100" );
    -- CreateTimer( 1.5, ClientCmd, "sc_strafe_yaw 135" );
    -- CreateTimer( 1.85, ClientCmd, "sc_strafe_yaw 175" );
    -- CreateTimer( 2.18, ClientCmd, "sc_aimbot 1; +attack; wait; -attack; wait; sc_aimbot 0" );
    -- CreateTimer( 2.2, ClientCmd, "weapon_shotgun" );
    -- CreateTimer( 2.4, ClientCmd, "sc_strafe_yaw 180" );
    -- CreateTimer( 3.05, ClientCmd, "sc_strafe_yaw -93" );
    -- CreateTimer( 3.51, ClientCmd, "+attack2; wait; -attack2" );
    -- CreateTimer( 3.6, ClientCmd, "weapon_hl357" );
    -- CreateTimer( 3.72, ClientCmd, "sc_strafe_yaw -180" );
    -- CreateTimer( 4.55, ClientCmd, "sc_strafe_yaw -55; setang 40" );
    -- CreateTimer( 5.05, ClientCmd, "sc_strafe_dir 0" );
    -- CreateTimer( 5.2, ClientCmd, "sc_strafe_dir 3; sc_strafe_yaw 180" );
    -- CreateTimer( 5.7, ClientCmd, "+duck" );
    -- CreateTimer( 5.9, ClientCmd, "-duck; sc_strafe_yaw 135; -jump; +sc_ducktap" );
    -- CreateTimer( 6.45, ClientCmd, "sc_strafe_yaw -147; -sc_ducktap" );
    -- CreateTimer( 6.65, ClientCmd, "sc_aimbot 1; +attack; wait; -attack; wait; sc_aimbot 0" );
    -- CreateTimer( 7.15, ClientCmd, "sc_strafe_yaw 180" );
    -- CreateTimer( 7.35, ClientCmd, "sc_strafe_vectorial 1; sc_strafe_ignore_ground 1; sc_strafe_yaw \"\"; sc_im_stop" );
    -- CreateTimer( 7.35, ClientCmd, "sc_strafe 1" );



    -- ClientCmd( "sc_strafe 1; sc_strafe_dir 3; sc_strafe_yaw \"\"; sc_strafe_ignore_ground 1; setang 0 180" );

    -- CreateTimer( 0.285, ClientCmd, "+jump; sc_st_setangles 0 180 700" );
    -- CreateTimer( 0.9, ClientCmd, "sc_strafe_yaw 120; sc_strafe_ignore_ground 1" );
    -- CreateTimer( 1.85, ClientCmd, "sc_strafe_yaw 178.6" );
    -- CreateTimer( 2.1, ClientCmd, "sc_aimbot 1; +attack" );
    -- CreateTimer( 2.7, ClientCmd, "-attack; sc_aimbot 0; sc_st_setangles 10 -110 100" );
    -- CreateTimer( 2.7, ClientCmd, "weapon_shotgun" );
    -- CreateTimer( 3.0, ClientCmd, "sc_strafe_yaw -110" );
    -- CreateTimer( 3.51, ClientCmd, "+attack2; wait; -attack2" );
    -- CreateTimer( 3.49, ClientCmd, "sc_strafe_yaw -90" );
    -- CreateTimer( 3.72, ClientCmd, "sc_strafe_yaw 180; sc_st_setangles 0 180 100" );
    -- CreateTimer( 4.1, ClientCmd, "sc_st_setangles_stop" );

    -- CreateTimer( 0.15, ClientCmd, "weapon_9mmAR" );
    -- CreateTimer( 0.285, ClientCmd, "+jump; sc_st_setangles 0 180 700" );
    -- CreateTimer( 0.9, ClientCmd, "sc_strafe_yaw 113; sc_strafe_ignore_ground 1" );
    -- CreateTimer( 1.75, ClientCmd, "sc_strafe_yaw 178.6" );
    -- CreateTimer( 2.1, ClientCmd, "sc_aimbot 1; +attack" );
    -- CreateTimer( 2.7, ClientCmd, "-attack; sc_aimbot 0; sc_st_setangles 10 -100 100" );
    -- CreateTimer( 2.7, ClientCmd, "weapon_shotgun" );
    -- CreateTimer( 3.1, ClientCmd, "sc_strafe_yaw -85" );
    -- CreateTimer( 3.5, ClientCmd, "+attack2; wait; -attack2" );
    -- CreateTimer( 3.81, ClientCmd, "sc_strafe_yaw 177; sc_st_setangles 10 175 100" );
    -- CreateTimer( 4.5, ClientCmd, "sc_strafe_yaw 180" );
    -- CreateTimer( 4.7, ClientCmd, "sc_strafe_yaw -10" );
    -- CreateTimer( 5.1, ClientCmd, "sc_strafe_dir 0; sc_strafe_yaw 175" );
    -- CreateTimer( 5.3, ClientCmd, "sc_strafe_dir 3; sc_strafe_yaw 180; sc_st_follow_point 716.602 2496.667 -594.336 0.05; sc_st_setangles_stop" );
    -- CreateTimer( 5.5, ClientCmd, "weapon_hl357" );
    -- CreateTimer( 5.7, ClientCmd, "+duck" );
    -- CreateTimer( 5.8, ClientCmd, "sc_strafe_yaw 135; sc_aimbot 1" );
    -- CreateTimer( 5.9, ClientCmd, "-duck" );
    -- CreateTimer( 6.415, ClientCmd, "sc_strafe_yaw -145" );
    -- CreateTimer( 6.65, ClientCmd, "+attack; wait; -attack; sc_aimbot 0; sc_st_follow_point_stop; sc_st_setangles 20 179 100" );
    -- CreateTimer( 6.9, ClientCmd, "sc_st_setangles_stop;" );

    -- CreateTimer( 6.9, ClientCmd, "sc_strafe 0; -jump" );
end

function OnGameFrame(state, frametime, postruncmd)
    if ( not postruncmd ) then return end;

    if ( adjust_ques_position ) then
        local player = GetPEntityFromEntityIndex( ques_player_index );

        if ( player ~= nil ) then
            if ( player.vars.velocity:LengthSqr() == 0 ) then
                -- this is bullshit.. unfortunately QEES' position at boost spot sometimes is shifted
                player.vars.origin = Vector( -5327.921875, -3270.352051, -607.96875 );
                adjust_ques_position = false;
            end
        else
            adjust_ques_position = false;
        end
    end
end

function OnEntityUse(entity, other)
    if ( entity ~= nil ) then
        PrintChatText( "OnEntityUse(" .. tostring( GetEntityIndexFromEdict( entity ) ) .. ")" );
    end
end

function OnEntityTouch(entity, other)
    if ( entity ~= nil and entity.vars.model == "*273" ) then -- trigger_once activates multi_manager -> spawns3_mm
        spawns_state = 1;

        -- respawn players
        CreateTimer( 1e-6, function() -- next frame
            DisableSurvivalMode();

            spawns_state = 2;

            CreateTimer( 0.01, EnableSurvivalMode );
            -- CreateTimer( 1e-6, EnableSurvivalMode );
        end );
    end

    -- if ( entity ~= nil and entity.vars.classname == "trigger_once" and GetEntityIndexFromEdict( entity ) ~= 638 ) then
    --     PrintChatText( "OnEntityTouch(" .. tostring( GetEntityIndexFromEdict( entity ) ) .. "," .. tostring( entity.vars.model ) .. ", " .. tostring( entity.vars.targetname ) .. ", " .. tostring( entity.vars.target ) .. ")" );
    -- end
end

function OnTouchTrigger(name)
    if ( name == "bunnyrun" ) then
        -- CreateTimer( 0.32, InputManager.Playback, "c07a2_bunnyrun" ); -- 0.265 is good
        -- CreateTimer( 0.1, InputManager.Record, "c07a2_bunnyrun" );
    end

    PrintChatText( "Touched trigger \"" .. name .. "\"" );
    return true;
end

function OnTouchServerTrigger(activator, name)
    if ( activator.vars.netname == "QEES51" ) then
        if ( name == "ques_triggur_bot" ) then
            CreateTimer( 1.25, InputManager.Playback, "c07a2_bunnyrun" );
        elseif ( name == "ques_triggur_vel" ) then
            adjust_ques_position = true;
        end

        ClientCmd( string.format( "say Player %s touched trigger \"%s\"", activator.vars.netname, name ) );

        return true;
    end

    return false;
end

function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
    printl( "OnPlayerSpawn()" );
    
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) );
    
    local sPlayerName = pPlayerEdict.vars.netname;
    
    if ( spawns_state == 0 ) then
        if ( sPlayerName == "Sw1ft" ) then
            pPlayerEdict.vars.origin = Vector( 2913.000000, 2256.000000, -199.000000 );
        elseif ( sPlayerName == "QEES51" ) then
            pPlayerEdict.vars.origin = Vector( 2849.000000, 2256.000000, -199.000000 );
        elseif ( sPlayerName == "iMicro" ) then
            pPlayerEdict.vars.origin = Vector( 2913.000000, 2256.000000, -199.000000 );
        end
    elseif ( spawns_state == 2 ) then
        if ( sPlayerName == "QEES51" ) then
            pPlayerEdict.vars.origin = Vector( 244.000000, -1988.000000, 337.000000 );
        elseif ( sPlayerName == "iMicro" ) then
            pPlayerEdict.vars.origin = Vector( 244.000000, -1940.000000, 337.000000 );
        end
    end
end

function PrintTime()
    PrintChatText( string.format( "%.3f", SegmentCurrentTime() - start_time ) );
end

SpeedrunInit();

printl( "Executed c07_a2" );
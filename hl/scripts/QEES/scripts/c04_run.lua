zalypa = 0
connected = false;
spawned = false;
start_time = 0.0;


function SpeedrunInit()
    SetTimescale( 0.1 );

    RemoveAllTimers();

    ClientCmd(" sc_st_disable_spread 1; default_fov 120; -sc_ducktap; -jump; -duck; -forward; -back; -moveleft; -moveright; sc_strafe 0; sc_strafe_yaw -30; sc_strafe_ignore_ground 1; -attack; sc_im_stop");
    ClientCmd("sc_strafe_type 0; sc_strafe_dir 3; sc_st_setangles_stop; sc_ducktap_adjust_fps 10000; sc_autojump_inconsistent 0; fps_max 200; mp_classic_mode 1; clockwindow 0");

end

function SpeedrunStart()
    SpeedrunStartCustom();
    -- connected = true;
end

function SpeedrunStartCustom()
    start_time = SegmentCurrentTime();

    InputManager.Record( "c04_run" );
    --InputManager.Playback( "c04_run" );

    CreateTimer( 0.15, EnableSurvivalMode );
    CreateTimer( 0.1, DisableSurvivalMode );

    ClientCmd("sc_strafe 1; sc_strafe_yaw 30; sc_strafe_ignore_ground 0");
    ClientCmd("weapon_9mmhandgun");
    CreateTimer(0.280, ClientCmd,"sc_strafe_yaw 0");
    CreateTimer(0.490, ClientCmd,"sc_strafe_yaw -49; sc_st_setangles 0 -65 40");
    CreateTimer(0.5, ClientCmd,"+attack2");
    CreateTimer(0.700, ClientCmd,"+jump");
    CreateTimer(0.710, ClientCmd,"kill; -jump");
    CreateTimer(0.800, ClientCmd,"-attack2; sc_strafe_yaw \"\"");
















end

function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
    printl( "OnPlayerSpawn()" );
    
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) );
    
  
    local sPlayerName = pPlayerEdict.vars.netname;
        
    if ( sPlayerName == "QEES51" ) then
        if(zalypa == 0) then
            pPlayerEdict.vars.origin = Vector( 63.000000, 1465.000000, 45.000000 );
            zalypa = 1
        else
            pPlayerEdict.vars.origin = Vector( 63.000000, 1568.000000, 45.000000 ); 
        end
    end



end

function PrintTime()
    PrintChatText( string.format( "%.3f (IM frames: %d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end


SpeedrunInit();
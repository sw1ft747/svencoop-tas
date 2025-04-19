spawns_state = 0;
revive_state = 0;
yebki = 0;


function SpeedrunStart()
    start_time = SegmentCurrentTime();

	EnableSurvivalMode();
    RemoveAllTimers();

    SetTimescale( 0.9 );

    ClientCmd( "sv_cheats 0;setvel 0 0 0;sc_strafe_yaw \"\";sc_strafe_type 0;sc_strafe 0;-jump;pausable 0;-duck;sc_strafe_ignore_ground 1;sc_st_legit_mode_ignore_freeze 1;-sc_ducktap;sc_strafe_vectorial_increment 0" );
    ClientCmd( "sc_st_setangles_stop; sc_st_setangles2_stop; sc_st_follow_point_stop; -jump; -duck; -attack;-attack2; -moveleft; -right; -moveright;-back; -sc_ducktap; sc_aimbot_scripts_filter_targets 1" );
    ClientCmd( "sc_strafe 0; sc_strafe_dir 3; sc_strafe_ignore_ground 1; sc_strafe_vectorial 1; sc_strafe_vectorial_increment 0; sc_strafe_vectorial_snap 0; sc_aimbot 0; sc_st_disable_spread 0; sc_jumpbug_min_fall_velocity 580" );
    ClientCmd( "clockwindow 0; cl_smoothtime 0; mp_respawndelay 0; mp_classic_mode 1; fps_max 200; sc_jumpbug_min_fall_velocity 580; sc_st_legit_mode_ignore_freeze 1; sc_aimbot_change_angles_back 1" );
    
    -- СТАРТ КАРРТЫ
end

function PrintTime()
    PrintChatText( string.format( "%.3f (%d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

function OnFireTargets( targetname, activator, caller, usetype, value, delay )
    if ( targetname == "anthony" ) then

    elseif ( targetname == "huylo") then
        CreateTimer( 0.000, function()
            CreateTimer( 0.0, ClientCmd, "+use;weapon_satchel" );
            CreateTimer( 1, ClientCmd, "+attack;wait;-attack;-use" );
            yebki = 1
        end );
    elseif ( targetname == "huylo" and yebki == 1) then
        CreateTimer( 0.000, function()
            CreateTimer( 0.0, ClientCmd, "+use;weapon_satchel" );
            CreateTimer( 1, ClientCmd, "+attack;wait;-attack;-use" );
            yebki = 2
        end );
    elseif (targetname == "GeneWormDead") then
        ClientCmd("sc_script StopTimer()");
    elseif ( targetname == "strelyat") then
        ClientCmd("+attack;wait;-attack;say strelyat");
    elseif ( targetname == "strelyat1") then
        ClientCmd("+attack;wait;-attack;say strelyat1");
    elseif ( targetname == "strelyat2") then
        ClientCmd("+attack;wait;-attack;say strelyat2");
    elseif ( targetname == "strelyat3") then
        ClientCmd("+attack;wait;-attack;say strelyat3");
    end
    printl( "OnFireTargets :: " .. targetname .. " : " .. value .. " : " .. delay );
end

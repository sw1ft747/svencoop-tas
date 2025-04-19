connected = false;
spawned = false;
start_time = 0.0;

function SpeedrunInit()
    SetTimescale( 0.5 );

    RemoveAllTimers();

    ClientCmd(" sc_st_disable_spread 1; default_fov 120; -sc_ducktap; -jump; -duck; -forward; -back; -moveleft; -moveright; sc_strafe 0; sc_strafe_yaw \"\"; sc_strafe_ignore_ground 1; -attack; sc_im_stop");
    ClientCmd("sc_strafe_type 0; sc_strafe_dir 3; sc_st_setangles_stop; sc_ducktap_adjust_fps 0; sc_autojump_inconsistent 0; sc_strafe_vectorial_increment 0; fps_max 500; mp_classic_mode 1; clockwindow 0");
    
end

function SpeedrunStart()
    SpeedrunStartCustom();
    -- connected = true;
end

function SpeedrunStartCustom()
    start_time = SegmentCurrentTime();

    --CreateTimer(4.500, ClientCmd,"sc_im_record c16_a2_new");
    CreateTimer(4.500, ClientCmd,"sc_im_play c16_a2_new");

    CreateTimer( 0.75, EnableSurvivalMode );
    CreateTimer( 0.7, DisableSurvivalMode );
    CreateTimer(4.500, ClientCmd,"sc_strafe 1");


    CreateTimer(0.285, ClientCmd,"setang 0 360 0");
    CreateTimer(5.085, ClientCmd,"+tau");
    --CreateTimer(8.300, ClientCmd,"sc_st_timescale 0.1");
    CreateTimer(4.500, ClientCmd,"sc_strafe 1");
    CreateTimer(11.500, ClientCmd,"sc_st_timescale 0.05");

    CreateTimer(8.490, ClientCmd,"setang 0.000000 290.769653 0.000000");
    CreateTimer(8.490, ClientCmd,"+forward; +duck");
    CreateTimer(8.540, ClientCmd,"+jump;");
    CreateTimer(8.546, ClientCmd,"-forward; -duck; -tau");
    CreateTimer(8.700, ClientCmd,"toggle sc_strafe_type 0 1");
    CreateTimer(8.800, ClientCmd,"sc_strafe_yaw -160; sc_st_setangles 0 -160 120");
    CreateTimer(9.000, ClientCmd,"sc_strafe_yaw 110; sc_st_setangles 0 110 120");
    CreateTimer(9.000, ClientCmd,"+tau");
    CreateTimer(9.100, ClientCmd,"sc_strafe_yaw 80");
    CreateTimer(9.400, ClientCmd,"sc_strafe_yaw 56; sc_st_setangles 0 56 120; +moveright");
    CreateTimer(9.418, ClientCmd,"-moveright");
    CreateTimer(9.900, ClientCmd,"-tau; -jump; sc_ducktap");
    CreateTimer(10.170, ClientCmd,"sc_strafe_yaw -159; sc_st_setangles 0 -179 200");
    CreateTimer(10.800, ClientCmd,"sc_ducktap; +jump; sc_strafe_yaw -167");
    CreateTimer(11.075, ClientCmd,"sc_strafe_yaw -179");
    CreateTimer(10.350, ClientCmd,"+tau");
    CreateTimer(11.240, ClientCmd,"sc_strafe_yaw 149; sc_st_setangles 0 90 200");
    CreateTimer(11.300, ClientCmd,"+moveright");
    CreateTimer(11.490, ClientCmd,"-moveright");
    CreateTimer(11.530, ClientCmd,"sc_strafe_yaw 60; sc_st_setangles 0 90 200;");
    CreateTimer(11.700, ClientCmd,"+duck; sc_strafe_yaw 90 +back");
    CreateTimer(11.780, ClientCmd,"-duck; setang 0 90 0; -back");
    CreateTimer(11.820, ClientCmd,"sc_strafe_yaw 130");
    CreateTimer(11.826, ClientCmd,"+duck; -tau");
    CreateTimer(11.944, ClientCmd,"sc_strafe_yaw 35; -duck");
    CreateTimer(12.140, ClientCmd,"sc_strafe_yaw 142; +duck");
    CreateTimer(12.320, ClientCmd,"-duck");
    CreateTimer(12.320, ClientCmd,"+jump");
    CreateTimer(12.330, ClientCmd,"+duck");
    CreateTimer(12.340, ClientCmd,"sc_strafe_yaw 122; sc_st_setangles 0 122 200");
    CreateTimer(12.400, ClientCmd,"-duck");

    CreateTimer(12.500, ClientCmd,"toggle_survival_mode");
    CreateTimer(12.500, ClientCmd,"sc_strafe_yaw -157; sc_st_setangles 0 -175 200");
    CreateTimer(13.844, ClientCmd,"sc_im_split");
    CreateTimer(12.700, ClientCmd,"sc_st_timescale 0.1");
    CreateTimer(13.020, ClientCmd,"+duck");
    CreateTimer(13.076, ClientCmd,"-duck");
    CreateTimer(13.320, ClientCmd,"+attack2");
    CreateTimer(13.400, ClientCmd,"sc_strafe_yaw 88; sc_st_setangles 3 126 120");
    CreateTimer(13.620, ClientCmd,"sc_strafe_yaw 50");
    --CreateTimer(13.800, ClientCmd,"+duck");
    CreateTimer(13.844, ClientCmd,"-attack2");
    --CreateTimer(13.944, ClientCmd,"-duck");
    CreateTimer(13.844, ClientCmd,"sc_strafe_yaw \"\"");


    








    
    --[[
    CreateTimer(13.700, ClientCmd,"+moveright");
    CreateTimer(13.820, ClientCmd,"-moveright");
    CreateTimer(13.820, ClientCmd,"+duck");
    CreateTimer(13.900, ClientCmd,"-attack2; sc_st_setangles 0 0 200");
    CreateTimer(14.050, ClientCmd,"-duck");
    CreateTimer(14.650, ClientCmd,"sc_strafe_yaw -80");
    CreateTimer(15.000, ClientCmd,"sc_strafe_yaw 0");
    CreateTimer(15.330, ClientCmd,"sc_strafe_yaw -50");
    CreateTimer(15.400, ClientCmd,"sc_strafe_yaw 0");
    CreateTimer(15.650, ClientCmd,"sc_strafe_yaw 40; sc_st_setangles 0 90 200");
    CreateTimer(16.000, ClientCmd,"sc_strafe_yaw 90;");]]
   








	--[[CreateTrigger("strafe", Vector(1229.656, -1776.750, 64.344), Vector(0, 0, 0), Vector(122.906, 61.125, 149.062));
	--CreateTrigger("split", Vector(376.750, 689.719, 2223.750), Vector(0, 0, 0), Vector(83.156, 10.875, 147.375));
	CreateTrigger("Survival", Vector(328.688, -67.156, 1972.562), Vector(0, 0, -14.594), Vector(58.344, 59.531, 0));
    ClientCmd("sc_strafe 0; sc_strafe_ignore_ground 1");
    --CreateTimer(11.500, ClientCmd,"sc_im_split");
    CreateTimer(8.000, ClientCmd,"sc_st_timescale 0.1");]]
    


   
end


function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "strafe") then
		--ClientCmd("sc_strafe 1; sc_strafe_ignore_ground 0");

	elseif (name == "frozen_door") then
		CreateTimer(1.6, ClientCmd,"sc_st_setangles 0.871262 206.713257 20");
		CreateTimer(2.95, ClientCmd,"sc_im_play c08_a2_freezedoorV2");

	elseif (name == "split") then
		ClientCmd("sc_im_split; say jopa");

	elseif (name == "Survival") then
		CreateTimer(0.000, DisableSurvivalMode);
		CreateTimer(0.000, EnableSurvivalMode);
    end
    return true;
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


function PrintTime()
    PrintChatText( string.format( "%.3f (IM frames: %d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

SpeedrunInit();


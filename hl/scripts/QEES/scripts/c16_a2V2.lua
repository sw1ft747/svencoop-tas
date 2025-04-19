ClientCmd( "sc_st_timescale 0.5");

function SpeedrunInit()
    SetTimescale( 0.25 );

    RemoveAllTimers();

    ClientCmd(" sc_st_disable_spread 0; default_fov 120; -sc_ducktap; -jump; -duck; -forward; -back; -moveleft; -moveright; sc_strafe 0; sc_strafe_yaw \"\"; sc_strafe_ignore_ground 1; -attack; sc_im_stop");
    ClientCmd("sc_strafe_type 0; sc_strafe_dir 3; sc_st_setangles_stop; sc_ducktap_adjust_fps 0; sc_autojump_inconsistent 0; sc_strafe_vectorial_increment 0; fps_max 200; mp_classic_mode 1; clockwindow 0");
    ClientCmd("sc_aimbot 0; sc_aimbot_change_angles_back 0");
    
end

function SpeedrunStart()
    InputManager.Record( "c16_a2" );

    ClientCmd("toggle_survival_mode;");
    ClientCmd("toggle_survival_mode;");

    CreateTimer(0.285, ClientCmd,"setang 0 360 0");
    CreateTimer(5.085, ClientCmd,"+tau");
    --CreateTimer(8.300, ClientCmd,"sc_st_timescale 0.1");

    CreateTimer(13.500, ClientCmd,"sc_st_timescale 0.05");

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
    CreateTimer(11.480, ClientCmd,"-moveright");
    CreateTimer(11.530, ClientCmd,"sc_strafe_yaw 60; sc_st_setangles 0 90 200;");
    CreateTimer(11.700, ClientCmd,"+duck; sc_strafe_yaw 90 +back");
    CreateTimer(11.780, ClientCmd,"-duck; setang 0 90 0; -back");
    CreateTimer(11.820, ClientCmd,"sc_strafe_yaw 130");
    CreateTimer(11.826, ClientCmd,"+duck; -tau");
    CreateTimer(11.944, ClientCmd,"sc_strafe_yaw 35; -duck");
    CreateTimer(12.140, ClientCmd,"sc_strafe_yaw 142; +duck");
    CreateTimer(12.320, ClientCmd,"-duck");
    CreateTimer(12.340, ClientCmd,"sc_strafe_yaw 122; sc_st_setangles 0 122 200");
    CreateTimer(12.500, ClientCmd,"toggle_survival_mode");
    CreateTimer(12.700, ClientCmd,"sc_strafe_yaw -157; sc_st_setangles 0 -175 200");
    CreateTimer(13.200, ClientCmd,"+duck");
    CreateTimer(13.260, ClientCmd,"-duck");
    CreateTimer(13.320, ClientCmd,"+attack2");
    CreateTimer(13.400, ClientCmd,"sc_strafe_yaw 88; sc_st_setangles 7 122 120");
    CreateTimer(13.620, ClientCmd,"sc_strafe_yaw 50");
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
    CreateTimer(16.000, ClientCmd,"sc_strafe_yaw 90;"); 
    
end

SpeedrunInit();
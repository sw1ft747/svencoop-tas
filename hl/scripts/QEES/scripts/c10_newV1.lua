ClientCmd( "sc_st_timescale 0.1");

function SpeedrunInit()
    ClientCmd("sc_strafe_yaw -30");
    ClientCmd("-jump");
    ClientCmd("sc_strafe_ignore_ground 1");
    ClientCmd("-duck");
    ClientCmd("-forward");
    ClientCmd("-back");
    ClientCmd("-moveleft");
    ClientCmd("-moveright");
    ClientCmd("sc_strafe_type 0");
    ClientCmd("sc_st_setangles_stop");
    ClientCmd("sc_ducktap_adjust_fps 10000");
    ClientCmd("sc_autojump_inconsistent 0");
    ClientCmd("-sc_ducktap");
    --ClientCmd("sc_st_setangles 0 -25.235596 20");

end

function SpeedrunStart()
    InputManager.Record( "c10" );

    ClientCmd("toggle_survival_mode;");
    ClientCmd("toggle_survival_mode;");

    ClientCmd("setang 0.000000 334.769653 0.000000");

    --[[CreateTimer(0.000, ClientCmd,"sc_strafe_ignore_ground 0");
    CreateTimer(0.630, ClientCmd,"+jump");
    CreateTimer(0.630, ClientCmd,"sc_st_setangles 89 0 120");
    CreateTimer(0.640, ClientCmd,"-jump");
    CreateTimer(0.870, ClientCmd,"+moveright; +back");
    CreateTimer(0.870, ClientCmd,"sc_strafe_yaw -77");
    CreateTimer(1.700, ClientCmd,"+duck; -moveright; -back; sc_st_setangles 0 -90 120");
    CreateTimer(1.790, ClientCmd,"-duck");
    CreateTimer(4.100, ClientCmd,"sc_st_timescale 0.1");
    CreateTimer(2.160, ClientCmd,"sc_strafe_yaw -90");
    CreateTimer(2.150, ClientCmd,"sc_ducktap");
    CreateTimer(2.410, ClientCmd,"sc_strafe_yaw 148; sc_st_setangles 0 -179 120");
    CreateTimer(2.778, ClientCmd,"sc_strafe_yaw -90");
    CreateTimer(3.150, ClientCmd,"sc_st_setangles 0 0 100");
    CreateTimer(3.402, ClientCmd,"sc_strafe_yaw 7");
    CreateTimer(3.900, ClientCmd,"sc_ducktap; +jump; sc_strafe_yaw 0; sc_st_setangles -90 -90 80; weapon_crowbar");
    CreateTimer(3.990, ClientCmd,"-jump");
    CreateTimer(4.100, ClientCmd,"+moveleft; +forward");
    CreateTimer(4.500, ClientCmd,"+attack");
    CreateTimer(4.508, ClientCmd,"weapon_357");
    CreateTimer(4.550, ClientCmd,"-attack");
    --CreateTimer(4.750, ClientCmd,"
    CreateTimer(4.750, ClientCmd,"+duck; setang 87.638756 218.331299 0.000000; sc_strafe_yaw -170; -forward; +back; ");
    CreateTimer(4.869, ClientCmd,"-duck; sc_st_setangles 0 -179 100");
    CreateTimer(4.900, ClientCmd,"-back; -moveright");
    CreateTimer(4.990, ClientCmd,"-moveleft");
    CreateTimer(5.180, ClientCmd,"-moveleft; sc_strafe_yaw -168; +jump; sc_autojump_inconsistent 1");
    CreateTimer(5.420, ClientCmd,"sc_strafe_yaw -111");
    CreateTimer(5.720, ClientCmd,"sc_autojump_inconsistent 0");
    CreateTimer(5.820, ClientCmd,"sc_strafe_yaw -179");
    CreateTimer(5.920, ClientCmd,"+duck");
    CreateTimer(6.020, ClientCmd,"sc_strafe_yaw -90; -duck");
    CreateTimer(6.135, ClientCmd,"+duck");]]

    CreateTimer(0.000, ClientCmd,"sc_st_setangles 0 -120 10");
    CreateTimer(0.100, ClientCmd,"sc_st_setangles 0 -25 10");
    CreateTimer(0.100, ClientCmd,"sc_strafe_ignore_ground 0");
    CreateTimer(0.600, ClientCmd,"+jump; sc_st_setangles 89 0 120");
    CreateTimer(0.640, ClientCmd,"-jump");
    CreateTimer(0.870, ClientCmd,"+moveright; +back");
    CreateTimer(0.870, ClientCmd,"sc_strafe_yaw -77");
    CreateTimer(1.700, ClientCmd,"+duck; -moveright; -back; sc_st_setangles 0 -90 120");
    CreateTimer(1.790, ClientCmd,"-duck");
    CreateTimer(2.150, ClientCmd,"+sc_ducktap");
    CreateTimer(2.156, ClientCmd,"sc_strafe_yaw -90");
    CreateTimer(2.410, ClientCmd,"sc_strafe_yaw 148; sc_st_setangles 0 -179 120");
    CreateTimer(2.878, ClientCmd,"sc_strafe_yaw -115");
    CreateTimer(2.898, ClientCmd,"sc_strafe_yaw -90");
    CreateTimer(3.150, ClientCmd,"sc_st_setangles 0 0 100");
    CreateTimer(3.440, ClientCmd,"sc_strafe_yaw 47");
    CreateTimer(3.550, ClientCmd,"sc_strafe_type 1");
    CreateTimer(3.650, ClientCmd,"sc_strafe_yaw 0; sc_strafe_type 0");
    --CreateTimer(3.900, ClientCmd,"sc_ducktap; +jump; sc_strafe_yaw 0; sc_st_setangles -90 -90 80; weapon_crowbar");
    --[[CreateTimer(3.990, ClientCmd,"-jump");
    CreateTimer(4.100, ClientCmd,"+moveleft; +forward");
    CreateTimer(4.500, ClientCmd,"+attack");
    CreateTimer(4.508, ClientCmd,"weapon_357");
    CreateTimer(4.550, ClientCmd,"-attack");]]
    




    
end

SpeedrunInit();
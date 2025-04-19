CreateTimer(0.000, ClientCmd, "setang 0 180 0");
CreateTimer(0.000, ClientCmd, "sc_strafe; sc_strafe_yaw 180; sc_strafe_ignore_ground 0");
CreateTimer(0.130, ClientCmd, "+jump");
CreateTimer(0.220, ClientCmd, "setang 30.000000 0.000000 0.000000");
CreateTimer(0.220, ClientCmd, "+attack");
CreateTimer(0.220, ClientCmd, "+duck");
CreateTimer(0.226, ClientCmd, "setang 0 180 0");
CreateTimer(0.290, ClientCmd, "-duck; -jump; sc_strafe_ignore_ground 1; -attack");
CreateTimer(0.290, ClientCmd, "sc_strafe_yaw \"\"");
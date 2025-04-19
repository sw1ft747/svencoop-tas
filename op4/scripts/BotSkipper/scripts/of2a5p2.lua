CreateTrigger("start", Vector(459.281, -543.094, 1186.250), Vector(0, 0, 0), Vector(46.000, 121.969, 134.844));

function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "start") then 
		ClientCmd("sc_im_record of2a5p2");
		ClientCmd("sc_Strafe 1;sc_strafe_type 0;sc_strafe_ignore_ground 0;setang 0 -179.99 0;sc_strafe_yaw -179;sc_st_reset_timer");
        CreateTimer( 0.6, ClientCmd, "+jump");
        CreateTimer( 0.48, ClientCmd, "sc_st_setangles 0 130 60");
        CreateTimer( 0.68, ClientCmd, "sc_Strafe_yaw 130");
        CreateTimer( 0.9, ClientCmd, "sc_st_setangles 0 -179 60");
        CreateTimer( 1.16, ClientCmd, "sc_Strafe_yaw -179");
        CreateTimer( 1.7, ClientCmd, "+duck");
        CreateTimer( 1.8, ClientCmd, "-duck");
        CreateTimer( 2.0, ClientCmd, "sc_Strafe_yaw \"\";sc_strafe_ignore_ground 1;-jump");
	return true;

	end
end

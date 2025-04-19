connected = false;
spawned = false;
start_time = 0.0;
spawns_state = 0;

function SpeedrunInit()
    SetTimescale( 0.25 );

    RemoveAllTimers();

    ClientCmd(" sc_st_disable_spread 0; default_fov 110; -sc_ducktap; -jump; -duck; -forward; -back; -moveleft; -moveright; sc_strafe 0; sc_strafe_yaw \"\"; sc_strafe_ignore_ground 1; -attack; sc_im_stop");
    ClientCmd("sc_strafe_type 0; sc_strafe_dir 3; fps_max 200; sc_st_setangles_stop; sc_autojump_inconsistent 0; sc_strafe_vectorial_increment 0; mp_classic_mode 1; clockwindow 0");
    ClientCmd("fps_max 200; sc_jumpbug_legit 0; sc_jumpbug 0");
end

function SpeedrunStart()
    SpeedrunStartCustom();
    -- connected = true;
end

function SpeedrunStartCustom()
    start_time = SegmentCurrentTime();

	CreateTrigger("DarkRoom", Vector(577.719, -3039.844, -451.594), Vector(0, 0, -197.094), Vector(248.125, 256.562, 0));
	CreateTrigger("afterDark", Vector(1424.594, 778.625, 666.594), Vector(0, 0, 0), Vector(281.625, 319.219, 511.250));










end




function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "DarkRoom") then
		--CreateTimer(8.702, ClientCmd,"sc_st_timescale 0.01");
		CreateTimer(1.922, ClientCmd,".tas_c05a3_spawnbot ");
		CreateTimer(8.922, ClientCmd,"sc_st_timescale 0.05");
		CreateTimer(9.892, ClientCmd,"sc_st_timescale 0.03");
		CreateTimer(5.0, ClientCmd,"+tau");
		--CreateTimer(8.890, ClientCmd,"+forward");
		--CreateTimer(8.890, ClientCmd,"+duck");
		--CreateTimer(8.890, ClientCmd,"+jump");
		CreateTimer(8.731, ClientCmd,"-tau");
		--CreateTimer(8.891, ClientCmd,"-forward");
		--CreateTimer(8.893, ClientCmd,"-jump");
		--CreateTimer(8.891, ClientCmd,"-duck");
		CreateTimer(0.222, ClientCmd,"sc_st_timescale 0.5");
		ClientCmd( "weapon_crossbow;weapon_gauss");
		CreateTimer(10.822, ClientCmd,"sc_st_timescale 0.5");

	elseif (name == "afterDark") then
		ClientCmd("setang 0.196680 277.080688 0.000000\n");

    end
end

function PrintTime()
    PrintChatText( string.format( "%.3f (IM frames: %d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

SpeedrunInit();

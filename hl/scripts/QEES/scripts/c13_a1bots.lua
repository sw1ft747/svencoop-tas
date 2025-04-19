ClientCmd( "weapon_crossbow;weapon_gauss" );
CreateTrigger("spawn1", Vector(-255.812, -977.125, 1697.375), Vector(0, 0, 0), Vector(33.875, 48.531, 122.312));
CreateTrigger("spawn2", Vector(-198.125, -978.219, 1697.000), Vector(0, 0, 0), Vector(44.844, 47.938, 135.781));
CreateTrigger("spawn3", Vector(-118.719, -977.156, 1699.562), Vector(0, 0, 0), Vector(46.500, 44.156, 141.188));
CreateTrigger("spawn4", Vector(-45.594, -978.906, 1698.219), Vector(0, 0, 0), Vector(50.250, 40.312, 143.469));

printl( "Executed \"c13_a1.lua\"" );

function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "spawn1") then --ГОТОВ 100%
		CreateTimer(0.0, ClientCmd,"say spawn1");
		ClientCmd("+jump");
		ClientCmd("say 376Vel");
		CreateTimer(0.020, ClientCmd,"-jump");
		ClientCmd("+tau");
		CreateTimer(0.510, ClientCmd,"-tau");
		CreateTimer(0.010, ClientCmd,"-forward");
		CreateTimer(0.010, ClientCmd,"toggle sc_strafe_type 0 1");
		--ClientCmd("sc_st_timescale 0.25");
		ClientCmd("sc_im_play c13_a1spawn1");

		--CreateTimer(2.0, ClientCmd,"say 1");
		CreateTimer(2.0, ClientCmd,"sc_im_stop");
		CreateTimer(2.0, ClientCmd,"sc_im_play c13_a1afterDoor1");
		
		--CreateTimer(4.7, ClientCmd,"say 4.7Sec");
		CreateTimer(4.7, ClientCmd,"sc_im_stop");
		CreateTimer(4.7, ClientCmd,"sc_im_play c13_a1ComeToDoor1");

	elseif (name == "spawn2") then --ГОТОВ 100%
		CreateTimer(0.0, ClientCmd,"say spawn2");
		ClientCmd("+jump");
		ClientCmd("say 379Vel");
		CreateTimer(0.020, ClientCmd,"-jump");
		ClientCmd("+tau");
		CreateTimer(0.510, ClientCmd,"-tau");
		CreateTimer(0.010, ClientCmd,"-forward");
		CreateTimer(0.010, ClientCmd,"toggle sc_strafe_type 0 1");
		--ClientCmd("sc_st_timescale 0.25");
		ClientCmd("sc_im_play c13_a1spawn2");

		--CreateTimer(2.0, ClientCmd,"say 2");
		CreateTimer(2.0, ClientCmd,"sc_im_stop");
		CreateTimer(2.0, ClientCmd,"sc_im_play c13_a1afterDoor2");

		--CreateTimer(4.7, ClientCmd,"say 4.7Sec");
		CreateTimer(4.7, ClientCmd,"sc_im_stop");
		CreateTimer(4.7, ClientCmd,"sc_im_play c13_a1ComeToDoor2");

	elseif (name == "spawn3") then --ГОТОВ 100%
		CreateTimer(0.0, ClientCmd,"say spawn3");
		ClientCmd("+jump");
		ClientCmd("say 380Vel");
		CreateTimer(0.020, ClientCmd,"-jump");
		ClientCmd("+tau");
		CreateTimer(0.510, ClientCmd,"-tau");
		CreateTimer(0.010, ClientCmd,"-forward");
		CreateTimer(0.010, ClientCmd,"toggle sc_strafe_type 0 1");
		--ClientCmd("sc_st_timescale 0.25");
		ClientCmd("sc_im_play c13_a1spawn3");

		--CreateTimer(2.0, ClientCmd,"say 3");
		CreateTimer(2.0, ClientCmd,"sc_im_stop");
		CreateTimer(2.0, ClientCmd,"sc_im_play c13_a1afterDoor3");

		CreateTimer(4.3, ClientCmd,"sc_im_stop");
		CreateTimer(4.3, ClientCmd,"sc_im_play c13_a1ComeToDoor3");
		--CreateTimer(4.3, ClientCmd,"sc_im_stop");

	elseif (name == "spawn4") then --ГОТОВ 100%
		CreateTimer(0.0, ClientCmd,"say spawn4");
		ClientCmd("+jump");
		ClientCmd("say 373Vel");
		--ClientCmd("say spawn4 need off jumpbug");
		CreateTimer(0.020, ClientCmd,"-jump");
		ClientCmd("+tau");
		CreateTimer(0.510, ClientCmd,"-tau");
		CreateTimer(0.010, ClientCmd,"-forward");
		CreateTimer(0.010, ClientCmd,"toggle sc_strafe_type 0 1");
		--ClientCmd("sc_st_timescale 0.25");
		ClientCmd("sc_im_play c13_a1spawn4");

		--CreateTimer(3.70, ClientCmd,"sc_st_timescale 0.05");

		--CreateTimer(2.0, ClientCmd,"say 4");
		CreateTimer(2.0, ClientCmd,"sc_im_stop");
		CreateTimer(2.0, ClientCmd,"sc_im_play c13_a1afterDoor4");

		--CreateTimer(3.8, ClientCmd,"say 3.8 sec");
		CreateTimer(3.8, ClientCmd,"sc_im_stop");
		CreateTimer(3.8, ClientCmd,"sc_im_play c13_a1jumpBug4");

		--CreateTimer(4.7, ClientCmd,"say 4.7Sec");
		CreateTimer(4.7, ClientCmd,"sc_im_stop");
		CreateTimer(4.7, ClientCmd,"sc_im_play c13_a1ComeToDoor4");
	
	
	
	
	
	
	
		--[[elseif (name == "afterDoor") then
		CreateTimer(4.000, ClientCmd,"sc_st_timescale 0.05");
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c13_a1afterDoor");
	
	elseif (name == "afterDrop") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_record c13_a1afterDrop");

	elseif (name == "OpenDoor") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_record c13_a1OpenDoor");--]]
	
    end
end



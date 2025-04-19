ClientCmd( "weapon_crossbow;weapon_gauss\n" );
CreateTrigger("spawn", Vector(-1552.500, -3741.625, -104.375), Vector(0, 0, 0), Vector(54.406, 86.844, 123.375));
CreateTrigger("tryba2", Vector(-328.125, -5060.031, -100.969), Vector(0, 0, 0), Vector(170.344, 51.375, 81.500));

printl( "Executed \"c11_a2.lua\"" );

function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "spawn") then
		ClientCmd("sc_im_play c11_a2Spawn");
		ClientCmd("sc_st_timescale 0.25");
		--CreateTimer(0.073, ClientCmd,"+forward");
		CreateTimer(2.800, ClientCmd,"sc_im_stop");
		CreateTimer(2.800, ClientCmd,"say record");
		CreateTimer(2.800, ClientCmd,"sc_im_play c11_a2Spawn2");
		--CreateTimer(2.700, ClientCmd,"sc_st_timescale 0.05");
		--ClientCmd("+tau");
		ClientCmd("setang 0 1.461182 0");
		--CreateTimer(1.005, ClientCmd,"-tau");
		--CreateTimer(1.075, ClientCmd,"+tau");
		--CreateTimer(0.420, ClientCmd,"+jump");
		--CreateTimer(0.421, ClientCmd,"-forward");
		CreateTimer(6.100, ClientCmd,"sc_st_timescale 0.05");
		CreateTimer(5.000, ClientCmd,"sc_im_stop");
		--CreateTimer(6.100, ClientCmd,"say record");
		CreateTimer(5.000, ClientCmd,"sc_im_play c11_a2to_up");
		CreateTimer(6.200, ClientCmd,"sc_im_stop");
		CreateTimer(6.200, ClientCmd,"sc_im_play c11_a2to_up2");
		CreateTimer(6.400, ClientCmd,"sc_im_stop");
		--CreateTimer(6.500, ClientCmd,"sc_im_play c11_a2to_up3");
		--CreateTimer(6.500, ClientCmd,"say record");


	elseif (name == "tryba2") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c11_a2GodBoost");
		--ClientCmd("sc_st_timescale 0.05");
	
    end
end



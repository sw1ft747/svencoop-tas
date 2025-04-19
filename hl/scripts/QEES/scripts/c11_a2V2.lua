ClientCmd( "weapon_crossbow;weapon_gauss\n" );
CreateTrigger("spawn", Vector(-1552.500, -3741.625, -104.375), Vector(0, 0, 0), Vector(54.406, 86.844, 123.375));
CreateTrigger("tryba2", Vector(-328.125, -5060.031, -100.969), Vector(0, 0, 0), Vector(170.344, 51.375, 81.500));
CreateTrigger("povorot1", Vector(-2731.438, -4509.250, -97.938), Vector(0, 0, 0), Vector(84.625, 26.000, 105.719));
CreateTrigger("povorot2", Vector(242.406, 1076.281, -120.188), Vector(0, 0, 0), Vector(37.531, 73.375, 94.250));

--CreateTrigger("povorotGovna", Vector(328.562, 795.469, -44.156), Vector(0, 0, -75.781), Vector(67.688, 13.688, 0));

CreateTrigger("povorotGovna", Vector(18.125, 611.062, -154.406), Vector(0, 0, 0), Vector(72.438, 11.094, 143.000));

printl( "Executed \"c11_a2.lua\"" );

function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "spawn") then
		CreateTimer(1.000, ClientCmd,"sc_strafe");
		ClientCmd("sc_im_play c11_a2SpawnV2");
		ClientCmd("sc_st_timescale 0.25");
		CreateTimer(0.073, ClientCmd,"+forward");
		CreateTimer(2.800, ClientCmd,"sc_im_stop");
		--CreateTimer(2.800, ClientCmd,"say record");
		CreateTimer(2.800, ClientCmd,"sc_im_play c11_a2Spawn2V2");
		CreateTimer(11.000, ClientCmd,"sc_st_timescale 0.1");
		ClientCmd("+tau");
		ClientCmd("setang 0 1.461182 0");
		CreateTimer(1.005, ClientCmd,"-tau");
		--CreateTimer(1.075, ClientCmd,"+attack2");
		CreateTimer(0.420, ClientCmd,"+jump");
		CreateTimer(0.422, ClientCmd,"-jump");
		CreateTimer(0.421, ClientCmd,"-forward");

		CreateTimer(8.200, ClientCmd,"sc_im_stop");
		CreateTimer(8.200, ClientCmd,"+back");
		CreateTimer(8.200, ClientCmd,"weapon_shotgun");
		CreateTimer(8.500, ClientCmd,"-back");
		CreateTimer(8.500, ClientCmd,"sc_im_play c11_a2trybaaaaa");
		CreateTimer(8.500, ClientCmd,"setang 0 270 0");
		--CreateTimer(8.500, ClientCmd,"say record");
		CreateTimer(8.500, ClientCmd,"sc_strafe");

		CreateTimer(9.120, ClientCmd,"sc_im_stop");
		CreateTimer(9.120, ClientCmd,"sc_im_play c11_a2HEADCRAB");
		
	elseif (name == "tryba2") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c11_a2GodBoostV2");
		ClientCmd("toggle_survival_mode wait; toggle_survival_mode");
		--ClientCmd("sc_st_timescale 0.05");

	elseif (name == "povorot1") then
		ClientCmd("sc_im_stop");
		--ClientCmd("say record");
		--ClientCmd("sc_im_play c11_a2povorot1");
		--CreateTimer(0.200, ClientCmd,"setang 0 0 0");

	elseif (name == "povorot2") then
		--ClientCmd("sc_im_stop");
		--ClientCmd("sc_im_record c11_a2povorot2");
		--CreateTimer(0.200, ClientCmd,"setang 0 270 0");

	elseif (name == "povorotGovna") then
		ClientCmd("kill; wait; toggle_survival_mode");
		CreateTimer(0.120, ClientCmd,"wait; toggle_survival_mode; wait; toggle_survival_mode; weapon_crossbow");
		--ClientCmd("weapon_crossbow");
		ClientCmd("sc_st_timescale 0.25");

    end
end



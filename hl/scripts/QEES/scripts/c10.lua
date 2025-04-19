CreateTrigger("SpawnRight", Vector(3436.406, 1792.219, -554.125), Vector(0, 0, 0), Vector(70.781, 45.250, 144.812));
CreateTrigger("tonnel", Vector(3693.469, 1574.438, -255.281), Vector(0, 0, 0), Vector(68.594, 23.656, 102.500));
CreateTrigger("ladder", Vector(3696.312, 1070.969, -253.906), Vector(0, 0, 0), Vector(11.844, 65.281, 95.875));
CreateTrigger("jump", Vector(3448.438, 822.125, 261.250), Vector(0, 0, -137.469), Vector(191.906, 11.688, 0));
CreateTrigger("r8Shoot", Vector(3438.000, 379.844, 4.188), Vector(0, 0, 0), Vector(42.312, 132.906, 197.875));
CreateTrigger("r8Shoot2", Vector(3204.469, 415.562, 6.000), Vector(0, 0, 0), Vector(29.031, 91.469, 179.219));
CreateTrigger("afterShoot", Vector(3072.375, 320.125, 4.125), Vector(0, 0, 0), Vector(24.719, 192.562, 169.375));
CreateTrigger("barney", Vector(1633.938, 335.344, 0.969), Vector(0, 0, 0), Vector(125.281, 21.562, 127.406));
CreateTrigger("barney2", Vector(1825.312, 476.281, 3.594), Vector(0, 0, 0), Vector(14.844, 165.531, 132.969));
CreateTrigger("stop", Vector(480.219, -643.062, 132.094), Vector(0, 0, 0), Vector(0.906, 162.562, 123.156));



printl( "Executed \"c10.lua\"" );

function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "SpawnRight") then
		ClientCmd("sc_im_play c10rightSpawnV2");
		ClientCmd("setang 0 329 0");
		CreateTimer(0.146, ClientCmd,"+forward");
		CreateTimer(0.462, ClientCmd,"+jump");
		CreateTimer(0.472, ClientCmd,"-jump");
		CreateTimer(0.462, ClientCmd,"-forward");
		--CreateTimer(14.400, ClientCmd,"sc_st_timescale 0.1");
		ClientCmd("toggle_survival_mode;");
		ClientCmd("toggle_survival_mode;");
		CreateTimer(9.000, ClientCmd,"toggle_survival_mode");
		CreateTimer(9.000, ClientCmd,"toggle_survival_mode");

	elseif (name == "tonnel") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c10tonnel");
		--ClientCmd("say record");

	elseif (name == "ladder") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c10ladder");
		--ClientCmd("say record");
		ClientCmd("weapon_crowbar");

	elseif (name == "jump") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c10jump");
		--ClientCmd("say record");

	elseif (name == "r8Shoot") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c10r8ShootV2");
		--ClientCmd("say record");
		ClientCmd("sc_st_disable_spread 1");
		--CreateTimer(0.600, ClientCmd,"sc_st_timescale 0.1");
		--CreateTimer(0.600, ClientCmd,"default_fov 1");

	elseif (name == "r8Shoot2") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c10r8ShootV2V2");
		--ClientCmd("say record");

	elseif (name == "afterShoot") then
		ClientCmd("sc_im_stop");
		ClientCmd("default_fov 120");
		ClientCmd("sc_im_play c10r8Shoot");
		--ClientCmd("sc_st_disable_spread 0");
		--ClientCmd("say record");
		--ClientCmd("sc_st_timescale 0.25");

	elseif (name == "barney") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c10barney");
		--ClientCmd("say record");

	elseif (name == "barney2") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c10barney2");
		--ClientCmd("say record");

	elseif (name == "stop") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_st_disable_spread 0");
    end
end



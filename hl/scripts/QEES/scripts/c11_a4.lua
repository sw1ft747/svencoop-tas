ClientCmd( "weapon_crossbow; weapon_gauss");
CreateTrigger("Spawn", Vector(-2135.156, -484.344, -2233.500), Vector(0, 0, 0), Vector(75.531, 47.688, 121.781));
CreateTrigger("podiem", Vector(-1253.284, 367.688, -2209.969), Vector(0, 0, 0), Vector(324.909, 56.098, 173.844));
CreateTrigger("podiemEnd", Vector(-1263.969, 1426.406, -1953.969), Vector(0, 0, 0), Vector(344.110, 85.870, 77.959));
CreateTrigger("toTop", Vector(616.062, 362.719, -1851.094), Vector(0, 0, 0), Vector(87.469, 85.406, 613.125));
CreateTrigger("topside", Vector(-255.938, 159.969, -1470.750), Vector(0, 0, 0), Vector(52.594, 53.719, 107.788));
CreateTrigger("boost", Vector(-144.625, 91.969, -1469.938), Vector(0, 0, 0), Vector(15.219, 85.812, 128.625));



printl( "Executed \"c11_a4.lua\"" );

function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "Spawn") then
		ClientCmd("sc_im_play c11_a4startV2");
		ClientCmd("sc_st_timescale 0.25");
		--ClientCmd("say spawn");
		ClientCmd("+forward");
		--ClientCmd("+tau");
		--CreateTimer(1.410, ClientCmd,"-tau");
		CreateTimer(0.403, ClientCmd,"-forward");
		CreateTimer(0.403, ClientCmd,"+jump");
		CreateTimer(0.406, ClientCmd,"-jump");
		--CreateTimer(12.000, ClientCmd,"say record");
		--CreateTimer(11.100, ClientCmd,"sc_st_timescale 0.05");
		CreateTimer(11.200, ClientCmd,"sc_im_stop");
		CreateTimer(11.200, ClientCmd,"sc_im_play c11_a4gunV2");
		CreateTimer(11.200, ClientCmd,"record");
		--CreateTimer(11.000, ClientCmd,"weapon_rpg");
		CreateTimer(12.400, ClientCmd,"sc_im_stop");
		CreateTimer(12.400, ClientCmd,"setang 25.505388 102.716675 0.000000");
		CreateTimer(12.400, ClientCmd,"weapon_crossbow");
		CreateTimer(13.100, ClientCmd,"say trigger_activate");

	elseif (name == "podiem") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c11_a4podiemV2");
		--ClientCmd("say start");

	elseif (name == "podiemEnd") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c11_a4podiemEndV2");
		--ClientCmd("say start");
		--ClientCmd("sc_st_timescale 0.05");

	elseif (name == "toTop") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c11_a4toTopV2");
		--ClientCmd( "weapon_crossbow");
		--ClientCmd("say start");
		ClientCmd("setang 0 180 0");
		--CreateTimer(1.200, ClientCmd,"sc_st_timescale 0.1");

	elseif (name == "topside") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c11_a4topsideV2");
		--ClientCmd("say start");

	elseif (name == "boost") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c11_a4boost");
		ClientCmd("say suicide");


    end
end



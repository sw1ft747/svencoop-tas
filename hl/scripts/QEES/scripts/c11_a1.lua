
CreateTrigger("1", Vector(2296.719, -4528.906, -797.938), Vector(0, 0, 0), Vector(498.906, 354.688, 327.031));
CreateTrigger("left", Vector(-2204.469, 881.281, 48.094), Vector(0, 0, 0), Vector(59.469, 42.781, 105.688));
CreateTrigger("right", Vector(-2344.250, 863.844, 43.906), Vector(0, 0, 0), Vector(64.969, 51.438, 114.594));
CreateTrigger("stop", Vector(-2359.500, -152.250, 45.812), Vector(0, 0, 0), Vector(263.375, 131.781, 84.094));
CreateTrigger("death", Vector(1905.281, -4063.969, -1092.281), Vector(0, 0, 0), Vector(8.906, 74.688, 92.625));
CreateTrigger("gauss", Vector(2440.500, -4034.250, -695.625), Vector(0, 0, 0), Vector(202.781, 96.062, 289.094));
CreateTrigger("1000fps", Vector(4884.625, -1749.562, -755.406), Vector(0, 0, -109.625), Vector(96.719, 83.906, 0));



printl( "Executed \"c11_a1.lua\"" );

function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "1") then
		ClientCmd("weapon_crossbow; wait; toggle_survival_mode;");
		CreateTimer(0.100, ClientCmd,"kill; wait; toggle_survival_mode; wait; weapon_crossbow; wait; toggle_survival_mode;");

	elseif (name == "left") then
		ClientCmd("sc_im_play c11_a1left\n");

	elseif (name == "right") then
		ClientCmd("sc_im_play c11_a1right\n");	

	elseif (name == "stop") then
		ClientCmd("sc_im_stop\n");

	elseif (name == "death") then
		ClientCmd("sc_im_stop\n");
		CreateTimer(0.000, ClientCmd,"kill; wait; toggle_survival_mode;");
		
	elseif (name == "gauss") then
		ClientCmd("weapon_gauss;\n");

	elseif (name == "1000fps") then
		--ClientCmd("fps_max 1000;\n");
		ClientCmd("sc_st_timescale 0.1;\n");


    end
end



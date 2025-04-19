CreateTrigger("1", Vector(-2561.531, 2802.406, 910.094), Vector(0, 0, 0), Vector(29.875, 153.844, 200.125));
CreateTrigger("2", Vector(-1566.812, 2740.469, 991.531), Vector(0, 0, 0), Vector(87.312, 3.344, 113.281));
CreateTrigger("fpsjumpbug", Vector(-1872.844, 2889.438, -1450.375), Vector(0, 0, 0), Vector(349.656, 316.344, 89.750));
CreateTrigger("fpsreturn", Vector(-1437.594, 2739.594, -1774.625), Vector(0, 0, 0), Vector(71.219, 557.062, 204.188));
CreateTrigger("3", Vector(-1503.344, 2886.344, 1006.000), Vector(0, 0, 0), Vector(38.312, 30.375, 53.438));

printl("c05a1 men");

function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "1") then
		ClientCmd("sc_im_stop;wait;sc_im_play c05a1button");	
	elseif (name == "2") then
		ClientCmd("-forward;sc_im_stop;w10;setang 6.335971 272.290649 0.000000;wait;sc_im_play c05a1nade");
    elseif (name == "fpsjumpbug") then
		ClientCmd("fps_max 1000");
	elseif (name == "fpsreturn") then
		ClientCmd("fps_max 500");
	elseif (name == "3") then
		ClientCmd("sc_im_stop;setang 89 180 0;sc_im_play c05a1drop")
	end
end

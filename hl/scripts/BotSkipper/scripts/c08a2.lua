CreateTrigger("eee1", Vector(3311.906, 961.062, 1884.625), Vector(0, 0, 0), Vector(16.312, 106.438, 134.688));
CreateTrigger("eee2", Vector(2718.094, 727.188, 2056.625), Vector(0, 0, 0), Vector(103.875, 24.000, 160.750));
CreateTrigger("eee3", Vector(1111.000, 1489.625, 2059.969), Vector(0, 0, 0), Vector(46.281, 162.469, 177.219));
CreateTrigger("eee4", Vector(162.531, 1150.969, 2221.344), Vector(0, 0, 0), Vector(81.656, 40.656, 133.625));
CreateTrigger("kill", Vector(323.969, -70.094, 2023.062), Vector(0, 0, -39.062), Vector(62.219, 58.594, 0));
CreateTrigger("trigger", Vector(3579.860, 560.000, 2054.031), Vector(0, 0, 0), Vector(68.109, 63.979, 70.053));
printl("c08a2");

function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "eee1") then 
		ClientCmd("sc_im_stop;sc_im_play c08a2climb;say playing c08a2climb");
	elseif (name == "eee2") then
		ClientCmd("sc_im_stop;wait;sc_im_play c08a2boost1;weapon_crossbow;say playing c08_a2boost1");
	elseif (name == "eee3") then
		ClientCmd("sc_im_stop;wait;sc_im_play c08_a2climb2;say playing c08_a2climb2");  
	elseif (name == "eee4") then
		ClientCmd("sc_im_stop;wait;sc_im_record c08a2mraz;say recording c08_a2mraz");
	elseif (name == "kill") then
		ClientCmd("kill;toggle_survival_mode");
	elseif (name == "trigger") then
		ClientCmd("toggle_survival_mode;toggle_survival_mode");
	end
end

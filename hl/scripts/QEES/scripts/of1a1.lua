CreateTrigger("spawn", Vector(-687.531, 3076.781, 148.156), Vector(0, 0, -146.594), Vector(33.281, 35.469, 0));
CreateTrigger("door", Vector(-1020.094, -366.156, -116.062), Vector(0, 0, 0), Vector(69.219, 145.750, 150.156));
CreateTrigger("lasers", Vector(-896.844, -1452.250, -30.312), Vector(0, 0, 0), Vector(75.719, 57.781, 83.562));




printl( "Executed \"of1a1.lua\"" );

function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "spawn") then
		ClientCmd("sc_im_play of1a1_spawn");
		ClientCmd("setang -2.032367 326.502686 0.000000");

	elseif (name == "door") then
		CreateTimer(0.050, ClientCmd,"kill");
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play of1a1_door");

	elseif (name == "lasers") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play of1a1_lasers");
    end
end



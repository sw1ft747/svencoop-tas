CreateTrigger("ducker", Vector(-1536.775, -126.861, -1187.875), Vector(0, 0, 0), Vector(500.838, 51.642, 152.929));
CreateTrigger("fps1", Vector(-1399.688, 122.375, 1400.812), Vector(0, 0, -55.781), Vector(245.688, 259.906, 0));
printl("c05a3 men");

function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "fps1") then 
		ClientCmd("fps_max 100");
	elseif (name == "fps2") then
		ClientCmd("fps_max 500");
	elseif (name == "ducker") then
		ClientCmd("sc_im_play ducker");
	end
end

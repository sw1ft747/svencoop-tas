CreateTrigger("20", Vector(-399.500, 773.156, -902.812), Vector(0, 0, -360.000), Vector(466.500, 89.219, 0));
CreateTrigger("200", Vector(-284.156, 968.156, -1002.500), Vector(0, 0, -195.875), Vector(293.531, 769.219, 0));

printl("sukaa");

function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "20") then
		ClientCmd("fps_max 20");
	elseif (name == "200") then
		ClientCmd("fps_max 500")
	end
end
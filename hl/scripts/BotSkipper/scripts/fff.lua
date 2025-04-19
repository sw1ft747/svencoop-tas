CreateTrigger("crossBow", Vector(-227.406, -868.688, 377.312), Vector(0, 0, 0), Vector(37.469, 38.875, 161.031));
CreateTrigger("trigger", Vector(-699.551, 572.743, -278.761), Vector(0, 0, -75.208), Vector(98.171, 62.226, 0));



printl( "Executed \"c13_a3.lua\"" );

function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "crossBow") then
		ClientCmd("weapon_crossbow;");
		ClientCmd("setang -0.161591 108.770142 0.000000");
	elseif (name == "trigger") then
		ClientCmd("weapon_357");
    end
end

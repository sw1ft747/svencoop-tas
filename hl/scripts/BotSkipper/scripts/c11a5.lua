CreateTrigger("trigger", Vector(-4226.625, -1473.625, -1439.406), Vector(0, 0, 0), Vector(1954.281, 88.625, 184.781));

printl("c11a1 men");

function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "1") then
		ClientCmd("weapon_crossbow");
	elseif (name == "trigger") then
		ClientCmd("toggle_survival_mode")
	end
end

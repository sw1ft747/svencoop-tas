CreateTimer(2.000, ClientCmd,"toggle_survival_mode");
CreateTimer(2.000, ClientCmd,"toggle_survival_mode");
ClientCmd("weapon_gauss");
CreateTrigger("crossBow", Vector(-227.406, -868.688, 377.312), Vector(0, 0, 0), Vector(37.469, 38.875, 161.031));



printl( "Executed \"c13_a3.lua\"" );

function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "crossBow") then
		ClientCmd("weapon_crossbow;");
		ClientCmd("setang -0.161591 108.770142 0.000000");

    end
end



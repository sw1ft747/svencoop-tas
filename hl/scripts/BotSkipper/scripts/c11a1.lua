function SpeedrunStart()
	CreateTrigger("trigger", Vector(2504.812, -4265.031, -805.906), Vector(0, 0, 0), Vector(37.156, 19.500, 133.875));
	ClientCmd("weapon_gauss");
end

printl("c111111111111111");

function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "trigger") then 
		CreateTimer(0.000, ClientCmd,"weapon_crossbow");
		CreateTimer(0.245, ClientCmd,"sc_im_play c11_a1_new");
		
	return true;

	end
end
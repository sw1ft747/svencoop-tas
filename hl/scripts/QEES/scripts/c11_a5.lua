ClientCmd( "weapon_gauss\n" );
CreateTrigger("DarkRoom", Vector(-717.625, -2607.969, -1588.563), Vector(0, 0, -77.160), Vector(79.344, 319.844, 0));
CreateTrigger("Rocket", Vector(-2961.861, -1465.242, -1322.044), Vector(0, 0, 0), Vector(118.508, 71.013, 48.675));
CreateTrigger("Bow", Vector(-2937.406, -1459.719, -1427.031), Vector(0, 0, 0), Vector(91.594, 35.156, 52.625));


printl( "Executed \"c11_a5.lua\"" );

function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "DarkRoom") then
		
		ClientCmd( "weapon_gauss" );

	elseif (name == "Rocket") then
		ClientCmd( "weapon_rpg" );

	elseif (name == "Bow") then
		ClientCmd( "weapon_crossbow" );
    end
end



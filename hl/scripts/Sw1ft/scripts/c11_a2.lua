CreateTrigger("c11a2_take_xbow", Vector(-40.938, 482.688, -150.781), Vector(0, 0, 0), Vector(176.031, 136.281, 142.844));

printl( "Executed \"c11_a2.lua\"" );

function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	
	if ( name == "c11a2_take_xbow" ) then
		ClientCmd("weapon_crossbow");
    end
end



CreateTrigger("Spawn", Vector(-1790.938, -2678.438, -1347.531), Vector(0, 0, 0), Vector(33.312, 38.031, 104.969));
--CreateTrigger("split", Vector(-703.985, -502.069, -1669.906), Vector(0, 0, 0), Vector(201.877, 107.758, 93.811));
CreateTrigger("split", Vector(-1730.844, -909.750, -1710.656), Vector(0, 0, 0), Vector(51.188, 192.688, 156.406));



printl( "Executed \"c02_a1.lua\"" );

function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "Spawn") then
		CreateTimer(0.400, ClientCmd,"sc_im_play c07_a1_spawn");
		--CreateTimer(0.400, ClientCmd,"say 123");

	elseif (name == "split") then
		ClientCmd("sc_im_split; say jopa");

    end
end



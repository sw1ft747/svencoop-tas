CreateTimer(5.0, ClientCmd,"+tau");
CreateTimer(8.500, ClientCmd,"-tau");
CreateTimer(11.250, ClientCmd,"sc_im_stop");



CreateTrigger("Spawn", Vector(72.594, 1970.062, 1664.906), Vector(0, 0, 0), Vector(39.625, 21.344, 137.906));



printl( "Executed \"c14.lua\"" );

function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "Spawn") then
		ClientCmd("setang 0.000000 300.926514 0.000000");
		ClientCmd("sc_im_play c14_spawn_gauss_boy");
		
    end
end



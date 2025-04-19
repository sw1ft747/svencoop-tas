CreateTrigger("DarkRoom", Vector(-3068.344, -819.312, 183.969), Vector(0, 0, -313.938), Vector(305.031, 307.062, 0));
CreateTrigger("afterDark", Vector(-206.906, -861.312, 231.188), Vector(0, 0, 0), Vector(88.000, 111.438, 114.531));


printl( "Executed \"c16_a1.lua\"" );

function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "DarkRoom") then
		CreateTimer(8.462, ClientCmd,"sc_st_timescale 0.01");
		CreateTimer(8.000, ClientCmd,"+attack2");
		CreateTimer(8.660, ClientCmd,"-attack2");
		CreateTimer(8.662, ClientCmd,"setang 0 228.268433 0");
		CreateTimer(8.660, ClientCmd,"setang 3.149459 32.601929 0.000000");
		CreateTimer(8.725, ClientCmd,"+duck");
		CreateTimer(9.000, ClientCmd,"-duck");
		CreateTimer(8.655, ClientCmd,"+jump");
		CreateTimer(8.690, ClientCmd,"-jump");
		CreateTimer(0.222, ClientCmd,"sc_st_timescale 0.5");
		ClientCmd( "weapon_crossbow;weapon_gauss");

	elseif (name == "afterDark") then
		CreateTimer(0.000, ClientCmd,"setang -3.260106 209.053345 0.000000");

    end
end



CreateTrigger("water", Vector(256.375, 1479.438, -1279.000), Vector(0, 0, 0), Vector(81.094, 95.969, 150.375));
CreateTrigger("setang", Vector(-8.781, 1505.875, -1275.250), Vector(0, 0, 0), Vector(43.062, 74.969, 120.031));
CreateTrigger("time_scale", Vector(1528.344, 1482.719, -1278.281), Vector(0, 0, 0), Vector(36.344, 124.562, 125.469));

printl( "Executed \"c13_a2.lua\"" );

function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "water") then
		ClientCmd( "sc_st_timescale 0.25");
		ClientCmd("sc_im_play c13_a2Skipperwater");
		ClientCmd("setang 0 0 0");

	elseif (name == "setang") then
		ClientCmd("setang -10.620719 354.237671 0.000000");
		--just hold W--

	elseif (name == "time_scale") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c13_a2DeathForBoost");
	
    end
end


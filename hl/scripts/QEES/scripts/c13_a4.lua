ClientCmd("sc_im_play c13_a4_start");

CreateTrigger("start_boost", Vector(1704.094, -543.625, -251.250), Vector(0, 0, 0), Vector(26.375, 31.656, 84.344));
--CreateTrigger("start", Vector(285.969, -1203.500, -547.125), Vector(0, 0, 0), Vector(97.438, 67.969, 66.594));


printl( "Executed \"c13_a4.lua\"" );

function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "start_boost") then
	ClientCmd("sc_im_play c13_a4_boost");

	elseif (name == "start") then
		ClientCmd("sc_im_split; say jopa");
    end
end



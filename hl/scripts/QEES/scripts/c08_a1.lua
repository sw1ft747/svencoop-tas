ClientCmd("sc_St_timescale 0.25");
CreateTrigger("spawn", Vector(-891.938, 1893.406, 452.406), Vector(0, 0, 0), Vector(60.125, 52.500, 132.000));
CreateTrigger("Grenades", Vector(-1000.125, 1889.406, -262.188), Vector(0, 0, 0), Vector(38.562, 145.594, 137.750));
CreateTrigger("Drop", Vector(-652.594, -995.906, -263.219), Vector(0, 0, 0), Vector(19.344, 187.062, 157.250));
CreateTrigger("tonnel", Vector(-649.969, -1050.188, -1056.188), Vector(0, 0, -129.125), Vector(10.969, 111.688, 0));
CreateTrigger("tonnel2", Vector(77.938, -172.344, -1269.000), Vector(0, 0, 0), Vector(10.250, 119.438, 142.531));
CreateTrigger("tonnel3", Vector(538.625, -193.344, -1145.906), Vector(0, 0, 0), Vector(132.375, 21.094, 137.406));
CreateTrigger("boost", Vector(1971.344, 473.406, -942.406), Vector(0, 0, 0), Vector(10.938, 115.938, 166.594));


printl( "Executed \"c08_a1.lua\"" );

function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "spawn") then
		ClientCmd("sc_im_play c08_a1Spawn");

	elseif (name == "Grenades") then	
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c08_a1Grenades");
		--ClientCmd("say record");

	elseif (name == "Drop") then	
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c08_a1Drop");
		--ClientCmd("say record");

	elseif (name == "tonnel") then	
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_record c08_a1tonnel");
		--ClientCmd("say record");

	elseif (name == "tonnel2") then	
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_record c08_a1tonnel2");
		--ClientCmd("say record");

	elseif (name == "tonnel3") then	
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_record c08_a1tonnel3");
		--ClientCmd("say record");

	elseif (name == "boost") then	
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_record c08_a1boost");
		--ClientCmd("say record");
    end
end



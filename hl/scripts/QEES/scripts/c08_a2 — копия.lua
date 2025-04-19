--CreateTimer(10.000, ClientCmd,"sc_st_timescale 0.05");
--CreateTrigger("spawnRight", Vector(3507.531, 600.125, 2028.250), Vector(0, 0, 0), Vector(31.469, 38.938, 124.156));

--ClientCmd("setpos 338.031250 858.625000 2256.031250");

CreateTrigger("spawnLeft", Vector(3628.656, 606.531, 2025.844), Vector(0, 0, 0), Vector(33.219, 33.500, 127.094));
CreateTrigger("door", Vector(3551.344, 536.406, 2040.156), Vector(0, 0, 0), Vector(64.125, 7.469, 100.719));
CreateTrigger("duckTap", Vector(2990.344, 822.500, 1875.438), Vector(0, 0, 0), Vector(96.875, 11.750, 143.469));
CreateTrigger("steps", Vector(2817.188, 503.219, 2011.219), Vector(0, 0, 0), Vector(13.438, 97.406, 121.438));
CreateTrigger("roomZalypa", Vector(2720.375, 677.094, 2057.062), Vector(0, 0, 0), Vector(94.656, 26.344, 165.938));
CreateTrigger("fixZalypaboost", Vector(1471.625, 1311.031, 2054.938), Vector(0, 0, 0), Vector(16.219, 161.469, 164.094));
CreateTrigger("laddergovna", Vector(1130.500, 1487.000, 2063.688), Vector(0, 0, 0), Vector(23.719, 164.094, 178.625));
CreateTrigger("finallGovno", Vector(1005.031, 1055.812, 2143.438), Vector(0, 0, 0), Vector(15.656, 143.594, 196.000));
CreateTrigger("sc_end", Vector(879.375, 865.156, 2222.562), Vector(0, 0, 0), Vector(27.344, 158.938, 142.094));

CreateTrigger("frozen_door", Vector(277.719, 712.281, 2225.219), Vector(0, 0, 0), Vector(76.344, 44.094, 90.125));
--CreateTrigger("split", Vector(376.750, 689.719, 2223.750), Vector(0, 0, 0), Vector(83.156, 10.875, 147.375));
CreateTrigger("Survival", Vector(328.688, -67.156, 1972.562), Vector(0, 0, -14.594), Vector(58.344, 59.531, 0));



CreateTimer(0.700, DisableSurvivalMode);
CreateTimer(0.700, EnableSurvivalMode);


printl( "Executed \"c08_a2.lua\"" );

function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "spawnRight") then
		--ClientCmd("sc_im_record c08_a2spawnRight");
		--ClientCmd("setang -2.097920 311.682129 0.000000");
		--CreateTimer(0.105, ClientCmd,"+forward");
		--CreateTimer(0.400, ClientCmd,"-forward");
		--CreateTimer(0.300, ClientCmd,"setang -0.590040 235.508423 0.000000");
		--CreateTimer(0.700, ClientCmd,"setang 0 270 0");

	elseif (name == "spawnLeft") then
		ClientCmd("setang -2.097921 225.856934 0.000000");
		ClientCmd("sc_im_play c08_a2spawnLeft");
		CreateTimer(0.105, ClientCmd,"+forward");
		CreateTimer(0.400, ClientCmd,"-forward");
		CreateTimer(0.402, ClientCmd,"setang 0 270 0");

	elseif (name == "door") then
		ClientCmd("setang 0 270 0");
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c08_a2door");
		--ClientCmd("say record");

	elseif (name == "duckTap") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c08_a2duckTap");
		--ClientCmd("say record");
	
	elseif (name == "steps") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c08_a2steps");
		--ClientCmd("say record");
		ClientCmd("setang 0 180 0");

	elseif (name == "roomZalypa") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c08_a2roomZalypa");
		--ClientCmd("say record");

	elseif (name == "fixZalypaboost") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c08_a2fixZalypaboost");

	elseif (name == "laddergovna") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c08_a2laddergovna");
		ClientCmd("weapon_9mmAR");
	
	elseif (name == "finallGovno") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c08_a2finallGovno");

	elseif (name == "sc_end") then
		ClientCmd("sc_im_stop");

	elseif (name == "frozen_door") then
		CreateTimer(1.6, ClientCmd,"sc_st_setangles 0.871262 206.713257 600");
		CreateTimer(2.95, ClientCmd,"sc_im_play c08_a2_freezedoor");

	elseif (name == "split") then
		ClientCmd("sc_im_split; say jopa");

	

	elseif (name == "Survival") then
		CreateTimer(0.000, DisableSurvivalMode);
		CreateTimer(0.000, EnableSurvivalMode);
		

    end
end



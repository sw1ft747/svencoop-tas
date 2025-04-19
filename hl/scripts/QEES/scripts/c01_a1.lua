CreateTrigger("spawn", Vector(513.969, 243.500, -225.469), Vector(0, 0, 0), Vector(167.750, 155.344, 124.625));

CreateTrigger("aferDoor", Vector(-2548.593750, -818.906250, -311.906250), Vector(0, 0, 0), Vector(26.406, 135.438, 123.969));
CreateTrigger("scToElevate", Vector(-2399.938, -820.312, -178.656), Vector(0, 0, -96.719), Vector(21.438, 136.656, 0));
--CreateTrigger("Drop", Vector(-1650.375, -819.875, -279.500), Vector(0, 0, 0), Vector(25.719, 140.594, 174.531));
CreateTrigger("freeze1", Vector(-1606.156, -787.094, -278.719), Vector(0, 0, 0), Vector(19.250, 111.375, 98.812));
--CreateTrigger("JumpBug", Vector(-1721.406, -800.906, -1156.688), Vector(0, 0, 0), Vector(11.344, 96.875, 169.562));
CreateTrigger("freeze2", Vector(-1651.375, -820.250, -1155.156), Vector(0, 0, 0), Vector(25.594, 138.125, 133.094));
CreateTrigger("afterDrop", Vector(-1626.500, -819.812, -1154.375), Vector(0, 0, 0), Vector(16.344, 132.219, 109.719));
CreateTrigger("freeze3", Vector(-906.375, -957.844, -1122.469), Vector(0, 0, 0), Vector(114.250, 26.750, 118.812));
CreateTrigger("freeze4", Vector(-2428.125, -1714.062, -1155.406), Vector(0, 0, 0), Vector(128.781, 8.000, 95.219));
CreateTrigger("ComandRoom", Vector(-1192.938, -2357.594, -1155.062), Vector(0, 0, 0), Vector(60.781, 0.562, 87.719));
--CreateTrigger("ComandRoom**", Vector(-1209.188, -2367.969, -1155.875), Vector(0, 0, 0), Vector(75.156, 8.031, 108.344));
CreateTrigger("ANG", Vector(-1217.875, -2842.281, -1154.812), Vector(0, 0, 0), Vector(83.656, 16.188, 89.969));
CreateTrigger("afterComandRoom", Vector(-1208.438, -2861.156, -1155.281), Vector(0, 0, 0), Vector(77.875, 5.594, 129.531));
CreateTrigger("freeze5", Vector(-2021.000, -2786.688, -1148.188), Vector(0, 0, 0), Vector(78.938, 18.594, 117.875));



printl( "Executed \"c01_a1.lua\"" );

function OnTouchTrigger(name)

	printl( "Touched trigger: \"" .. name .. "\"" );
	
	if (name == "aferDoor") then
		ClientCmd("sc_im_play c01_a1_afterDoor");
		ClientCmd("say record");
		CreateTimer(0.480, ClientCmd,"sc_freeze2");
		CreateTimer(0.780, ClientCmd,"sc_freeze2");

	elseif (name == "spawn") then
		ClientCmd("fps_max 20");
		ClientCmd("sc_st_timescale 0.5");
		ClientCmd("sc_fastrun");
		CreateTimer(14.125, ClientCmd,"sc_st_timescale 0.1");
		CreateTimer(14.000, ClientCmd,"kill");
		CreateTimer(14.825, ClientCmd,"sc_fastrun");
		CreateTimer(14.200, ClientCmd,"fps_max 500");
		
	elseif (name == "scToElevate") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c01_a1_ElevateV2");
		ClientCmd("setang -1.210439 359.423218 0.000000");
		ClientCmd("say record");
	
	elseif (name == "freeze1") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_freeze2");
		CreateTimer(2.000, ClientCmd,"sc_freeze2");
		CreateTimer(2.000, ClientCmd,"setang -0.358137 165.250854 0.000000");
		CreateTimer(2.000, ClientCmd,"sc_im_play c01_a1_DropV2");
		ClientCmd("say record");
		ClientCmd("fps_max 1000");
	
	elseif (name == "JumpBug") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c01_a1_JumpBugV2");
		--ClientCmd("sc_jumpbug");
		ClientCmd("say record");

	elseif (name == "freeze2") then
		--ClientCmd("sc_im_stop");
		ClientCmd("sc_freeze2");
		ClientCmd("fps_max 400");
		CreateTimer(0.220, ClientCmd,"fps_max 500");
		CreateTimer(0.240, ClientCmd,"sc_freeze2");

	elseif (name == "afterDrop") then
		ClientCmd("sc_im_play c01_a1_afterDropV2");
		ClientCmd("say record");

	elseif (name == "freeze3") then
		ClientCmd("sc_im_stop");
		CreateTimer(0.350, ClientCmd,"sc_im_record c01_a1_afterFreeze3V2");
		ClientCmd("sc_freeze2");
		CreateTimer(0.350, ClientCmd,"sc_freeze2");
		ClientCmd("say record");
	
	elseif (name == "freeze4") then
		ClientCmd("sc_im_stop");
		CreateTimer(0.200, ClientCmd,"sc_im_record c01_a1_afterFreeze4V2");
		ClientCmd("sc_freeze2");
		CreateTimer(0.200, ClientCmd,"sc_freeze2");
		ClientCmd("say record");
		CreateTimer(0.200, ClientCmd,"setang 0 340 0");
	
	--[[elseif (name == "ComandRoom") then
		ClientCmd("sc_im_stop");
		ClientCmd("setang 6.591243 314.945068 0.000000");
		ClientCmd("sc_im_record c01_a1_ComandRoom");

	--[[elseif (name == "ComandRoom_2") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c01_a1_ComandRoom");]]

	elseif (name == "ANG") then
		ClientCmd("setang -0.539365 272.521362 0.000000");

	elseif (name == "afterComandRoom") then
		ClientCmd("setang 1.296303 245.044556 0.000000");
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c01_a1_AfterComandRoomV2");
		ClientCmd("say record");

	elseif (name == "freeze5") then
		ClientCmd("sc_im_stop");
		CreateTimer(4.200, ClientCmd,"sc_im_record c01_a1_afterFreeze5V3");
		ClientCmd("sc_freeze2");
		CreateTimer(4.200, ClientCmd,"sc_freeze2");
		ClientCmd("say record");

    end
end



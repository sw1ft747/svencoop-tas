-- CreateTrigger("spawn1", Vector(159.719, -197.562, 1924.031), Vector(0, 0, -40.000), Vector(82.188, 87.938, 40));
CreateTrigger("spawn2", Vector(157.000, 25.031, 1924.031), Vector(0, 0, -40.000), Vector(84.906, 80.031, 40));
CreateTrigger("stopmove", Vector(-522.938, -150.031, 1681.844), Vector(0, 0, 0), Vector(61.531, 213.781, 202.969));

printl( "Executed \"c08_a2.lua\"" );

function OnTouchTrigger(name)

	printl( "Touched trigger: \"" .. name .. "\"" );
	
	if (name == "spawn1") then
	
		ClientCmd("weapon_crossbow");
		PrintChatText("SPAWN #1 RIGHT NOW");
		CreateTimer(0.15, PrintChatText, "[spawn1] Recording/playing back inputs...");
		-- CreateTimer(0.15, ClientCmd, "sc_im_record c8a2_spawn1; sc_strafe; sc_strafe_ignore_ground 0");
		CreateTimer(0.15, ClientCmd, "sc_im_play c8a2_spawn1; sc_strafe; sc_strafe_ignore_ground 0");
	
	elseif (name == "spawn2") then
	
		ClientCmd("weapon_crossbow");
		PrintChatText("SPAWN #2 RIGHT NOW");
		CreateTimer(0.15, PrintChatText, "[spawn2] Recording/playing back inputs...");
		-- CreateTimer(0.15, ClientCmd, "sc_im_record c8a2_spawn2; sc_strafe; sc_strafe_ignore_ground 0");
		CreateTimer(0.15, ClientCmd, "sc_im_play c8a2_spawn2; sc_strafe; sc_strafe_ignore_ground 0");
	
	elseif (name == "stopmove") then
	
		CreateTimer(0.1, PrintChatText, "[stopmove] Stopped recording/playing back inputs...");
		CreateTimer(0.1, ClientCmd, "sc_im_stop; sc_strafe_ignore_ground 1");
    
	end
	
	return true;
end

-- CreateTimer(1.0, ClientCmd, "sc_im_record pizdac8a2");
-- CreateTimer(0.5, ClientCmd, "sc_im_play pizdac8a2");
-- CreateTimer(0.5, PrintChatText, "Recording/playing back inputs...");
-- CreateTimer(13.0, ClientCmd, "+attack;wait;-attack");
-- CreateTimer(13.5, ClientCmd, "+jump;wait;-jump");
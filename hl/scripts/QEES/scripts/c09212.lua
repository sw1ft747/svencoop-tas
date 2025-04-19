ClientCmd( "weapon_medkit");
CreateTimer(0.000, ClientCmd,"drop");
CreateTimer(0.002, ClientCmd,"kill");
CreateTimer(0.200, DisableSurvivalMode);
CreateTimer(0.200, EnableSurvivalMode);
CreateTimer(0.204, ClientCmd,"weapon_medkit");
CreateTimer(0.204, ClientCmd,"drop");
CreateTimer(0.258, ClientCmd,"gibme");
CreateTimer(0.360, DisableSurvivalMode);
CreateTimer(0.360, EnableSurvivalMode);


printl( "Executed \"c09.lua\"" );

function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "123") then
		
    end
end



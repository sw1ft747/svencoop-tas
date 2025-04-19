ClientCmd( "weapon_medkit");
CreateTimer(0.000, ClientCmd,"drop");
CreateTimer(0.002, ClientCmd,"kill");
CreateTimer(0.200, DisableSurvivalMode);
CreateTimer(0.200, EnableSurvivalMode);
CreateTimer(0.201, DisableSurvivalMode);
CreateTimer(0.201, EnableSurvivalMode);
CreateTimer(0.204, ClientCmd,"weapon_medkit");
CreateTimer(0.204, ClientCmd,"drop");
CreateTimer(0.258, ClientCmd,"gibme");
CreateTimer(0.360, DisableSurvivalMode);
CreateTimer(0.360, EnableSurvivalMode);
CreateTimer(0.361, DisableSurvivalMode);
CreateTimer(0.364, ClientCmd,"weapon_medkit");
CreateTimer(0.364, ClientCmd,"drop");
CreateTimer(0.366, ClientCmd,"gibme");
CreateTimer(0.500, DisableSurvivalMode);
CreateTimer(0.500, EnableSurvivalMode);
CreateTimer(0.501, DisableSurvivalMode);
CreateTimer(0.654, ClientCmd,"weapon_medkit");
CreateTimer(0.656, ClientCmd,"drop");
CreateTimer(0.660, ClientCmd,"gibme");
CreateTimer(0.750, DisableSurvivalMode);
CreateTimer(0.750, EnableSurvivalMode);
CreateTimer(0.850, DisableSurvivalMode);


printl( "Executed \"c09.lua\"" );

function OnTouchTrigger(name)
    printl( "Touched trigger: \"" .. name .. "\"" );
    if (name == "123") then
        
    end
end
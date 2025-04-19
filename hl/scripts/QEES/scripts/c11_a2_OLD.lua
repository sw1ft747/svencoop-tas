function InitTriggers()
	CreateTrigger("spawn", Vector(-1552.500, -3741.625, -104.375), Vector(0, 0, 0), Vector(54.406, 86.844, 123.375));
	CreateTrigger("tryba2", Vector(-328.125, -5060.031, -100.969), Vector(0, 0, 0), Vector(170.344, 51.375, 81.500));
	--CreateTrigger("povorot1", Vector(-2731.438, -4509.250, -97.938), Vector(0, 0, 0), Vector(84.625, 26.000, 105.719));
	--CreateTrigger("povorot2", Vector(242.406, 1076.281, -120.188), Vector(0, 0, 0), Vector(37.531, 73.375, 94.250));
	
	CreateTrigger("povorotGovna", Vector(554.906, 583.156, -113.000), Vector(0, 0, 0), Vector(53.719, 35.156, 112.312));
	CreateTrigger("trigger1", Vector(-2455.531, 2314.031, -204.688), Vector(0, 0, 0), Vector(72.562, 264.406, 186.406));
end

function SpeedrunInit()
    SetTimescale( 0.25 );

    RemoveAllTimers();
	InitTriggers();

    ClientCmd("-sc_ducktap; -jump; -duck; -forward; -back; -moveleft; -moveright; sc_strafe 0; sc_strafe_yaw \"\"; sc_strafe_ignore_ground 1; -attack; sc_im_stop");
    ClientCmd("sc_strafe_type 0; sc_strafe_dir 3; sc_st_setangles_stop; sc_autojump_inconsistent 0; mp_classic_mode 1; clockwindow 0");
end

function SpeedrunStart()
	

	ClientCmd( "weapon_shotgun; weapon_gauss");
	ClientCmd("impulse 100");
	CreateTimer(4.000, ClientCmd,"impulse 100");
end

function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );

	if (name == "spawn") then
		ClientCmd("sc_im_play c11_a2SpawnV3_V2");
		--ClientCmd("sc_st_timescale 0.25");
		CreateTimer(0.074, ClientCmd,"+forward");

		

		--CreateTimer(8.000, ClientCmd,"sc_st_timescale 0.05");
		--CreateTimer(2.200, ClientCmd,"say record");

		CreateTimer(2.200, ClientCmd,"sc_im_stop");
		CreateTimer(2.200, ClientCmd,"sc_im_play c11_a2Spawn2V3_V2");

		CreateTimer(3.500, ClientCmd,"sc_im_stop");
		CreateTimer(3.500, ClientCmd,"sc_im_play c11_a2SpawnZalypa_V2");

		ClientCmd("+tau");
		ClientCmd("setang 0 1.461182 0");
		CreateTimer(1.205, ClientCmd,"-tau");
		--CreateTimer(1.075, ClientCmd,"+attack2");
		CreateTimer(0.420, ClientCmd,"+jump");
		CreateTimer(0.422, ClientCmd,"-jump");
		CreateTimer(0.421, ClientCmd,"-forward");

		--CreateTimer(7.400, ClientCmd,"sc_strafe");
		CreateTimer(7.500, ClientCmd,"sc_im_stop");
		--CreateTimer(7.500, ClientCmd,"+back");
		--CreateTimer(7.670, ClientCmd,"-back");
		CreateTimer(7.500, ClientCmd,"sc_im_play c11_a2trybaaaaa_V2");
		--CreateTimer(7.650, ClientCmd,"setang 0 270 0");
		--CreateTimer(7.500, ClientCmd,"say record");
		--CreateTimer(7.670, ClientCmd,"sc_strafe");

		CreateTimer(8.100, ClientCmd,"sc_im_stop");
		CreateTimer(8.100, ClientCmd,"sc_im_play c11_a2HEADCRAB_V2");

		--CreateTimer(10.000, ClientCmd,"sc_im_split");
		--CreateTimer(10.000, ClientCmd,"say 123");
		
	elseif (name == "tryba2") then
		ClientCmd("sc_im_stop");
		--ClientCmd("sc_fastrun");
		ClientCmd("sc_im_play c11_a2GodBoostV3_V2");
		ClientCmd("toggle_survival_mode wait; toggle_survival_mode");
		--ClientCmd("sc_st_timescale 0.05");
	elseif (name == "povorotGovna") then
		ClientCmd("sc_im_stop");
		CreateTimer(0.060, ClientCmd,"kill; wait; toggle_survival_mode;");
		CreateTimer(0.160, ClientCmd,"wait; toggle_survival_mode; wait; toggle_survival_mode; wait; toggle_survival_mode; weapon_gauss; weapon_crossbow;");
		--ClientCmd("weapon_crossbow");
		ClientCmd("sc_st_timescale 0.1");
	elseif (name == "trigger1") then
		CreateTimer(0.120, ClientCmd,"toggle_survival_mode wait; toggle_survival_mode");
    end

	return true;
end

function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
    printl( "OnPlayerSpawn()" );
    
    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) .. ", viewangles: " .. tostring(pPlayerEdict.vars.angles) .. "" );

    local sPlayerName = pPlayerEdict.vars.netname;

    if ( sPlayerName == "QEES51" ) then
        -- pPlayerEdict.vars.origin = Vector( 3464.000000, 1813.000000, -511.000000 );
        -- pPlayerEdict.vars.angles = Vector( 0.000000, 300.000000, 0.000000 );
    end
end

SpeedrunInit();

printl( "Executed \"c11_a2.lua\"" );
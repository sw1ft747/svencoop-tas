ClientCmd( "weapon_gauss");
ClientCmd("sc_st_timescale 0.25");
CreateTrigger("spawnTry1", Vector(-2010.281, -470.562, -2209.969), Vector(0, 0, 0), Vector(43.000, 56.719, 62.998));
CreateTrigger("podiem1", Vector(-1253.284, 367.688, -2209.969), Vector(0, 0, 0), Vector(324.909, 56.098, 173.844));
CreateTrigger("podiemEnd1", Vector(-1263.969, 1426.406, -1953.969), Vector(0, 0, 0), Vector(344.110, 85.870, 77.959));
CreateTrigger("toTop1", Vector(559.969, 337.910, -1655.969), Vector(0, 0, 0), Vector(31.097, 142.090, 67.821));
CreateTrigger("topside1", Vector(-274.250, 128.069, -1441.969), Vector(0, 0, 0), Vector(93.655, 31.900, 61.462));


printl( "Executed \"c11_a4.lua\"" );

function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "spawnTry1") then
		--ClientCmd("say 1");
		ClientCmd("+tau");
		CreateTimer(1.000, ClientCmd,"-tau");
		ClientCmd("sc_im_play c11_a4spawnV2");
		CreateTimer(0.020, ClientCmd,"+jump");
		CreateTimer(0.026, ClientCmd,"-jump");
		--CreateTimer(6.200, ClientCmd,"say record");
		CreateTimer(6.200, ClientCmd,"sc_im_stop");
		CreateTimer(6.200, ClientCmd,"sc_im_play c11_a4XBowBoost");
		CreateTimer(10.860, ClientCmd,"sc_im_stop");
		CreateTimer(10.864, ClientCmd,"kill");

	elseif (name == "podiem1") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c11_a4podiemV2");
		--ClientCmd("say start");
		--CreateTimer(0.200, ClientCmd,"sc_st_timescale 0.05");

	elseif (name == "podiemEnd1") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c11_a4podiemEndV2");
		--ClientCmd("say start");
		--ClientCmd("sc_st_timescale 0.05");

	elseif (name == "topside1") then
		ClientCmd("sc_im_stop");
		ClientCmd("sc_im_play c11_a4topsideV2");
		ClientCmd("say start");

    end
end



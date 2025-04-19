

printl( "Executed \"c02_a2.lua\"" );

function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "90") then
		--ClientCmd("+back")
		--CreateTimer(0.30, ClientCmd,"-back");

	elseif (name == "split") then
		ClientCmd("sc_im_split");

    end
end

function SpeedrunStart()
    ClientCmd( "weapon_medkit");
	CreateTrigger("90", Vector(-239.625, 990.562, -1199.562), Vector(0, 0, 0), Vector(182.094, 116.594, 162.875));

	CreateTimer(0.050, ClientCmd,"rcon_password 1337");
	--CreateTimer(0.052, ClientCmd,"-jump");
	--CreateTimer(0.052, ClientCmd,"kill");
	CreateTimer(0.0, ClientCmd,"weapon_medkit");
	--CreateTimer(0.820, ClientCmd,"-forward");
	--CreateTimer(0.792, ClientCmd,"rcon toggle_survival_mode");
	--CreateTimer(0.792, ClientCmd,"rcon toggle_survival_mode");

end
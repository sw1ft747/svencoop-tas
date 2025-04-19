--CreateTimer(0.400, ClientCmd,"say 123");
--CreateTrigger("split", Vector(-59.691, 318.020, -615.911), Vector(0, 0, 0), Vector(63.006, 179.128, 98.484));

function SpeedrunStart()
    CreateTimer(0.250, ClientCmd,"sc_im_play c07_a2_qees");
    CreateTimer(22.000, ClientCmd,"weapon_357");
end

printl( "Executed \"c07_a2.lua\"" );

function OnTouchTrigger(name)
	printl( "Touched trigger: \"" .. name .. "\"" );
	if (name == "1") then

	elseif (name == "split") then
		ClientCmd("sc_im_split");

    end
end

function OnPlayInput(filename, frame, cmd)
    if ( frame == 4000 ) then
        ClientCmd( "weapon_hl357" );
    elseif ( frame == 4548 ) then
        cmd.buttons = cmd.buttons | IN_ATTACK;
        Aimbot( cmd, true, false, false, false );
    end
end



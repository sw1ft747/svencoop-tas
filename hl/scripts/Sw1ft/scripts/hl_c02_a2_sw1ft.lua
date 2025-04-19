autofreeze = false;

function SpeedrunStart()
    ClientCmd( "wait; kill" );

    CreateTrigger("sw1ftbot", Vector(1428.531, -1008.969, -1255.500), Vector(0, 0, -43.031), Vector(78.938, 36.062, 0));
end

function OnGameFrame(state, frametime, postruncmd)
    if ( not postruncmd and autofreeze ) then
        if ( PlayerMove.origin.z <= -1208.75 ) then
            ClientCmd( "sc_freeze2" );
            autofreeze = false;
        end
    end
end

function OnTouchTrigger( name )
    if ( name == "sw1ftbot") then
        -- ClientCmd( "sc_freeze2" );
        autofreeze = true;
    end

    return true;
end
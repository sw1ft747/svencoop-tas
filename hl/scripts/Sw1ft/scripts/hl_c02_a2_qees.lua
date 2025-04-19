function SpeedrunStart()
    CreateTrigger("triggerpush_skip", Vector(1397.500, -992.219, -1102.375), Vector(0, 0, 0), Vector(92.812, 50.375, 91.094));
end

function OnTouchTrigger( name )
    if ( name == "triggerpush_skip") then
        -- ClientCmd("sc_im_play c2a2_qees_v2");
        -- InputManager.Playback("c2a2_qees_v2");
        -- ClientCmd("sc_st_timescale 0.25");
        -- ClientCmd("sc_im_record c2a2_qees");
        ClientCmd("setang 20 180");
        -- CreateTimer( 0.1, ClientCmd, "sc_strafe 1; sc_strafe_ignore_ground 0; sc_im_record c2a2_qees_v3" );
        CreateTimer( 0.05, ClientCmd, "sc_im_play c2a2_qees_v3" );
    end

    return true;
end
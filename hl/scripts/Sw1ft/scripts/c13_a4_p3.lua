function InitTriggers()
    ClearTriggers();
    ClearServerTriggers();
end

function SpeedrunInit()
    ClientCmd("sc_strafe_yaw \"\"; sc_strafe_type 0; sc_strafe 1; sc_strafe_dir 3; sc_st_setangles_stop; -jump; -duck; -forward; -back; -moveleft; -moveright; -tau");
    ClientCmd("sc_strafe_ignore_ground 1");
end

function SpeedrunStart()
    InitTriggers();
    DrawVisualHints();

    ClientCmd("kill");
end

function OnServerSignal( value )
    if ( value == 0 ) then
        ClientCmd( "sc_sendsignal 0" );
    end
end

function DrawVisualHints()
    ClientCmd( "sc_debug_draw_box 1144 -39.968750 -237.968750 -16 -16 -18 16 16 18 0 255 255 90 1 1000000" );
    ClientCmd( "sc_debug_draw_box 1144 -39.968750 -237.968750 -2 -2 -2 2 2 2 0 255 255 90 0 1000000" );
    
    ClientCmd( "sc_debug_draw_box 1144 -64.000000 -183.937500 -16 -16 -32 16 16 32 0 255 255 90 1 1000000" );
    ClientCmd( "sc_debug_draw_box 1144 -64.000000 -183.937500 -2 -2 -2 2 2 2 0 255 255 90 0 1000000" );
    ClientCmd( "sc_debug_draw_line 1144 -79.000000 -300 1144 -79.000000 0 0 255 0 255 3 1000000" );
    ClientCmd( "sc_debug_draw_line 1144 79.000000 -300 1144 79.000000 0 0 255 0 255 3 1000000" );
    ClientCmd( "sc_debug_draw_line 1144 -79.000000 -200 1144 79.000000 -200 0 255 0 255 3 1000000" );
    
    ClientCmd( "sc_debug_draw_box 896 -64 -212 -16 -16 -36 16 16 36 50 0 255 90 1 1000000" );
    ClientCmd( "sc_debug_draw_box 896 64 -212 -16 -16 -36 16 16 36 50 0 255 90 1 1000000" );
    ClientCmd( "sc_debug_draw_box 768 -64 -212 -16 -16 -36 16 16 36 50 0 255 90 1 1000000" );
    ClientCmd( "sc_debug_draw_box 768 64 -212 -16 -16 -36 16 16 36 50 0 255 90 1 1000000" );
end

SpeedrunInit();

printl( "Executed \"c13_a4_p3.lua\"" );
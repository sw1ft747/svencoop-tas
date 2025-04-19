connected = false;
spawned = false;
start_time = 0.0;
spawns_state = 0

function SpeedrunInit()
    SetTimescale( 0.95 );

    RemoveAllTimers();

    ClientCmd(" sc_st_disable_spread 1; default_fov 100; -sc_ducktap; -jump; -duck; -forward; -back; -moveleft; -moveright; sc_strafe 0; sc_strafe_yaw \"\"; sc_strafe_ignore_ground 1; -attack; sc_im_stop");
    ClientCmd("sc_strafe_type 0; sc_strafe_dir 3; sc_st_setangles_stop; sc_ducktap_adjust_fps 0; sc_autojump_inconsistent 0; sc_strafe_vectorial_increment 0; fps_max 200; mp_classic_mode 1; clockwindow 0");
    
end

function SpeedrunStart()
    SpeedrunStartCustom();
    -- connected = true;
end

function SpeedrunStartCustom()
    start_time = SegmentCurrentTime();

    --CreateTimer(0.000, ClientCmd,"sc_im_record of4a4");
    --CreateTimer(0.000, ClientCmd,"sc_im_play of4a4");
    --CreateTimer(0.000, ClientCmd,"sc_strafe 1");
    --CreateTimer(0.000, ClientCmd,"weapon_displacer")

    CreateTrigger("1", Vector(-93.500, -614.000, 560.438), Vector(0, 0, -142.750), Vector(81.406, 62.594, 0));

    CreateTimer(0.000, ClientCmd,"+attack2");
    CreateTimer(0.000, ClientCmd,"sc_st_setangles -40 -162.50 220");
    --CreateTimer(1.490, ClientCmd,"weapon_grapple");
    CreateTimer(1.490, ClientCmd,"weapon_9mmAR");
    CreateTimer(1.490, ClientCmd,"sc_st_setangles_stop");
    CreateTimer(1.490, ClientCmd,"setang 10 151");
    CreateTimer(1.495, ClientCmd,"-attack2");
    CreateTimer(1.495, ClientCmd,"sc_strafe_yaw 144");
    CreateTimer(1.975, ClientCmd,"sc_strafe 1");
    CreateTimer(2.290, ClientCmd,"+forward");
    CreateTimer(2.300, ClientCmd,"gibme");
    CreateTimer(2.350, ClientCmd,"gibme");
    CreateTimer(2.400, ClientCmd,"gibme");
    CreateTimer(2.450, ClientCmd,"gibme");
    
    --CreateTimer(3.220, ClientCmd,"sc_st_timescale 0.05");

    CreateTimer(3.275, ClientCmd,"gibme");
    CreateTimer(3.275, ClientCmd,"gibme");
    CreateTimer(3.275, ClientCmd,"gibme");
    CreateTimer(3.275, ClientCmd,"gibme");
    CreateTimer(3.275, ClientCmd,"gibme");
    CreateTimer(3.275, ClientCmd,"gibme");
    CreateTimer(3.375, ClientCmd,"gibme");
    CreateTimer(3.375, ClientCmd,"gibme");
    CreateTimer(3.375, ClientCmd,"gibme");
    CreateTimer(3.375, ClientCmd,"gibme");
    CreateTimer(3.375, ClientCmd,"gibme");
    CreateTimer(3.395, ClientCmd,"gibme");
    CreateTimer(3.395, ClientCmd,"gibme");
    CreateTimer(3.390, ClientCmd,"sc_strafe_yaw 151");
    CreateTimer(3.400, ClientCmd,"setang 0 -30");
    CreateTimer(3.405, ClientCmd,"+attack2");
    CreateTimer(3.410, ClientCmd,"setang 10 151");
    CreateTimer(3.390, ClientCmd,"-forward");
    CreateTimer(3.410, ClientCmd,"+duck");
    CreateTimer(3.420, ClientCmd,"gibme");
    CreateTimer(3.690, ClientCmd,"gibme");
    CreateTimer(3.850, ClientCmd,"setang 53 -133");
    CreateTimer(3.855, ClientCmd,"-attack2");
    CreateTimer(3.990, ClientCmd,"-duck");
    CreateTimer(4.014, ClientCmd,"+forward");
    CreateTimer(6.160, ClientCmd,"+back");
    CreateTimer(6.160, ClientCmd,"+moveright");
    CreateTimer(6.270, ClientCmd,"-moveright");
    CreateTimer(6.270, ClientCmd,"-back");
    CreateTimer(6.275, ClientCmd,"sc_strafe_yaw -110");
    CreateTimer(6.615, ClientCmd,"sc_strafe 0");
    CreateTimer(6.615, ClientCmd,"sc_strafe_yaw 78");
    CreateTimer(6.615, ClientCmd,"+forward");
    CreateTimer(6.715, ClientCmd,"-forward");
    CreateTimer(6.805, ClientCmd,"sc_strafe 1");
    CreateTimer(6.805, ClientCmd,"setang 9.571757 76.552734 0.000000");
    CreateTimer(6.969, ClientCmd,"+sc_ducktap");
    CreateTimer(6.965, ClientCmd,"setang -10.817403 -110.242310 0.000000");
    CreateTimer(6.884, ClientCmd,"+attack");
    CreateTimer(6.999, ClientCmd,"-attack");
    CreateTimer(6.975, ClientCmd,"+jump");
    CreateTimer(6.975, ClientCmd,"+attack2");
    CreateTimer(6.985, ClientCmd,"setang 0 90 0.000000");
    CreateTimer(6.995, ClientCmd,"-attack2");
    CreateTimer(7.175, ClientCmd,"sc_strafe_yaw 90");
    CreateTimer(7.235, ClientCmd,"gibme");
    CreateTimer(7.235, ClientCmd,"gibme");
    CreateTimer(7.235, ClientCmd,"gibme");
    CreateTimer(7.295, ClientCmd,"-jump");
    CreateTimer(7.650, ClientCmd,"sc_strafe_yaw 95");
    CreateTimer(7.959, ClientCmd,"sc_st_setangles 0 57 80");
    CreateTimer(7.959, ClientCmd,"sc_strafe_yaw 57");
    CreateTimer(8.279, ClientCmd,"sc_strafe_yaw 90");
    CreateTimer(8.269, ClientCmd,"gibme");
    CreateTimer(8.269, ClientCmd,"gibme");
    CreateTimer(8.279, ClientCmd,"sc_st_setangles 50 90 80");
    CreateTimer(8.279, ClientCmd,"-sc_ducktap");
    CreateTimer(8.730, ClientCmd,"+use");
    CreateTimer(8.760, ClientCmd,"-use");
    CreateTimer(8.760, ClientCmd,"sc_st_setangles 0 90 80");
    CreateTimer(8.779, ClientCmd,"sc_strafe_yaw -51");
    CreateTimer(9.369, ClientCmd,"+forward");
    CreateTimer(9.469, ClientCmd,"-forward");
    CreateTimer(9.459, ClientCmd,"sc_strafe_yaw 102");
    CreateTimer(9.689, ClientCmd,"+sc_ducktap");
    CreateTimer(9.699, ClientCmd,"+duck");
    CreateTimer(9.699, ClientCmd,"+jump");
    CreateTimer(9.699, ClientCmd,"-sc_ducktap");
    CreateTimer(9.704, ClientCmd,"setang -30.989082 -62.723999 0.000000");
    CreateTimer(9.714, ClientCmd,"+attack2");
    CreateTimer(9.720, ClientCmd,"setang 0 102 0.000000");
    CreateTimer(9.779, ClientCmd,"-attack2");
    CreateTimer(9.869, ClientCmd,"sc_strafe_yaw -178");
    CreateTimer(9.720, ClientCmd,"sc_st_setangles 0 -179 80");
    CreateTimer(9.799, ClientCmd,"sc_strafe_type 1");
    CreateTimer(9.904, ClientCmd,"-duck");
    CreateTimer(10.119, ClientCmd,"+duck");
    CreateTimer(10.154, ClientCmd,"-duck");



    --[[CreateTimer(2.400, ClientCmd,"+attack");
    CreateTimer(3.784, ClientCmd,"sc_st_setangles 0 -146 860");
    CreateTimer(8.259, ClientCmd,"-attack");
    CreateTimer(8.259, ClientCmd,"weapon_9mmAR");
    CreateTimer(9.980, ClientCmd,"+back");
    CreateTimer(9.980, ClientCmd,"+moveright");
    CreateTimer(10.090, ClientCmd,"-moveright");
    CreateTimer(10.095, ClientCmd,"-back");
    CreateTimer(10.100, ClientCmd,"sc_strafe_yaw -110");
    CreateTimer(10.440, ClientCmd,"sc_strafe 0");
    CreateTimer(10.440, ClientCmd,"sc_strafe_yaw 78");
    CreateTimer(10.440, ClientCmd,"+forward");
    CreateTimer(10.540, ClientCmd,"-forward");
    CreateTimer(10.630, ClientCmd,"sc_strafe 1");
    CreateTimer(10.630, ClientCmd,"setang 9.571757 76.552734 0.000000");
    CreateTimer(10.794, ClientCmd,"+sc_ducktap");
    CreateTimer(10.790, ClientCmd,"setang -10.817403 -110.242310 0.000000");
    CreateTimer(10.709, ClientCmd,"+attack");
    CreateTimer(10.799, ClientCmd,"-attack");
    CreateTimer(10.800, ClientCmd,"+jump");
    CreateTimer(10.800, ClientCmd,"+attack2");
    CreateTimer(10.810, ClientCmd,"setang 0 90 0.000000");
    CreateTimer(10.900, ClientCmd,"-attack2");
    CreateTimer(11.000, ClientCmd,"sc_strafe_yaw 90");
    CreateTimer(11.080, ClientCmd,"gibme");
    CreateTimer(11.105, ClientCmd,"gibme");
    CreateTimer(11.105, ClientCmd,"gibme");
    CreateTimer(11.105, ClientCmd,"-sc_ducktap");
    CreateTimer(11.360, ClientCmd,"+duck");
    CreateTimer(11.510, ClientCmd,"sc_strafe_yaw 95");
    CreateTimer(11.660, ClientCmd,"-duck");
    CreateTimer(11.750, ClientCmd,"sc_strafe_yaw 60");
    CreateTimer(11.750, ClientCmd,"sc_st_setangles 0 60 80");
    CreateTimer(12.100, ClientCmd,"gibme");
    CreateTimer(12.100, ClientCmd,"gibme");
    CreateTimer(12.200, ClientCmd,"sc_st_setangles 30 90 80");
    CreateTimer(12.200, ClientCmd,"sc_strafe_yaw 115");
    CreateTimer(12.580, ClientCmd,"+use");
    CreateTimer(12.590, ClientCmd,"sc_st_setangles 0 90 80");
    CreateTimer(12.500, ClientCmd,"-jump");
    CreateTimer(12.680, ClientCmd,"-use");
    CreateTimer(12.790, ClientCmd,"sc_strafe_yaw -90");
    CreateTimer(13.220, ClientCmd,"+forward");
    CreateTimer(13.339, ClientCmd,"-forward");
    CreateTimer(13.345, ClientCmd,"sc_strafe_yaw 65");
    CreateTimer(13.345, ClientCmd,"setang 0 65 0");
    CreateTimer(13.520, ClientCmd,"+sc_ducktap");
    CreateTimer(13.530, ClientCmd,"+duck");
    CreateTimer(13.530, ClientCmd,"-sc_ducktap");
    CreateTimer(13.600, ClientCmd,"+jump");
    CreateTimer(13.540, ClientCmd,"setang -20 -126 0");
    CreateTimer(13.545, ClientCmd,"+attack2");
    CreateTimer(13.550, ClientCmd,"setang 0 65 0");
    CreateTimer(13.675, ClientCmd,"-attack2");
    CreateTimer(13.600, ClientCmd,"sc_strafe_yaw 179");
    CreateTimer(13.600, ClientCmd,"setang 0 90 0");
    CreateTimer(13.700, ClientCmd,"setang 0 179 0");
    CreateTimer(13.800, ClientCmd,"-duck");
    CreateTimer(13.500, ClientCmd,"sc_strafe_type 1");
    CreateTimer(14.050, ClientCmd,"sc_strafe_type 0");
    CreateTimer(14.150, ClientCmd,"+duck");
    CreateTimer(14.200, ClientCmd,"gibme");
    CreateTimer(14.200, ClientCmd,"gibme");
    CreateTimer(14.200, ClientCmd,"gibme");
    CreateTimer(14.200, ClientCmd,"gibme");
    CreateTimer(14.215, ClientCmd,"-duck");
    CreateTimer(14.364, ClientCmd,"setang 0 -9 0");
    CreateTimer(14.365, ClientCmd,"+attack2");

    --[[CreateTimer(8.500, ClientCmd,"sc_im_stop");]]
end


function OnTouchTrigger( name )
    if ( name == "1" ) then
        spawns_state = 1;
        CreateTimer(0.000, ClientCmd,"sc_strafe_ignore_ground 0");
        CreateTimer(0.000, ClientCmd,"sc_strafe 1");
        CreateTimer(0.000, ClientCmd,"setang 0 132");
        CreateTimer(0.050, ClientCmd,"sc_st_setangles 0 90 120");
        CreateTimer(0.000, ClientCmd,"-forward");
        CreateTimer(0.000, ClientCmd,"sc_strafe_yaw 132");
        CreateTimer(0.000, ClientCmd,"-forward");
    elseif (name == "2") then
        spawns_state = 2;
    elseif (name == "3") then
        spawns_state = 3;
    end

    return true;
end

function OnFireCrossbowSpread(entity, entindex)
    return true, 1.0, true, 1.0;
end

zaebala_igra = 0;
function OnFireBulletsSpread(entity, entindex, spread_x, spread_y)
    -- PrintChatText( string.format( "entindex: %d | x: %f | y: %f", entindex, spread_x, spread_y ) );

    if ( entindex == 8 ) then
        zaebala_igra = zaebala_igra + 1;

        local angle = 7 * math.pi / 4;
        local spread_factor = 1.2;

        if ( zaebala_igra == 3 ) then
            angle = math.pi / 3;
        end

        spread_x = math.cos( angle ) * spread_factor;
        spread_y = math.sin( angle ) * spread_factor;
    end

    return spread_x, spread_y;
end

function OnPlayerSpawn( pSpawnSpotEdict, pPlayerEdict )
    printl( "OnPlayerSpawn()" );

    printl( "Player \"" .. tostring( pPlayerEdict.vars.netname ) .. "\" spawned at " .. tostring( pPlayerEdict.vars.origin ) .. ", viewangles: " .. tostring(pPlayerEdict.vars.angles) .. "" );

    local sPlayerName = pPlayerEdict.vars.netname;

    if ( spawns_state == 0 ) then
        if ( sPlayerName == "ialex" ) then
            pPlayerEdict.vars.origin = Vector( -128, 1, 39 );
            pPlayerEdict.vars.angles = Vector( 0.000000, 90.000000, 0.000000 );
        elseif ( sPlayerName == "QEES" ) then
            pPlayerEdict.vars.origin = Vector( -1018, -88, -314 ); 
            pPlayerEdict.vars.angles = Vector( 0, -90, 0.000000 );
        end
    end
end



function PrintTime()
    PrintChatText( string.format( "%.3f (IM frames: %d)", SegmentCurrentTime() - start_time, InputManager.GetCurrentFrame() ) );
end

SpeedrunInit();
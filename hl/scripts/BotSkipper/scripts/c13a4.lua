function OnFirstClientdataReceived(receive_time)
	printl( "OnFirstClientdataReceived(" .. receive_time .. ")" );

    if ( SpeedrunStart ~= nil ) then SpeedrunStart() end

    ClientCmd( "wait; use weapon_medkit" );

end
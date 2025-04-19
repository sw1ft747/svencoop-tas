function OnFirstClientdataReceived(receive_time)
	printl( "OnFirstClientdataReceived(" .. receive_time .. ")" );
	
	local mapname = GetMapName():lower();
	printl(mapname);
	if (mapname == "hl_c**") then
		IncludeScript("c**");
	end
	

end

function OnBeginLoading()
	printl( "OnBeginLoading()" );
end

function OnEndLoading()
	printl( "OnEndLoading()" );

end

function OnDisconnect()
	printl( "OnDisconnect()" );
end

printl( "Executed \"main.lua\"" );

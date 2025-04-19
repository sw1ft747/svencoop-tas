-- PB-Time Manager

pb_maps = {};

function pb_register(name)
    pb_maps[ name ] = -1;
end

function pb_remove(name)
    pb_maps[ name ] = nil;
end

function pb_get_time(name)
    return pb_maps[ name ];
end

function pb_set_time(name, time)
    if ( time ~= nil ) then
        pb_maps[ name ] = time;
    end
end

function pb_save()
    local file = io.open( "sven_internal/scripts/pb/" .. MapName .. ".txt", "w" );

    if ( file ~= nil ) then
        for key, value in pairs( pb_maps ) do
            file:write( string.format( "%s = %f\n", key, value ) );
        end

        file:close();
    end
end

function pb_load()
    local file = io.open( "sven_internal/scripts/pb/" .. MapName .. ".txt", "r" );

    if ( file ~= nil ) then
        local function split_string(str, sep)
            if ( sep == nil ) then
                sep = "%s";
            end
        
            local t = {};
        
            for token in string.gmatch( str, "([^" .. sep .. "]+)" ) do
                table.insert( t, token )
            end
        
            return t;
        end

        for line in file:lines() do
            local tokenized_string = split_string( line, "%s=" );

            if ( #tokenized_string == 2 ) then
                if ( pb_maps[ tokenized_string[ 1 ] ] ~= nil ) then
                    local t = tonumber( tokenized_string[ 2 ] );

                    if ( t ~= nil ) then
                        pb_maps[ tokenized_string[ 1 ] ] = t;
                    else
                        pb_maps[ tokenized_string[ 1 ] ] = -1;
                    end
                end
            end
        end

        file:close();
        pb_validate();
    end
end

function pb_validate()
    for key, value in pairs( pb_maps ) do
        if ( value == nil ) then
            pb_maps[ key ] = -1;
        end
    end
end

function pb_check( name, time, metainfo )
    local pb_time = pb_get_time( name );

    if ( pb_time ~= nil ) then
        if ( pb_time ~= -1 ) then
            local time_diff = pb_time - time;
            
            ClientCmd( string.format( "say %s. Time: %.3f (%s%.3f) (PB: %.3f)", metainfo, time, time_diff >= 0 and "-" or "+", math.abs( time_diff ), pb_time ) );

            if ( time_diff > 0 ) then
                pb_set_time( name, time );
            end
        else
            ClientCmd( string.format( "say %s. Time: %.3f (New possible best)", metainfo, time ) );
            pb_set_time( name, time );
        end
    end
end

function pb_print()
    for key, value in pairs( pb_maps ) do
        printl( key .. " = " .. value );
    end
end
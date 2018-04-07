function sdata_ChatWarn( ply, text, public )
    if (string.sub(string.lower(text), 1, 5) == "!data") then
		local args = string.Explode( " ", text )
		if #args == 1 then
			ply:ConCommand( "sdata_menu" )
		else
			table.remove( args, 1 )
			sdata_con_warn( ply, _, args )
		end
		return false
    end
end
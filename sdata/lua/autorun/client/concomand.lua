hook.Add("PlayerInitialSpawn", "setname", function(ply)
	ply.NewName = ply:Nick()
end )

hook.Add( "OnPlayerChat", "OpenCrateGui", function( ply, text, team )
	
	if (string.sub(text, 1, 6) == "!crate") && ply == LocalPlayer() then 

		local TextEntry = vgui.Create( "DTextEntry", frame ) -- create the form as a child of frame
		TextEntry:SetPos( 25, 50 )
		TextEntry:SetSize( 60, 80 )
		TextEntry:Center()
		TextEntry:SetText( "Placeholder Text" )
		TextEntry.OnEnter = function( self )
			chat.AddText( self:GetValue() )	-- print the form's text as server text
		end

		local Frame = vgui.Create( "DFrame" )
		Frame:SetPos( 450, 100 )
		Frame:SetSize( 200 , 70 )
		Frame:SetTitle( "" )
		Frame:Center()
		Frame:SetDraggable( false )
		Frame:ShowCloseButton( true )
		Frame:MakePopup()
		Frame.Paint = function()
			draw.RoundedBox(4 , 0, 0, Frame:GetWide() , Frame:GetTall() , Color(200,0,0,200))
			draw.RoundedBox(2 , 2, 2, Frame:GetWide() -4, 21, Color(50,50,50,200))
		end


				
		return true 
	end
	
end )

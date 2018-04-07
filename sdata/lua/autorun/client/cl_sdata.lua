AddCSLuaFile()


surface.CreateFont( "sdataFont1",
{
	font      = "Arial",
	size      = 18,
	weight    = 700,
}
)
surface.CreateFont( "sdataFont3",
{
	font      = "Arial",
	size      = 24,
	weight    = 700,
}
)

function sdata_menu()
	sdata.MenuFrame = vgui.Create( "DFrame" )
	sdata.MenuFrame:SetSize( ScrW() - 100, 595 )
	sdata.MenuFrame:SetTitle( "System DataPlayer:  By Le Monde Dévaster / Devils_monkey" )
	sdata.MenuFrame:SetVisible( true )
	sdata.MenuFrame:SetDraggable( true )
	sdata.MenuFrame:ShowCloseButton( true )
	sdata.MenuFrame:MakePopup()
	sdata.MenuFrame:Center()
	 
	local MenuPanel = vgui.Create( "DPanel", sdata.MenuFrame )
	MenuPanel:Dock( FILL )
	MenuPanel:DockMargin( 0, 0, 0, 0 )
	MenuPanel.Paint = function() -- Paint function
		surface.SetDrawColor( 50, 50, 50, 255 ) 
		surface.DrawRect( 0, 0, MenuPanel:GetWide(), MenuPanel:GetTall() ) -- Draw the rect
	end
	
	local MenuPanel2 = vgui.Create( "DPanel", sdata.MenuFrame )
	MenuPanel2:Dock( BOTTOM )
	MenuPanel2:DockMargin( 0, 5, 0, 0 )
	MenuPanel2:SetHeight( 35 )
	MenuPanel2.Paint = function() -- Paint function
		surface.SetDrawColor( 50, 50, 50, 255 ) 
		surface.DrawRect( 0, 0, MenuPanel2:GetWide(), MenuPanel2:GetTall() ) -- Draw the rect
	end
	
	local MenuPanel2Text1 = vgui.Create( "DLabel", MenuPanel2 )
	MenuPanel2Text1:SetPos( 5, 2 )
	MenuPanel2Text1:SetColor( Color(255, 50, 50, 255) )
	MenuPanel2Text1:SetFont( "sdataFont1" )
	MenuPanel2Text1:SetText( "." )
	MenuPanel2Text1:SizeToContents()
	
	sdata.MenuFrame.MenuPanel2Text2 = vgui.Create( "DLabel", MenuPanel2 )
	sdata.MenuFrame.MenuPanel2Text2:SetPos( 255, 2 )
	sdata.MenuFrame.MenuPanel2Text2:SetColor( Color(255, 200, 200, 255) )
	sdata.MenuFrame.MenuPanel2Text2:SetFont( "sdataFont1" )
	sdata.MenuFrame.MenuPanel2Text2:SetText( "0" )
	sdata.MenuFrame.MenuPanel2Text2:SizeToContents()
	
	local MenuPanel2Text3 = vgui.Create( "DLabel", MenuPanel2 )
	MenuPanel2Text3:SetPos( 5, 17 )
	MenuPanel2Text3:SetColor( Color(255, 50, 50, 255) )
	MenuPanel2Text3:SetFont( "sdataFont1" )
	MenuPanel2Text3:SetText( "." )
	MenuPanel2Text3:SizeToContents()
	
	sdata.MenuFrame.MenuPanel2Text4 = vgui.Create( "DLabel", MenuPanel2 )
	sdata.MenuFrame.MenuPanel2Text4:SetPos( 255, 17 )
	sdata.MenuFrame.MenuPanel2Text4:SetColor( Color(255, 200, 200, 255) )
	sdata.MenuFrame.MenuPanel2Text4:SetFont( "sdataFont1" )
	sdata.MenuFrame.MenuPanel2Text4:SetText( "0" )
	sdata.MenuFrame.MenuPanel2Text4:SizeToContents()
	
	sdata.MenuFrame.MenuPanel2Text5 = vgui.Create( "DLabel", MenuPanel2 )
	sdata.MenuFrame.MenuPanel2Text5:SetPos( 280, 6 )
	sdata.MenuFrame.MenuPanel2Text5:SetColor( Color(255, 255, 255, 255) )
	sdata.MenuFrame.MenuPanel2Text5:SetFont( "sdataFont3" )
	sdata.MenuFrame.MenuPanel2Text5:SetText( "" )
	sdata.MenuFrame.MenuPanel2Text5:SizeToContents()
	
	local MenuPanel2Button1 = vgui.Create( "DButton", MenuPanel2 )
	MenuPanel2Button1:SetSize( 80, 25 )
	MenuPanel2Button1:Dock( RIGHT )
	MenuPanel2Button1:DockMargin( 0, 5, 5, 5 )
	MenuPanel2Button1:SetText( "." )
	MenuPanel2Button1.DoClick = function( MenuPanel2Button1 )
		net.Start( "sdata_openoptions" )
		net.SendToServer()
	end
		
	sdata.MenuFrame.WarningsList = vgui.Create( "DListView", MenuPanel )
	sdata.MenuFrame.WarningsList:Dock( FILL )
	sdata.MenuFrame.WarningsList:DockMargin( 5, 5, 5, 5 )
	sdata.MenuFrame.WarningsList:SetWidth( 565 )
	sdata.MenuFrame.WarningsList:SetMultiSelect(false)
	sdata.MenuFrame.WarningsList:AddColumn("ID"):SetFixedWidth( 40 )
	sdata.MenuFrame.WarningsList:AddColumn( "." ):SetFixedWidth( 200 )
	sdata.MenuFrame.WarningsList:AddColumn( "." )
	sdata.MenuFrame.WarningsList:AddColumn( "." ):SetFixedWidth( 120 )
	sdata.MenuFrame.WarningsList:AddColumn( "." ):SetFixedWidth( 100 )
	sdata.MenuFrame.WarningsList.OnRowRightClick = function( PlayerList, line )
		local DropDown = DermaMenu()
		DropDown:AddOption(cl11, function()
			warning = sdata.MenuFrame.WarningsList:GetLine( line ):GetValue( 1 )
			net.Start("sdata_deletesinglewarn")
				net.WriteInt( warning, 32 )
			net.SendToServer()
			
			sdata.MenuFrame.WarningsList:Clear()
			net.Start("sdata_fetchwarnings")
				net.WriteString( sdata.lastselectedtype )
				net.WriteString( sdata.lastselected )
			net.SendToServer()
		end )
		DropDown:AddOption(cl12, function()
			SetClipboardText( sdata.MenuFrame.WarningsList:GetLine( line ):GetValue( 3 ) )
			MsgC( Color(255,0,0), "sdata2: ", Color(255,255,255),  "." )
		end )
		DropDown:AddOption(cl15, function()
			print( sdata.currentselectedplayer )
			sdata_playerwarnmenu_id()
		end )
		DropDown:Open()
	end
	
	
	 
	local MenuPanel3 = vgui.Create( "DPanel", sdata.MenuFrame )
	MenuPanel3:Dock( RIGHT )
	MenuPanel3:DockMargin( 0, 0, 0, 0 )
	MenuPanel3:SetWidth( 200 )
	MenuPanel3.Paint = function() -- Paint function
		surface.SetDrawColor( 50, 50, 50, 255 )
		surface.DrawRect( 0, 0, MenuPanel3:GetWide(), MenuPanel3:GetTall() ) -- Draw the rect
	end
		
	
	
	sdata.MenuFrame.PlayerList = vgui.Create( "DListView", MenuPanel3 )
	sdata.MenuFrame.PlayerList:Dock( FILL )
	sdata.MenuFrame.PlayerList:DockMargin( 0, 5, 5, 0 )
	sdata.MenuFrame.PlayerList:SetWidth( 200 )
	sdata.MenuFrame.PlayerList:SetMultiSelect(false)
	sdata.MenuFrame.PlayerList:AddColumn( "." )
	sdata.MenuFrame.PlayerList.OnRowSelected = function( PlayerList, line )
		sdata.MenuFrame.WarningsList:Clear()
		net.Start("sdata_fetchwarnings")
			net.WriteString( "playername" )
			net.WriteString( tostring(sdata.MenuFrame.PlayerList:GetLine( line ):GetValue( 1 )) )
		net.SendToServer()
		sdata.lastselected = tostring(sdata.MenuFrame.PlayerList:GetLine( line ):GetValue( 1 ))
		sdata.lastselectedtype = "playername"
		sdata.MenuFrame.MenuPanel2Text5:SetText("")
	end
	sdata.MenuFrame.PlayerList.OnRowRightClick = function( PlayerList, line )
		local DropDown = DermaMenu()
		DropDown:AddOption(cl15, function() 
			sdata.activeplayer = sdata.MenuFrame.PlayerList:GetLine( line ):GetValue( 1 )
			sdata_playerwarnmenu()
		end )
		DropDown:AddOption(cl16, function()
			sdata.MenuFrame.WarningsList:Clear() 
			sdata.playerinfo = {} 
			sdata_deletewarnings( sdata.MenuFrame.PlayerList:GetLine( line ):GetValue( 1 ) )
		end )
		DropDown:AddOption(cl17, function() 
		sdata_removewarn( sdata.MenuFrame.PlayerList:GetLine( line ):GetValue( 1 ) )
		end )
		DropDown:AddSpacer()
		
		DropDown:Open()
	end
	
	for _, v in pairs( player.GetAll() ) do
		sdata.MenuFrame.PlayerList:AddLine( v:Nick() )
	end
	
	local MenuPanelButton = vgui.Create( "DButton", MenuPanel3 )
	MenuPanelButton:SetSize( 200, 25 )
	MenuPanelButton:Dock( BOTTOM )
	MenuPanelButton:DockMargin( 0, 5, 5, 5 )
	MenuPanelButton:SetText( "Offline Player" )
	MenuPanelButton.DoClick = function( MenuPanelButton )
		sdata_offlineplayerprompt()
	end
end

function sdata_offlineplayerprompt()
	local MenuFrame = vgui.Create( "DFrame" )
	MenuFrame:SetPos( ScrW() / 2 - 190, ScrH() / 2 - 85 )
	MenuFrame:SetSize( 220, 110 )
	MenuFrame:SetVisible( true )
	MenuFrame:SetDraggable( true )
	MenuFrame:ShowCloseButton( true )
	MenuFrame:MakePopup()
	 
	local MenuPanel = vgui.Create( "DPanel", MenuFrame )
	MenuPanel:SetPos( 5, 30 )
	MenuPanel:SetSize( 210, 75 )
	MenuPanel.Paint = function() -- Paint function
		surface.SetDrawColor( 50, 50, 50, 255 ) 
		surface.DrawRect( 0, 0, MenuPanel:GetWide(), MenuPanel:GetTall() ) -- Draw the rect
	end
	
	MenuFrame:SetTitle( "Select offline player" )
	
	local MenuPanelLabel1 = vgui.Create( "DLabel", MenuPanel )
	MenuPanelLabel1:SetPos( 5, 5 )
	MenuPanelLabel1:SetColor( Color(255, 255, 255, 255) )
	MenuPanelLabel1:SetFont( "sdataFont1" )
	MenuPanelLabel1:SetText( "Offline Player SteamID" )
	MenuPanelLabel1:SizeToContents()
	
	local MenuPanelTextEntry1 = vgui.Create( "DTextEntry", MenuPanel )
	MenuPanelTextEntry1:SetPos( 5, 30 )
	MenuPanelTextEntry1:SetMultiline( false )
	MenuPanelTextEntry1:SetWidth( 200 )
	
	local MenuPanelButton1 = vgui.Create( "DButton", MenuPanel )
	MenuPanelButton1:SetSize( 80, 15 )
	MenuPanelButton1:SetPos( 5, 55 )
	MenuPanelButton1:SetText( cl23 )
	MenuPanelButton1.DoClick = function( MenuPanelButton1 )
		sdata.MenuFrame.WarningsList:Clear()
		sdata.MenuFrame.PlayerList:ClearSelection()
		net.Start("sdata_fetchwarnings")
			net.WriteString( "playerid" )
			net.WriteString( MenuPanelTextEntry1:GetValue() )
		net.SendToServer()
		sdata.lastselectedtype = "playerid"
		sdata.lastselected = MenuPanelTextEntry1:GetValue()
		sdata.MenuFrame.MenuPanel2Text5:SetText( "Showing warnings for OFFLINE player: " .. MenuPanelTextEntry1:GetValue() )
		sdata.MenuFrame.MenuPanel2Text5:SizeToContents()
		MenuFrame:Close()
	end
	
	local MenuPanelButton2 = vgui.Create( "DButton", MenuPanel )
	MenuPanelButton2:SetSize( 80, 15 )
	MenuPanelButton2:SetPos( 90, 55 )
	MenuPanelButton2:SetText( cl24 )
	MenuPanelButton2.DoClick = function( MenuPanelButton2 )
		MenuFrame:Close()
	end
end

function sdata_clientmenu()
	sdata.ClientMenuFrame = vgui.Create( "DFrame" )
	sdata.ClientMenuFrame:SetPos( ScrW() / 2 - 400, ScrH() / 2 - 300 )
	sdata.ClientMenuFrame:SetSize( 800, 595 )
	sdata.ClientMenuFrame:SetTitle( cl1 .. " ::: " .. cl18 )
	sdata.ClientMenuFrame:SetVisible( true )
	sdata.ClientMenuFrame:SetDraggable( true )
	sdata.ClientMenuFrame:ShowCloseButton( true )
	sdata.ClientMenuFrame:MakePopup()
	 
	local MenuPanel = vgui.Create( "DPanel", sdata.ClientMenuFrame )
	MenuPanel:SetPos( 10, 35 )
	MenuPanel:SetSize( 780, 510 )
	MenuPanel.Paint = function() -- Paint function
		surface.SetDrawColor( 50, 50, 50, 255 ) 
		surface.DrawRect( 0, 0, MenuPanel:GetWide(), MenuPanel:GetTall() ) -- Draw the rect
	end
	
	local MenuPanel2 = vgui.Create( "DPanel", sdata.ClientMenuFrame )
	MenuPanel2:SetPos( 10, 550 )
	MenuPanel2:SetSize( 780, 35 )
	MenuPanel2.Paint = function() -- Paint function
		surface.SetDrawColor( 50, 50, 50, 255 ) 
		surface.DrawRect( 0, 0, MenuPanel2:GetWide(), MenuPanel2:GetTall() ) -- Draw the rect
	end
	
	local MenuPanel2Text1 = vgui.Create( "DLabel", MenuPanel2 )
	MenuPanel2Text1:SetPos( 5, 2 )
	MenuPanel2Text1:SetColor( Color(255, 50, 50, 255) )
	MenuPanel2Text1:SetFont( "sdataFont1" )
	MenuPanel2Text1:SetText( "." )
	MenuPanel2Text1:SizeToContents()
	
	sdata.ClientMenuFrame.MenuPanel2Text2 = vgui.Create( "DLabel", MenuPanel2 )
	sdata.ClientMenuFrame.MenuPanel2Text2:SetPos( 165, 2 )
	sdata.ClientMenuFrame.MenuPanel2Text2:SetColor( Color(255, 200, 200, 255) )
	sdata.ClientMenuFrame.MenuPanel2Text2:SetFont( "sdataFont1" )
	sdata.ClientMenuFrame.MenuPanel2Text2:SetText( "0" )
	sdata.ClientMenuFrame.MenuPanel2Text2:SizeToContents()
	
	local MenuPanel2Text3 = vgui.Create( "DLabel", MenuPanel2 )
	MenuPanel2Text3:SetPos( 5, 17 )
	MenuPanel2Text3:SetColor( Color(255, 50, 50, 255) )
	MenuPanel2Text3:SetFont( "sdataFont1" )
	MenuPanel2Text3:SetText( "." )
	MenuPanel2Text3:SizeToContents()
	
	sdata.ClientMenuFrame.MenuPanel2Text4 = vgui.Create( "DLabel", MenuPanel2 )
	sdata.ClientMenuFrame.MenuPanel2Text4:SetPos( 165, 17 )
	sdata.ClientMenuFrame.MenuPanel2Text4:SetColor( Color(255, 200, 200, 255) )
	sdata.ClientMenuFrame.MenuPanel2Text4:SetFont( "sdataFont1" )
	sdata.ClientMenuFrame.MenuPanel2Text4:SetText( "0" )
	sdata.ClientMenuFrame.MenuPanel2Text4:SizeToContents()
	
	sdata.ClientMenuFrame.WarningsList = vgui.Create( "DListView", MenuPanel )
	sdata.ClientMenuFrame.WarningsList:SetPos( 5, 5 )
	sdata.ClientMenuFrame.WarningsList:SetSize( 770, 500 )
	sdata.ClientMenuFrame.WarningsList:SetMultiSelect(false)
	sdata.ClientMenuFrame.WarningsList:AddColumn( "." ):SetFixedWidth( 140 )
	sdata.ClientMenuFrame.WarningsList:AddColumn( "." )
	sdata.ClientMenuFrame.WarningsList:AddColumn( "." ):SetFixedWidth( 100 )
	
	net.Start("sdata_fetchownwarnings")
	net.SendToServer()
end

function sdata_playerwarnmenu()
	local MenuFrame = vgui.Create( "DFrame" )
	MenuFrame:SetPos( ScrW() / 2 - 190, ScrH() / 2 - 85 )
	MenuFrame:SetSize( 380, 170 )
	MenuFrame:SetVisible( true )
	MenuFrame:SetDraggable( true )
	MenuFrame:ShowCloseButton( true )
	MenuFrame:MakePopup()
	 
	local MenuPanel = vgui.Create( "DPanel", MenuFrame )
	MenuPanel:SetPos( 5, 30 )
	MenuPanel:SetSize( 370, 135 )
	MenuPanel.Paint = function() -- Paint function
		surface.SetDrawColor( 50, 50, 50, 255 ) 
		surface.DrawRect( 0, 0, MenuPanel:GetWide(), MenuPanel:GetTall() ) -- Draw the rect
	end
	
	local HiddenLabel = vgui.Create( "DLabel", MenuPanel )
	HiddenLabel:SetPos( 0, 0 )
	HiddenLabel:SetColor( Color(255, 255, 255, 0) )
	HiddenLabel:SetFont( "sdataFont1" )
	HiddenLabel:SetText( sdata.activeplayer )
	HiddenLabel:SizeToContents()
	
	MenuFrame:SetTitle( "."  .. " ::: " .. HiddenLabel:GetText() )
	
	local MenuPanelLabel1 = vgui.Create( "DLabel", MenuPanel )
	MenuPanelLabel1:SetPos( 5, 5 )
	MenuPanelLabel1:SetColor( Color(255, 255, 255, 255) )
	MenuPanelLabel1:SetFont( "sdataFont1" )
	MenuPanelLabel1:SetText( "." )
	MenuPanelLabel1:SizeToContents()
	
	local MenuPanelLabel2 = vgui.Create( "DLabel", MenuPanel )
	MenuPanelLabel2:SetPos( 120, 5 )
	MenuPanelLabel2:SetColor( Color(255, 20, 20, 255) )
	MenuPanelLabel2:SetFont( "sdataFont1" )
	MenuPanelLabel2:SetText( HiddenLabel:GetText() )
	MenuPanelLabel2:SizeToContents()
	
	local MenuPanelLabel3 = vgui.Create( "DLabel", MenuPanel )
	MenuPanelLabel3:SetPos( 5, 25 )
	MenuPanelLabel3:SetColor( Color(255, 255, 255, 255) )
	MenuPanelLabel3:SetFont( "sdataFont1" )
	MenuPanelLabel3:SetText( "." )
	MenuPanelLabel3:SizeToContents()
	
	local MenuPanelTextEntry1 = vgui.Create( "DTextEntry", MenuPanel )
	MenuPanelTextEntry1:SetPos( 5, 45 )
	MenuPanelTextEntry1:SetMultiline( true )
	MenuPanelTextEntry1:SetSize( 360, 50 )
	
	local MenuPanelButton1 = vgui.Create( "DButton", MenuPanel )
	MenuPanelButton1:SetSize( 80, 30 )
	MenuPanelButton1:SetPos( 5, 100 )
	MenuPanelButton1:SetText( cl23 )
	MenuPanelButton1.DoClick = function( MenuPanelButton1 )
		sdata_sendwarning( HiddenLabel:GetText(), MenuPanelTextEntry1:GetValue() )
		MenuFrame:Close()
	end
	
	local MenuPanelButton2 = vgui.Create( "DButton", MenuPanel )
	MenuPanelButton2:SetSize( 80, 30 )
	MenuPanelButton2:SetPos( 90, 100 )
	MenuPanelButton2:SetText( "." )
	MenuPanelButton2.DoClick = function( MenuPanelButton2 )
		MenuFrame:Close()
	end
end

function sdata_playerwarnmenu_id()
	local MenuFrame = vgui.Create( "DFrame" )
	MenuFrame:SetPos( ScrW() / 2 - 190, ScrH() / 2 - 85 )
	MenuFrame:SetSize( 380, 170 )
	MenuFrame:SetVisible( true )
	MenuFrame:SetDraggable( true )
	MenuFrame:ShowCloseButton( true )
	MenuFrame:MakePopup()
	 
	local MenuPanel = vgui.Create( "DPanel", MenuFrame )
	MenuPanel:SetPos( 5, 30 )
	MenuPanel:SetSize( 370, 135 )
	MenuPanel.Paint = function() -- Paint function
		surface.SetDrawColor( 50, 50, 50, 255 ) 
		surface.DrawRect( 0, 0, MenuPanel:GetWide(), MenuPanel:GetTall() ) -- Draw the rect
	end
	
	local HiddenLabel = vgui.Create( "DLabel", MenuPanel )
	HiddenLabel:SetPos( 0, 0 )
	HiddenLabel:SetColor( Color(255, 255, 255, 0) )
	HiddenLabel:SetFont( "sdataFont1" )
	HiddenLabel:SetText( util.SteamIDFrom64(sdata.currentselectedplayer) )
	HiddenLabel:SizeToContents()
	
	MenuFrame:SetTitle( "."  .. " ::: " .. HiddenLabel:GetText() )
	
	local MenuPanelLabel1 = vgui.Create( "DLabel", MenuPanel )
	MenuPanelLabel1:SetPos( 5, 5 )
	MenuPanelLabel1:SetColor( Color(255, 255, 255, 255) )
	MenuPanelLabel1:SetFont( "sdataFont1" )
	MenuPanelLabel1:SetText( "." )
	MenuPanelLabel1:SizeToContents()
	
	local MenuPanelLabel2 = vgui.Create( "DLabel", MenuPanel )
	MenuPanelLabel2:SetPos( 120, 5 )
	MenuPanelLabel2:SetColor( Color(255, 20, 20, 255) )
	MenuPanelLabel2:SetFont( "sdataFont1" )
	MenuPanelLabel2:SetText( HiddenLabel:GetText() )
	MenuPanelLabel2:SizeToContents()
	
	local MenuPanelLabel3 = vgui.Create( "DLabel", MenuPanel )
	MenuPanelLabel3:SetPos( 5, 25 )
	MenuPanelLabel3:SetColor( Color(255, 255, 255, 255) )
	MenuPanelLabel3:SetFont( "sdataFont1" )
	MenuPanelLabel3:SetText( "." )
	MenuPanelLabel3:SizeToContents()
	
	local MenuPanelTextEntry1 = vgui.Create( "DTextEntry", MenuPanel )
	MenuPanelTextEntry1:SetPos( 5, 45 )
	MenuPanelTextEntry1:SetMultiline( true )
	MenuPanelTextEntry1:SetSize( 360, 50 )
	
	local MenuPanelButton1 = vgui.Create( "DButton", MenuPanel )
	MenuPanelButton1:SetSize( 80, 30 )
	MenuPanelButton1:SetPos( 5, 100 )
	MenuPanelButton1:SetText( "." )
	MenuPanelButton1.DoClick = function( MenuPanelButton1 )
		sdata_sendwarning( HiddenLabel:GetText(), MenuPanelTextEntry1:GetValue() )
		MenuFrame:Close()
	end
	
	local MenuPanelButton2 = vgui.Create( "DButton", MenuPanel )
	MenuPanelButton2:SetSize( 80, 30 )
	MenuPanelButton2:SetPos( 90, 100 )
	MenuPanelButton2:SetText( "." )
	MenuPanelButton2.DoClick = function( MenuPanelButton2 )
		MenuFrame:Close()
	end
end

function sdata_optionsmenu()
	local MenuFrame = vgui.Create( "DFrame" )
	MenuFrame:SetPos( ScrW() / 2 - 205, ScrH() / 2 - 125 )
	MenuFrame:SetSize( 410, 225 )
	MenuFrame:SetVisible( true )
	MenuFrame:SetDraggable( true )
	MenuFrame:ShowCloseButton( true )
	MenuFrame:SetTitle( "." )
	MenuFrame:MakePopup()
	 
	local MenuPanel = vgui.Create( "DPanel", MenuFrame )
	MenuPanel:SetPos( 5, 30 )
	MenuPanel:SetSize( 400, 190 )
	MenuPanel.Paint = function() -- Paint function
		surface.SetDrawColor( 50, 50, 50, 255 ) 
		surface.DrawRect( 0, 0, MenuPanel:GetWide(), MenuPanel:GetTall() ) -- Draw the rect
	end
	
	local MenuPanelCheckBox1 = vgui.Create( "DCheckBoxLabel", MenuPanel )
	MenuPanelCheckBox1:SetPos( 5, 5 )
	MenuPanelCheckBox1:SetText( "." )
	MenuPanelCheckBox1.Button.DoClick = function( MenuPanelCheckBox1 )
		local val = tostring(MenuPanelCheckBox1:GetChecked())
		net.Start("sdata_changeconvarbool")
			net.WriteString("sdata_kick")
			net.WriteString( val )
		net.SendToServer()
	end
	MenuPanelCheckBox1.Think = function( MenuPanelCheckBox1 )
		if GetConVar("sdata_kick"):GetBool() ~= MenuPanelCheckBox1:GetChecked() then
			MenuPanelCheckBox1:SetValue( GetConVar("sdata_kick"):GetBool() )
		end
	end
	MenuPanelCheckBox1:SizeToContents()
	
	
	local MenuPanelCheckBox2 = vgui.Create( "DCheckBoxLabel", MenuPanel )
	MenuPanelCheckBox2:SetPos( 5, 25 )
	MenuPanelCheckBox2:SetText( cl27 )
	MenuPanelCheckBox2.Button.DoClick = function( MenuPanelCheckBox2 )
		local val = tostring(MenuPanelCheckBox2:GetChecked())
		net.Start("sdata_changeconvarbool")
			net.WriteString("sdata_ban")
			net.WriteString( val )
		net.SendToServer()
	end
	MenuPanelCheckBox2.Think = function( MenuPanelCheckBox2 )
		if GetConVar("sdata_ban"):GetBool() ~= MenuPanelCheckBox2:GetChecked() then
			MenuPanelCheckBox2:SetValue( GetConVar("sdata_ban"):GetBool() )
		end
	end
	MenuPanelCheckBox2:SizeToContents()
	
	local MenuPanelCheckBox3 = vgui.Create( "DCheckBoxLabel", MenuPanel )
	MenuPanelCheckBox3:SetPos( 5, 45 )
	MenuPanelCheckBox3:SetText( cl28 )
	MenuPanelCheckBox3.Button.DoClick = function( MenuPanelCheckBox3 )
		local val = tostring(MenuPanelCheckBox3:GetChecked())
		net.Start("sdata_changeconvarbool")
			net.WriteString("sdata_decay")
			net.WriteString( val )
		net.SendToServer()
	end
	MenuPanelCheckBox3.Think = function( MenuPanelCheckBox3 )
		if GetConVar("sdata_decay"):GetBool() ~= MenuPanelCheckBox3:GetChecked() then
			MenuPanelCheckBox3:SetValue( GetConVar("sdata_decay"):GetBool() )
		end
	end
	MenuPanelCheckBox3:SizeToContents()
	
	local MenuPanelCheckBox4 = vgui.Create( "DCheckBoxLabel", MenuPanel )
	MenuPanelCheckBox4:SetPos( 5, 65 )
	MenuPanelCheckBox4:SetText( "." )
	MenuPanelCheckBox4.Button.DoClick = function( MenuPanelCheckBox4 )
		local val = tostring(MenuPanelCheckBox4:GetChecked())
		net.Start("sdata_changeconvarbool")
			net.WriteString("sdata_reasonrequired")
			net.WriteString( val )
		net.SendToServer()
	end
	MenuPanelCheckBox4.Think = function( MenuPanelCheckBox4 )
		if GetConVar("sdata_reasonrequired"):GetBool() ~= MenuPanelCheckBox4:GetChecked() then
			MenuPanelCheckBox4:SetValue( GetConVar("sdata_reasonrequired"):GetBool() )
		end
	end
	MenuPanelCheckBox4:SizeToContents()
	
	local MenuPanelCheckBox5 = vgui.Create( "DCheckBoxLabel", MenuPanel )
	MenuPanelCheckBox5:SetPos( 5, 85)
	MenuPanelCheckBox5:SetText( cl30 )
	MenuPanelCheckBox5.Button.DoClick = function( MenuPanelCheckBox5 )
		local val = tostring(MenuPanelCheckBox5:GetChecked())
		net.Start("sdata_changeconvarbool")
			net.WriteString("sdata_reset_warnings_after_ban")
			net.WriteString( val )
		net.SendToServer()
	end
	MenuPanelCheckBox5.Think = function( MenuPanelCheckBox5 )
		if GetConVar("sdata_reset_warnings_after_ban"):GetBool() ~= MenuPanelCheckBox5:GetChecked() then
			MenuPanelCheckBox5:SetValue( GetConVar("sdata_reset_warnings_after_ban"):GetBool() )
		end
	end
	MenuPanelCheckBox5:SizeToContents()
	
	local MenuPanelCheckBox6 = vgui.Create( "DCheckBoxLabel", MenuPanel )
	MenuPanelCheckBox6:SetPos( 5, 105)
	MenuPanelCheckBox6:SetText( cl31 .. " (garrysmod/data/sdata2)" )
	MenuPanelCheckBox6.Button.DoClick = function( MenuPanelCheckBox6 )
		local val = tostring(MenuPanelCheckBox6:GetChecked())
		net.Start("sdata_changeconvarbool")
			net.WriteString("sdata_logging")
			net.WriteString( val )
		net.SendToServer()
	end
	MenuPanelCheckBox6.Think = function( MenuPanelCheckBox6 )
		if GetConVar("sdata_logging"):GetBool() ~= MenuPanelCheckBox6:GetChecked() then
			MenuPanelCheckBox6:SetValue( GetConVar("sdata_logging"):GetBool() )
		end
	end
	MenuPanelCheckBox6:SizeToContents()
	
	local MenuPanelSlider4 = vgui.Create( "DNumSlider", MenuPanel )
	MenuPanelSlider4:SetPos( 5, 130 )
	MenuPanelSlider4:SetSize( 390, 30 )
	MenuPanelSlider4:SetText( cl32 .. ": " )
	MenuPanelSlider4:SetMin( 0 )
	MenuPanelSlider4:SetMax( 43200 )
	MenuPanelSlider4:SetDark( false )
	MenuPanelSlider4:SetDecimals( 0 )
	MenuPanelSlider4.TextArea:SetDrawBackground( true )
	MenuPanelSlider4.TextArea:SetWide( 30 )
	MenuPanelSlider4.Label:SetWide(150)
	MenuPanelSlider4:SetValue( GetConVar("sdata_decay_rate"):GetInt() )
	MenuPanelSlider4.Think = function( MenuPanelSlider4 )
		
		if MenuPanelSlider4.Slider:GetDragging() then return end
		if ( sdata.MenuThink or CurTime() ) > CurTime() then return end
		
		if MenuPanelSlider4.TextArea:GetValue() == "" then return end
		if tonumber(MenuPanelSlider4.TextArea:GetValue()) ~= GetConVar("sdata_decay_rate"):GetInt() then
			net.Start("sdata_changeconvar")
				net.WriteString("sdata_decay_rate")
				net.WriteInt( MenuPanelSlider4.TextArea:GetValue(), 32 )
			net.SendToServer()
			sdata.MenuThink = CurTime() + 1
			return
		end
		if GetConVar("sdata_decay_rate"):GetInt() ~= MenuPanelSlider4:GetValue() then
			MenuPanelSlider4:SetValue( GetConVar("sdata_decay_rate"):GetInt() )
		end
	end
	
	local punishment_text = vgui.Create( "DLabel", MenuPanel )
	punishment_text:SetPos( 5, 160 )
	punishment_text:SetColor(Color(255,50,50,255))
	punishment_text:SetText(cl33)
	punishment_text:SizeToContents()
	
	local punishment_text2 = vgui.Create( "DLabel", MenuPanel )
	punishment_text2:SetPos( 5, 173 )
	punishment_text2:SetColor(Color(255,50,50,255))
	punishment_text2:SetText("addons/sdata2/lua/sdata/modules/sdata_settings.lua")
	punishment_text2:SizeToContents()
	
	
end


net.Receive("SendPlayerWarns", function(length )
	sdata.playerinfo = net.ReadTable()
	sdata.playerwarns = net.ReadInt( 32 )
	sdata.currentselectedplayer = net.ReadString()

	if ValidPanel( sdata.MenuFrame ) then
		if sdata.playerinfo then
			sdata.MenuFrame.WarningsList:Clear()
			for k, v in pairs(sdata.playerinfo) do
				if v.server == "NULL" then v.server = "UNKNOWN" end
				sdata.MenuFrame.WarningsList:AddLine(v.pid, v.admin, v.reason, v.server, v.date)
			end
			sdata.MenuFrame.WarningsList:SortByColumn( 3, true )
			sdata.MenuFrame.MenuPanel2Text4:SetText( #sdata.playerinfo )
			sdata.MenuFrame.MenuPanel2Text4:SizeToContents()
		end
		
		if sdata.playerwarns then
			sdata.MenuFrame.MenuPanel2Text2:SetText( sdata.playerwarns )
			sdata.MenuFrame.MenuPanel2Text2:SizeToContents()
		end
	end
end)

net.Receive("SendOwnWarns", function(length )
	sdata.ownplayerinfo = net.ReadTable()
	sdata.ownplayerwarns = net.ReadInt( 32 )

	if ValidPanel( sdata.ClientMenuFrame ) then
		if sdata.ownplayerinfo then
			sdata.ClientMenuFrame.WarningsList:Clear()
			for k, v in pairs(sdata.ownplayerinfo) do
				sdata.ClientMenuFrame.WarningsList:AddLine(v.admin, v.reason, v.date)
			end
			sdata.ClientMenuFrame.WarningsList:SortByColumn( 3, true )
			sdata.ClientMenuFrame.MenuPanel2Text4:SetText( #sdata.ownplayerinfo )
			sdata.ClientMenuFrame.MenuPanel2Text4:SizeToContents()
		end
		
		if sdata.ownplayerwarns then
			sdata.ClientMenuFrame.MenuPanel2Text2:SetText( sdata.ownplayerwarns )
			sdata.ClientMenuFrame.MenuPanel2Text2:SizeToContents()
		end
	end
end)

net.Receive("sdataMenu", function(length )
	if not ValidPanel(sdata.MenuFrame) then
		sdata_menu()
	end
end)

net.Receive("sdataClientMenu", function(length )
	if not ValidPanel(sdata.ClientMenuFrame) then
		sdata_clientmenu()
	end
end)

net.Receive("sdataOptionsMenu", function(length )
	sdata_optionsmenu()
end)

net.Receive("sdataNotification", function(length )
	local admin = net.ReadEntity()
	local target = net.ReadEntity()
	local reason = net.ReadString()
	local tarid = ""
	if target == game.GetWorld() then
		tarid = net.ReadString()
		if admin:EntIndex() == 0 then
			chat.AddText( Color(60,60,60), "[", Color(30,90,150), "sdata", Color(60,60,60), "] ", Color(255,255,255), "steamid ", Color(255,0,0), tarid,  Color(255,255,255), " " .. cl34 .. " ", Color(100,100,100), "[CONSOLE]", Color(255,255,255), ": ", Color(150,40,40), reason )
		else
			chat.AddText( Color(60,60,60), "[", Color(30,90,150), "sdata", Color(60,60,60), "] ", Color(255,255,255), "steamid ", Color(255,0,0), tarid,  Color(255,255,255), " " .. cl34 .. " ", admin, Color(255,255,255), ": ", Color(150,40,40), reason )
		end
	else
		if admin:EntIndex() == 0 then
			chat.AddText( Color(60,60,60), "[", Color(30,90,150), "sdata", Color(60,60,60), "] ", target, Color(255,255,255), " " .. cl34 .. " ", Color(100,100,100), "[CONSOLE]", Color(255,255,255), ": ", Color(150,40,40), reason )
		else
			chat.AddText( Color(60,60,60), "[", Color(30,90,150), "sdata", Color(60,60,60), "] ", target, Color(255,255,255), " " .. cl34 .. " ", admin, Color(255,255,255), ": ", Color(150,40,40), reason )
		end
	end
end)

net.Receive("sdataNotification2", function(length )
	local admin = net.ReadEntity()
	local target = net.ReadString()
	local reason = net.ReadString()
    
    if admin:EntIndex() == 0 then
        chat.AddText( Color(60,60,60), "[", Color(30,90,150), "sdata", Color(60,60,60), "] ", Color(100,100,100), "[CONSOLE]", Color(255,255,255), " " .. cl35 .. " ", Color(255,0,0), target, Color(255,255,255), ": ", Color(150,40,40), reason )
    else
        chat.AddText( Color(60,60,60), "[", Color(30,90,150), "sdata", Color(60,60,60), "] ", admin, Color(255,255,255), " " .. cl35 .. " ", Color(255,0,0), target, Color(255,255,255), ": ", Color(150,40,40), reason )
    end
end)

net.Receive("sdataChatMessage", function(length )
	local message = net.ReadTable()
	
	chat.AddText( unpack( message ) )
end)

function sdata_con_warn( ply, _, args )
    if #args < 1 then return end
	
	sdata_sendwarning( args[1], args[2] or nil )
    
end
concommand.Add( "sdata_warn", sdata_con_warn )

function sdata_sendwarning( tar, reason )

	if (string.sub(string.lower( tar ), 1, 5) == "steam") then
		if string.len( tar ) == 7 then
			LocalPlayer():PrintMessage( HUD_PRINTTALK, "sdata: " .. cl36 )
		end
		tid = sdata_ConvertSteamID( tar )
		net.Start( "sdata_warnid" )
			net.WriteString( tid )
			net.WriteString( reason )
		net.SendToServer()
		return
	end
	
	
	if sdata_getUser( tar ) then
		tar = sdata_getUser( tar )
		net.Start( "sdata_warn" )
			net.WriteEntity( tar )
			net.WriteString( reason )
		net.SendToServer()
	else
		LocalPlayer():PrintMessage( HUD_PRINTTALK, "sdata: " .. cl37 )
	end
end

function sdata_removewarn( pl )
	print(pl)
	if (string.sub(string.lower( pl ), 1, 5) == "steam") then
		if string.len( pl ) == 7 then
			LocalPlayer():PrintMessage( HUD_PRINTTALK, "sdata: " .. cl36 )
		end
		pl = sdata_ConvertSteamID( pl )
		net.Start( "sdata_removewarnid" )
			net.WriteString( pl )
		net.SendToServer()
		return
	end
		
	net.Start( "sdata_removewarn" )
		net.WriteString( pl )
	net.SendToServer()
end

function sdata_con_delwarn( ply, _, args )
	if not (#args == 1) then return end
	sdata_deletewarnings( args[1] )
end
concommand.Add( "sdata_deletewarnings", sdata_con_delwarn )

function sdata_deletewarnings( pl )
	if (string.sub(string.lower( pl ), 1, 5) == "steam") then
		if string.len(pl) == 7 then
			LocalPlayer():PrintMessage( HUD_PRINTTALK, "sdata: " .. cl36  )
		end
		pl = sdata_ConvertSteamID( pl )
		net.Start( "sdata_deletewarningsid" )
			net.WriteString( pl )
		net.SendToServer()
		return
	end
	net.Start( "sdata_deletewarnings" )
		net.WriteString( pl )
	net.SendToServer()
end

function sdata_con_openmenu( ply, _, args )
	net.Start( "sdata_openmenu" )
	net.SendToServer()
end
concommand.Add( "sdata_menu", sdata_con_openmenu )

function sdata_con_openoptionsmenu( ply, _, args )
	net.Start( "sdata_openoptions" )
	net.SendToServer()
end
concommand.Add( "sdata_options", sdata_con_openoptionsmenu )

local files, dirs = file.Find("sdata/modules/client/*.lua", "LUA")
for k, v in pairs( files ) do
	print("sdata: Loading module (" .. v .. ")")
	include( "sdata/modules/client/" .. v )
end
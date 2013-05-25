/*
	local chatwide = ScreenScale( 200 )
	function ValidMessage( msg )
		return (msg and type(msg)=="string" and msg:len()>0)
	end

	chatbox = vgui.Create( "DTextEntry" )
	chatbox:SetPos(ScrW()/2 - chatwide/2, ScrH() - 90)
	chatbox:SetSize(chatwide, 20)
	chatbox:SetEnterAllowed(true)
	chatbox:SetVisible( false )
	
	chatbox.OnKeyCodeTyped = function( p, b )
		if b == KEY_ENTER and not input.IsKeyDown(KEY_LCONTROL) then
			p:OnEnter()
		end
	end

	chatbox:SetTextColor(color_black)
	chatbox:SetDrawBorder(true)
	chatbox:SetAllowNonAsciiCharacters(true)

	chatbox.OnEnter = function(entry)

		local msg = entry:GetValue()
		msg = "say ".. msg
		if ValidMessage( msg ) then
			LocalPlayer():ConCommand(msg) -- todo: netmsg for longer says...
		end
		chatbox:Hide()
			
	end
	
	chatbox.Hide = function()
	
		hook.Call("FinishChat", GAMEMODE)
	end
	chatbox.Close=chatbox.Hide
	
	chatbox.Think = function()
		if chatbox:IsVisible() then
			if( input.IsKeyDown(KEY_ESCAPE) ) then

				chatbox:SetVisible( false )

			end
		end
	end
	
	
	hook.Add("StartChat", "chatstart", function()
		chatbox:SetVisible( true )
		chatbox:SetText( "" )
		chatbox:MakePopup()
		chatbox:RequestFocus()
		return false
	end)
	
	hook.Add("FinishChat", "chatend", function()
		chatbox:SetVisible( false )
	end)


	hook.Add( "HUDShouldDraw", "chathide", function ( name )
		if name == "CHudChat" then
				 return false
		end
	end )
	*/
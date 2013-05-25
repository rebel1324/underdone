concommand.Add("UD_ToChatBox", function(ply, command, args)
	local strNewChat = string.gsub(args[1], "_", " ") .. ":"
	args[1] = ""
	chat.AddText(clrPurple, strNewChat .. table.concat(args, " "))
end)

function GM:OnPlayerChat(plySpeaker, strText, boolTeamOnly, boolPlayerIsDead)
	local tblText = string.ToTable(strText)
	local clrPlayerName = clrWhite
	local clrChat = clrWhite
	local boolDisplayName = true
	if plySpeaker == LocalPlayer() then clrPlayerName = clrGray end
	if tblText[1] == "*" and tblText[#tblText] == "*" && #tblText > 2 then clrChat = clrGreen end
	if tblText[1] == "/" && tblText[2] == "/" && #tblText > 2 then clrChat = clrOrange end
	if tblText[#tblText] == "@" && #tblText > 1 then clrChat = clrCream end
	if boolDisplayName then
		if clrChat == clrOrange then
			if tblText[3] == " " then
				strText = string.sub( strText, 4, #tblText )
			else
				strText = string.sub( strText, 2, #tblText )
			end
			strText = string.Replace( strText, "/", "" )
			chat.AddText( clrChat, "[OOC] ", clr_Gray, clrPlayerName, plySpeaker:Nick(), ": ",  clrWhite,  strText)
		else
			chat.AddText(clrPlayerName, plySpeaker:Nick(), ": ", clrChat,  strText)
		end
	else
		chat.AddText(clrChat, strText)
	end
	return true
end

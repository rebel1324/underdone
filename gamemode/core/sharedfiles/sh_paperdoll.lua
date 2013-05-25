local Player = FindMetaTable("Player")

function Player:HasSet(strSet)
	if !IsValid(self) then return false end
	local tblSetTable = EquipmentSetTable(strSet)
	if !tblSetTable then return false end
	for _, strItem in pairs(tblSetTable.Items or {}) do
		if !table.HasValue(self.Data.Paperdoll or {}, strItem) then return false end
	end
	return true
end

function Player:SetPaperDoll(strSlot, strItem)
	if !self or !self:IsValid() && !self:Alive() then return false end
	local tblItemTable = ItemTable(strItem) or {}
	self.Data = self.Data or {}
	self.Data.Paperdoll = self.Data.Paperdoll or {}
	if !strItem or self:GetSlot(strSlot) == strItem then
		if tblItemTable.Set && self:HasSet(tblItemTable.Set) then
			local tblSetTable = EquipmentSetTable(tblItemTable.Set)
			self:ApplyBuffTable(tblSetTable.Buffs, -1)
		end
		self.Data.Paperdoll[strSlot] = nil
		self:ApplyBuffTable(tblItemTable.Buffs, -1)
	else
		if self:GetSlot(strSlot) then
			if ItemTable(self:GetSlot(strSlot)).Set && self:HasSet(ItemTable(self:GetSlot(strSlot)).Set) then
				local tblSetTable = EquipmentSetTable(ItemTable(self:GetSlot(strSlot)).Set)
				self:ApplyBuffTable(tblSetTable.Buffs, -1)
			end
			self:ApplyBuffTable(ItemTable(self:GetSlot(strSlot)).Buffs, -1)
		end
		self.Data.Paperdoll[strSlot] = strItem
		if tblItemTable.Set && self:HasSet(tblItemTable.Set) then
			local tblSetTable = EquipmentSetTable(tblItemTable.Set)
			self:ApplyBuffTable(tblSetTable.Buffs)
		end
		self:ApplyBuffTable(tblItemTable.Buffs)
	end
	if SERVER then
		for strChkSlot, strChkItem in pairs(self.Data.Paperdoll or {}) do
			local tblSlotTable = GAMEMODE.DataBase.Slots[strChkSlot]
			if strChkSlot != strSlot && tblSlotTable.ShouldClear && tblSlotTable:ShouldClear(self, tblItemTable) then
				self:UseItem(strChkItem)
			end
		end
		SendUsrMsg("UD_UpdatePapperDoll", player.GetAll(), {self, strSlot, self:GetSlot(strSlot)})
		self:SaveGame()
	end
end

function Player:GetSlot(strSlot)
	if self.Data && self.Data.Paperdoll && self.Data.Paperdoll[strSlot] then return self.Data.Paperdoll[strSlot] end
	return
end

if SERVER then

		net.Receive( "c2s_RequestPaperdoll", function( len, sendto )
		
			local tblEquip = {}
			for _, ply in pairs( player.GetAll() ) do
					if sendto == ply then continue end
					
					tblEquip[ ply:EntIndex() ]  = {}
					for slot, name in pairs( GAMEMODE.DataBase.Slots ) do
							if ply:GetSlot( slot ) then
									tblEquip[ply:EntIndex()][slot] = ply:GetSlot( slot ) 
							end
					end
			end
			
			net.Start( "s2c_PushPaperdoll" )
				net.WriteTable( tblEquip )
			net.Send( sendto )
			
		end)
		
end

if CLIENT then

	net.Start( "c2s_RequestPaperdoll" )
	net.SendToServer()
			
	local init_ed = false
	hook.Add( "Initialize", "Paperdoll_check", function()
			init_ed = true
	end)
					
	hook.Add( "Think", "Paperdoll_Recieve", function()
			if init_ed then
					net.Start( "c2s_RequestPaperdoll" )
					net.SendToServer()
				
					hook.Remove( "Think", "Paperdoll_Recieve" )	
			end
	end)
	
	net.Receive( "s2c_PushPaperdoll", function() 
		local tblInfo = net.ReadTable()
		PrintTable( tblInfo )
		for _, p in pairs( player.GetAll() ) do
			for slot, name in pairs( GAMEMODE.DataBase.Slots ) do
				if LocalPlayer() == p then continue end
				if tblInfo[ p:EntIndex() ][ slot ] then
					GAMEMODE.PapperDollEnts[ p:EntIndex() ][ slot ] = tblInfo[ p:EntIndex() ][ slot ]
				end
			end
		end
	end)
		
	GM.PapperDollEnts = {}
	function UpdatePapperDollUsrMsg(usrMsg)
	

		if LocalPlayer() && !LocalPlayer().Data then LocalPlayer().Data = {} end
		if LocalPlayer() && LocalPlayer().Data && !LocalPlayer().Data.Paperdoll then LocalPlayer().Data.Paperdoll = {} end
	
		local plyPlayer = usrMsg:ReadEntity()
		if !IsValid(plyPlayer) then return end
		local strSlot = usrMsg:ReadString()
		local strItem = usrMsg:ReadString()
		if strItem == "" then strItem = nil end
		plyPlayer:SetPaperDoll(strSlot, strItem)
		plyPlayer:PapperDollBuildSlot(strSlot, strItem)
		if plyPlayer == LocalPlayer() && GAMEMODE.MainMenu then
			GAMEMODE.MainMenu.InventoryTab:LoadInventory()
		end
		
	end
	usermessage.Hook("UD_UpdatePapperDoll", UpdatePapperDollUsrMsg)
	
	function Player:PapperDollBuildSlot(strSlot, strItem)
		if !self:Alive() then return end
		GAMEMODE.PapperDollEnts[self:EntIndex()] = GAMEMODE.PapperDollEnts[self:EntIndex()] or {}
		local tblPlayerTable = GAMEMODE.PapperDollEnts[self:EntIndex()]
		tblPlayerTable = tblPlayerTable or {}
		
		local entPapperDollEnt = tblPlayerTable[strSlot]
	
			
		if strItem && strSlot then
		
			local tblItemTable = ItemTable(strItem)
			local tblSlotTable = SlotTable(strSlot)
			
			if tblItemTable && tblSlotTable then -- debug
				
				pac.SetupENT( self )
				
				local outfit = pac_luamodel[ GAMEMODE.PapperDollEnts[self:EntIndex()][strSlot] ]
			
				if outfit then
					self:RemovePACPart( outfit )
				end
				
				local outfit = pac_luamodel[ strItem ]
				if outfit then
					self:AttachPACPart( outfit )
				end
				
				self.curoutfit = strItem
				GAMEMODE.PapperDollEnts[self:EntIndex()][strSlot] = strItem -- un equip slot
			end
			
		else
			if strSlot then
				
				pac.SetupENT( self )
				local outfit = pac_luamodel[ GAMEMODE.PapperDollEnts[self:EntIndex()][strSlot] ]
				if outfit then
					self:RemovePACPart( outfit )
				end
					
				GAMEMODE.PapperDollEnts[self:EntIndex()][strSlot] = nil -- un equip slot
			end
		end
	end
end
PANEL = {}
PANEL.HeaderHieght = 15
PANEL.ItemIconPadding = 1
PANEL.ItemIconSize = 39

function PANEL:Init()
	self.HeaderList = CreateGenericList(self, 1, true, false)
	self.SkillsList = CreateGenericList(self, self.ItemIconPadding, true, true)
	self.SkillsList.Tiers = {}
	self.MastersHeader = CreateGenericList(self, 1, true, false)
	self.MastersList = CreateGenericList(self, 2, false, false)
	self:LoadSkills()
	self:LoadMasters()
end

function PANEL:PerformLayout()
	self.HeaderList:SetPos(0, 0)
	self.HeaderList:SetSize(59 + (self.ItemIconSize * 6), self.HeaderHieght)
	self.SkillsList:SetPos(0, self.HeaderHieght + 5)
	self.SkillsList:SetSize(self.HeaderList:GetWide(), self:GetTall() - self.HeaderHieght - 5)
	self.SkillsList:SetPadding( 1 )
	self.SkillsList:SetSpacing( 3 )
	
	self.MastersHeader:SetPos(self.HeaderList:GetWide() + 5, 0)
	self.MastersHeader:SetSize(self:GetWide() - self.HeaderList:GetWide() - 5, self.HeaderHieght)
	self.MastersList:SetPos(self.HeaderList:GetWide() + 5, self.HeaderHieght + 5)
	self.MastersList:SetSize(self.MastersHeader:GetWide(), self:GetTall() - self.HeaderHieght - 5)
	for intMaster, pgbMasterBar in pairs(self.MastersList.Masters or {}) do
		if pgbMasterBar.TierUp then
			pgbMasterBar.TierUp:SetPos(self.MastersList:GetWide() - 16 - 5, 2)
		end
	end
end

function PANEL:LoadSkills() -- must be changed

	self.SkillsList:Clear()
	
	local tblAddTable = table.Copy(GAMEMODE.DataBase.Skills)
	tblAddTable = table.ClearKeys(tblAddTable)
	for _, tblSkillTable in pairs(tblAddTable) do
		self:AddSkill(self.SkillsList, tblSkillTable.Name, tblSkillTable)
	end
	
	--Since when did NWvars get slow :/
	timer.Simple(0.2, function() self:LoadHeader() end)
	self:PerformLayout()
	
end

local grad = surface.GetTextureID( "gui/gradient_down" )
function PANEL:AddSkill(pnlParent, strSkill, tblSkillTable)

	local intSkillAmount = LocalPlayer():GetSkill(strSkill)
	local barSkill = vgui.Create("DPanel")
	barSkill:SetSize( 290, 42)
	pnlParent:AddItem(barSkill)
	
	barSkill.Paint = function()
	
		surface.SetTexture( grad )
		
		surface.SetDrawColor( 10, 10, 10, 200 )
		surface.DrawRect(  0,  0,  290,  42 )
		
		surface.SetDrawColor( 10, 10, 10, 200 )
		surface.DrawTexturedRect(  0,  0,  290,  42 )
		
		surface.SetTextColor( 255, 255, 255, 200 )
		surface.SetFont( "ChatFont" )
		local tw, th = surface.GetTextSize( tblSkillTable.PrintName )
		surface.SetTextPos( barSkill:GetWide()/2 - tw/2 + 42/2, barSkill:GetTall()/2 - th/2  ) 
		surface.DrawText( tblSkillTable.PrintName )
		
		surface.SetTextColor( 255, 255, 255, 200 )
		surface.SetFont( "BudgetLabel" )
		
		local teehee = "Passive"
		
		if tblSkillTable.Active then
			teehee = "Active"
		end
		
		local pw, ph = surface.GetTextSize( teehee )
		surface.SetTextPos( barSkill:GetWide() - pw - 1, barSkill:GetTall() - ph - 1  ) 
		surface.DrawText( teehee )
		
	end
	
	
	local icnSkill = vgui.Create("FIconItem", barSkill)
	icnSkill:SetSize(self.ItemIconSize, self.ItemIconSize)
	icnSkill:SetSkill(tblSkillTable, intSkillAmount)
	icnSkill:SetPos( 1, 1 )
	icnSkill.FromChar = true
		
	return icnSkill
	
end

-- How we get used to.
function PANEL:LoadMasters()
	self.MastersList:Clear()
	self.MastersList.Masters = {}
	for strName, tblMasterTable in pairs(table.Copy(GAMEMODE.DataBase.Masters)) do
		local pgbMasterBar = vgui.Create("FPercentBar")
		local intCurentLevel = LocalPlayer():GetMasterLevel(strName)
		local intCurentExp =  LocalPlayer():GetMasterExp(strName) - toMasterExp(intCurentLevel)
		local intNextExp = toMasterExp(intCurentLevel + 1) - toMasterExp(intCurentLevel)
		pgbMasterBar:SetTall(20)
		pgbMasterBar:SetMax(intNextExp - 1)
		pgbMasterBar:SetValue(intCurentExp)
		pgbMasterBar:SetText(tblMasterTable.PrintName .. " Tier " .. intCurentLevel)
		if LocalPlayer():GetMasterExp(strName) == LocalPlayer():GetMasterExpNextLevel(strName) - 1 then
			if LocalPlayer():GetTotalMasters() < GAMEMODE.MaxMaxtersTiers then
				pgbMasterBar.TierUp = CreateGenericImageButton(pgbMasterBar, "icon16/arrow_up.png", "Tier Up", function()
					RunConsoleCommand("UD_BuyMasterLevel", strName)
				end)
			end
		end
		self.MastersList:AddItem(pgbMasterBar)
		if pgbMasterBar.TierUp then
			pgbMasterBar.TierUp:SetPos(pgbMasterBar:GetWide() - pgbMasterBar.TierUp:GetWide() - 5, 2)
		end
		table.insert(self.MastersList.Masters, pgbMasterBar)
	end
	self.MastersHeader:Clear()
	local lblTotal = vgui.Create("DLabel")
	lblTotal:SetFont("UiBold")
	lblTotal:SetColor(clrDrakGray)
	lblTotal:SetText("  Total Tiers " .. LocalPlayer():GetTotalMasters() .. "/" .. GAMEMODE.MaxMaxtersTiers)
	lblTotal:SizeToContents()
	self.MastersHeader:AddItem(lblTotal)
	self:PerformLayout()
end

function PANEL:LoadHeader()
	self.HeaderList:Clear()
	local lblSkillPoints = vgui.Create("DLabel")
	lblSkillPoints:SetFont("UiBold")
	lblSkillPoints:SetColor(clrDrakGray)
	lblSkillPoints:SetText("  Ability Points " .. LocalPlayer():GetNWInt("SkillPoints"))
	lblSkillPoints:SizeToContents()
	self.HeaderList:AddItem(lblSkillPoints)
end
vgui.Register("charactertab", PANEL, "Panel")

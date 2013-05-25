local Player = FindMetaTable("Player")
local Entity = FindMetaTable("Entity")

function Player:AddRecipe(strRecipe)
	if !IsValid(self) then return false end
	self.Recipes = self.Recipes or {}
	self.Recipes[strRecipe] = true
end

function Player:HasRecipe(strRecipe)
	if !IsValid(self) then return false end
	return (self.Recipes or {})[strRecipe]
end

local tblFirePlace = {}
tblFirePlace[1] = "models/props/de_inferno/clayoven.mdl"


function Entity:IsFireplace()
	if self:GetClass() == "env_fire" then
		return true
	elseif ( self:GetClass() == "prop_physics" ||  self:GetClass() == "dynamic" ) then
		return table.HasValue(  tblFirePlace, string.lower( self:GetModel() )  )
	end
end

function Player:CanMake(strRecipe)
	local tblRecipeTable = RecipeTable(strRecipe)
	if !IsValid(self) or !tblRecipeTable or !self:HasRecipe(strRecipe) then return false end
	for strMaster, intLevel in pairs(tblRecipeTable.RequiredMasters) do if self:GetMasterLevel(strMaster) < intLevel then return false end end
	for strItem, intAmount in pairs(tblRecipeTable.Ingredients) do if !self:HasItem(strItem, intAmount) then return false end end
	if tblRecipeTable.MakeTime then if CurTime() < (self.NextCraft or 0) then return false end end
	if !self:HasRoomFor(tblRecipeTable.Products, -self:TotalWeightOf(tblRecipeTable.Ingredients)) then return false end
	if tblRecipeTable.NearFire then
		for _, entFire in pairs( ents.GetAll() ) do
			
			if entFire:IsFireplace() then
				if self:GetPos():Distance( entFire:GetPos() ) <= 150 then
					return true
				end
			end
			
		end
		
		return false
	end
	return true
end

if SERVER then
	function Player:CraftRecipe(strRecipe)
		if !self:CanMake(strRecipe) then return false end
		local tblRecipeTable = RecipeTable(strRecipe)
		self:Freeze(true)
		self.NextCraft = (tblRecipeTable.MakeTime or 0) + CurTime()
		if tblRecipeTable.MakeTime then
			self:CreateProgressBar(tblRecipeTable.PrintName, tblRecipeTable.MakeTime)
		end
		timer.Simple(tblRecipeTable.MakeTime or 0, function()
			if !IsValid(self) then return false end
			self:Freeze(false)
			if !self:CanMake(strRecipe) then return false end
			local intChance = tblRecipeTable.Chance or 100
			local intTotalRequiredMasterLevel = 0
			local intTotalMasterLevel = 0
			for strMaster, intLevel in pairs(tblRecipeTable.RequiredMasters) do
				intTotalRequiredMasterLevel = intTotalRequiredMasterLevel + intLevel
				intTotalMasterLevel = intTotalMasterLevel + self:GetMasterLevel(strMaster)
			end
			intChance = math.Clamp(intChance * (intTotalMasterLevel / intTotalRequiredMasterLevel), 0, 100)
			self:TakeItems(tblRecipeTable.Ingredients)
			if math.random(1, 100 / intChance) == 1 then
				self:GiveItems(tblRecipeTable.Products)
				if tblRecipeTable.GainExp && SERVER then
					for strMaster, intLevel in pairs(tblRecipeTable.RequiredMasters or {}) do
						self:AddMaster(strMaster, math.Round(tblRecipeTable.GainExp * (intLevel / self:GetMasterLevel(strMaster))), true)
					end
				end
			else
				self:GiveItems(tblRecipeTable.BadProducts)
			end
			local fxdSparks = EffectData()
			fxdSparks:SetOrigin(self:GetPos() + Vector(0,0,70))
			util.Effect("cball_explode", fxdSparks)	
			return true
		end)
	end
	concommand.Add("UD_CraftRecipe", function(ply, command, args) ply:CraftRecipe(args[1]) end)
end
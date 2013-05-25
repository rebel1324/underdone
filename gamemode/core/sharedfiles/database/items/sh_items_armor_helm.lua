local function AddModel(tblAddTable, strModel, vecPostion, angAngle, clrColor, strMaterial, vecScale)
	tblAddTable.Model = tblAddTable.Model or {}
	if type(tblAddTable.Model) != "table" then tblAddTable.Model = {} end
	table.insert(tblAddTable.Model, {Model = strModel, Position = vecPostion, Angle = angAngle, Color = clrColor, Material = strMaterial, Scale = vecScale})
	return tblAddTable
end
local function AddStats(tblAddTable, strSlot, intArmor)
	tblAddTable.Slot = strSlot
	tblAddTable.Armor = intArmor
	return tblAddTable
end
local function AddBuff(tblAddTable, strBuff, intAmount)
	tblAddTable.Buffs[strBuff] = intAmount
	return tblAddTable
end

--Chef Hat Madness--
local Item = QuickCreateItemTable(BaseArmor, "armor_helm_brithat", "British Hat", "It means you cool like that", "icons/hat_cheifshat")
Item = AddStats(Item, "slot_helm", 3)
Item.Weight = 1
Item.SellPrice = 25
Register.Item(Item)

local Item = QuickCreateItemTable(BaseArmor, "armor_helm_fancyhat", "Fancy Hat", "Cotton does not defends you from the sharpenels", "icons/hat_cheifshat")
Item = AddStats(Item, "slot_helm", 1)
Item.Weight = 1
Item.SellPrice = 25
Register.Item(Item)

local Item = QuickCreateItemTable(BaseArmor, "armor_helm_musicgear", "Alien Music Gear", "SWAG is for pussies", "icons/hat_cheifshat")
Item = AddStats(Item, "slot_helm", 5)
Item.Weight = 1
Item.SellPrice = 25
Register.Item(Item)

local Item = QuickCreateItemTable(BaseArmor, "armor_helm_racist", "Blackey Afro", "Makes you more stronger and faster", "icons/hat_cheifshat")
Item = AddStats(Item, "slot_helm", 5)
Item.Weight = 1
Item.SellPrice = 25
Register.Item(Item)

local Item = QuickCreateItemTable(BaseArmor, "armor_helm_skull", "Skull Helm", "Makes you more stronger and faster", "icons/bt/item_skull")
Item = AddStats(Item, "slot_helm", 5)
Item.Weight = 1
Item.SellPrice = 25
Register.Item(Item)

local Item = QuickCreateItemTable(BaseArmor, "armor_helm_robo", "Robo Helm", "Makes you more stronger and faster", "icons/bt/item_module")
Item = AddStats(Item, "slot_helm", 5)
Item.Weight = 1
Item.SellPrice = 25
Register.Item(Item)

local Item = QuickCreateItemTable(BaseArmor, "armor_helm_combine", "Advanced Combine Mask", "Makes you more stronger and faster", "icons/bt/item_mask")
Item = AddStats(Item, "slot_helm", 5)
Item.Weight = 1
Item.SellPrice = 25
Register.Item(Item)

local Item = QuickCreateItemTable(BaseArmor, "armor_helm_steam", "Steam Punk Hat", "Makes you more british and smarter.", "icons/junk_cog")
Item = AddStats(Item, "slot_helm", 5)
Item.Weight = 1
Item.SellPrice = 25
Register.Item(Item)

local Item = QuickCreateItemTable(BaseArmor, "armor_helm_headcrab", "Headcrab", "Apply direct on your forehead.", "icons/bt/item_crab")
Item = AddStats(Item, "slot_helm", 5)
Item.Weight = 1
Item.SellPrice = 25
Register.Item(Item)

local Item = QuickCreateItemTable(BaseArmor, "armor_helm_pheadcrab", "Posion Headcrab", "Apply direct on your forehead.", "icons/bt/item_crab")
Item = AddStats(Item, "slot_helm", 5)
Item.Weight = 1
Item.SellPrice = 25
Register.Item(Item)
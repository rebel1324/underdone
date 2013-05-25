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

local Item = QuickCreateItemTable(BaseArmor, "armor_chest_junkarmor", "Junky Armor", "Protects your heart and lungs from gettin pwnd", "icons/amor_junkyarmor")
Item = AddStats(Item, "slot_chest", 15)
Item = AddBuff(Item, "stat_maxhealth", 5)
Item.Weight = 2
Item.SellPrice = 420
Register.Item(Item)

local Item = QuickCreateItemTable(BaseArmor, "armor_chest_racist", "KFC Bucket", "Not Offensive", "icons/bt/misc_basket")
Item = AddStats(Item, "slot_chest", 25)
Item = AddBuff(Item, "stat_maxhealth", 10)
Item.Level = 14
Item.Weight = 2
Item.SellPrice = 1020
Register.Item(Item)

local Item = QuickCreateItemTable(BaseArmor, "armor_chest_skull", "Death Below", "Not Offensive", "icons/bt/item_skull")
Item = AddStats(Item, "slot_chest", 25)
Item = AddBuff(Item, "stat_maxhealth", 10)
Item.Level = 14
Item.Weight = 2
Item.SellPrice = 1020
Register.Item(Item)

local Item = QuickCreateItemTable(BaseArmor, "armor_chest_robo", "Radiant Heater Robo Parts", "Not Offensive", "icons/bt/item_armour_1")
Item = AddStats(Item, "slot_chest", 25)
Item = AddBuff(Item, "stat_maxhealth", 10)
Item.Level = 14
Item.Weight = 2
Item.SellPrice = 1020
Register.Item(Item)

local Item = QuickCreateItemTable(BaseArmor, "armor_chest_combine", "Combine V-1 Chest Armor", "Not Offensive", "icons/bt/item_elite")
Item = AddStats(Item, "slot_chest", 25)
Item = AddBuff(Item, "stat_maxhealth", 10)
Item.Level = 14
Item.Weight = 2
Item.SellPrice = 1020
Register.Item(Item)

local Item = QuickCreateItemTable(BaseArmor, "armor_chest_steam", "Steam Punk Steamer Armour", "Especially British Name", "icons/junk_cog")
Item = AddStats(Item, "slot_chest", 40)
Item = AddBuff(Item, "stat_maxhealth", 10)
Item.Level = 14
Item.Weight = 2
Item.SellPrice = 1020
Register.Item(Item)
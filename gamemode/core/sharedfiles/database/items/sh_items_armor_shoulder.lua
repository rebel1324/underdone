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

local Item = QuickCreateItemTable(BaseArmor, "armor_shoulder_racist", "Blackest Seagull", "Seagull cries when you're hurts!", "icons/bt/misc_seagull")
Item = AddStats(Item, "slot_shoulder", 5)
Item = AddBuff(Item, "stat_agility", 1)
Item.Level = 1
Item.Weight = 2
Item.SellPrice = 760
Register.Item(Item)

local Item = QuickCreateItemTable(BaseArmor, "armor_shoulder_skull", "Skull Shoulder", "Seagull cries when you're hurts!", "icons/bt/item_skull")
Item = AddStats(Item, "slot_shoulder", 5)
Item = AddBuff(Item, "stat_agility", 1)
Item.Level = 1
Item.Weight = 2
Item.SellPrice = 760
Register.Item(Item)

local Item = QuickCreateItemTable(BaseArmor, "armor_shoulder_robo", "Robo Shoulder", "Robotics!", "icons/bt/item_module")
Item = AddStats(Item, "slot_shoulder", 5)
Item = AddBuff(Item, "stat_agility", 1)
Item.Level = 1
Item.Weight = 2
Item.SellPrice = 760
Register.Item(Item)

local Item = QuickCreateItemTable(BaseArmor, "armor_shoulder_combine", "Combine Ammo Belt", "Robotics!", "icons/bt/item_ar2alt")
Item = AddStats(Item, "slot_shoulder", 5)
Item = AddBuff(Item, "stat_agility", 1)
Item.Level = 1
Item.Weight = 2
Item.SellPrice = 760
Register.Item(Item)

local Item = QuickCreateItemTable(BaseArmor, "armor_shoulder_steam", "Metalic Shoulder Pad", "Robotics!", "icons/bt/item_module")
Item = AddStats(Item, "slot_shoulder", 5)
Item = AddBuff(Item, "stat_agility", 1)
Item.Level = 1
Item.Weight = 2
Item.SellPrice = 760
Register.Item(Item)


local Item = QuickCreateItemTable(BaseArmor, "armor_shoulder_light", "'Lantern'", "No more darkness", "icons/bt/item_module")
Item = AddStats(Item, "slot_shoulder", 5)
Item = AddBuff(Item, "stat_agility", 1)
Item.Level = 1
Item.Weight = 2
Item.SellPrice = 760
Register.Item(Item)
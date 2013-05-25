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

local Item = QuickCreateItemTable(BaseArmor, "armor_sheild_eco", "Cog Sheild", "Protects", "icons/bt/item_box1")
Item = AddStats(Item, "slot_offhand", 20)
Item.Weight = 1
Item.SellPrice = 505
Register.Item(Item)

local Item = QuickCreateItemTable(BaseArmor, "armor_shield_pulseshield", "Saw Sheild", "Protects", "icons/bt/item_battery")
Item = AddModel(Item, "models/props_junk/sawblade001a.mdl", Vector(0.3, 1, -2.1), Angle(-89, 68.9, 4.7))
Item = AddStats(Item, "slot_offhand", 20)
Item.Weight = 1
Item.SellPrice = 505
Register.Item(Item)

local Item = QuickCreateItemTable(BaseArmor, "armor_shield_wowshield", "Antlion-Shell Shield", "Protects", "icons/bt/item_battery")
Item = AddModel(Item, "models/Gibs/Antlion_gib_Large_1.mdl", Vector(-6.1, -6.8, 12.6), Angle(64.9, 40.8, -135.8))
Item = AddStats(Item, "slot_offhand", 23)
Item.Level = 5
Item.Weight = 1
Item.SellPrice = 631
Register.Item(Item)

local Item = QuickCreateItemTable(BaseArmor, "armor_shield_steam", "Antlion-Shell Shield2", "Protects", "icons/bt/item_battery")
Item = AddModel(Item, "models/Gibs/Antlion_gib_Large_1.mdl", Vector(-6.1, -6.8, 12.6), Angle(64.9, 40.8, -135.8))
Item = AddStats(Item, "slot_offhand", 23)
Item.Level = 5
Item.Weight = 1
Item.SellPrice = 631
Register.Item(Item)
local function AddBuff(tblAddTable, strBuff, intAmount)
	tblAddTable.Buffs = tblAddTable.Buffs or {}
	tblAddTable.Buffs[strBuff] = intAmount
	return tblAddTable
end

local tblEquipmentSet = {}
tblEquipmentSet.Name = "set_racist"
tblEquipmentSet.PrintName = "The Black Man"
tblEquipmentSet.Items = {}
tblEquipmentSet.Items[1] = "armor_helm_racist"
tblEquipmentSet.Items[2] = "armor_chest_racist"
tblEquipmentSet.Items[3] = "armor_shoulder_racist"
AddBuff(tblEquipmentSet, "stat_maxhealth", 35)
AddBuff(tblEquipmentSet, "stat_strength", 4)
Register.EquipmentSet(tblEquipmentSet)

local tblEquipmentSet = {}
tblEquipmentSet.Name = "set_racist"
tblEquipmentSet.PrintName = "The Black Man"
tblEquipmentSet.Items = {}
tblEquipmentSet.Items[1] =  "armor_helm_robo" 
tblEquipmentSet.Items[2] =  "armor_chest_robo" 
tblEquipmentSet.Items[3] =  "armor_shoulder_robo" 
tblEquipmentSet.Items[4] =  "armor_belt_robo" 
AddBuff(tblEquipmentSet, "stat_maxhealth", 35)
AddBuff(tblEquipmentSet, "stat_strength", 4)
Register.EquipmentSet(tblEquipmentSet)
local function AddModel(tblAddTable, strModel, vecPostion, angAngle, clrColor, strMaterial, vecScale)
	tblAddTable.Model = tblAddTable.Model or {}
	if type(tblAddTable.Model) != "table" then tblAddTable.Model = {} end
	table.insert(tblAddTable.Model, {Model = strModel, Position = vecPostion, Angle = angAngle, Color = clrColor, Material = strMaterial, Scale = vecScale})
	return tblAddTable
end
local function AddStats(tblAddTable, intPower, intFireRate)
	tblAddTable.Power = intPower
	tblAddTable.FireRate = intFireRate
	tblAddTable.HoldType = "melee2"
	tblAddTable.Melee = true
	return tblAddTable
end
local function AddBuff(tblAddTable, strBuff, intAmount)
	tblAddTable.Buffs[strBuff] = intAmount
	return tblAddTable
end
local function AddSound(tblAddTable, strShootSound)
	tblAddTable.Sound = strShootSound
	return tblAddTable
end

local normalvein = {
	dice = { 1, 280 },
	
	occ = {
		["mat_iron"] = { 0, 5 },
		["mat_copper"] = { 10, 19 },
	}
}

local tblVeinModel = {
[ "models/props_wasteland/rockcliff_cluster01a.mdl" ] = normalvein,
[ "models/props_wasteland/rockcliff_cluster01b.mdl" ] = normalvein,
[ "models/props_wasteland/rockcliff_cluster02a.mdl" ] = normalvein,
[ "models/props_wasteland/rockcliff_cluster02b.mdl" ] = normalvein,
[ "models/props_wasteland/rockcliff_cluster02c.mdl" ] = normalvein,
[ "models/props_wasteland/rockcliff_cluster03a.mdl" ] = normalvein,
[ "models/props_wasteland/rockcliff_cluster03b.mdl" ] = normalvein,
[ "models/props_wasteland/rockcliff_cluster03c.mdl" ] = normalvein,
}


local Item = QuickCreateItemTable(BaseWeapon, "special_drill", "Metal Drill", "Allows you to gather resources from rocks", "icons/weapon_sniper1")
Item = AddStats(Item, 1, 8)
Item.HoldType = "physgun"
Item = AddSound(Item, "npc/dog/dog_servo1.wav")
Item.Level = 1
Item.CallBack = function( tblItem, plyPlayer, tblTrace )
	if ( tblTrace.Entity:GetClass() == "prop_dynamic" || tblTrace.Entity:GetClass() == "prop_physics" ) then
		local tblVein = tblVeinModel[ string.lower( tblTrace.Entity:GetModel() ) ]
		if tblVein then
				local dice = math.random( tblVein.dice[1], tblVein.dice[2] )
				local dat = tblVein.occ
				
				for name, data in pairs( dat ) do
				
					if ( ( !data[ 1 ] || dice > data[ 1 ] ) && ( !data[ 2 ] || dice <= data[ 2 ] ) ) then 
						if ( plyPlayer:CanBurden( ItemTable(name).Weight ) ) then
							plyPlayer:EmitSound(  "physics/concrete/rock_impact_hard" .. math.random( 1, 4 ) ..".wav" )
							plyPlayer:AddItem( name, 1 )
							plyPlayer:CreateNotification( "Gathered one " ..  ItemTable(name).PrintName .. " from the Ore Vein")
							plyPlayer:AddMaster( "master_mining" , 1)
						else
							plyPlayer:CreateNotification(  "Not enough Inventory space" )
						end
						break;
					end
					
				end

		end
	end
end
Item.Weight = 1
Item.SellPrice = 1
Register.Item(Item)




local Item = QuickCreateItemTable(BaseItem, "mat_armourflesh", "Armour Flesh", "A Hardened flesh from the rock.", "icons/bt/mat_armourflesh")
Item.Stackable = true
Item.SellPrice = 500
Item.Weight = 2
Register.Item(Item)

local Item = QuickCreateItemTable(BaseItem, "mat_iron", "Iron", "The basic material for crafting items.", "icons/bt/mat_iron")
Item.Stackable = true
Item.SellPrice = 30
Item.Weight = 1
Register.Item(Item)

local Item = QuickCreateItemTable(BaseItem, "mat_copper", "Copper", "The basic material for crafting items.", "icons/bt/mat_copper")
Item.Stackable = true
Item.SellPrice = 25
Item.Weight = 1
Register.Item(Item)

local Item = QuickCreateItemTable(BaseItem, "mat_pyrocore", "Pyrocore", "Really hot and light. Touch it with care.", "icons/bt/mat_pyrocore")
Item.Stackable = true
Item.SellPrice = 4000
Item.Weight = .2
Register.Item(Item)

local Item = QuickCreateItemTable(BaseItem, "mat_pyromite", "Pyromite", "Really hot and light. Touch it with care.", "icons/bt/mat_pyromite")
Item.Stackable = true
Item.SellPrice = 1500
Item.Weight = .2
Register.Item(Item)

local Item = QuickCreateItemTable(BaseItem, "mat_rhynomite", "Rhynomite", "Really Heavy. Feels like combine metals.", "icons/bt/mat_rhynomite")
Item.Stackable = true
Item.SellPrice = 3000
Item.Weight = 3
Register.Item(Item)

local Item = QuickCreateItemTable(BaseItem, "mat_glass", "Rhynomite", "Usually used for electonic stuffs.", "icons/bt/mat_glass")
Item.Stackable = true
Item.SellPrice = 200
Item.Weight = 3
Register.Item(Item)


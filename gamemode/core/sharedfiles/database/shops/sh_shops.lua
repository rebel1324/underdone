local Shop = {}
Shop.Name = "shop_general"
Shop.PrintName = "Shop General"
Shop.Inventory = {}
--Shop.Inventory["item_orange"] = {}
--Shop.Inventory["item_bananna"] = {}
--Shop.Inventory["item_banannabunch"] = {}
Shop.Inventory["special_drill"] = {}
Shop.Inventory["item_smallammo_small"] = {}
Shop.Inventory["item_sniperammo_small"] = {}
Shop.Inventory["item_rifleammo_small"] = {}
Shop.Inventory["item_buckshotammo_small"] = {}
Shop.Inventory["item_smallammo_big"] = {}
Shop.Inventory["item_sniperammo_big"] = {}
Shop.Inventory["item_rifleammo_big"] = {}
Shop.Inventory["item_buckshotammo_big"] = {}
Shop.Inventory["item_launcher_nade_big"] = {}
Shop.Inventory["item_launcher_nade"] = {}
Shop.Inventory["item_healthkit"] = {}
Shop.Inventory["item_antivirus"] = {}
Shop.Inventory["book_wooddistilation"] = {}
Shop.Inventory["item_firestarting_kit"] = {}
Shop.Inventory["item_grenade2"] = {}
Register.Shop(Shop)

local Shop = {}
Shop.Name = "shop_armor"
Shop.PrintName = "Armor Shop"
Shop.Inventory = {}
Shop.Inventory["armor_chest_junkarmor"] = {}
Shop.Inventory["armor_helm_fancyhat"] = {}
Shop.Inventory["armor_helm_musicgear"] = {}

Shop.Inventory["armor_helm_racist"] = {}
Shop.Inventory["armor_chest_racist"] = {}
Shop.Inventory["armor_shoulder_racist"] = {}

Shop.Inventory["armor_helm_skull"] = {}
Shop.Inventory["armor_chest_skull"] = {}
Shop.Inventory["armor_shoulder_skull"] = {}
Shop.Inventory["armor_belt_skull"] = {}

Shop.Inventory[ "armor_helm_robo" ] = {}
Shop.Inventory[ "armor_chest_robo" ] = {}
Shop.Inventory[ "armor_shoulder_robo" ] = {}
Shop.Inventory[ "armor_belt_robo" ] = {}

Shop.Inventory[ "armor_helm_combine" ] = { }
Shop.Inventory[ "armor_chest_combine" ] = { }
Shop.Inventory[ "armor_shoulder_combine" ] = { }
Shop.Inventory[ "armor_belt_combine" ] = { }
	
Shop.Inventory[ "armor_helm_steam" ] = {}
Shop.Inventory[ "armor_chest_steam" ] = {}
Shop.Inventory[ "armor_shoulder_steam" ] = {}
Shop.Inventory[ "armor_belt_steam" ] = {}
Shop.Inventory[ "armor_shield_steam" ] = {}
	
Shop.Inventory["armor_sheild_eco"] = {}
Shop.Inventory["armor_shield_pulseshield"] = {}
Shop.Inventory["armor_shield_wowshield"] = {}

Shop.Inventory[ "armor_helm_headcrab" ] = {  }
Shop.Inventory[ "armor_helm_pheadcrab" ] = {  }
Shop.Inventory[ "armor_shoulder_light" ] = {  }
Register.Shop(Shop)

local Shop = {}
Shop.Name = "shop_armor2"
Shop.PrintName = "Advanced Armor Shop"
Shop.Inventory = {}
Shop.Inventory["armor_helm_brithat"] = {}
Register.Shop(Shop)

local Shop = {}
Shop.Name = "shop_armor3"
Shop.PrintName = "Master Armor Shop"
Shop.Inventory = {}
Shop.Inventory["armor_helm_brithat"] = {}
Register.Shop(Shop)

local Shop = {}
Shop.Name = "shop_weapons"
Shop.PrintName = "Arms Dealer"
Shop.Inventory = {}
Shop.Inventory["weapon_ranged_junkpistol"] = {}
Shop.Inventory["weapon_ranged_sharpshooter"] = {}
Shop.Inventory["weapon_ranged_scatter"] = {}
Shop.Inventory["weapon_ranged_rustysmg"] = {}
Shop.Inventory["weapon_ranged_bughunter"] = {}
Shop.Inventory["weapon_ranged_drum"] = {}
Shop.Inventory["weapon_ranged_bolter"] = {}
Shop.Inventory["weapon_ranged_hwarang"] = {}
Shop.Inventory["weapon_ranged_silencer"] = {}

Shop.Inventory["weapon_ranged_hrifle"] = {}
Shop.Inventory["weapon_ranged_choitok"] = {}
Shop.Inventory["weapon_ranged_sr25"] = {}
Shop.Inventory["weapon_ranged_raider"] = {}
Shop.Inventory["weapon_ranged_smiter"] = {}

Shop.Inventory["weapon_ranged_scarface"] = {}
Shop.Inventory["weapon_ranged_tbusiness"] = {}
Shop.Inventory["weapon_ranged_tbusiness_gl"] = {}
Shop.Inventory["weapon_ranged_acrate"] = {}
Shop.Inventory["weapon_ranged_farseer"] = {}
Shop.Inventory["weapon_ranged_farseer_gl"] = {}
Shop.Inventory["weapon_ranged_pmaker"] = {}

Shop.Inventory["weapon_melee_robot"] = {}
Shop.Inventory["weapon_ranged_fatman"] = {}

Shop.Inventory["weapon_ranged_hloader"] = {}
Shop.Inventory["weapon_ranged_prohandle"] = {}
Shop.Inventory["weapon_ranged_autocannon"] = {}
Shop.Inventory["weapon_ranged_thethree"] = {}
Shop.Inventory["weapon_ranged_theparrot"] = {}

Shop.Inventory["weapon_melee_meathook"] = {}
Shop.Inventory["weapon_melee_sawblade"] = {}
Shop.Inventory["weapon_melee_deadblade"] = {}
Register.Shop(Shop)

local Shop = {}
Shop.Name = "shop_weapons2"
Shop.PrintName = "Advanced Arms Dealer"
Shop.Inventory = {}
Shop.Inventory["weapon_ranged_junkpistol"] = {}
Shop.Inventory[ "weapon_melee_ladel" ] = {} -- 2
Shop.Inventory[ "weapon_melee_spine" ] = {} -- 3
Shop.Inventory[ "weapon_melee_shovel" ] = {} -- 4
Shop.Inventory[ "weapon_melee_steelcutter" ] = {} -- 5
Shop.Inventory[ "weapon_melee_sharpnel" ] = {} -- 6
Shop.Inventory[ "weapon_melee_horn" ] = {} -- 7
Shop.Inventory[ "weapon_melee_outlander" ] = {} -- 8
Shop.Inventory[ "weapon_melee_thebigdeal" ] = {} -- 9
Shop.Inventory[ "weapon_melee_crystalcollapse" ] = {} -- 10
Shop.Inventory[ "weapon_melee_thebower" ] = {} -- 11
Shop.Inventory[ "weapon_melee_cleaver" ] = {} -- 1
Shop.Inventory[ "weapon_melee_axe" ] = {} -- n1
Shop.Inventory[ "weapon_melee_leadpipe" ] = {} -- n2
Shop.Inventory[ "weapon_melee_fryingpan" ] = {} -- n3
Shop.Inventory[ "weapon_melee_knife" ] = {} -- n4
Shop.Inventory[ "weapon_melee_meathook" ] = {} -- n5
Shop.Inventory[ "weapon_melee_knife" ] = {} -- n5
Shop.Inventory[ "weapon_melee_harpoon" ] = {} -- n5

Register.Shop(Shop)

local Shop = {}
Shop.Name = "shop_weapons3"
Shop.PrintName = "Master Arms Dealer"
Shop.Inventory = {}
Shop.Inventory["weapon_ranged_junkpistol"] = {}
Register.Shop(Shop)



--Testing shop
--[[
local Shop = {}
Shop.Name = "shop_weapons"
Shop.PrintName = "Arms Dealer"
Shop.Inventory = {}
Shop.Inventory["weapon_ranged_junkpistol"] = {Price = 1}
Shop.Inventory["weapon_ranged_junksmg"] = {Price = 1}
Shop.Inventory["weapon_ranged_junkrifle"] = {Price = 1}
Shop.Inventory["weapon_ranged_heavymacgun"] = {Price = 1}
Shop.Inventory["weapon_melee_cleaver"] = {Price = 1}
Shop.Inventory["weapon_melee_leadpipe"] = {Price = 1}
Shop.Inventory["weapon_melee_knife"] = {Price = 1}
Shop.Inventory["weapon_melee_circularsaw"] = {Price = 1}
Shop.Inventory["weapon_melee_dualaxe"] = {Price = 1}
Shop.Inventory["weapon_melee_anttalon"] = {Price = 1}
Shop.Inventory["weapon_melee_emptool"] = {Price = 1}
Shop.Inventory["armor_chest_antlion"] = {Price = 1}
Shop.Inventory["armor_shoulder_antlion"] = {Price = 1}
Shop.Inventory["armor_helm_antlionhelm"] = {Price = 1}
Shop.Inventory["armor_helm_cyborg"] = {Price = 1}
Shop.Inventory["armor_chest_cyborg"] = {Price = 1}
Shop.Inventory["armor_shoulder_cyborg"] = {Price = 1}
Shop.Inventory["armor_shield_imprvsaw"] = {Price = 1}
Shop.Inventory["armor_helm_bones"] = {Price = 1}
Shop.Inventory["armor_shield_antlionshell"] = {Price = 1}
Shop.Inventory["armor_belt_antlion"] = {Price = 1}
Register.Shop(Shop)]]
local function AddHealth(tblAddTable, intAmount, intTime)
	tblAddTable.AddedHealth = intAmount
	tblAddTable.AddTime = intTime
	return tblAddTable
end
local function AddAmmo(tblAddTable, intAmount, strType)
	tblAddTable.AmmoAmount = intAmount
	tblAddTable.AmmoType = strType
	return tblAddTable
end

local Item = QuickCreateItemTable(BaseFood, "item_canspoilingmeat", "Can of Spoiling Meat", "Restores your health by 10 over 12 Seconds", "icons/junk_metalcan1")
Item = AddHealth(Item, 10, 12)
Item.Model = "models/props_junk/garbage_metalcan001a.mdl"
Item.Message = "You ate a Spoiled pieace of Meat"
Item.UseSound = "vo/SandwichEat09.wav"
Item.Stackable = true
Item.SellPrice = 20
Item.Weight = 1
Register.Item(Item)

local Item = QuickCreateItemTable(BaseFood, "item_cancookedmeat", "Can of Cooked Meat", "Restores your health by 20 over 10 Seconds", "icons/junk_metalcan1")
Item = AddHealth(Item, 20, 10)
Item.Model = "models/props_junk/garbage_metalcan001a.mdl"
Item.Message = "You ate a pieace of Meat"
Item.UseSound = "vo/SandwichEat09.wav"
Item.Stackable = true
Item.SellPrice = 50
Item.Weight = 1
Register.Item(Item)

local Item = QuickCreateItemTable(BaseFood, "item_cookednoodles", "Cooked Chineese Noodles", "Restores your health by 30 over 5 Seconds", "icons/junk_metalcan1")
Item = AddHealth(Item, 30, 5)
Item.Model = "models/props_junk/garbage_metalcan001a.mdl"
Item.Message = "You ate some chineese noodles"
Item.UseSound = "vo/SandwichEat09.wav"
Item.Stackable = true
Item.SellPrice = 100
Item.Weight = 1
Register.Item(Item)

local Item = QuickCreateItemTable(BaseFood, "item_orange", "Orange", "Restores your health by 25 over 8 Seconds", "icons/food_orange")
Item = AddHealth(Item, 25, 8)
Item.Model = "models/props/cs_italy/orange.mdl"
Item.Message = "You ate a Orange"
Item.UseSound = "vo/SandwichEat09.wav"
Item.Stackable = true
Item.SellPrice = 8
Item.Weight = 1
Register.Item(Item)
local Item = DeriveTable(BaseItem)

local Item = QuickCreateItemTable(BaseFood, "item_antivirus", "Anti Virus", "An antivirus that can heal wounds.", "icons/item_antivirus")
Item = AddHealth(Item, 40, 10)
Item.Model = "models/healthvial.mdl"
Item.QuestNeeded = "quest_zombieblood"
Item.Message = "You have taken an antivirus"
Item.UseSound = "items/smallmedkit1.wav"
Item.Stackable = true
Item.SellPrice = 30
Item.Weight = 1
Register.Item(Item)

local Item = QuickCreateItemTable(BaseFood, "item_banannabunch", "Banana Bunch", "Restores your health by 75 over 20 Seconds", "icons/food_bananna_bunch")
Item = AddHealth(Item, 75, 20)
Item.Model = "models/props/cs_italy/bananna_bunch.mdl"
Item.Message = "You ate a Bunch of Bananna's"
Item.UseSound = "vo/SandwichEat09.wav"
Item.Stackable = true
Item.SellPrice = 80
Item.Weight = 1
Register.Item(Item)

local Item = QuickCreateItemTable(BaseFood, "item_bananna", "banana", "Restores your health by 15 over 10 Seconds", "icons/food_bananna")
Item = AddHealth(Item, 15, 10)
Item.Model = "models/props/cs_italy/bananna.mdl"
Item.Message = "You ate a Banana"
Item.UseSound = "vo/SandwichEat09.wav"
Item.Stackable = true
Item.SellPrice = 8
Item.Weight = 1
Register.Item(Item)


local Item = QuickCreateItemTable(BaseFood, "item_healthkit", "Health Kit", "Restores health by 40", "icons/item_healthkit")
Item = AddHealth(Item, 40, 1)
Item.Model = "models/Items/HealthKit.mdl"
Item.Message = "You've used a Health Kit"
Item.UseSound = "items/smallmedkit1.wav"
Item.Stackable = true
Item.SellPrice = 150
Item.Weight = 1
Register.Item(Item)


local Item = QuickCreateItemTable(BaseAmmo, "item_smallammo_small", "Small Rounds", "35 Small bullets", "icons/item_rifleammo")
Item = AddAmmo(Item, 35, "smg1")
Item.Model = "models/Items/357ammobox.mdl"
Item.Stackable = true
Item.SellPrice = 2
Item.Weight = 1
Register.Item(Item)

local Item = QuickCreateItemTable(BaseAmmo, "item_smallammo_big", "Small Rounds Pack", "350 Small bullets", "icons/item_rifleammo")
Item = AddAmmo(Item, 350, "smg1")
Item.Model = "models/Items/357ammobox.mdl"
Item.Stackable = true
Item.SellPrice = 20
Item.Weight = 1
Register.Item(Item)

local Item = QuickCreateItemTable(BaseAmmo, "item_rifleammo_small", "Rifle Rounds", "50 Rifle bullets", "icons/bt/item_smgbox")
Item = AddAmmo(Item, 50, "ar2")
Item.Model = "models/Items/BoxSRounds.mdl"
Item.Stackable = true
Item.SellPrice = 3
Item.Weight = 1
Register.Item(Item)

local Item = QuickCreateItemTable(BaseAmmo, "item_rifleammo_big", "Rifle Rounds Pack", "400 Rifle bullets", "icons/bt/item_smgbox")
Item = AddAmmo(Item, 400, "ar2")
Item.Model = "models/Items/BoxSRounds.mdl"
Item.Stackable = true
Item.SellPrice = 24
Item.Weight = 1
Register.Item(Item)

local Item = QuickCreateItemTable(BaseAmmo, "item_buckshotammo_small", "Buckshot", "20 Buckshot shells", "icons/item_buckshot")
Item = AddAmmo(Item, 20, "buckshot")
Item.Model = "models/Items/BoxBuckshot.mdl"
Item.Stackable = true
Item.SellPrice = 3
Item.Weight = 1
Register.Item(Item)

local Item = QuickCreateItemTable(BaseAmmo, "item_buckshotammo_big", "Buckshot Pack", "200 Buckshot shells", "icons/item_buckshot")
Item = AddAmmo(Item, 200, "buckshot")
Item.Model = "models/Items/BoxBuckshot.mdl"
Item.Stackable = true
Item.SellPrice = 30
Item.Weight = 1
Register.Item(Item)

local Item = QuickCreateItemTable(BaseAmmo, "item_sniperammo_small", "SniperRound", "8 Sniper Round", "icons/bt/item_sniperround")
Item = AddAmmo(Item, 8, "SniperRound")
Item.Model = "models/Items/BoxBuckshot.mdl"
Item.Stackable = true
Item.SellPrice = 8
Item.Weight = 1
Register.Item(Item)

local Item = QuickCreateItemTable(BaseAmmo, "item_sniperammo_big", "SniperRound Pack", "100 Sniper Round", "icons/bt/item_sniperround")
Item = AddAmmo(Item, 100, "SniperRound")
Item.Model = "models/Items/BoxBuckshot.mdl"
Item.Stackable = true
Item.SellPrice = 100
Item.Weight = 1
Register.Item(Item)

local Item = QuickCreateItemTable(BaseAmmo, "item_launcher_nade", "Launcher-nade", "1 Launcher-nade", "icons/bt/item_smg_grenade")
Item = AddAmmo(Item, 1, "smg1_grenade")
Item.Model = "models/Items/BoxBuckshot.mdl"
Item.Stackable = true
Item.SellPrice = 100
Item.Weight = 1
Register.Item(Item)

local Item = QuickCreateItemTable(BaseAmmo, "item_launcher_nade_big", "Launcher-nade Pack", "10 Launcher-nade", "icons/bt/item_smg_grenade")
Item = AddAmmo(Item, 10, "smg1_grenade")
Item.Model = "models/Items/BoxBuckshot.mdl"
Item.Stackable = true
Item.SellPrice = 1000
Item.Weight = 1
Register.Item(Item)



--More ZCOM stuff I want these to have icons before we add them to game
local Item = QuickCreateItemTable(BaseFood, "item_pumpkin", "Pumpkin", "Restores your health by 35 over 12 Seconds", "icons/food_bananna")
Item = AddHealth(Item, 35, 12)
Item.Model = "models/props_outland/pumpkin01.mdl"
Item.Message = "You ate a Pumpkin"
Item.UseSound = "vo/SandwichEat09.wav"
Item.SellPrice = 45
Item.Weight = 1
Register.Item(Item)

local Item = QuickCreateItemTable(BaseFood, "item_coffee", "Coffee Mug", "Restores health by 12", "icons/food_bananna")
Item = AddHealth(Item, 12, 1)
Item.Model = "models/props_junk/garbage_coffeemug001a.mdl"
Item.Message = "You drank a cup of stale coffee."
Item.UseSound = "player/pl_scout_dodge_can_drink.wav"
Item.SellPrice = 2
Item.Weight = 1
Register.Item(Item)

local Item = QuickCreateItemTable(BaseFood, "item_milk", "Milk(1Gal)", "Restores your health by 50 over 15 Seconds", "icons/food_bananna")
Item = AddHealth(Item, 50, 15)
Item.Model = "models/props_junk/garbage_milkcarton001a.mdl"
Item.Message = "You drank a whole gallon of milk!"
Item.UseSound = "player/pl_scout_dodge_can_drink.wav"
Item.SellPrice = 10
Item.Weight = 1
Register.Item(Item)

local Item = QuickCreateItemTable(BaseFood, "item_milk_small", "Milk(1/2Gal)", "Restores your health by 25 over 8 Seconds", "icons/food_bananna")
Item = AddHealth(Item, 25, 8)
Item.Model = "models/props_junk/garbage_milkcarton002a.mdl"
Item.Message = "You drank half a gallon of milk."
Item.UseSound = "player/pl_scout_dodge_can_drink.wav"
Item.SellPrice = 6
Item.Weight = 1
Register.Item(Item)

local Item = QuickCreateItemTable(BaseFood, "item_beer", "Cheap Beer", "Restores your health by 30 over 30 Seconds", "icons/food_bananna")
Item = AddHealth(Item, 30, 30)
Item.Model = "models/props_junk/garbage_glassbottle001a.mdl"
Item.Message = "You drank a bottle of cheap beer."
Item.UseSound = "player/pl_scout_dodge_can_drink.wav"
Item.SellPrice = 8
Item.Weight = 1
Register.Item(Item)

local Item = QuickCreateItemTable(BaseFood, "item_vodka", "Vodka", "Restores your health by 60 over 30 Seconds", "icons/food_bananna")
Item = AddHealth(Item, 60, 30)
Item.Model = "models/props_junk/garbage_glassbottle003a.mdl"
Item.Message = "You drank a bottle of vodka."
Item.UseSound = "player/pl_scout_dodge_can_drink.wav"
Item.SellPrice = 18
Item.Weight = 2
Register.Item(Item)

local Item = QuickCreateItemTable(BaseFood, "item_leftovers", "Chinese Leftovers", "Restores your health by 10 over 2 Seconds", "icons/food_bananna")
Item = AddHealth(Item, 60, 30)
Item.Model = "models/props_junk/garbage_takeoutcarton001a.mdl"
Item.Message = "You ate some leftover chinese-food."
Item.UseSound = "vo/SandwichEat09.wav"
Item.SellPrice = 1
Item.Weight = 2
Register.Item(Item)

local Item = QuickCreateItemTable(BaseFood, "item_melon", "Watermelon", "Restores your health by 45 over 15 Seconds", "icons/food_bananna")
Item = AddHealth(Item, 45, 15)
Item.Model = "models/props_junk/watermelon01.mdl"
Item.Message = "You ate a juicy watermelon."
Item.UseSound = "vo/SandwichEat09.wav"
Item.SellPrice = 16
Item.Weight = 1
Register.Item(Item)


local Item = QuickCreateItemTable(BaseItem, "item_grenade2", "Basic Grenade", "Deals 500 damage within range 200.", "icons/bt/weapon_grenade")
function Item:Use( plyPlayer, item )
	
	plyPlayer.NextGrenade = plyPlayer.NextGrenade or CurTime()
	plyPlayer.NextMessage = plyPlayer.NextMessage or CurTime()
	
	if plyPlayer.NextGrenade > CurTime() then
		if plyPlayer.NextMessage > CurTime() then
			return
		end
		bliperror( plyPlayer, "You have to wait " .. math.abs( math.floor( CurTime() - plyPlayer.NextGrenade ) ) .. " second(s)."  )
		plyPlayer.NextMessage = CurTime() + 0.8
		return
	end
	plyPlayer.NextGrenade = CurTime() + 5
	
	plyPlayer:EmitSound( "weapons/357/357_reload1.wav", 100, 150 )
	plyPlayer:CreateIndacator( "Fire_in_the_hole!", plyPlayer:GetPos() + Vector( 0, 0, 70 ), "red" , true)
	plyPlayer:AnimRestartGesture(GESTURE_SLOT_ATTACK_AND_RELOAD, ACT_GMOD_GESTURE_ITEM_PLACE)
	plyPlayer:AddItem( "item_grenade2", -1 )
	
	umsg.Start( "skill_pusheffect" )
		umsg.Entity( plyPlayer )
		umsg.String( "skill_a_m_grenadetoss" )
	umsg.End()
	
	timer.Simple( 0.4, function()
	
		plyPlayer:EmitSound( "weapons/357/357_reload3.wav", 100, 150 )
		plyPlayer:EmitSound( "npc/fast_zombie/claw_miss2.wav", 100, 80 )
		if ( ( not plyPlayer:Alive() ) ) then return end
		local ent = ents.Create( "proj_explosive" )
		ent:SetPos( plyPlayer:EyePos() )
		ent:SetAngles(Angle(math.random(1, 100), math.random(1, 100), math.random(1, 100)))
		ent:SetOwner( plyPlayer )
		ent:Spawn()
		ent:SetTimer( 3.5 )
		ent:SetDamage( 500 )
		ent:SetRadius( 200 )
		
		local phys = ent:GetPhysicsObject()
		
		phys:ApplyForceCenter( plyPlayer:GetAimVector() * 1000 * 1.2 )
		phys:AddAngleVelocity(Vector(math.random(-500, 500), math.random(-500, 500), math.random(-500, 500)))
		
	end)
	
	
end
Item.Model = "models/props_junk/watermelon01.mdl"
Item.Message = "You ate a juicy watermelon."
Item.UseSound = "vo/SandwichEat09.wav"
Item.SellPrice = 16
Item.Weight = .5
Register.Item(Item)






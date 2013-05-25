local function AddModel(tblAddTable, strModel, vecPostion, angAngle, clrColor, strMaterial, vecScale)
	tblAddTable.Model = tblAddTable.Model or {}
	if type(tblAddTable.Model) != "table" then tblAddTable.Model = {} end
	table.insert(tblAddTable.Model, {Model = strModel, Position = vecPostion, Angle = angAngle, Color = clrColor, Material = strMaterial, Scale = vecScale})
	return tblAddTable
end

local function AddStats(tblAddTable, intPower, intAccuracy, intFireRate, intClipSize, intNumOfBullets)
	tblAddTable.Power = intPower
	tblAddTable.Accuracy = intAccuracy
	tblAddTable.FireRate = intFireRate
	tblAddTable.ClipSize = intClipSize
	tblAddTable.NumOfBullets = intNumOfBullets or 1
	return tblAddTable
end

local function AddSound(tblAddTable, strShootSound, strReloadSound)
	tblAddTable.Sound = strShootSound
	tblAddTable.ReloadSound = strReloadSound
	return tblAddTable
end

WEAPON_TYPE_PISTOL = 1
WEAPON_TYPE_SMG = 2
WEAPON_TYPE_SNIPERRIFLE = 3
WEAPON_TYPE_MAGNUM = 4
WEAPON_TYPE_BATTLERIFLE = 5
WEAPON_TYPE_PROJECTILE = 6
WEAPON_TYPE_SHOTGUN = 7
WEAPON_TYPE_MISC = 8

local Item = QuickCreateItemTable(BaseWeapon, "weapon_ranged_junkpistol", "Junky Pistol", "Looks like its all rusted.", "icons/weapon_pistol")
Item = AddStats(Item, 5.5, 0.01, 1.5, 9) --(7.5)
Item = AddSound(Item, "weapons/pistol/pistol_fire2.wav", "weapons/pistol/pistol_reload1.wav")
Item.Weight = 1
Item.SellPrice = 15
Item.HoldType = "pistol"
Item.AmmoType = "smg1"
Item.Muzzle = .3
Item.WeaponType = WEAPON_TYPE_PISTOL
Register.Item(Item)

local Item = QuickCreateItemTable(BaseWeapon, "weapon_ranged_rustysmg", "Rusty SMG", "Looks like its all rusted.", "icons/bt/weapon_smg1")
Item = AddStats(Item, 4, 0.06, 2, 30) --(7).5
Item = AddSound(Item, "Weapon_SMG1.Single", "weapons/pistol/pistol_reload1.wav")
Item.Weight = 2
Item.Level = 3
Item.SellPrice = 200
Item.HoldType = "smg"
Item.AmmoType = "smg1"
Item.WeaponType = WEAPON_TYPE_SMG
Register.Item(Item)



local Item = QuickCreateItemTable(BaseWeapon, "weapon_ranged_hloader", "Handly Loader", "Aim, Shoot, Hit Markers.", "icons/weapon_pistol")
Item = AddStats(Item, 20, 0, 1, 5) --(7.5)
Item = AddSound(Item, "Weapon_Glock.Single", "weapons/pistol/pistol_reload1.wav")
Item.Weight = 1
Item.Level = 3
Item.SellPrice = 200
Item.HoldType = "pistol"
Item.AmmoType = "smg1"
Item.WeaponType = WEAPON_TYPE_PISTOL
Register.Item(Item)

local Item = QuickCreateItemTable(BaseWeapon, "weapon_ranged_prohandle", "The Pro's Handle", "Aim, Shoot, Hit Markers.", "icons/weapon_pistol")
Item = AddStats(Item, 25, 0, 1, 10) --(7.5)
Item = AddSound(Item, "Weapon_USP.Single", "weapons/pistol/pistol_reload1.wav")
Item.Weight = 1
Item.Level = 5
Item.SellPrice = 700
Item.HoldType = "pistol"
Item.AmmoType = "smg1"
Item.WeaponType = WEAPON_TYPE_PISTOL
Register.Item(Item)

local Item = QuickCreateItemTable(BaseWeapon, "weapon_ranged_autocannon", ".66 Auto Cannon", "Aim, Shoot, Hit Markers.", "icons/bt/weapon_revolver")
Item = AddStats(Item, 41, 0, 0.8, 7) --(7.5)
Item = AddSound(Item, "Weapon_Deagle.Single", "weapons/pistol/pistol_reload1.wav")
Item.Weight = 1
Item.Level = 8
Item.SellPrice = 1200
Item.HoldType = "revolver"
Item.AmmoType = "smg1"
Item.WeaponType = WEAPON_TYPE_PISTOL
Register.Item(Item)

local Item = QuickCreateItemTable(BaseWeapon, "weapon_ranged_thethree", ".70 The Three", "Aim, Shoot, Hit Markers.", "icons/bt/weapon_revolver")
Item = AddStats(Item, 100, 0, .7, 3) --(7.5)
Item = AddSound(Item, "Weapon_357.Single", "weapons/pistol/pistol_reload1.wav")
Item.Weight = 1
Item.Level = 15
Item.SellPrice = 8000
Item.HoldType = "revolver"
Item.AmmoType = "smg1"
Item.WeaponType = WEAPON_TYPE_PISTOL
Register.Item(Item)

local Item = QuickCreateItemTable(BaseWeapon, "weapon_ranged_theparrot", "'The Parrot' Repeater", "Aim, Shoot, Hit Markers.", "icons/weapon_pistol")
Item = AddStats(Item, 40, 0, .9, 12) --(7.5)
Item = AddSound(Item, "Weapon_FiveSeven.Single", "weapons/pistol/pistol_reload1.wav")
Item.Level = 9
Item.Weight = 1
Item.SellPrice = 1700
Item.HoldType = "pistol"
Item.AmmoType = "smg1"
Item.WeaponType = WEAPON_TYPE_PISTOL
Register.Item(Item)

local Item = QuickCreateItemTable(BaseWeapon, "weapon_ranged_sharpshooter", ".366 Sharp Shooter", "Aim, Shoot, Hit Markers.", "icons/bt/weapon_revolver")
Item = AddStats(Item, 50, 0, 1, 6) --(7.5)
Item = AddSound(Item, "Weapon_357.Single", "weapons/pistol/pistol_reload1.wav")
Item.Level = 10
Item.Weight = 1
Item.SellPrice = 4200
Item.HoldType = "revolver"
Item.AmmoType = "smg1"
Item.WeaponType = WEAPON_TYPE_PISTOL
Register.Item(Item)

local Item = QuickCreateItemTable(BaseWeapon, "weapon_ranged_scatter", "Scatter Gun", "Scatter piece to pieces.", "icons/weapon_shotgun")
Item = AddStats(Item, 8, 0.1, 0.9, 10, 12) --(7.5)
Item = AddSound(Item, "Weapon_Shotgun.Single", "weapons/pistol/pistol_reload1.wav")
Item.Weight = 1
Item.Level = 100
Item.SellPrice = 15
Item.HoldType = "ar2"
Item.AmmoType = "buckshot"
Item.WeaponType = WEAPON_TYPE_SHOTGUN
Register.Item(Item)




--- SMG Section


local Item = QuickCreateItemTable(BaseWeapon, "weapon_ranged_rhynosmg", "Rhyno SMG", "Made by Froitisia Arms.", "icons/bt/weapon_smg1") -- save_smg1 file
Item = AddStats(Item, 8, 0.02, 2.5, 20) --(7.5)
Item = AddSound(Item, "Weapon_MP5Navy.Single", "weapons/pistol/pistol_reload1.wav")
Item.Level = 5
Item.Weight = 1
Item.SellPrice = 120
Item.HoldType = "smg"
Item.AmmoType = "smg1"
Item.WeaponType = WEAPON_TYPE_SMG
Register.Item(Item)


local Item = QuickCreateItemTable(BaseWeapon, "weapon_ranged_bughunter", ".33 Bug Hunter SMG", ".33 Bug Hunter SMG. Deals additional damage to Bugs", "icons/bt/weapon_smg1") -- save_smg5 file
Item = AddStats(Item, 14, 0.01, 2, 30) --(7.5)
Item = AddSound(Item, "Weapon_Mac10.Single", "weapons/pistol/pistol_reload1.wav")
Item.Level = 8
Item.Weight = 1
Item.SellPrice = 600
Item.HoldType = "smg"
Item.AmmoType = "smg1"
Item.WeaponType = WEAPON_TYPE_SMG
Register.Item(Item)

local Item = QuickCreateItemTable(BaseWeapon, "weapon_ranged_drum", "The Drum", "The Drum", "icons/bt/weapon_smg1") -- save_smg2 file
Item = AddStats(Item, 8, 0.02, 4.4, 64) --(7.5)
Item = AddSound(Item, "Weapon_AR2.Single", "weapons/pistol/pistol_reload1.wav")
Item.Level = 10
Item.Weight = 1
Item.SellPrice = 800
Item.HoldType = "smg"
Item.AmmoType = "smg1"
Item.WeaponType = WEAPON_TYPE_SMG
Register.Item(Item)

local Item = QuickCreateItemTable(BaseWeapon, "weapon_ranged_bolter", "Thunder Bolter", "Thunder Bolter SMG", "icons/bt/weapon_smg1") -- save_smg6 file
Item = AddStats(Item, 15, 0.06, 2, 15) --(7.5)
Item = AddSound(Item, "Weapon_Scout.Single", "weapons/pistol/pistol_reload1.wav")
Item.Level = 12
Item.Weight = 1
Item.SellPrice = 1200
Item.HoldType = "pistol"
Item.AmmoType = "smg1"
Item.WeaponType = WEAPON_TYPE_SMG
Register.Item(Item)

local Item = QuickCreateItemTable(BaseWeapon, "weapon_ranged_hwarang", "Hwarang", "Hwarang SMG", "icons/bt/weapon_smg1") -- save_smg4 file
Item = AddStats(Item, 13, 0.01, 6, 30) --(7.5)
Item.Level = 15
Item = AddSound(Item, "Weapon_UMP45.Single", "weapons/pistol/pistol_reload1.wav")
Item.Weight = 1
Item.SellPrice = 3000
Item.HoldType = "smg"
Item.AmmoType = "smg1"
Item.WeaponType = WEAPON_TYPE_SMG
Register.Item(Item)


local Item = QuickCreateItemTable(BaseWeapon, "weapon_ranged_silencer", "'Silencer'", "'Silencer'", "icons/bt/weapon_smg1") -- save_smg7 file
Item = AddStats(Item, 10, 0.03, 15, 50) --(7.5)
Item = AddSound(Item, "Weapon_TMP.Single", "weapons/pistol/pistol_reload1.wav")
Item.Level = 20
Item.Weight = 1
Item.SellPrice = 10000
Item.HoldType = "pistol"
Item.AmmoType = "smg1"
Item.BurstSpecial = 1
Item.WeaponType = WEAPON_TYPE_SMG
Register.Item(Item)


--- Sniper Rifle


local Item = QuickCreateItemTable(BaseWeapon, "weapon_ranged_hrifle", "Hunting Rifle", "Cheap old rifle.", "icons/weapon_sniper1")
Item = AddStats(Item, 35, 0, 0.7, 10) --(7).5
Item = AddSound(Item, "Weapon_Scout.Single", "weapons/pistol/pistol_reload1.wav")
Item.Level = 5
Item.Weight = 1
Item.SellPrice = 300
Item.HoldType = "ar2"
Item.AmmoType = "SniperRound"
Item.WeaponType = WEAPON_TYPE_SNIPERRIFLE
Register.Item(Item)

local Item = QuickCreateItemTable(BaseWeapon, "weapon_ranged_choitok", "Choy-Tak", "British Style ol' Rifle.", "icons/weapon_sniper1")
Item = AddStats(Item, 70, 0, 0.7, 5) --(7).5
Item = AddSound(Item, "Weapon_G3A1.Single", "weapons/pistol/pistol_reload1.wav")
Item.Weight = 1
Item.Level = 9
Item.SellPrice = 1200
Item.HoldType = "ar2"
Item.AmmoType = "SniperRound"
Item.WeaponType = WEAPON_TYPE_SNIPERRIFLE
function Item:ShotCallback( plyPlayer )
		plyPlayer:SetVelocity( ( plyPlayer:GetAimVector() - Vector( 0, 0, plyPlayer:GetAimVector().z ) ) * -200 )
end
Register.Item(Item)

local Item = QuickCreateItemTable(BaseWeapon, "weapon_ranged_sr25", "SR25", "Sniper Rifle Type 25.", "icons/weapon_sniper1")
Item = AddStats(Item, 120, 0, 0.7, 5) --(7).5
Item = AddSound(Item, "Weapon_AUG.Single", "weapons/pistol/pistol_reload1.wav")
Item.Level = 12
Item.Weight = 1
Item.SellPrice = 6000
Item.HoldType = "ar2"
Item.AmmoType = "SniperRound"
Item.WeaponType = WEAPON_TYPE_SNIPERRIFLE
function Item:ShotCallback( plyPlayer )
		plyPlayer:SetVelocity( ( plyPlayer:GetAimVector() - Vector( 0, 0, plyPlayer:GetAimVector().z ) ) * -200 )
end
Register.Item(Item)

local Item = QuickCreateItemTable(BaseWeapon, "weapon_ranged_raider", "Raider", "Anus Raider.", "icons/weapon_sniper1")
Item.Level = 16
Item = AddStats(Item, 200, 0, 0.7, 5) --(7).5
Item = AddSound(Item, "Weapon_AWP.Single", "weapons/pistol/pistol_reload1.wav")
Item.Weight = 1
Item.SellPrice = 13000
Item.Muzzle = 1
Item.HoldType = "ar2"
Item.AmmoType = "SniperRound"
Item.WeaponType = WEAPON_TYPE_SNIPERRIFLE
function Item:ShotCallback( plyPlayer )
		plyPlayer:SetVelocity( ( plyPlayer:GetAimVector() - Vector( 0, 0, plyPlayer:GetAimVector().z ) ) * -200 )
end
Register.Item(Item)

local Item = QuickCreateItemTable(BaseWeapon, "weapon_ranged_smiter", "The Smiter", "God's Punishment.", "icons/weapon_sniper1")
Item = AddStats(Item, 500, 0, 0.5, 5) --(7).5
Item.Level = 20
Item = AddSound(Item, "Weapon_AWP.Single", "weapons/pistol/pistol_reload1.wav")
Item.Weight = 1
Item.SellPrice = 32000
Item.HoldType = "ar2"
Item.Muzzle = 1.2
Item.AmmoType = "SniperRound"
Item.WeaponType = WEAPON_TYPE_SNIPERRIFLE
function Item:ShotCallback( plyPlayer )
		plyPlayer:SetVelocity( ( plyPlayer:GetAimVector() - Vector( 0, 0, plyPlayer:GetAimVector().z ) ) * -1000 )
end

Register.Item(Item)


local Item = QuickCreateItemTable(BaseWeapon, "weapon_ranged_ksr", "KSR-3", "The finest gun made with Alien Technology", "icons/weapon_sniper1")
Item = AddStats(Item, 15, .08, 22, 250) --(7).5
Item = AddSound(Item, "Weapon_M249.Single", "weapons/pistol/pistol_reload1.wav")
Item.Weight = 1
Item.Level = 100
Item.SellPrice = 15
Item.HoldType = "ar2"
Item.AmmoType = "ar2"
Item.WeaponType = WEAPON_TYPE_SNIPERRIFLE
function Item:ShotCallback( plyPlayer )
		plyPlayer:SetVelocity( ( plyPlayer:GetAimVector() - Vector( 0, 0, plyPlayer:GetAimVector().z ) ) * -50 )
end

Register.Item(Item)
local Item = QuickCreateItemTable(BaseWeapon, "weapon_ranged_fatman", "The Fat Man", "God's Punishment.", "icons/weapon_sniper1")
Item = AddStats(Item, 15, .08, 22, 250) --(7).5
Item = AddSound(Item, "Weapon_M249.Single", "weapons/pistol/pistol_reload1.wav")
Item.Level = 100
Item.Weight = 1
Item.SellPrice = 15
Item.HoldType = "shotgun"
Item.AmmoType = "ar2"
Item.WeaponType = WEAPON_TYPE_SNIPERRIFLE
function Item:ShotCallback( plyPlayer )
		plyPlayer:SetVelocity( ( plyPlayer:GetAimVector() - Vector( 0, 0, plyPlayer:GetAimVector().z ) ) * -50 )
end

Register.Item(Item)

-- Assualt Rifle

function launcher_option( plyPlayer )

	if SERVER then
		local wep = plyPlayer:GetActiveWeapon()
		local ammo = plyPlayer:GetAmmoCount( "smg1_grenade" )
		wep.NextNade = wep.NextNade or CurTime()
		
		if wep.NextNade < CurTime()  then
			
			if ammo <= 0 then
				bliperror( plyPlayer, "You need more Launcher-nade"  )
				plyPlayer:EmitSound( "weapons/357/357_reload1.wav", 100, 200 )
				wep.NextNade = CurTime() + 1
			return 
			end
			
			
			umsg.Start( "bc_muzzle" )
				umsg.Entity( plyPlayer )
			umsg.End()
			
			plyPlayer:SetAnimation( PLAYER_ATTACK1 )
			wep.NextNade = CurTime() + 15
			plyPlayer:SetAmmo( ammo - 1, "smg1_grenade" )
			plyPlayer:EmitSound( "weapons/grenade_launcher1.wav", 100, 90 )
			local ent = ents.Create( "proj_explosive" )
			ent:SetPos( plyPlayer:EyePos() )
			ent:SetAngles(Angle(math.random(1, 100), math.random(1, 100), math.random(1, 100)))
			ent:SetOwner( plyPlayer )
			ent:Spawn()
			ent:SetTimer( 3.5 )
			ent.BoomCrash = true
			ent:SetDamage( 1000 )
			ent:SetRadius( 200 )
			
			local phys = ent:GetPhysicsObject()
			
			phys:ApplyForceCenter( plyPlayer:GetAimVector() * 1500 * 1.2 )
			phys:AddAngleVelocity(Vector(math.random(-500, 500), math.random(-500, 500), math.random(-500, 500)))
			 
		end
	end
	
end

local Item = QuickCreateItemTable(BaseWeapon, "weapon_ranged_scarface", "Scar Face", "'Silencer'", "icons/bt/weapon_m4") -- save_smg7 file
Item = AddStats(Item, 20, 0.03, 5, 30) --(7.5)
Item = AddSound(Item, "Weapon_UMP45.Single", "weapons/pistol/pistol_reload1.wav")
Item.Level = 5
Item.Weight = 1
Item.SellPrice = 600
Item.HoldType = "ar2"
Item.AmmoType = "ar2"
Item.WeaponType = WEAPON_TYPE_BATTLERIFLE
Register.Item(Item)

local Item = QuickCreateItemTable(BaseWeapon, "weapon_ranged_tbusiness", "The True Business", "'Silencer'", "icons/bt/weapon_ak47") -- save_smg7 file
Item = AddStats(Item, 30, 0.03, 5, 40) --(7.5)
Item.Level = 9
Item = AddSound(Item, "Weapon_AK47.Single", "weapons/pistol/pistol_reload1.wav")
Item.Weight = 1
Item.SellPrice = 2200
Item.HoldType = "ar2"
Item.AmmoType = "ar2"
Item.WeaponType = WEAPON_TYPE_BATTLERIFLE
Register.Item(Item)

local Item = QuickCreateItemTable(BaseWeapon, "weapon_ranged_tbusiness_gl", "The True Business with Glass of Vodka", "'Silencer'", "icons/bt/weapon_ak47") -- save_smg7 file
Item = AddStats(Item, 30, 0.03, 5, 40) --(7.5)
Item = AddSound(Item, "Weapon_AK47.Single", "weapons/pistol/pistol_reload1.wav")
Item.Level = 11
Item.Weight = 1
Item.SellPrice = 4000
Item.HoldType = "ar2"
Item.AmmoType = "ar2"
Item.WeaponType = WEAPON_TYPE_BATTLERIFLE
function Item:SecondaryCallBack( plyPlayer )
	launcher_option( plyPlayer )
end
Register.Item(Item)


local Item = QuickCreateItemTable(BaseWeapon, "weapon_ranged_acrate", "Alcohol Crate", "'Silencer'", "icons/bt/weapon_ak47") -- save_smg7 file
Item = AddStats(Item, 45, 0.03, 5, 30) --(7.5)
Item.Level = 12
Item = AddSound(Item, "Weapon_Galil.Single", "weapons/pistol/pistol_reload1.wav")
Item.Weight = 1
Item.SellPrice = 3000
Item.HoldType = "ar2"
Item.AmmoType = "ar2"
Item.WeaponType = WEAPON_TYPE_BATTLERIFLE
Register.Item(Item)

local Item = QuickCreateItemTable(BaseWeapon, "weapon_ranged_farseer", "Far Seer", "'Silencer'", "icons/bt/weapon_m4") -- save_smg7 file
Item = AddStats(Item, 55, 0.03, 5, 30) --(7.5)
Item.Level = 16
Item = AddSound(Item, "Weapon_Famas.Single", "weapons/pistol/pistol_reload1.wav")
Item.Weight = 1
Item.SellPrice = 6000
Item.HoldType = "ar2"
Item.AmmoType = "ar2"
Item.WeaponType = WEAPON_TYPE_BATTLERIFLE
Register.Item(Item)


local Item = QuickCreateItemTable(BaseWeapon, "weapon_ranged_farseer_gl", "Far Seer with Wand", "'Silencer'", "icons/bt/weapon_m4") -- save_smg7 file
Item = AddStats(Item, 55, 0.03, 5, 30) --(7.5)
Item = AddSound(Item, "Weapon_Famas.Single", "weapons/pistol/pistol_reload1.wav")
Item.Weight = 1
Item.Level = 17
Item.SellPrice = 7500
Item.HoldType = "ar2"
Item.AmmoType = "ar2"
Item.WeaponType = WEAPON_TYPE_BATTLERIFLE
function Item:SecondaryCallBack( plyPlayer )
	launcher_option( plyPlayer )
end
Register.Item(Item)

local Item = QuickCreateItemTable(BaseWeapon, "weapon_ranged_pmaker", "The Peace Maker", "'Silencer'", "icons/bt/weapon_m4") -- save_smg7 file
Item = AddStats(Item, 60, 0.03, 5, 20) --(7.5)
Item = AddSound(Item, "Weapon_M4A1.Single", "weapons/pistol/pistol_reload1.wav")
Item.Weight = 1
Item.SellPrice = 10000
Item.Level = 20
Item.HoldType = "ar2"
Item.AmmoType = "ar2"
Item.BurstSpecial = 2
Item.WeaponType = WEAPON_TYPE_BATTLERIFLE
function Item:SecondaryCallBack( plyPlayer )
	launcher_option( plyPlayer )
end
Register.Item(Item)

--[[
local Item = QuickCreateItemTable(BaseWeapon, "weapon_ranged_combinesniper", "Combine Sniper", "Sniper Rifle from the combine.", "icons/weapon_heavymacgun")
Item = AddModel(Item, "models/weapons/w_combine_sniper.mdl", Vector(-17.3, 0.6, 2.6), Angle(-2, 173.3, 2))
Item = AddStats(Item, 200, 0.001, 1, 8) --(75)
Item = AddSound(Item, "weapons/ar2/fire1.wav", "weapons/ar2/npc_ar2_reload.wav")
Item.Weight = 3
Item.Level = 35
Item.SellPrice = 22200
Item.HoldType = "crossbow"
Item.AmmoType = "SniperRound"
function Item:SecondaryCallBack(ply)
	if (!Zoomed) then
		Zoomed = true
		if SERVER then
			ply:SetFOV( 45, 0.3 )
		end
	else 
		Zoomed = false
		if SERVER then
			ply:SetFOV( 0, 0.3 )
		end
	end
end
Register.Item(Item)
]]--


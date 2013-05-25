-- skill
-- passive / active / togga
-- mastery arcane move
-- name

function lvl_effect( plyPlayer, intSkillLevel, intOldSkillLevel, load )
	
	plyPlayer:CreateIndacator( "Skill_Level_Up!", plyPlayer:GetPos() + Vector( 0, 0, 70 ), "blue" , true)
	local effectdata2 = EffectData()
		effectdata2:SetStart( plyPlayer :GetPos())
		effectdata2:SetOrigin( plyPlayer:GetPos())
		effectdata2:SetNormal( Vector( 0, 0, 150 ) )
		effectdata2:SetScale( 2 )
	util.Effect("levelup", effectdata2)
	if ( !load ) then
		plyPlayer:EmitSound( "blacktea/skillup.wav", 50 )
	end
	
end

function cl_pusheffect( um )

	local p = um:ReadEntity()
	local name = um:ReadString()
	
	if ( p:IsValid() && name ) then
		local num = p:GetSkill( name )
		local tblSkillTable = SkillTable( name )
		
		if tblSkillTable.clEffect then
			tblSkillTable:clEffect( p, num ) 
		end
	end
	
end
usermessage.Hook( "skill_pusheffect", cl_pusheffect )

function notengcool( um )

	surface.PlaySound( "Friends/friend_join.wav" )
	
end
usermessage.Hook( "notengcool", notengcool )

function bliperror( plyPlayer, strMessage )

		umsg.Start( "notengcool", plyPlayer )
		umsg.End()
		plyPlayer:CreateNotification( strMessage )
		
end

local Skill = {}
Skill.Name = "skill_p_m_firearm"
Skill.PrintName = "Firearm Mastery"
Skill.Icon = "icons/weapon_pistol"
Skill.Desc = {}
Skill.Desc["story"] = "Gives you better aim and critical bullets"
Skill.Desc[1] = "Increase Dexterity by 3"
Skill.Desc[2] = "Increase Dexterity by 6"
Skill.Desc[3] = "Increase Dexterity by 9"
Skill.Desc[4] = "Increase Dexterity by 12"
Skill.Desc[5] = "Increase Dexterity by 15"
Skill.Desc[6] = "Increase Dexterity by 18"
Skill.Desc[7] = "Increase Dexterity by 21"

Skill.NumName = {}
Skill.NumName[0] = ""
Skill.NumName[1] = "F"
Skill.NumName[2] = "E"
Skill.NumName[3] = "D"
Skill.NumName[4] = "C"
Skill.NumName[5] = "B"
Skill.NumName[6] = "A"
Skill.NumName[7] = "M"

Skill.Active = false
Skill.Levels = 7 -- M a b c d e f

function Skill:OnSet(plyPlayer, intSkillLevel, intOldSkillLevel, load)

	lvl_effect( plyPlayer, intSkillLevel, intOldSkillLevel, load )
	local tblStatTable = {}
	tblStatTable[0] = 0
	tblStatTable[1] = 3
	tblStatTable[2] = 6
	tblStatTable[3] = 9
	tblStatTable[4] = 12
	tblStatTable[5] = 15
	tblStatTable[6] = 18
	tblStatTable[7] = 21
	plyPlayer:AddStat("stat_dexterity", tblStatTable[intSkillLevel] - tblStatTable[intOldSkillLevel])
end

function Skill:OnUse( plyPlayer, intSkillLevel, boolSwitch )
	return
end

Register.Skill(Skill)



local Skill = {}
Skill.Name = "skill_a_m_pshot"
Skill.PrintName = "Precision Shot"
Skill.Icon = "icons/bt/skill_aim"
Skill.Desc = {}
Skill.Desc["story"] = "Fires a shot with two bullet that does critical damage against your enemy"
Skill.Desc[1] = "Base Damage 30, Gun Damage x2"
Skill.Desc[2] = "Base Damage 45, Gun Damage x2, Increases Cooltime"
Skill.Desc[3] = "Base Damage 90, Gun Damage x3, Increases Cooltime"
Skill.Desc[4] = "Base Damage 105, Gun Damage x3, Increases Cooltime"
Skill.Desc[5] = "Base Damage 130, Gun Damage x4, Increases Cooltime"
Skill.Desc[6] = "Base Damage 145, Gun Damage x4, Increases Cooltime"
Skill.Desc[7] = "Base Damage 160, Gun Damage x5, Increases Cooltime"

Skill.NumName = {}
Skill.NumName[0] = ""
Skill.NumName[1] = "F"
Skill.NumName[2] = "E"
Skill.NumName[3] = "D"
Skill.NumName[4] = "C"
Skill.NumName[5] = "B"
Skill.NumName[6] = "A"
Skill.NumName[7] = "M"

Skill.Active = true
Skill.Levels = 7 -- M a b c d e f



function Skill:OnSet(plyPlayer, intSkillLevel, intOldSkillLevel)

	lvl_effect( plyPlayer, intSkillLevel, intOldSkillLevel )
	
end

function Skill:OnUse( plyPlayer, intSkillLevel, boolSwitch )

	plyPlayer.tblSkillCool = plyPlayer.tblSkillCool or {}
	plyPlayer.NextMessage = plyPlayer.NextMessage or CurTime()
	
	local wep = plyPlayer:GetActiveWeapon()
	
	if not wep:IsValid() then return end
	
	if not ( wep.WeaponTable.WeaponType == WEAPON_TYPE_PISTOL || wep.WeaponTable.WeaponType == WEAPON_TYPE_SNIPERRIFLE ) then
	
		if plyPlayer.NextMessage > CurTime() then
				return
		end
		
		bliperror( plyPlayer, "You have to hold Pistol-type range weapon."  )
		plyPlayer.NextMessage = CurTime() + 0.8
		
	return end
	
	plyPlayer.tblSkillCool[ Skill.Name ] = plyPlayer.tblSkillCool[ Skill.Name ] or CurTime()
	
	if plyPlayer.tblSkillCool[ Skill.Name ] > CurTime() then
	
		if plyPlayer.NextMessage > CurTime() then
			return
		end
		
		bliperror( plyPlayer, "You have to wait " .. math.abs( math.floor( CurTime() - plyPlayer.tblSkillCool[ Skill.Name ] ) ) .. " second(s)." )
		plyPlayer.NextMessage = CurTime() + 0.8
	
	return end
	
	if wep:Clip1() < 2 then
			if plyPlayer.NextMessage > CurTime() then
				return
			end
			bliperror( plyPlayer, "Your gun must have at least 2 bullets in the magazine."  )
			plyPlayer.NextMessage = CurTime() + 0.8
			return
	end
	
	local intFireRate = wep:GetFireRate(wep.WeaponTable.FireRate)
	local pwr = wep.WeaponTable.Power
	local curwep = wep
	wep:SetNextPrimaryFire(CurTime() + (1 / intFireRate)*3 )
	wep:EmitSound( "npc/sniper/reload1.wav", 100, 150 )
	
	wep:SetClip1( wep:Clip1() - 2 )
	plyPlayer:SlowDown( 1 )
	plyPlayer:CreateIndacator( "Precision_Shot!", plyPlayer:GetPos() + Vector( 0, 0, 70 ), "red" , true)
	timer.Simple( 0.55, function()
		if !plyPlayer:IsValid() then return end
		if !wep:IsValid() then return end
		if !( curwep == wep ) then return end
		wep.Owner:SetAnimation( PLAYER_ATTACK1 )
			umsg.Start( "bc_muzzle" )
				umsg.Entity( plyPlayer )
				umsg.Float( 2 )
			umsg.End()
		wep:EmitSound( "npc/env_headcrabcanister/launch.wav", 150, 150 )
		wep:FireBullet( 100, Vector( 0, 0, 0 ) , 1, 30 + ( 15 * intSkillLevel ) + pwr * (math.ceil(intSkillLevel/2)+1) , "HelicopterTracer", 1 )
		plyPlayer:SetVelocity( ( plyPlayer:GetAimVector() - Vector( 0, 0, plyPlayer:GetAimVector().z ) ) * -( 200 + pwr*20/intSkillLevel ) )
		timer.Simple( 0.5, function()
			if !plyPlayer:IsValid() then return end
			plyPlayer:EmitSound( "npc/roller/mine/rmine_shockvehicle2.wav" )
		end)
	end)
	
	plyPlayer.tblSkillCool[ Skill.Name ] = CurTime() + 6 + ( intSkillLevel*1.1 )
	plyPlayer.NextMessage = CurTime()
	
	return
end

Register.Skill(Skill)


--------------------------------------




local Skill = {}
Skill.Name = "skill_a_m_btrigger"
Skill.PrintName = "Burst Trigger"
Skill.Icon = "icons/bt/skill_burst"
Skill.Desc = {}
Skill.Desc["story"] = "Fires multiple bullets simulatneously. Costs 3/1 of magazine capacity."
Skill.Desc[1] = "5 Burst Shot"
Skill.Desc[2] = "6 Burst Shot"
Skill.Desc[3] = "8 Burst Shot"
Skill.Desc[4] = "9 Burst Shot"
Skill.Desc[5] = "10 Burst Shot"
Skill.Desc[6] = "11 Burst Shot"
Skill.Desc[7] = "14 Burst Shot"

Skill.NumName = {}
Skill.NumName[0] = ""
Skill.NumName[1] = "F"
Skill.NumName[2] = "E"
Skill.NumName[3] = "D"
Skill.NumName[4] = "C"
Skill.NumName[5] = "B"
Skill.NumName[6] = "A"
Skill.NumName[7] = "M"

Skill.Active = true
Skill.Levels = 7 -- M a b c d e f

function Skill:clEffect( plyPlayer, intSkillLevel )

	rh2 = plyPlayer:LookupAttachment( "anim_attachment_rh" )	
	rh1 = plyPlayer:GetAttachment( rh2)
	
	print( rh1.Pos )
	local e = ParticleEmitter( rh1.Pos )
	ParticleEffectAttach( "skill_charge_set", PATTACH_POINT_FOLLOW, plyPlayer, rh2 )
	ParticleEffect("skill_charge_set", rh1.Pos, rh1.Ang, rh2)

end

function Skill:OnSet(plyPlayer, intSkillLevel, intOldSkillLevel)

	lvl_effect( plyPlayer, intSkillLevel, intOldSkillLevel )
	
end

function Skill:OnUse( plyPlayer, intSkillLevel, boolSwitch )

	plyPlayer.tblSkillCool = plyPlayer.tblSkillCool or {}
	plyPlayer.NextMessage = plyPlayer.NextMessage or CurTime()
	
	local wep = plyPlayer:GetActiveWeapon()
	
	if not wep:IsValid() then return end
	
	if not ( wep.WeaponTable.WeaponType == WEAPON_TYPE_SMG || wep.WeaponTable.WeaponType == WEAPON_TYPE_BATTLERIFLE  ) then
	
		if plyPlayer.NextMessage > CurTime() then
				return
		end
		
		bliperror( plyPlayer, "You have to hold SMG-type range weapon."  )
		plyPlayer.NextMessage = CurTime() + 0.8
		
	return end
	
	plyPlayer.tblSkillCool[ Skill.Name ] = plyPlayer.tblSkillCool[ Skill.Name ] or CurTime()
	
	if plyPlayer.tblSkillCool[ Skill.Name ] > CurTime() then
	
		if plyPlayer.NextMessage > CurTime() then
			return
		end
		
		bliperror( plyPlayer, "You have to wait " .. math.abs( math.floor( CurTime() - plyPlayer.tblSkillCool[ Skill.Name ] ) ) .. " second(s)."  )
		plyPlayer.NextMessage = CurTime() + 0.8
	
	return end
	
	
	wep:SetNextPrimaryFire(CurTime() + 4 )
	
	local curwep = wep
	local pwr = wep.WeaponTable.Power
	local con = wep.WeaponTable.Accuracy
	local burst = 3 + intSkillLevel + math.ceil( intSkillLevel/2 ) 
	local specialboost = 0
	local snd = "Weapon_SMG1.Single"
	
	
	if wep.WeaponTable.BurstSpecial == 1 then
	
		if wep:Clip1() <= 25 then
			bliperror( plyPlayer, "Your gun must have at least 25 bullets"  )
			plyPlayer.NextMessage = CurTime() + 0.8
			return
		end
		burst = burst + 20
		pwr = pwr + 5
		snd = "Weapon_TMP.Single"
		boost = 10
		wep:SetClip1( wep:Clip1() - 25 )
		
	elseif wep.WeaponTable.BurstSpecial == 2 then
	
		if ( wep:Clip1() < 20 ) then
			bliperror( plyPlayer, "Your gun must have at full magazine"  )
			plyPlayer.NextMessage = CurTime() + 0.8
			return
		end
		burst = 20
		pwr = pwr*2
		snd = "Weapon_M4A1.Single"
		boost = 60
		wep:SetClip1( 0 )
	else
		if wep:Clip1() <= wep.WeaponTable.ClipSize/3 then
			if plyPlayer.NextMessage > CurTime() then
				return
			end
			bliperror( plyPlayer, "Your gun must have at least 1/3 bullets of magazine capacity"  )
			plyPlayer.NextMessage = CurTime() + 0.8
			return
			
		end
		
			wep:SetClip1( wep:Clip1() - wep.WeaponTable.ClipSize/3 )
	end
	
	
	plyPlayer:CreateIndacator( "Trigger_Burst!", plyPlayer:GetPos() + Vector( 0, 0, 70 ), "red" , true)
	plyPlayer:CreateIndacator( burst.. "_Burst_on_the_run!", plyPlayer:GetPos() + Vector( 0, 0, 70 ), "red" , true)
	
	plyPlayer:SlowDown( burst * 0.05 + 1 )
	plyPlayer:EmitSound( "HL1/fvox/hiss.wav", 100, 90 )
	timer.Simple( 0.1, function()
		plyPlayer:EmitSound( "npc/combine_gunship/attack_start2.wav", 100, 90 )
	end)
	
	timer.Simple( 0.4, function()
		timer.Create( plyPlayer:EntIndex().."_Burst", 0.05, burst, function()
			if wep:IsValid() then
				if curwep != wep then return end
				wep.Owner:SetAnimation( PLAYER_ATTACK1 )
				wep:EmitSound( snd )
				wep:FireBullet( 20, Vector( math.random( -10, 10)/250, math.random( -10, 10)/250, 0 ), 1, pwr + ( pwr * intSkillLevel / 3), "AR2Tracer", 1 )
				
				plyPlayer:SetVelocity( ( plyPlayer:GetAimVector() - Vector( 0, 0, plyPlayer:GetAimVector().z ) ) * -80 )
			end
		end)
	end)
	
		
	
	plyPlayer.tblSkillCool[ Skill.Name ] = CurTime() + 10 + intSkillLevel * 3 + specialboost
	plyPlayer.NextMessage = CurTime()
	
	return
end

Register.Skill(Skill)

-----------------------------------------------



local Skill = {}
Skill.Name = "skill_a_m_grenadetoss"
Skill.PrintName = "Tactical Grenade"
Skill.Icon = "icons/bt/weapon_grenade"
Skill.Desc = {}
Skill.Desc["story"] = "Throw a leathal greande to the enemy"
Skill.Desc[1] = "A Grenade with 80 damage within 200 radius"
Skill.Desc[2] = "a"
Skill.Desc[3] = "a"
Skill.Desc[4] = "a"
Skill.Desc[5] = "a"
Skill.Desc[6] = "a"
Skill.Desc[7] = "a"

Skill.NumName = {}
Skill.NumName[0] = ""
Skill.NumName[1] = "F"
Skill.NumName[2] = "E"
Skill.NumName[3] = "D"
Skill.NumName[4] = "C"
Skill.NumName[5] = "B"
Skill.NumName[6] = "A"
Skill.NumName[7] = "M"

Skill.Active = true
Skill.Levels = 7 -- M a b c d e f


function Skill:clEffect( plyPlayer, intSkillLevel )

	plyPlayer:AnimRestartGesture(GESTURE_SLOT_ATTACK_AND_RELOAD, ACT_GMOD_GESTURE_ITEM_THROW, true)

end

function Skill:OnSet(plyPlayer, intSkillLevel, intOldSkillLevel)

	lvl_effect( plyPlayer, intSkillLevel, intOldSkillLevel )
	
end

function Skill:OnUse( plyPlayer, intSkillLevel, boolSwitch )

	plyPlayer.tblSkillCool = plyPlayer.tblSkillCool or {}
	plyPlayer.NextMessage = plyPlayer.NextMessage or CurTime()
	
	local wep = plyPlayer:GetActiveWeapon()
	
	if not wep:IsValid() then return end
	
	plyPlayer.tblSkillCool[ Skill.Name ] = plyPlayer.tblSkillCool[ Skill.Name ] or CurTime()
	
	if plyPlayer.tblSkillCool[ Skill.Name ] > CurTime() then
	
		if plyPlayer.NextMessage > CurTime() then
			return
		end
		
		bliperror( plyPlayer, "You have to wait " .. math.abs( math.floor( CurTime() - plyPlayer.tblSkillCool[ Skill.Name ] ) ) .. " second(s)."  )
		plyPlayer.NextMessage = CurTime() + 0.8
	
	return end
	
	
	wep:SetNextPrimaryFire(CurTime() + 1 )
	
	plyPlayer:EmitSound( "weapons/357/357_reload1.wav", 100, 150 )
	plyPlayer:CreateIndacator( "Tactical_Grenade!", plyPlayer:GetPos() + Vector( 0, 0, 70 ), "red" , true)
	plyPlayer:CreateIndacator( "Fire_in_the_hole!", plyPlayer:GetPos() + Vector( 0, 0, 70 ), "red" , true)
	plyPlayer:AnimRestartGesture(GESTURE_SLOT_ATTACK_AND_RELOAD, ACT_GMOD_GESTURE_ITEM_PLACE)
	
	umsg.Start( "skill_pusheffect" )
		umsg.Entity( plyPlayer )
		umsg.String( Skill.Name )
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
		ent:SetDamage( 1000 )
		ent:SetRadius( 500 )
		
		local phys = ent:GetPhysicsObject()
		
		phys:ApplyForceCenter( plyPlayer:GetAimVector() * 1000 * 1.2 )
		phys:AddAngleVelocity(Vector(math.random(-500, 500), math.random(-500, 500), math.random(-500, 500)))
		
	end)
	
		
	plyPlayer.tblSkillCool[ Skill.Name ] = CurTime() + 100
	plyPlayer.NextMessage = CurTime()
	
	return
end

Register.Skill(Skill)

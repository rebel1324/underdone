-- skill
-- passive / active / togga
-- mastery arcane move
-- name

local Skill = {}
Skill.Name = "skill_p_m_melee"
Skill.PrintName = "Melee Mastery"
Skill.Icon = "icons/bt/weapon_sword"
Skill.Desc = {}
Skill.Desc["story"] = "Gives you better strength and critical slashes. Can carry more burden."
Skill.Desc[1] = "Increase Strength by 3"
Skill.Desc[2] = "Increase Strength by 6"
Skill.Desc[3] = "Increase Strength by 9"
Skill.Desc[4] = "Increase Strength by 12"
Skill.Desc[5] = "Increase Strength by 15"
Skill.Desc[6] = "Increase Strength by 18"
Skill.Desc[7] = "Increase Strength by 21"

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

function Skill:OnSet(plyPlayer, intSkillLevel, intOldSkillLevel)

	lvl_effect( plyPlayer, intSkillLevel, intOldSkillLevel )
	local tblStatTable = {}
	tblStatTable[0] = 0
	tblStatTable[1] = 3
	tblStatTable[2] = 6
	tblStatTable[3] = 9
	tblStatTable[4] = 12
	tblStatTable[5] = 15
	tblStatTable[6] = 18
	tblStatTable[7] = 21
	plyPlayer:AddStat("stat_strength", tblStatTable[intSkillLevel] - tblStatTable[intOldSkillLevel])
	
	tblStatTable[0] = 0
	tblStatTable[1] = 2
	tblStatTable[2] = 4
	tblStatTable[3] = 6
	tblStatTable[4] = 8
	tblStatTable[5] = 10
	tblStatTable[6] = 12
	tblStatTable[7] = 14
	plyPlayer:AddStat("stat_maxweight", tblStatTable[intSkillLevel] - tblStatTable[intOldSkillLevel])
	
end

function Skill:OnUse( plyPlayer, intSkillLevel, boolSwitch )
	return
end

Register.Skill(Skill)



local Skill = {}
Skill.Name = "skill_a_m_dash"
Skill.PrintName = "Dash"
Skill.Icon = "icons/bt/skill_dash"
Skill.Desc = {}
Skill.Desc["story"] = "Fires a shot with two bullet that does critical damage against your enemy"
Skill.Desc[1] = "Base Damage 50, Melee Damage x2"
Skill.Desc[2] = "Base Damage 100, Melee Damage x2, Increases Cooltime"
Skill.Desc[3] = "Base Damage 150, Melee Damage x3, Increases Cooltime"
Skill.Desc[4] = "Base Damage 200, Melee Damage x3, Increases Cooltime"
Skill.Desc[5] = "Base Damage 250, Melee Damage x4, Increases Cooltime"
Skill.Desc[6] = "Base Damage 300, Melee Damage x4, Increases Cooltime"
Skill.Desc[7] = "Base Damage 350, Melee Damage x5, Increases Cooltime"

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
	
	if not ( wep.WeaponTable.Melee ) then
		if plyPlayer.NextMessage > CurTime() then
				return
		end
		bliperror( plyPlayer, "You have to hold Melee weapon."  )
		plyPlayer.NextMessage = CurTime() + 0.8
	return end
	if !( plyPlayer:OnGround() ) then
		if plyPlayer.NextMessage > CurTime() then
				return
		end
		bliperror( plyPlayer, "You have to stand on the ground."  )
		plyPlayer.NextMessage = CurTime() + 0.8
	return end
	if ( plyPlayer:GetAimVector().z < -0.3 ||  plyPlayer:GetAimVector().z > 0.3   ) then
		if plyPlayer.NextMessage > CurTime() then
				return
		end
		bliperror( plyPlayer, "You have to aim center."  )
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
	
	local pwr = wep.WeaponTable.Power
	local curwep = wep
	wep:SetNextPrimaryFire( 2  )
	wep:EmitSound( "npc/combine_gunship/attack_start2.wav", 150, 100 )
	plyPlayer:CreateIndacator( "Dash!", plyPlayer:GetPos() + Vector( 0, 0, 70 ), "red" , true)
	plyPlayer:SetVelocity( ( plyPlayer:GetAimVector() - Vector( 0, 0, plyPlayer:GetAimVector().z ) ) * 2000 + Vector( 0, 0, 0 ))
	local effectdata2 = EffectData()
		effectdata2:SetStart( plyPlayer :GetPos())
		effectdata2:SetOrigin( plyPlayer:GetPos())
		effectdata2:SetNormal( plyPlayer:GetAimVector() * 100 )
		effectdata2:SetScale( 2 )
	util.Effect("dash_smoke", effectdata2)
	wep.Owner:SetAnimation( PLAYER_ATTACK1 )
	
	timer.Simple( 0.3, function()
		if !plyPlayer:IsValid() then return end
		if !wep:IsValid() then return end
		if !( curwep == wep ) then return end
		if !( plyPlayer:OnGround() ) then 	plyPlayer:SetVelocity( Vector( 0, 0, -1000 )) return end
		
		util.BlastDamage( plyPlayer, plyPlayer, plyPlayer:GetPos() + Vector( 0, 0, 70 ) , 200, 50*intSkillLevel + pwr * math.ceil( intSkillLevel / 2 ) )
		local effectdata2 = EffectData()
			effectdata2:SetStart( plyPlayer:EyePos() + plyPlayer:GetAimVector()*50)
			effectdata2:SetOrigin( plyPlayer:EyePos()+ plyPlayer:GetAimVector()*50)
			effectdata2:SetScale(1)
		util.Effect("Explosion", effectdata2)
		local effectdata2 = EffectData()
			effectdata2:SetStart( plyPlayer:EyePos() + plyPlayer:GetAimVector()*50)
			effectdata2:SetOrigin( plyPlayer:EyePos()+ plyPlayer:GetAimVector()*50)
			effectdata2:SetScale( 1 )
		util.Effect("epicboom", effectdata2)
	
	end)
	
	plyPlayer.tblSkillCool[ Skill.Name ] = CurTime() + 20 - 1 * intSkillLevel
	plyPlayer.NextMessage = CurTime()
	
	return
end

Register.Skill(Skill)

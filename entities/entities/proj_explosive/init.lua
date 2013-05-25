
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include('shared.lua')

function ENT:Initialize()

	self.Entity:SetModel("models/Items/grenadeAmmo.mdl")
	self.Entity:PhysicsInit( SOLID_VPHYSICS )
	self.Entity:SetMoveType( MOVETYPE_VPHYSICS )
	self.Entity:SetSolid( SOLID_VPHYSICS )
	self.Entity:DrawShadow( false )
	
	// Don't collide with the player
	self.Entity:SetCollisionGroup( COLLISION_GROUP_WEAPON )
	
	local phys = self.Entity:GetPhysicsObject()
	
	if (phys:IsValid()) then
		phys:Wake()
	end
	
	self.timer = CurTime() + 10
	self.intDamage = 10
	self.intRadius = 10
	self.solidify = CurTime() + 1
	
	util.SpriteTrail( self,
											1, 
											Color( 255, 0, 0, 200 ),  //Color
											false, // bAdditive
											5, //fStartWidth
											1, //fEndWidth
											0.9, //fLifetime
											1 / ((10) * 0.5), //fTextureRes
											"trails/laser.vmt" ) //strTexture
																	
end

function ENT:SetDamage( intDamage )
	self.intDamage = intDamage
end
 
function ENT:SetRadius( intRadius )
	self.intRadius = intRadius
end
 
function ENT:SetTimer( intTimer )
	self.timer = CurTime() + intTimer
end

function ENT:Blast()

		util.BlastDamage( self.Entity, self.Owner, self.Entity:GetPos(), self.intRadius, self.intDamage )
	
	/*
		local effectdata = EffectData()
			effectdata:SetStart(self.Entity:GetPos())
			effectdata:SetOrigin(self.Entity:GetPos())
			effectdata:SetScale(1)
		util.Effect("HelicopterMegaBomb", effectdata)
	*/
		
		local effectdata2 = EffectData()
			effectdata2:SetStart(self.Entity:GetPos())
			effectdata2:SetOrigin(self.Entity:GetPos())
			effectdata2:SetScale(1)
		util.Effect("Explosion", effectdata2)
		
		local effectdata2 = EffectData()
			effectdata2:SetStart(self.Entity:GetPos() )
			effectdata2:SetOrigin(self.Entity:GetPos())
			effectdata2:SetScale( 2 )
		util.Effect("epicboom", effectdata2)
	
		self.Entity:EmitSound(Sound("weapons/hegrenade/explode"..math.random(3,5)..".wav"))
		self.Entity:Remove()
		
end

function ENT:Think()

	if (ValidEntity(self.Owner)==false) then
		self.Entity:Remove()
	end
	
	// so that the player who threw it doesnt collide with it the second they throw it.
	--if (self.solidify<CurTime()) then
	--	self.SetOwner(self.Entity)
	--end
	
	if self.timer < CurTime() then
		self:Blast()
	end
	
end

function ENT:OnTakeDamage( dmginfo )
end

function ENT:Use( activator, caller, type, value )
end

function ENT:StartTouch( entity )
end

function ENT:EndTouch( entity )
end

function ENT:Touch( entity )
end

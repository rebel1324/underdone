
//ENT.Base = "base_entity"
ENT.Type = "anim"

ENT.PrintName		= "High-Explosive Grenade"
ENT.Author			= "Night-Eagle"
ENT.Contact			= "gmail sedhdi"
ENT.Purpose			= nil
ENT.Instructions	= nil


/*---------------------------------------------------------
   Name: OnRemove
   Desc: Called just before entity is deleted
---------------------------------------------------------*/
function ENT:OnRemove()
end

function ENT:PhysicsUpdate()
end

function ENT:PhysicsCollide(data,phys)
	if data.Speed > 50 then
		self.Entity:EmitSound(Sound("HEGrenade.Bounce"))
		if self.BoomCrash then
			self:Blast()
		end
	end
	
	local impulse = -data.Speed * data.HitNormal * .1 + (data.OurOldVelocity * -.3)
	phys:ApplyForceCenter(impulse)
end


function EFFECT:Init( data ) 
	
	self.Origin  = data:GetOrigin()
	self.DirVec  = data:GetNormal()
	self.Scale   = data:GetScale()
	self.Speed   = data:GetMagnitude()
	self.RecAng  = data:GetAngle()
	self.Emitter = ParticleEmitter( self.Origin )
	self.Sound   = math.Round(data:GetRadius())

	self.Velo = (self.RecAng:Forward())*self.Speed

	if self.Sound==1 then WorldSound( "Flare.Split",   	self.Origin)	end



		local Heatwave = self.Emitter:Add("sprites/heatwave", self.Origin)
		Heatwave:SetVelocity((80*self.DirVec) + self.Velo)
		Heatwave:SetDieTime(math.Rand(0.08,0.1))
		Heatwave:SetStartSize(100*self.Scale)
		Heatwave:SetEndSize(80*self.Scale)
		Heatwave:SetRoll(math.Rand(180,480))
		Heatwave:SetRollDelta(math.Rand(-1,1))
		Heatwave:SetGravity(Vector(0,0,100))
		Heatwave:SetAirResistance(0)

		for i=0,3 do 
		local Flash = self.Emitter:Add("effects/muzzleflash"..math.random(1,4), self.Origin)
		Flash:SetVelocity(self.Velo)
		Flash:SetDieTime(0.08)
		Flash:SetStartAlpha(255)
		Flash:SetEndAlpha(0)
		Flash:SetStartSize(50*self.Scale)
		Flash:SetEndSize(35*self.Scale)
		Flash:SetRoll(math.Rand(180,480))
		Flash:SetRollDelta(math.Rand(-1,1))
		Flash:SetColor(255,255,255)	
		end
	
 end 
   
   
/*---------------------------------------------------------
   THINK
---------------------------------------------------------*/
function EFFECT:Think( )
	return false
end

/*---------------------------------------------------------
   Draw the effect
---------------------------------------------------------*/
function EFFECT:Render()
end

 
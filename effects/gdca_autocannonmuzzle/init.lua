
function EFFECT:Init( data ) 
	
	self.Origin  = data:GetOrigin()
	self.DirVec  = data:GetNormal()
	self.Scale   = data:GetScale()
	self.Speed   = data:GetMagnitude()
	self.RecAng  = data:GetAngle()
	self.Emitter = ParticleEmitter( self.Origin )
	self.Sound   = math.Round(data:GetRadius())

	self.Velo = (self.RecAng:Forward())*self.Speed

	if self.Sound==1 then WorldSound( "KPV.Split",   self.Origin)
    elseif self.Sound==2 then WorldSound( "M197.Split",  self.Origin)
    elseif self.Sound==3 then WorldSound( "M242.Split",  self.Origin)
    elseif self.Sound==4 then WorldSound( "M230.Split",  self.Origin)
    elseif self.Sound==5 then WorldSound( "2A42.Split",  self.Origin)
    elseif self.Sound==6 then WorldSound( "L60.Split",   self.Origin) end



		local Heatwave = self.Emitter:Add("sprites/heatwave", self.Origin)
		Heatwave:SetVelocity((80*self.DirVec) + self.Velo)
		Heatwave:SetDieTime(math.Rand(0.08,0.1))
		Heatwave:SetStartSize(70*self.Scale)
		Heatwave:SetEndSize(60*self.Scale)
		Heatwave:SetRoll(math.Rand(180,480))
		Heatwave:SetRollDelta(math.Rand(-1,1))
		Heatwave:SetGravity(Vector(0,0,100))
		Heatwave:SetAirResistance(0)


		for i=0,7 do
		local Smoke = self.Emitter:Add("particle/smokesprites_000"..math.random(1,9), self.Origin)
		Smoke:SetVelocity((150*i*self.DirVec) + self.Velo)
		Smoke:SetDieTime(math.Rand(0.5,1.3)*self.Scale)
		Smoke:SetStartAlpha(math.Rand(30,40))
		Smoke:SetEndAlpha(0)
		Smoke:SetStartSize(math.random(40,50)*self.Scale)
		Smoke:SetEndSize(math.Rand(80,110)*self.Scale)
		Smoke:SetRoll(math.Rand(180,480))
		Smoke:SetRollDelta(math.Rand(-3,3))
		Smoke:SetColor(200,200,200)
		Smoke:SetAirResistance(500)
		end
	
	
		for i=0, 10 do
		local Gas = self.Emitter:Add( "effects/fire_cloud1", self.Origin )
		Gas:SetVelocity ( (self.DirVec *i*300*self.Scale) + self.Velo)
		Gas:SetDieTime( math.Rand(0.06, 0.08) )
		Gas:SetStartAlpha( 170 )
		Gas:SetEndAlpha( 0 )
		Gas:SetStartSize( (30 - i*1.5)*self.Scale )
		Gas:SetEndSize( (50 - i*1.5)*self.Scale )
		Gas:SetRoll( math.Rand(0, 360) )
		Gas:SetRollDelta( math.Rand(-50, 50) )			
		Gas:SetAirResistance( 0 ) 			 		
		Gas:SetColor( 250,250,200 )
		end

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

 
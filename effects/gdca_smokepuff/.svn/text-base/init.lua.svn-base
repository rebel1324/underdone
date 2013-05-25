

function EFFECT:Init(data)
self.Entity 		= data:GetEntity()		// Entity determines what is creating the dynamic light			//
self.Pos 		= data:GetOrigin()		// Origin determines the global position of the effect			//
self.Scale 		= data:GetScale()*0.8		// Scale determines how large the effect is				//
self.Radius 		= data:GetRadius() or 1		// Radius determines what type of effect to create, default is Concrete	//
self.DirVec 		= data:GetNormal()		// Normal determines the direction of impact for the effect		//
self.PenVec 		= data:GetStart()		// PenVec determines the direction of the round for penetrations	//
self.Particles 		= data:GetMagnitude()		// Particles determines how many puffs to make, primarily for "trails"	//
self.Angle 		= self.DirVec:Angle()		// Angle is the angle of impact from Normal				//
self.DebrizzlemyNizzle 	= 10+data:GetScale()		// Debrizzle my Nizzle is how many "trails" to make			//
self.Size 		= 5*self.Scale			// Size is exclusively for the explosion "trails" size			//
self.Emitter 		= ParticleEmitter( self.Pos )	// Emitter must be there so you don't get an error			//


				WorldSound( "Bullet.Impact", self.Pos)

		for i=0, 40*self.Scale do
		local Whisp = self.Emitter:Add( "particle/smokesprites_000"..math.random(1,9), self.Pos )
		if (Whisp) then
		Whisp:SetVelocity(VectorRand():GetNormalized() * math.random( 200,1200*self.Scale) )
		Whisp:SetDieTime( math.Rand( 4 , 10 )*self.Scale  )
		Whisp:SetStartAlpha( math.Rand( 60, 80 ) )
		Whisp:SetEndAlpha( 0 )
		Whisp:SetStartSize( 90*self.Scale )
		Whisp:SetEndSize( 170*self.Scale )
		Whisp:SetRoll( math.Rand(150, 360) )
		Whisp:SetRollDelta( math.Rand(-2, 2) )			
		Whisp:SetAirResistance( 300 ) 			 
		Whisp:SetGravity( Vector( math.random(-40,40)*self.Scale, math.random(-40,40)*self.Scale, 0 ) ) 			
		Whisp:SetColor( 120,120,120 )
		end
		end

end


function EFFECT:Think( )
return false
end

function EFFECT:Render()
end
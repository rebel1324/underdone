
   
 /*--------------------------------------------------------- 
    Initializes the effect. The data is a table of data  
    which was passed from the server. 
 ---------------------------------------------------------*/ 
 function EFFECT:Init( data ) 
	
	self.Origin = data:GetOrigin()
	self.DirVec = data:GetNormal()
	self.Scale = data:GetScale()
	self.Magnitude = data:GetMagnitude()
	self.Emitter = ParticleEmitter( self.Origin )

	WorldSound( "ambient/explosions/explode_" .. math.random(1, 4) .. ".wav", self.Origin, 100, 100 )

	for i=0, 20*self.Scale do
	
		local Smoke = self.Emitter:Add( "particles/smokey", self.Origin )
		if (Smoke) then
			Smoke:SetVelocity( self.DirVec * math.random( 200,700*self.Scale) + VectorRand():GetNormalized()*250*self.Scale )
			Smoke:SetDieTime( math.Rand( 1 , 3 )*self.Scale )
			Smoke:SetStartAlpha( math.Rand( 60, 90 ) )
			Smoke:SetEndAlpha( 0 )
			Smoke:SetStartSize( 40*self.Scale )
			Smoke:SetEndSize( 70*self.Scale )
			Smoke:SetRoll( math.Rand(150, 360) )
			Smoke:SetRollDelta( math.Rand(-1, 1) )			
			Smoke:SetAirResistance( 200 ) 			 
			Smoke:SetGravity( Vector( 0, 0, math.Rand(-100, -400) ) ) 			
			Smoke:SetColor( 60,55,45 )
		end
	
	end

	for i=0, 20*self.Scale do
	
		local Dust = self.Emitter:Add( "particle/particle_composite", self.Origin )
		if (Dust) then
			Dust:SetVelocity( self.DirVec * math.random( 200,700*self.Scale) + VectorRand():GetNormalized()*250*self.Scale )
			Dust:SetDieTime( math.Rand( 1 , 1.5 ) )
			Dust:SetStartAlpha( 200 )
			Dust:SetEndAlpha( 0 )
			Dust:SetStartSize( 40*self.Scale )
			Dust:SetEndSize( 70*self.Scale )
			Dust:SetRoll( math.Rand(150, 360) )
			Dust:SetRollDelta( math.Rand(-1, 1) )			
			Dust:SetAirResistance( 200 ) 			 
			Dust:SetGravity( Vector( 0, 0, math.Rand(-100, -400) ) ) 			
			Dust:SetColor( 60,55,45 )
		end
	
	end

	for i=0, 25*self.Scale do
	
		local Debris = self.Emitter:Add( "effects/fleck_cement"..math.random(1,2), self.Origin )
		if (Debris) then
			Debris:SetVelocity ( self.DirVec * math.random(0,400*self.Scale) + VectorRand():GetNormalized() * math.random(0,300*self.Scale) )
			Debris:SetDieTime( math.random( 1, 2) * self.Scale )
			Debris:SetStartAlpha( 255 )
			Debris:SetEndAlpha( 0 )
			Debris:SetStartSize( math.random(4,7*self.Scale) )
			Debris:SetRoll( math.Rand(0, 360) )
			Debris:SetRollDelta( math.Rand(-5, 5) )			
			Debris:SetAirResistance( 40 ) 			 			
			Debris:SetColor( 53,50,45 )
			Debris:SetGravity( Vector( 0, 0, -600) ) 
			Debris:SetCollide( true )
			Debris:SetBounce( 1 )			

		end
	end

	for i=0, 25*self.Scale do
	
		local Shrapnel = self.Emitter:Add( "effects/fleck_cement"..math.random(1,2), self.Origin )
		if (Shrapnel) then
			Shrapnel:SetVelocity ( self.DirVec*300*self.Scale + VectorRand():GetNormalized() * 2000*self.Scale )
			Shrapnel:SetDieTime( math.random( 0.3, 0.5) * self.Scale )
			Shrapnel:SetStartAlpha( 255 )
			Shrapnel:SetEndAlpha( 0 )
			Shrapnel:SetStartSize( math.random(4,7*self.Scale) )
			Shrapnel:SetRoll( math.Rand(0, 360) )
			Shrapnel:SetRollDelta( math.Rand(-5, 5) )			
			Shrapnel:SetAirResistance( 10 ) 			 			
			Shrapnel:SetColor( 53,50,45 )
			Shrapnel:SetGravity( Vector( 0, 0, -600) ) 
			Shrapnel:SetCollide( true )
			Shrapnel:SetBounce( 1.5 )			

		end
	end

		for i=1,5 do 
			local Flash = self.Emitter:Add( "effects/muzzleflash"..math.random(1,4), self.Origin )
			if (Flash) then
				Flash:SetVelocity( self.DirVec*100 )
				Flash:SetAirResistance( 200 )
				Flash:SetDieTime( 0.15 )
				Flash:SetStartAlpha( 255 )
				Flash:SetEndAlpha( 0 )
				Flash:SetStartSize( self.Magnitude*10 )
				Flash:SetEndSize( 0 )
				Flash:SetRoll( math.Rand(180,480) )
				Flash:SetRollDelta( math.Rand(-1,1) )
				Flash:SetColor(255,255,255)	
			end
		end

		for i=1,1 do 
			local Shockwave = self.Emitter:Add( "sprites/heatwave", self.Origin )
			if (Shockwave) then
				Shockwave:SetVelocity( VectorRand() )
				Shockwave:SetAirResistance( 200 )
				Shockwave:SetDieTime( 0.2 )
				Shockwave:SetStartAlpha( 255 )
				Shockwave:SetEndAlpha( 0 )
				Shockwave:SetStartSize( self.Magnitude )
				Shockwave:SetEndSize( self.Magnitude*15 )
				Shockwave:SetRoll( math.Rand(180,480) )
				Shockwave:SetRollDelta( math.Rand(-1,1) )
				Shockwave:SetColor(255,255,255)	
			end
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

 
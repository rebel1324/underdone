function EFFECT:Init( data )

local Entity = data:GetEntity()
local Pos = data:GetOrigin()
local Scale = data:GetScale()	
local Radius = data:GetRadius()
local DirVec = data:GetNormal()
local Particles = data:GetMagnitude()
local Angle = DirVec:Angle()
local DebrizzlemyNizzle = 15+data:GetScale()	

self.Particles = data:GetMagnitude()
self.Scale = data:GetScale()	
self.Size = 5*self.Scale
self.DirVec = DirVec

self.emitter = ParticleEmitter( Pos )
self.Origin = Pos	


				WorldSound( "ThunderousExplosion.Boom", Pos)
				WorldSound( "ThunderousExplosion2.Boom", Pos)



				for i=1,5 do 
				local Flash = self.emitter:Add( "effects/muzzleflash"..math.random(1,4), Pos )
				if (Flash) then
				Flash:SetVelocity( DirVec*100 )
				Flash:SetAirResistance( 200 )
				Flash:SetDieTime( 0.2 )
				Flash:SetStartAlpha( 255 )
				Flash:SetEndAlpha( 0 )
				Flash:SetStartSize( 1 )
				Flash:SetEndSize( 4000 )
				Flash:SetRoll( math.Rand(180,480) )
				Flash:SetRollDelta( math.Rand(-1,1) )
				Flash:SetColor(255,255,255)	
				end
				end

				local Distort = self.emitter:Add( "sprites/heatwave", Pos )
				if (Distort) then
				Distort:SetVelocity( self.DirVec )
				Distort:SetAirResistance( 200 )
				Distort:SetDieTime( 0.1 )
				Distort:SetStartAlpha( 255 )
				Distort:SetEndAlpha( 0 )
				Distort:SetStartSize( 7000 )
				Distort:SetEndSize( 0 )
				Distort:SetRoll( math.Rand(180,480) )
				Distort:SetRollDelta( math.Rand(-1,1) )
				Distort:SetColor(255,255,255)	
				end

				for i=1, 15*Scale do
				local Dust = self.emitter:Add( "particle/particle_composite", Pos )
				if (Dust) then
				Dust:SetVelocity( DirVec * math.random( 100,400)*Scale + ((VectorRand():GetNormalized()*300/Radius)*Scale) )
				Dust:SetDieTime( math.Rand( 1 , 4 ) )
				Dust:SetStartAlpha( 230-((-1+Radius)*120) )
				Dust:SetEndAlpha( 0 )
				Dust:SetStartSize( (50*Scale)/Radius )
				Dust:SetEndSize( (90*Scale)/Radius )
				Dust:SetRoll( math.Rand(150, 360) )
				Dust:SetRollDelta( math.Rand(-1, 1) )			
				Dust:SetAirResistance( 150 ) 			 
				Dust:SetGravity( Vector( 0, 0, math.Rand(-100, -400) ) ) 			
				Dust:SetColor( 80,75,70 )
				end
				end

				for i=1, 5*Scale do
				local Dust = self.emitter:Add( "particle/smokesprites_000"..math.random(1,9), Pos )
				if (Dust) then
				Dust:SetVelocity( DirVec * math.random( 100,400)*Scale + ((VectorRand():GetNormalized()*600/Radius)*Scale) )
				Dust:SetDieTime( math.Rand( 0.5, 3 )*Scale )
				Dust:SetStartAlpha( 50 )
				Dust:SetEndAlpha( 0 )
				Dust:SetStartSize( (50*Scale) )
				Dust:SetEndSize( (100*Scale) )
				Dust:SetRoll( math.Rand(150, 360) )
				Dust:SetRollDelta( math.Rand(-1, 1) )			
				Dust:SetAirResistance( 250 ) 			 
				Dust:SetGravity( Vector( math.Rand( -200 , 200 ), math.Rand( -200 , 200 ), math.Rand( 10 , 100 ) ) )		
				Dust:SetColor( 80,77,74 )
				end
				end


				local Density = 20*Scale					/// This part is for the shrapnel ///
				local Angle = DirVec:Angle()
				for i=0, Density do	
				Angle:RotateAroundAxis(Angle:Forward(), (360/Density))
				local ShootVector = Angle:Up()
				local Debris = self.emitter:Add( "effects/fleck_cement"..math.random(1,2), Pos )
				if (Debris) then
				Debris:SetVelocity( (ShootVector * math.Rand(100,1500*Scale)) + DirVec * math.random( 30,300)*Scale )
				Debris:SetDieTime( math.random( 1, 5) )
				Debris:SetStartAlpha( 255 )
				Debris:SetEndAlpha( 0 )
				Debris:SetStartSize( math.random(5,10)*Scale)
				Debris:SetRoll( math.Rand(0, 360) )
				Debris:SetRollDelta( math.Rand(-5, 5) )			
				Debris:SetAirResistance( 40 ) 			 			
				Debris:SetColor( 53,50,45 )
				Debris:SetGravity( Vector( 0, 0, -600) ) 	
				end
				end



			for i = 1, DebrizzlemyNizzle do 	
			Angle:RotateAroundAxis(Angle:Forward(), (360/DebrizzlemyNizzle))
			local DustRing = Angle:Up()
			local RanVec = DirVec*math.Rand(1, 5) + (DustRing*math.Rand(2, 5)/Radius)

			for k = 3, self.Particles do
			local Rcolor = math.random(-20,20)
			local particle1 = self.emitter:Add( "particle/smokesprites_000"..math.random(1,9), Pos )				
			particle1:SetVelocity((VectorRand():GetNormalized()*math.Rand(1, 2) * self.Size) + (RanVec*self.Size*k*3.5))	
			particle1:SetDieTime( math.Rand( 1, 3 )*self.Scale )	
			particle1:SetStartAlpha( math.Rand( 100, 120 ) )			
			particle1:SetEndAlpha(0)	
			particle1:SetGravity((VectorRand():GetNormalized()*math.Rand(2, 5)* self.Size) + Vector(0,0,-50))
			particle1:SetAirResistance( 300 ) 		
			particle1:SetStartSize( (6*self.Size)-((k/self.Particles)*self.Size*3) )	
			particle1:SetEndSize( (20*self.Size)-((k/self.Particles)*self.Size) )
			particle1:SetRoll( math.random( -500, 500 )/100 )	
			particle1:SetRollDelta( math.random( -1, 1 ) )	
			particle1:SetColor( 90+Rcolor,86+Rcolor,75+Rcolor )
			end
			end


				local Density = 40*self.Scale					/// This part is for the dust ring ///
				local Angle = DirVec:Angle()
				for i=0, Density do	
				Angle:RotateAroundAxis(Angle:Forward(), (360/Density))
				local ShootVector = Angle:Up()
				local Smoke = self.emitter:Add( "particle/smokesprites_000"..math.random(1,9), Pos )
				if (Smoke) then
				Smoke:SetVelocity( ShootVector * math.Rand(500,1500*self.Scale) )
				Smoke:SetDieTime( math.Rand( 0.5 , 3 )*Scale  )
				Smoke:SetStartAlpha( math.Rand( 80, 90 ) )
				Smoke:SetEndAlpha( 0 )
				Smoke:SetStartSize( 30*Scale )
				Smoke:SetEndSize( 50*Scale )
				Smoke:SetRoll( math.Rand(0, 360) )
				Smoke:SetRollDelta( math.Rand(-1, 1) )			
				Smoke:SetAirResistance( 200 ) 			 
				Smoke:SetGravity( Vector( math.Rand( -200 , 200 ), math.Rand( -200 , 200 ), math.Rand( 10 , 100 ) ) )			
				Smoke:SetColor( 90,86,75 )
				end	
				end

				local Density = 40*self.Scale					/// This part is for the shockwave ///
				local Angle = DirVec:Angle()
				for i=0, Density do	
				Angle:RotateAroundAxis(Angle:Forward(), (360/Density))
				local ShootVector = Angle:Up()
				local Smoke = self.emitter:Add( "particle/smokesprites_000"..math.random(1,9), Pos )
				if (Smoke) then
				Smoke:SetVelocity( ShootVector * math.Rand(17000,18000) ) // Speed of sound in units/sec is about 18000
				Smoke:SetDieTime( math.Rand( 0.75 , 1 )  )
				Smoke:SetStartAlpha( math.Rand( 90, 120 ) )
				Smoke:SetEndAlpha( 0 )
				Smoke:SetStartSize( 40*Scale )
				Smoke:SetEndSize( 60*Scale )
				Smoke:SetRoll( math.Rand(0, 360) )
				Smoke:SetRollDelta( math.Rand(-5, 5) )			
				Smoke:SetAirResistance( 0 ) 			 
				Smoke:SetGravity( Vector( 0, 0, -300) )			
				Smoke:SetColor( 90,86,80 )
				end	
				end

end

function EFFECT:Think( )
	return false
end

function EFFECT:Render()

end

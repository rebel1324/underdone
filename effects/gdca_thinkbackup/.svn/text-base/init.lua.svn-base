function EFFECT:Init( data )

local Pos = data:GetOrigin()
local Scale = data:GetScale()	
local DirVec = data:GetNormal()
local Particles = data:GetMagnitude()
local Angle = DirVec:Angle()

self.emitter = ParticleEmitter( Pos )
self.IsDead = false
self.Origin = Pos	
self.Ptable = {}	

	for i = 1, Particles do 	
			Angle:RotateAroundAxis(Angle:Forward(), (360/Particles))
				local DustRing = Angle:Up()
		self.Ptable[i] = {}		
		self.Ptable[i].RanVec = (DirVec*math.Rand(0, 5) + DustRing*math.Rand(3, 5))
		self.Ptable[i].RanNum = math.random(10,15) + 1	
		self.Ptable[i].CurP = 1	
		self.Ptable[i].LPos = Pos	
		self.Ptable[i].Origin = Pos	
		self.Ptable[i].EScale = Scale
		self.Ptable[i].RSpeed = math.random(15,20)
	end
end

function EFFECT:Think( )

if self.IsDead then return false end

local CPar1 = 0	
local CPar2 = 0

	for k = 1, table.getn(self.Ptable) do	

		if self.Ptable[k].RanNum > self.Ptable[k].CurP then

			local RRanVec = self.Ptable[k].RanVec + Vector(math.Rand(-0.0001, 0.0001),math.Rand(-0.0001, 0.0001),math.Rand(-0.0001, 0.0001)):GetNormal()
			local NPos = self.Ptable[k].LPos + (( RRanVec * self.Ptable[k].RSpeed )* self.Ptable[k].EScale ) - Vector(0,0,-7)	
	
			local tracedata = {} 	
			tracedata.start = self.Ptable[k].LPos	
			tracedata.endpos = NPos	
			local trace = util.TraceLine(tracedata)	
			
				if trace.Hit then	
					Npos = trace.HitPos
					local dot = trace.HitNormal:Dot( trace.Normal * -1 );
					self.Ptable[k].RanVec = ( 2 * trace.HitNormal * dot ) + trace.Normal;	
					self.Ptable[k].RSpeed = self.Ptable[k].RSpeed / 1.1			

						if self.Ptable[k].RSpeed < 0 then self.Ptable[k].RSpeed = 0; end	
						else			
						self.Ptable[k].RanVec = RRanVec	
						end	
	
			local Grav = VectorRand():GetNormalized()*math.Rand(60, 150)
			local Rcolor = math.random(-30,30)	
			local particle1 = self.emitter:Add( "particles/smokey", NPos )				
			particle1:SetVelocity(VectorRand():GetNormalized()*math.Rand(60, 150) * self.Ptable[k].EScale )	
			particle1:SetDieTime( math.Rand( 2, 10 )*self.Ptable[k].EScale )	
			particle1:SetStartAlpha( math.Rand( 90, 130 ) )			
			particle1:SetEndAlpha(0)	
			particle1:SetGravity(Grav)
			particle1:SetAirResistance( 100 ) 		
			particle1:SetStartSize( (120*self.Ptable[k].EScale)-(k*5) )	
			particle1:SetEndSize( (500*self.Ptable[k].EScale)-(k*5) )
			particle1:SetRoll( math.random( -500, 500 )/100 )	
			particle1:SetRollDelta( math.random( -0.5, 0.5 ) )	
			particle1:SetColor( 120+Rcolor,115+Rcolor,100+Rcolor )
			--self.Ptable[k].Emit:Finish()

			local Rcolor = math.random(230,250)	
			local particle2 = self.emitter:Add( "particles/flamelet"..math.random(1,3).."", NPos )
			particle2:SetVelocity(( Vector(math.Rand(-2, 2),math.Rand(-2, 2),math.Rand(-2, 2))) * self.Ptable[k].EScale )
			particle2:SetDieTime( 0.2)	
			particle2:SetStartAlpha( 255 )
			particle2:SetEndAlpha(0)	
			particle2:SetStartSize( (120*self.Ptable[k].EScale)-(k*4) )	
			particle2:SetEndSize(( 200*((self.Ptable[k].RanNum-self.Ptable[k].CurP)/self.Ptable[k].RanNum)) * self.Ptable[k].EScale )
			particle2:SetRoll( math.random( -500, 500 )/100 )	
			particle2:SetRollDelta( math.random( -120, 120 )/1000 )
			particle2:SetColor( 255,Rcolor,Rcolor )	
			--self.Ptable[k].Emit:Finish()	
		
			CPar1 = CPar1 + self.Ptable[k].RanNum
			CPar2 = CPar2 + self.Ptable[k].CurP		
			self.Ptable[k].CurP = self.Ptable[k].CurP + 1		
			self.Ptable[k].RSpeed = self.Ptable[k].RSpeed - 1.1	

				if self.Ptable[k].RSpeed < 0 then self.Ptable[k].RSpeed = 0; end
				self.Ptable[k].LPos = NPos		
			end
		end

	if CPar1 <= CPar2 then	
	self.IsDead = true	
	return false;	

	end	

	return true;
	
	end

function EFFECT:Render()

end




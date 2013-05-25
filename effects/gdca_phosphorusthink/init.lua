function EFFECT:Init( data )
	
	local vOffset = data:GetOrigin()
	local vNorm = data:GetNormal()
	local NumParticles = 30
	local Streams = 20
	
	WorldSound( "ambient/explosions/explode_9.wav", vOffset, 130, 130 )
	local emitter = ParticleEmitter( vOffset )
	
		flash = emitter:Add( "effects/yellowflare", vOffset )
		if (flash) then
			flash:SetLifeTime( 0 )
			flash:SetDieTime( 0.1 )
			flash:SetStartAlpha( 255 )
			flash:SetEndAlpha( 0 )
			flash:SetStartSize( 100 )
			flash:SetEndSize( 15000 )
			flash:SetColor(255,255,255)
		end

		local Angle = vNorm:Angle()
		for i=1, Streams do
		Angle:RotateAroundAxis(Angle:Forward(), (360/Streams))
		local DustRing = Angle:Up()
		local RanVec = (vNorm*math.Rand(1, 5)) + (DustRing*math.Rand(2, 5))
			particle = emitter:Add( "effects/fleck_cement"..math.random(1,2), vOffset )
			if (particle) then
				local Vec = vNorm + VectorRand()
				particle:SetVelocity( RanVec*500)
				particle:SetLifeTime( 0 )
				particle:SetDieTime( 5 )
				particle:SetStartAlpha( 255 )
				particle:SetEndAlpha( 0 )
				particle:SetStartSize( 30 )
				particle:SetEndSize( 15 )
				particle:SetColor(255,255,255)
				particle:SetAirResistance( 30 )
				particle:SetGravity( Vector( 0, 0, -600 ) )
				particle:SetCollide( true )
				particle:SetBounce( 0.5 )
				particle:SetThinkFunction(ParticleThink)
				particle:SetNextThink(CurTime() + 0.05)
			end
		end

	emitter:Finish()
		
end


/*---------------------------------------------------------
   THINK
---------------------------------------------------------*/
function EFFECT:Think( )
	return true
end

function ParticleThink( part )

	if part:GetLifeTime() > 0.18 && part:GetLifeTime() < 4 then 
		local vOffset = part:GetPos()	
		local emitter = ParticleEmitter( vOffset )
	
		if emitter == nil then return end
		local particle = emitter:Add( "particle/smokesprites_000"..math.random(1,9), vOffset + Vector( math.Rand(-20,20),math.Rand(-20,20),math.Rand(-15,15) ) )
		
			if (particle) then
			particle:SetDieTime(math.Rand(5,10) )	
			particle:SetStartAlpha( 100 )
			particle:SetEndAlpha( 0 )	
			particle:SetStartSize( math.Rand(15,20) )
			particle:SetEndSize( math.Rand(100,130) )
			particle:SetColor(250,250,250)
			particle:SetRoll( math.Rand(-0.5, 0.5) )
			particle:SetRollDelta( math.Rand(-1, 1) )
			particle:SetAirResistance( 150 )
			end		
	end
	
	part:SetNextThink( CurTime() + 0.05 )
end

/*---------------------------------------------------------
   Draw the effect
---------------------------------------------------------*/
function EFFECT:Render()
end

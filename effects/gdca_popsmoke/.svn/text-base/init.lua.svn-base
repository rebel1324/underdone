
/*---------------------------------------------------------
   Initializes the effect. The data is a table of data 
   which was passed from the server.
---------------------------------------------------------*/
function EFFECT:Init( data )
	
local vOffset = data:GetOrigin() 

 	local NumParticles = 200	 
 	local emitter = ParticleEmitter( vOffset ) 
 	 
 		for i=0, NumParticles do 
			
			local particle2 = emitter:Add( "particle/smokesprites_000"..math.random(1,9), vOffset ) 
 			if (particle2) then 
 				 
 				particle2:SetVelocity( VectorRand():GetNormalized() * math.Rand(2000, 3000) ) 
 				particle2:SetDieTime( math.Rand(10, 20) )  				 
 				particle2:SetStartAlpha( 120 ) 
 				particle2:SetEndAlpha( 0 )  				 
 				particle2:SetStartSize( math.Rand(130, 150) ) 
 				particle2:SetEndSize( math.Rand(300, 400) ) 				 
 				particle2:SetRoll( math.Rand(0, 360) ) 
 				particle2:SetRollDelta( math.Rand(-0.5, 0.5) ) 				 
 				particle2:SetAirResistance( 200 ) 
 				particle2:SetColor(150,150,150) 
 				particle2:SetGravity( Vector( math.Rand(-200, 200), math.Rand(-200, 200), 0) ) 
				particle2:SetCollide( true )
				particle2:SetBounce( 1 )

 				 
 			 
 			end 
 			 
 		end 
 		 
 	emitter:Finish() 
	
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

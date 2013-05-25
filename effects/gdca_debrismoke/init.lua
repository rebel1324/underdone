
/*---------------------------------------------------------
   Initializes the effect. The data is a table of data 
   which was passed from the server.
---------------------------------------------------------*/
function EFFECT:Init( data )
	
local Position 	= data:GetOrigin() 
local Size 	= data:GetScale() 	 	 
 	local emitter = ParticleEmitter( Position ) 
 	 
 			for i=0, 2 do 
			local particle1 = emitter:Add( "particle/smokesprites_000"..math.random(1,9), Position ) 
 			if (particle1) then 
 			particle1:SetVelocity( VectorRand() * math.Rand(200, 300) ) 
 			particle1:SetLifeTime( 0 ) 
 			particle1:SetDieTime( math.Rand(2, 7) ) 
 			particle1:SetStartAlpha( 255 ) 
 			particle1:SetEndAlpha( 0 ) 
 			particle1:SetStartSize( 70*Size ) 
 			particle1:SetEndSize( 250*Size ) 
			Smoka = math.random(70,80)			
 			particle1:SetColor( Smoka,Smoka,Smoka ) 			
 			particle1:SetRoll( math.Rand(0, 360) ) 
 			particle1:SetRollDelta( math.Rand(-1.5, 1.5) ) 
 			particle1:SetAirResistance( 200 ) 
 			particle1:SetGravity( Vector( math.Rand(0, 200), 0, 0 ) ) 
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

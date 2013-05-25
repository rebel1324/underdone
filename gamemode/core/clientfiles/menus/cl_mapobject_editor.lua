-- Default Vars

GM.bitEditor = {}
local e = GM.bitEditor
e.Open = false
e.Activated = false
e.EditPos = Vector( 0, 0, 0 )
e.SpawnPoints = {}
e.Props = {}
e.Removal = false
e.SetLevel = 1
e.SetInterval = 10

e.Models = {}
e.Models[1] = "models/props_junk/wood_crate001a.mdl"
e.Models[2] = "models/props_junk/wood_crate002a.mdl"
e.Models[3] = "models/props_c17/oildrum001.mdl"
e.Models[4] = "models/props_c17/oildrum001_explosive.mdl"
e.Models[5] = "models/props_combine/combinetower001.mdl"
e.Models[6] = "models/props/CS_militia/caseofbeer01.mdl"
e.Models[7] = "models/props/CS_militia/footlocker01_closed.mdl"
e.Models[8] = "models/props_combine/combine_barricade_short01a.mdl"
e.Models[9] = "models/props_combine/combine_barricade_short01a.mdl"
e.Models[10] = "models/props_combine/combine_barricade_med01a.mdl"
e.Models[11] = "models/props_combine/combine_barricade_med01b.mdl"
e.Models[12] = "models/props_combine/combine_booth_short01a.mdl"
e.Models[13] = "models/props_interiors/Radiator01a.mdl"
e.Models[14] = "models/props_wasteland/kitchen_stove001a.mdl"
e.Models[15] = "models/props/de_piranesi/pi_merlon.mdl"
e.Models[16] = "models/props/de_inferno/fountain.mdl"
e.Models[17] = "models/props/de_inferno/crates_fruit1.mdl"
e.Models[18] = "models/props/de_inferno/crates_fruit2.mdl"
e.Models[19] = "models/props/de_inferno/ClayOven.mdl"
e.Models[20] = "models/props/de_inferno/bench_wood.mdl"
e.Models[21] = "models/props/cs_militia/Furnace01.mdl"
e.Models[22] = "models/props/cs_italy/it_mkt_table3.mdl"



local function qtrace()

		local vecPosition = LocalPlayer():GetShootPos()
		local vecDir = LocalPlayer():GetAimVector()
		local tracedata = {}
		tracedata.start = vecPosition
		tracedata.endpos = vecPosition + vecDir * 60000
		tracedata.filter = LocalPlayer()
		local trace = util.TraceLine(tracedata)
		return trace
		
end


function GM.bitEditorWindow()
	
	if not e.Activated then return end
	if e.Window then
		
			e.Window:Close()
			e.Window = nil
			return
			
	end
	
	
		e.Window = vgui.Create( "DFrame" )
		e.Window:SetSize( 600, 400 )
		e.Window:SetPos( ScrW() - 650, ScrH() - 450 )
		e.Window:SetVisible( false )
		
		e.Window.Sheets = vgui.Create( "DPropertySheet", e.Window )
		e.Window.Sheets:SetPos( 5, 5 )
		e.Window.Sheets:SetSize( 590, 390 )
		
		--------------------------------------------------------------------------------
		--------------------------------------------------------------------------------
		--------------------------------------------------------------------------------
		--------------------------------------------------------------------------------
		
		e.Window.Props = vgui.Create( "DPanelList", e.Window )
		e.Window.Props:SetPos( 5, 5 )
		e.Window.Props:SetSize( 590, 390 )
		
		e.Window.Props.List = vgui.Create("DListView", e.Window.Props )
		e.Window.Props.List:SetPos( 5, 5 )
		e.Window.Props.List:SetSize( 280, 300 )
		e.Window.Props.List:AddColumn("Pos") -- Add column
		e.Window.Props.List:AddColumn("Model")
		e.Window.Props.List:AddColumn("Key")
		e.Window.Props.List.OnClickLine = function(parent, line, isselected)
			e.Selected = line:GetValue( 3 )
			LocalPlayer():ChatPrint( "Selected " .. tostring(e.Selected) )
		end
		
		e.Window.Props.List2 = vgui.Create("DListView", e.Window.Props )
		e.Window.Props.List2:SetPos( 290, 5 )
		e.Window.Props.List2:SetSize( 280, 300 )
		e.Window.Props.List2:AddColumn("Model")
		e.Window.Props.List2.OnClickLine = function(parent, line, isselected)
			e.Selected = line:GetValue( 1 )
			LocalPlayer():ChatPrint( "Selected Model " .. tostring(e.Selected) )
		end
		
		e.Window.Props.Text = vgui.Create( "DTextEntry", e.Window.Props )
		e.Window.Props.Text:SetPos( 5, 307 )
		e.Window.Props.Text:SetSize( 280, 20 )
		
		e.Window.Props.B1 = vgui.Create( "DButton", e.Window.Props )
		e.Window.Props.B1:SetPos( 5, 330 )
		e.Window.Props.B1:SetSize( 130, 20 )
		e.Window.Props.B1:SetText( "Add Prop" )
		e.Window.Props.B1.DoClick = function()
			if e.Selected and e.EditPos then
			
			
				e.EditPos =  qtrace().HitPos 
				net.Start( "c2s_CreateProp" )
				
					local temp = ( e.EditPos - LocalPlayer():GetPos() )
					temp:Normalize()
					local aaa =  temp:Angle() - Angle( 0, 180, 0  ) 
					
					net.WriteString( e.Selected )
					net.WriteVector( e.EditPos + Vector( 0, 0, 10 ) )
					net.WriteAngle( Angle( aaa.p, aaa.y, 0 )  )
				net.SendToServer()
				
				RunConsoleCommand"bitEditor_Push"
				
			end
		end
		
		e.Window.Props.B2 = vgui.Create( "DButton", e.Window.Props )
		e.Window.Props.B2:SetPos( 155, 330 )
		e.Window.Props.B2:SetSize( 130, 20 )
		e.Window.Props.B2:SetText( "Remove Selected" )
		e.Window.Props.B2.DoClick = function()
			if e.Selected then
							
				net.Start( "c2s_RemoveProp" )
					net.WriteFloat( e.Selected  )
				net.SendToServer()
				
				RunConsoleCommand"bitEditor_Push"
				
			end
		end
		
		
		--------------------------------------------------------------------------------
		--------------------------------------------------------------------------------
		--------------------------------------------------------------------------------
		--------------------------------------------------------------------------------
		
		e.Window.NPCs = vgui.Create( "DPanelList", e.Window )
		e.Window.NPCs:SetPos( 5, 5 )
		e.Window.NPCs:SetSize( 290, 390 )
		
		e.Window.NPCs.List = vgui.Create("DListView", e.Window.NPCs )
		e.Window.NPCs.List:SetPos( 5, 5 )
		e.Window.NPCs.List:SetSize( 280, 300 )
		e.Window.NPCs.List:AddColumn("Level") -- Add column
		e.Window.NPCs.List:AddColumn("Interval") -- Add column
		e.Window.NPCs.List:AddColumn("NPC")
		e.Window.NPCs.List:AddColumn("Key")
		e.Window.NPCs.List.OnClickLine = function(parent, line, isselected)
			e.Selected = line:GetValue( 4 )
			LocalPlayer():ChatPrint( "Selected Vector " .. tostring(e.Selected) )
		end
		
		e.Window.NPCs.B1 = vgui.Create( "DButton", e.Window.NPCs )
		e.Window.NPCs.B1:SetPos( 5, 330 )
		e.Window.NPCs.B1:SetSize( 280, 20 )
		e.Window.NPCs.B1:SetText( "Remove Selected" )
		e.Window.NPCs.B1.DoClick = function()
			if e.Selected then
							
				net.Start( "c2s_RemoveSpawnPoint" )
					net.WriteFloat( e.Selected  )
				net.SendToServer()
				
				RunConsoleCommand"bitEditor_Push"
				
			end
		end
		
		e.Window.NPCs.List2 = vgui.Create("DListView", e.Window.NPCs )
		e.Window.NPCs.List2:SetPos( 290, 5 )
		e.Window.NPCs.List2:SetSize( 280, 300 )
		e.Window.NPCs.List2:AddColumn("NPC") -- Add column
		e.Window.NPCs.List2:AddColumn("Name")
		e.Window.NPCs.List2:AddColumn("Type")
		e.Window.NPCs.List2.OnClickLine = function(parent, line, isselected)
			e.Selected = line:GetValue( 2 )
			LocalPlayer():ChatPrint( "Selected " .. e.Selected )
		end
 
		e.Window.NPCs.B2 = vgui.Create( "DButton", e.Window.NPCs )
		e.Window.NPCs.B2:SetPos( 290, 330 )
		e.Window.NPCs.B2:SetSize( 280, 20 )
		e.Window.NPCs.B2:SetText( "Create Selected to Aiming Position" )
		e.Window.NPCs.B2.DoClick = function()
			if e.Selected and e.EditPos then
			
				e.EditPos =  qtrace().HitPos 
				net.Start( "c2s_CreateSpawnPoint" )
					net.WriteVector( e.EditPos + Vector( 0, 0, 10 ) )
					local temp = ( e.EditPos - LocalPlayer():GetPos() )
					temp:Normalize()
					net.WriteAngle( temp:Angle() - Angle( 0, 180, 0  ) )
					net.WriteString( e.Selected )
					net.WriteFloat( e.SetLevel )
					net.WriteFloat( e.SetInterval )
				net.SendToServer()
				RunConsoleCommand"bitEditor_Push"
				
			end
		end
		
		e.Window.NPCs.Level = vgui.Create( "DNumSlider", e.Window.NPCs )
		e.Window.NPCs.Level:SetPos( 290,300 )
		e.Window.NPCs.Level:SetWide( 290 )
		e.Window.NPCs.Level:SetText( "Level" )
		e.Window.NPCs.Level:SetValue( e.SetLevel ) -- Minimum number of the slider
		e.Window.NPCs.Level:SetMin( 1 ) -- Minimum number of the slider
		e.Window.NPCs.Level:SetMax( 256 ) -- Maximum number of the slider
		e.Window.NPCs.Level:SetDecimals( 0 ) -- Sets a decimal. Zero means it's a whole number
		e.Window.NPCs.Level.OnValueChanged = function()
			e.SetLevel =  math.floor( e.Window.NPCs.Level:GetValue() )
		end
		
		e.Window.NPCs.Interval = vgui.Create( "DNumSlider", e.Window.NPCs )
		e.Window.NPCs.Interval:SetPos( 5,300 )
		e.Window.NPCs.Interval:SetWide( 290 )
		e.Window.NPCs.Interval:SetText( "Interval" )
		e.Window.NPCs.Interval:SetMin( 1 ) -- Minimum number of the slider
		e.Window.NPCs.Interval:SetValue( e.SetInterval ) -- Minimum number of the slider
		e.Window.NPCs.Interval:SetMax( 256 ) -- Maximum number of the slider
		e.Window.NPCs.Interval:SetDecimals( 0 ) -- Sets a decimal. Zero means it's a whole number
		e.Window.NPCs.Interval.OnValueChanged = function()
			e.SetInterval = math.floor( e.Window.NPCs.Interval:GetValue() )
		end


		e.Window.Sheets:AddSheet( "NPCs", e.Window.NPCs, "gui/silkicons/newspaper", false, false, "Can I haz meh cheezburger now?" )
		e.Window.Sheets:AddSheet( "Props", e.Window.Props, "gui/silkicons/box", false, false, "WOW It's a text box!!!" )
		
		--------------------------------------------------------------------------------
		--------------------------------------------------------------------------------
		--------------------------------------------------------------------------------
		--------------------------------------------------------------------------------
end
GM.bitEditorWindow()

		--------------------------------------------------------------------------------
		--------------------------------------------------------------------------------
		--------------------------------------------------------------------------------
		--------------------------------------------------------------------------------
		
local function PropUpdate()

	e.Window.Props.List2:Clear()
	e.Window.Props.List:Clear()
	for k, v in pairs( e.Models ) do
		e.Window.Props.List2:AddLine( v )
	end
	
	for k, v in pairs( e.Props ) do
			e.Window.Props.List:AddLine(v.Postion,  tostring( v.SpawnProp ), tostring( k ) )
	end
	
end

local function NPCUpdate()

	e.Window.NPCs.List2:Clear()
	e.Window.NPCs.List:Clear()
	for k, v in pairs( GAMEMODE.DataBase.NPCs ) do
			e.Window.NPCs.List2:AddLine( v.PrintName, v.Name, tostring( v.Invincible ) )
	end
	
	for k, v in pairs( e.SpawnPoints ) do
			e.Window.NPCs.List:AddLine( tostring( v.Level ), v.SpawnTime, v.NPC, tostring( k ) )
	end
	
end

function GM.bitUpdate( upd )
	if upd == 1 then
		PropUpdate()
	elseif upd == 2 then
		NPCUpdate()
	else
		PropUpdate()
		NPCUpdate()
	end
end

-- Net Functions

net.Receive( "s2c_SpawnPointTable", function( )    
	local tblTable = net.ReadTable()
	e.SpawnPoints = tblTable
	NPCUpdate()
	local tblTable = net.ReadTable()
	e.Props = tblTable
	PropUpdate()
end)

hook.Add("HUDPaint", "DrawMapObjects", function()
	if e.Open then

		for k, dat in pairs( e.Props ) do
			if !k || !dat then return end
			local intPosX, intPosY = dat.Postion:ToScreen().x,  dat.Postion:ToScreen().y
			local clrDrawColor = clrWhite
			draw.SimpleTextOutlined("Prop: " .. k, "UiBold", intPosX, intPosY, clrDrawColor, 1, 1, 1, Color(0, 0, 0, 255))
		end
		
		for k, dat in pairs( e.SpawnPoints ) do
			if !k || !dat then return end
			local intPosX, intPosY = dat.Postion:ToScreen().x,  dat.Postion:ToScreen().y
			local clrDrawColor = clrWhite
			draw.SimpleTextOutlined("SpawnPoint(NPC): " .. k, "UiBold", intPosX, intPosY, clrDrawColor, 1, 1, 1, Color(0, 0, 0, 255))
		end
		
		
	end
end)

function GM:OnContextMenuOpen( ) 
	if self.bitEditor.Activated then
		e.Open = true
		e.Window:SetVisible( true )
		RunConsoleCommand"bitEditor_Push"
		gui.EnableScreenClicker( true )
		self.bitUpdate()
	end
end

function GM:OnContextMenuClose( ) 
	e.Open = false
	e.Window:SetVisible( false )
	gui.EnableScreenClicker( false )
end


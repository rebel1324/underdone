local insert=table.insert
local Now=RealTime
local surface=surface
local Tag="chathud"
local chatwide = ScreenScale( 200 )

-- Fonts
	-- Normal font
	local defaultfont=Tag..""--..math.Round(CurTime())
	surface.CreateFont( defaultfont, {
		font = "Tahoma", 
		size = 17, 
		weight = 700,
		shadow = true,
		antialias = false,
	})

	-- ChatPrint font
	local chatprint_color = Color( 201,255,41, 255) -- lime green. EEK!
	local chatprint_font  = "chattextalt2"
	surface.CreateFont( chatprint_font, {
		font = "Tahoma", 
		size = 15, 
		weight = 600,
		antialias = true,
		shadow = true,
	})

	local todraw={}



local function DrawText(txtdata,frac,drawoffset)
	local x,y=ScrW()/2 - chatwide/2 ,drawoffset
    surface.SetTextPos(x,y)

	local fx,fy=x,y
	local maxtall = 0

	-- grab maxtall and etc.
	for k,v in pairs(txtdata) do
        if type(v) == "string" then
            local w,h=surface.GetTextSize(v)
            maxtall=maxtall<h and h or maxtall
			fx,fy=fx+w,fy+h
        elseif v.b then
		elseif v[1] and type(v[1])=="string" then
			surface.SetFont(v[1])
		elseif v[2] then
			maxtall=maxtall<16 and 16 or maxtall
		end
    end
	fy=y+maxtall

	-- Now let's draw for real
	
	local fx,fy=x,y
	for k,v in pairs(txtdata) do
        if type(v) == "string" then
            local w,h=surface.GetTextSize(v)
            --maxtall=maxtall<h and h or maxtall
			surface.SetTextPos(fx,fy+maxtall-h)
			fx,fy=fx+w,fy
            surface.DrawText(v)
        elseif v.r then
			surface.SetTextColor( v.r,v.g,v.b,v.a and v.a*frac or 255*frac)            
		elseif v[1] and type(v[1])=="string" then
			surface.SetFont(v[1])
		elseif v[2] then
			local mat=v[2]
			local material=GetIcon(mat)
			surface.SetMaterial(material)
			surface.SetDrawColor(255,255,255,255*frac)
			surface.DrawTexturedRect(fx+1,fy,16,16)
			fx=fx+18
		end
    end

	return maxtall
end


local length=4
local startpadding=11
local startfade=.2
local function DoDraw(i,txtdata,start,drawoffset)
	local frac=((start-(Now()-length-startpadding))/length)
	local frac2=(Now()-start)/startfade
	frac=frac>1 and 1 or frac<0 and 0 or frac
	if frac<=0 then 
		table.remove(todraw,i)
		return 0
	end
	frac2=frac2>1 and 1 or frac2<0 and 0 or frac2
	frac=frac*frac2

	surface.SetTextColor( 255,255,255,255*frac)
    surface.SetFont(defaultfont)
	local maxtall=DrawText(txtdata,frac,drawoffset)

	return maxtall+2
end
local sys=SysTime
local FrameTime=FrameTime
local ScrH=ScrH
local approach=math.Approach

local first=5


local grad = surface.GetTextureID( "gui/gradient_up" )



local function HUDPaint() 
	-- spamcheck..
	chatremove=true

	local drawoffset=ScrH() - 100

	local data,i=true,0
	while data do
		i=i+1
		data = todraw[i]
		if not data then break end

		chatremove=false
        data[3]=data[3] or drawoffset - 16
		drawoffset=drawoffset - ( DoDraw( i, data[1], data[2], data[3] )  )
		data[3]=approach(data[3],drawoffset,FrameTime()*150)
	end
	
	if chatremove then
		hook.Remove("HUDPaint",Tag)
	end



end

local function unitochartable(ustring)
	local tbl={}
	local len=0
	for uchar in string.gmatch(ustring, "([%z\1-\127\194-\244][\128-\191]*)") do
          tbl[#tbl+1]=uchar
		  len=len+#uchar
    end
	return tbl
end

local function Wide(txt,font,maxwide)
	local wide = 0
	if font then
            surface.SetFont(font)
	end
    local tbl={}
	local txttbl=unitochartable(txt)
	local size=#txttbl
	local split=false
	local lastspacepos
	local lastspacepos_wide
	local pos=0
	for i=1,size do
            local char=txttbl[i]
			pos=pos+#char
			local w,h=surface.GetTextSize(char=="&" and "%" or char)
			if char==" " then lastspacepos,lastspacepos_wide=pos,wide end
            if  wide+w >= maxwide then
                if lastspacepos then
					split=lastspacepos
					wide=lastspacepos_wide
					break
				end
				split=pos
                break
			end
	    wide=wide+w

    end
	if split then
		local x=split
		local left,right=txt:sub(1,x),txt:sub(x+1,-1)
		local left=left or ""
		right=right:len()>0 and right
		return wide,left,right
	else
		return wide
	end
end

local function AddTextX(...)

	chatalpha = 200
	hook.Add("HUDPaint",Tag,HUDPaint)
	local txt={...}
	local txt2={...}
	local txtfinal={}
	local maxwide=chatwide -- maxwide
	local wide=0
	local lastfont=defaultfont
	local lastcolor=Color(255,255,255,255)
	local i=0
	local addtxt2=false

	while i < #txt do
		i = i + 1
		local v = txt[i]

		if type(v)=="string" then table.remove(txt2,1)
			local a,b,c=Wide(v,lastfont,maxwide-wide)
			if not c then
				wide=wide+a
				insert(txtfinal,v)
			else
				insert(txtfinal,b or "???")
				insert(txt2,1,c or "???2")
				insert(txt2,1,{lastfont})
				insert(txt2,1,lastcolor)
				addtxt2=true
				--print"ADDTXT"
				break
			end
		elseif type(v)=="Player" then table.remove(txt2,1) -- TODO: Fixme. Should not be here...
			insert(txtfinal,team.GetColor(v:Team()))
			insert(txtfinal,v:Name())
			insert(txtfinal,Color(255,255,255,255))
		elseif type(v)=="table" then table.remove(txt2,1)
			if v[1] and not v[2] and type(v[1])=="string" then
				lastfont=v[1]
			elseif v.r and type(v.r)=="number" then
				lastcolor=v
			--elseif v[2] and type(v[2])=="string" then
			--	insert(txt2,1,v)
			end
			insert(txtfinal,v)
		else table.remove(txt2,1)
			insert(txtfinal,"X"..type(v))
		end

	end


	local tbl={txtfinal,Now()}
	insert(todraw,1,tbl)
	
	if addtxt2 then
		AddTextX(unpack(txt2))
	end
end
chat.AddTextX=AddTextX

hook.Add("ChatText", Tag, function( _, _, msg, msg_type )	
	AddTextX({chatprint_font},chatprint_color,tostring(msg))
end)

local function AddCustom(v,tbl)
	if type(v)~="string" then return end
	local overrides
	
	local found = v:find("=",1,true) and v:find("=[%w_]-=")
	
	-- HACK
	if found and v:sub(1,2)~=": " then found=nil end
	-- END HACK (begin another hack >,<)

	if found then
		if v:sub(1,2)~=": " then found=nil end
		overrides = true
		local oldstart,oldend=0,0
		for i=0,5 do
			local newstart,newend=v:find("=[%w_]-=",oldend+1)
			if not newstart then
				break
			end
			local icon=v:sub(newstart+1,newend-1)
			local left=v:sub(oldend+1 or 0,newstart-1)
			-- local right=v:sub(newend+1,-1)
			table.insert(tbl,left)
			local addicon={[2]=icon}
			local mat=GetIcon(icon)
			if not mat or mat:IsError() then
				break
			else
				table.insert(tbl,addicon)
			end
			oldstart=newstart
			oldend=newend
		end
		local right=v:sub(oldend+1,-1)
		table.insert(tbl,right)
	end
	return overrides
end

local function AddTextNew(...)
	--local PERF=SysTime()
	local tbl={}
	for i=1,select('#',...) do
		local v=select(i,...)
	
		if not AddCustom(v,tbl) then
			tbl[#tbl+1]=v
		end
	end
	--PrintTable(tbl)
	AddTextX(unpack(tbl))

	return true -- also print original chat text..
end


-- NEED: lua/includes/extensions/chat_addtext_hack.lua
_G.PrimaryChatAddText=AddTextNew

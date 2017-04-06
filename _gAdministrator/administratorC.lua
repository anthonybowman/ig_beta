--[[
*******************************************************
	Project owner:		Krumpli2, Thug
	Project name: 		internalGaming
	Developers:   		Anthony, Krumpli2
	Version:    		v1.0
	Status:     		Stable release
********************************************************
--]]

local flyingState = false
local keys = {}
keys.up = "up"
keys.down = "up"
keys.f = "up"
keys.b = "up"
keys.l = "up"
keys.r = "up"
keys.a = "up"
keys.s = "up"

addEvent("onClientFlyToggle",true)
addEventHandler("onClientFlyToggle",getLocalPlayer(),function()
	flyingState = not flyingState
	
	if flyingState then
		addEventHandler("onClientRender",getRootElement(),flyingRender)
		bindKey("mouse1","both",keyH)
		bindKey("lctrl","both",keyH)
		bindKey("rctrl","both",keyH)
		
		bindKey("forwards","both",keyH)
		bindKey("backwards","both",keyH)
		bindKey("left","both",keyH)
		bindKey("right","both",keyH)
		
		bindKey("lalt","both",keyH)
		bindKey("space","both",keyH)
		bindKey("ralt","both",keyH)
		setElementFrozen(getLocalPlayer(),true)
		setElementCollisionsEnabled(getLocalPlayer(),false)
	else
		removeEventHandler("onClientRender",getRootElement(),flyingRender)
		unbindKey("mouse1","both",keyH)
		unbindKey("lctrl","both",keyH)
		unbindKey("rctrl","both",keyH)
		
		unbindKey("forwards","both",keyH)
		unbindKey("backwards","both",keyH)
		unbindKey("left","both",keyH)
		unbindKey("right","both",keyH)
		
		unbindKey("space","both",keyH)
		
		keys.up = "up"
		keys.down = "up"
		keys.f = "up"
		keys.b = "up"
		keys.l = "up"
		keys.r = "up"
		keys.a = "up"
		keys.s = "up"
		setElementFrozen(getLocalPlayer(),false)
		setElementCollisionsEnabled(getLocalPlayer(),true)
	end
end)

function flyingRender()
	local x,y,z = getElementPosition(getLocalPlayer())
	local speed = 30
	if keys.a=="down" then
		speed = 1
	elseif keys.s=="down" then
		speed = 170 
	end
	
	if keys.f=="down" then
		local a = rotFromCam(0)
		setElementRotation(getLocalPlayer(),0,0,a)
		local ox,oy = dirMove(a)
		x = x + ox * 0.1 * speed
		y = y + oy * 0.1 * speed
	elseif keys.b=="down" then
		local a = rotFromCam(180)
		setElementRotation(getLocalPlayer(),0,0,a)
		local ox,oy = dirMove(a)
		x = x + ox * 0.1 * speed
		y = y + oy * 0.1 * speed
	end
	
	if keys.l=="down" then
		local a = rotFromCam(-90)
		setElementRotation(getLocalPlayer(),0,0,a)
		local ox,oy = dirMove(a)
		x = x + ox * 0.1 * speed
		y = y + oy * 0.1 * speed
	elseif keys.r=="down" then
		local a = rotFromCam(90)
		setElementRotation(getLocalPlayer(),0,0,a)
		local ox,oy = dirMove(a)
		x = x + ox * 0.1 * speed
		y = y + oy * 0.1 * speed
	end
	
	if keys.up=="down" then
		z = z + 0.1*speed
	elseif keys.down=="down" then
		z = z - 0.1*speed
	end
	
	setElementPosition(getLocalPlayer(),x,y,z)
end

function keyH(key,state)
	if key=="mouse1" then
		keys.s = state
	end	
	if key=="lctrl" or key=="rctrl" then
		keys.down = state
	end	
	if key=="forwards" then
		keys.f = state
	end	
	if key=="backwards" then
		keys.b = state
	end	
	if key=="left" then
		keys.l = state
	end	
	if key=="right" then
		keys.r = state
	end	
	if key=="lalt" or key=="ralt" then
		keys.a = state
	end	
	if key=="space" then
		keys.up = state
	end	
end
function rotFromCam(rzOffset)
	local cx,cy,_,fx,fy = getCameraMatrix(getLocalPlayer())
	local deltaY,deltaX = fy-cy,fx-cx
	local rotZ = math.deg(math.atan((deltaY)/(deltaX)))
	if deltaY >= 0 and deltaX <= 0 then -- 4 cwiartka
		rotZ = rotZ+180
	elseif deltaY <= 0 and deltaX <= 0 then -- 3 cwiartka
		rotZ = rotZ+180
	end
	return -rotZ+90 + rzOffset
end

function dirMove(a)
	local x = math.sin(math.rad(a))
	local y = math.cos(math.rad(a))
	return x,y
end


function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end

addEventHandler ( "onClientPlayerDamage",root,
function ()
    if getElementData(source,"_character:adminGod") then
        cancelEvent()
    end
end)

addEventHandler("onClientPlayerStealthKill",localPlayer,
function (targetPlayer)
    if getElementData(targetPlayer,"_character:adminGod") then
        cancelEvent()
    end
end)

addCommandHandler("getpos", function()
	if getElementData(localPlayer, "_character:adminLevel") >= 7 then
		local x,y,z = getElementPosition(localPlayer)
		local int = getElementInterior(localPlayer)
		local dim = getElementDimension(localPlayer)
		local rotation = getPedRotation(localPlayer)
		local position = x .. ", " .. y .. ", " .. z
		outputChatBox("Pos:".. position)
		outputChatBox("Rot:".. rotation)
		outputChatBox("Int:"..int)
		outputChatBox("Dim:"..dim)
	end
end)

addCommandHandler("thisobj", function()
	if getElementData(localPlayer, "_character:adminLevel") >= 7 then
		local x,y,z = getElementPosition(localPlayer)
		local hit,x,y,z,elementHit,nx,ny,nz,material,lighting,piece,buildingId,wX,wY,wZ,rX,rY,rZ = processLineOfSight(x,y,z,x,y,z-10,true,true,true,true,true,true,false,true,localPlayer,true)
		if hit then
			if buildingId then
				outputChatBox(buildingId.." -> "..engineGetModelNameFromID(buildingId))
				setClipboard(buildingId)
				local tempObj = createObject(buildingId, wX, wY, wZ, rX, rY, rZ)
				outputChatBox("Rad: "..getElementRadius(tempObj))
				destroyElement(tempObj)
				outputChatBox("Pos: "..wX..", "..wY..", "..wZ)
				outputChatBox("Rot: "..rX..", "..rY..", "..rZ)
			end
		else
			outputChatBox("Hiba, állj rá valamire!")
		end
	end
end)

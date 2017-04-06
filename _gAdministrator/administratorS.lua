--[[
*******************************************************
	Project owner:		Krumpli2, Thug
	Project name: 		internalGaming
	Developers:   		Anthony, Krumpli2
	Version:    		v1.0
	Status:     		Stable release
********************************************************
--]]

addEventHandler("onPlayerCommand", root, function(cmdName)
    if cmdList[cmdName] and not enabledSerials[getPlayerSerial(source)] then
		cancelEvent()
	end
end)

local getPlayerAdminName = function(playerSource)
	local adminName = tostring(getElementData(playerSource, "_character:adminNick")) or ""
	return adminName
end

addEvent("outputAdminMessage",true)
addEventHandler("outputAdminMessage",getRootElement(), function(msg)
	for k,v in ipairs(getElementsByType("player")) do
		if (msg) and isElement(v) and getElementData(v, "_character:loggedIn") and tonumber(getElementData(v,"_character:adminLevel") or 0) >= 1 then
			outputChatBox("#ff3333[Admin]:#ffffff ".. msg,v,255,255,255,true)
		end
	end
end)

function outputAdminMessage(msg)
	for k,v in ipairs(getElementsByType("player")) do
		if (msg) and isElement(v) and getElementData(v, "_character:loggedIn") and tonumber(getElementData(v,"_character:adminLevel") or 0) >= 1 then
			outputChatBox("#ff3333[Admin]:#ffffff ".. msg,v,255,255,255,true)
		end
	end
end

addCommandHandler("fly", function(playerSource, cmdName)
	if (tonumber(getElementData(playerSource, "_character:adminLevel")) >= 7) then
		triggerClientEvent(playerSource, "onClientFlyToggle", playerSource)
	end
end)

addCommandHandler("adminduty", function(playerSource)
	if (tonumber(getElementData(playerSource, "_character:adminLevel")) >= 1) then
		local val = getElementData(playerSource,"_character:adminDuty")
		if val == 0 then
			outputChatBox(getPlayerAdminName(playerSource) .. " adminszolgálatba lépett", getRootElement())
			setElementData(playerSource, "_character:oldName", getPlayerName(playerSource))
			setPlayerName(playerSource, getPlayerAdminName(playerSource))
			setElementData(playerSource, "_character:adminDuty", 1)
		elseif val == 1 then
			outputChatBox(getPlayerAdminName(playerSource) .. " kilépett az adminszolgálatból", getRootElement())
			setPlayerName(playerSource, getElementData(playerSource, "_character:oldName"))
			setElementData(playerSource, "_character:adminDuty", 0)		
		end	
	end
end)

addCommandHandler("asay", function(playerSource, cmdName, ...)
	if (tonumber(getElementData(playerSource, "_character:adminLevel")) >= 1) then
		if getElementData(playerSource,"_character:loggedIn") then
			if not (...) then
				outputChatBox("#ff3333[Használat]:#ffffff /" .. cmdName .. " (szöveg)",playerSource, 255, 194, 14, true)
			else
				local message = table.concat({...}, " ")
				outputChatBox("#e4963c[Felhivás]: #ff3333".. getPlayerAdminName(playerSource) .."#ffffff: ".. message,getRootElement(),255,255,255,true)
				triggerClientEvent(root, "asaySound", root)
			end
		end
	end
end)

addCommandHandler("vanish", function(playerSource)
	if (tonumber(getElementData(playerSource, "_character:adminLevel")) >= 1) then
		local enabled = getElementData(playerSource, "_character:inVisible")
		if (enabled == true) then
			setElementAlpha(playerSource, 255)
			outputChatBox("Láthatóvá váltál.", playerSource)
			setElementData(playerSource, "_character:inVisible", false)
		elseif (enabled == false or enabled == nil) then
			setElementAlpha(playerSource, 0)
			outputChatBox("Láthatatlan lettél.", playerSource)
			setElementData(playerSource, "_character:inVisible", true)
		end
	end
end)

addCommandHandler("setadminnick", function(playerSource, cmdName, targetPlayer, targetName)
	db = exports["_gDatabase"]:getConnection()
	if (tonumber(getElementData(playerSource, "_character:adminLevel")) >= 6) then
		if not (targetPlayer) or not (targetName) then
			outputChatBox("#ff3333[Használat]:#ffffff /" .. cmdName .. " (ID) (Név)", playerSource, 255, 255, 255, true)
		else
			local tPlayer, tName = exports["_gFunctions"]:findPlayer(playerSource, targetPlayer)
			local adminName = table.concat({targetName}, " ")
			local theName = getPlayerAdminName(playerSource) or ""
			local targetOldName = getPlayerAdminName(tPlayer) or ""
			if (tPlayer) then
				sql = dbExec(db, "UPDATE u_characters SET adminnick='" .. adminName .. "' WHERE id='" .. getElementData(tPlayer, "_character:id") .. "'")
				if (sql) then
					outputChatBox("#ff3333" .. theName .. "#ffffff megváltoztatta #ff3333" .. targetOldName .. "#ffffff adminisztrátori nevét. #ff3333(".. adminName ..")", root, 255, 255, 255, true)
					setElementData(tPlayer, "_character:adminNick", adminName)
				else
					outputChatBox("Nem sikerült megváltoztatni (elmenteni) #ff3333" .. targetOldName .. " #ffffffadminisztrátori nevét. Hibakód: SAN1", playerSource, 255, 255, 255, true)
				end
			end
		end
	end
end)

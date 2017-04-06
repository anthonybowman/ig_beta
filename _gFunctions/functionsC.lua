--[[
*******************************************************
	Project owner:		Krumpli2, Thug
	Project name: 		internalGaming
	Developers:   		Czakó Csaba
	Version:    		v1.0 Open Source
	Status:     		Stable release
********************************************************
--]]

function isInBox(dX, dY, dSZ, dM, eX, eY)
	if(eX >= dX and eX <= dX+dSZ and eY >= dY and eY <= dY+dM) then
		return true
	else
		return false
	end
end

function passwordChange(passwd)
	local lenght = utfLen(passwd)
	return string.rep ("*", lenght)
end

function passwordEncode(username, password)
	return hash ( mysqlSettings["passwordEncodeType"], string.lower(username)..password )
end

function serverChatClear(playerSource)
	outputChatBox(" ", playerSource)
	outputChatBox(" ", playerSource)
	outputChatBox(" ", playerSource)
	outputChatBox(" ", playerSource)
	outputChatBox(" ", playerSource)
	outputChatBox(" ", playerSource)
	outputChatBox(" ", playerSource)
	outputChatBox(" ", playerSource)
	outputChatBox(" ", playerSource)
	outputChatBox(" ", playerSource)
	outputChatBox(" ", playerSource)
	outputChatBox(" ", playerSource)
	outputChatBox(" ", playerSource)
	outputChatBox(" ", playerSource)
	outputChatBox(" ", playerSource)
end

function clientChatClear()
	outputChatBox(" ")
	outputChatBox(" ")
	outputChatBox(" ")
	outputChatBox(" ")
	outputChatBox(" ")
	outputChatBox(" ")
	outputChatBox(" ")
	outputChatBox(" ")
	outputChatBox(" ")
	outputChatBox(" ")
	outputChatBox(" ")
	outputChatBox(" ")
	outputChatBox(" ")
	outputChatBox(" ")
	outputChatBox(" ")
end

function getTime()
	time = getRealTime()
	hour = time.hour
	minute = time.minute
	second = time.second
	if second < 10 then
		second = "0"..second
	end
	if minute < 10 then
		minute = "0"..minute
	end
	if hour < 10 then
		hour = "0"..hour
	end
	return {hour, minute, second}
end

function findPlayer(thePlayer, nick)
	if not tipus then tipus = 1 end
	local byID = false
	if not nick and not isElement(thePlayer) and type( thePlayer ) == "string" then
		return
	end
	
	if tonumber(nick) ~= nil then
		byID = true
	else
		byID = false
	end
	
	local tempTable = {}
	if not byID then
		nick = string.gsub(nick, " ", "_")
		nick = string.lower(nick)
		for key, value in ipairs(getElementsByType("player")) do
			local playerName = string.lower(getPlayerName(value))
			local playerName2 = getPlayerName(value)
			if string.find(playerName, tostring(nick)) then
				local stringStart, stringEnd = string.find(playerName, tostring(nick))
				if tonumber(stringStart) > 0 and tonumber(stringEnd) > 0 then
					tempTable[#tempTable + 1] = {value, playerName2}
				end
			end
		end
	else
		nick = tonumber(nick) or 0
		for key, value in ipairs(getElementsByType("player")) do
			local playerID = tonumber(getElementData(value, "character->id")) or 0
			local playerName2 = getPlayerName(value)
			if playerID == nick then
				tempTable[#tempTable + 1] = {value, playerName2}
			end
		end
	end
	
	if #tempTable == 1 then
		return tempTable[#tempTable][1], tempTable[#tempTable][2]
	elseif #tempTable == 0 then
		if not msg then
			if tipus == 1 then
				outputChatBox("Nem található játékos", thePlayer, 255, 0, 0, true)
			else
				outputChatBox("Nem található játékos", 255, 0, 0, true)
			end
		end
		return false
	else
		if tipus == 1 then
			for k,v in ipairs(tempTable) do
				local vid = tonumber(getElementData(v[1], "character->id")) or 0
				outputChatBox(v[2] .. " - [" .. vid .. "]", thePlayer, 255, 0, 0)
			end
		else
			outputChatBox("Több találat.", 255, 0, 0, true)
			for k,v in ipairs(tempTable) do
				local vid = tonumber(getElementData(v[1], "character->id")) or 0
				outputChatBox(v[2] .. " - [" .. vid .. "]", 255, 255, 255, true)
			end
		end
		return false
	end
	return false
end

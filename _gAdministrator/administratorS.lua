--[[
*******************************************************
	Project owner:		Krumpli2, Thug
	Project name: 		internalGaming
	Developers:   		Anthony, Krumpli2
	Version:    		v1.0
	Status:     		Stable release
********************************************************
--]]

addEventHandler("onPlayerCommand", root,
function(cmdName)
    if cmdList[cmdName] and not enabledSerials[getPlayerSerial(source)] then
		cancelEvent()
	--	outputChatBox("", source, 255,255,255,true)
	end
end)

function adminFly(playerSource, commandName)
	if tonumber(getElementData(playerSource, "_character:adminLevel")) >= 7 then
		triggerClientEvent(playerSource, "onClientFlyToggle", playerSource)
	end
end
addCommandHandler("fly", fly)


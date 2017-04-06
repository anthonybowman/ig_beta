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

addCommandHandler("fly", function(playerSource, cmdName)
	if tonumber(getElementData(playerSource, "_character:adminLevel")) >= 7 then
		triggerClientEvent(playerSource, "onClientFlyToggle", playerSource)
	end
end)


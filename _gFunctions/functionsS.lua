--[[
*******************************************************
	Project owner:		Krumpli2, Thug
	Project name: 		internalGaming
	Developers:   		Czakó Csaba
	Version:      		v1.0 Open Source
	Status:     		Stable release
********************************************************
--]]

function startMod(resource)
	if resource ~= getThisResource() then return end
	setGameType(defaultSettings["modVersion"])
	setMapName("Los Santos - San Fierro")
	setRuleValue("Mod Version", tostring(defaultSettings["modVersion"]))
end
addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), startMod)

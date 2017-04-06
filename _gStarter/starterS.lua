--[[
*******************************************************
	Project owner:		Krumpli2, Thug
	Project name: 		internalGaming
	Developers:   		Czakó Csaba
	Version:    		v1.0 Open Source
	Status:     		Stable release
********************************************************
--]]

function startScripts()
	local resources = getResources()
	startResource("_gFunctions")
	startResource("_gDatabase")
	for k,v in ipairs(resources) do
		startResource(v) 
	end
end
addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), startScripts)

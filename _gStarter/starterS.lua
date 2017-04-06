--[[
*******************************************************
	Project owner:		Krumpli2, Thug
	Project name: 		internalGaming
	Developers:   		Scott, Krumpli2
	Version:    		v1.0
	Status:     		Stable release
********************************************************
--]]

function startScripts()
	local resources = getResources()
	startResource("_gFunctions")
	startResource("_gCompiler")
	startResource("_gWhitelist")
	startResource("_gDatabase")
	for k,v in ipairs(resources) do
		startResource(v) 
	end
end
addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), startScripts)

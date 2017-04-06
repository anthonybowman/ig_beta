--[[
*******************************************************
	Project owner:		Krumpli2, Thug
	Project name: 		internalGaming
	Developers:   		Anthony, Krumpli2
	Version:    		v1.0
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


local characterID = {}
addEventHandler("onPlayerJoin",getRootElement(),
	function()
		local slot = nil
		for i = 1, 1024 do
			if (characterID[i]==nil) then
				slot = i
				break
			end
		end
		characterID[slot] = source
		setElementData(source, "_character:id", slot)
	end
)
addEventHandler("onPlayerQuit",getRootElement(),
	function()
		local slot = getElementData(source, "_character->id")
		if (slot) then
			characterID[slot] = nil
		end
	end
)
addEventHandler("onResourceStart",getResourceRootElement(getThisResource()),
	function()
		local players = getElementsByType("player")
		for key, value in ipairs(players) do
			characterID[key] = value
			setElementData(value, "_character->id", key)
		end
	end
)

function onPlayerNameChange()
	cancelEvent()
end
addEventHandler("onPlayerChangeNick", getRootElement(), onPlayerNameChange)

--[[
*******************************************************
	Project owner:		Krumpli2, Thug
	Project name: 		internalGaming
	Developers:   		Czakó Csaba
	Version:    		v1.0 Open Source
	Status:     		Stable release
********************************************************
--]]

mysqlSetteings = {
	passwordPrefix = "INTERNALGAMING@2017",
	passwordEncode = "sha1",
}

defaultSettings = {
	scriptVersion = "iGaming Beta",
	playerDataTime = 360,
	serverName = "internalGaming",
	serverNameEx = {"internal", "Gaming"},
	serverColor = {
		rgb = {85,178,243},
		hex = "#55b2f3",
	},
	playerDatas = {
		maxHealth = 100,
		maxArmor = 100,
		maxHunger = 100,
	},
	cursorButton = "m",
}

function getDefaultSettings()
	return defaultSettings
end

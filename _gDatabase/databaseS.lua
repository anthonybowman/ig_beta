--[[
*******************************************************
	Project owner:		Krumpli2, Thug
	Project name: 		internalGaming
	Developers:   		Anthony, Krumpli2
	Version:    		v1.0
	Status:     		Stable release
********************************************************
--]]

local dbHost = "127.0.0.1"
local dbUser = ""
local dbPass = ""
local dbName = ""

local sqlHandler = nil

function enabledConnection(res)
	sqlHandler = dbConnect( "mysql", "dbname="..dbName..";host="..dbHost, dbUser, dbPass, "charset=utf8" )
	
	if (not sqlHandler) then
		if (res == getThisResource()) then
	--		outputDebugString("Nem sikerült csatlakozni az adatbázishoz!")
		end
		return nil
	else
		dbExec( sqlHandler,"SET NAMES utf8" )
	--	outputDebugString("Sikerült csatlakozni az adatbázishoz!")
	end
	
	return nil
end
addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), enabledConnection, false)
	
function getConnection()
	if(sqlHandler) then
		return sqlHandler
	else
		return nil
	end
end

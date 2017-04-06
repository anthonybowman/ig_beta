--[[
*******************************************************
	Project owner:		Krumpli2, Thug
	Project name: 		internalGaming
	Developers:   		Scott, Krumpli2
	Version:    		v1.0 Open Source
	Status:     		Stable release
********************************************************
--]] 

local weatherNameToGTA = {
	["Haze"] = math.random(12,15),
	["Mostly Cloudy"] = 2,
	["Clear"] = 10,
	["Cloudy"] = math.random(0,7),
	["Flurries"] = 32,
	["Fog"] = math.random(0,7),
	["Mostly Sunny"] = math.random(0,7),
	["Partly Cloudy"] = math.random(0,7),
	["Partly Sunny"] = math.random(0,7),
	["Freezing Rain"] = 16,
	["Sleet"] = 16,
	["Snow"] = 31,
	["Sunny"] = 11,
	["Thunderstorms"] = 8,
	["Thunderstorm"] = 8,
	["Unknown"] = 0,
	["Overcast"] = 7,
	["Scattered Clouds"] = 7,
}

local rainedWeathers = {
	["Rain"] = true,
	["Sleet"] = true,
	["Freezing Rain"] = true,
	["Thunderstorm"] = true,
	["Thunderstorms"] = true,
	["Overcast"] = true,
	["Scattered Clouds"] = true,
}
setWaterLevel(0)
local json = nil
function fetchWeather()
	setRainLevel(0)
	setElementData(root, "snow", false)

	fetchRemote("http://api.wunderground.com/api/0bf7b698330f3296/conditions/q/CA/Nevada_City.json", function(data)
		local new = fromJSON(data)
		local wind = tonumber(new["current_observation"]["wind_kph"]) / 4 or 0
		local weather = tostring(new["current_observation"]["weather"])

		setWindVelocity(wind, wind, wind)
		setWaveHeight(wind / 2)

		if weatherNameToGTA[weather] then
			setWeather(weatherNameToGTA[weather])
		else
			setWeather(31)
		end

		if rainedWeathers[weather] then
			setWeather(7)
			setElementData(root, "snow", true)
		end

	end, nil, true)
end
setTimer(fetchWeather, 45000*10, 0)
addEventHandler("onResourceStart", resourceRoot, fetchWeather)

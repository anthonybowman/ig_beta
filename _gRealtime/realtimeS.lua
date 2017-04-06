--[[
*******************************************************
	Project owner:		Krumpli2, Thug
	Project name: 		internalGaming
	Developers:   		Scott, Krumpli2
	Version:    		v1.0
	Status:     		Stable release
********************************************************
--]]

function realTime(p)
	local realtime = getRealTime()
	hour = realtime.hour
	minute = realtime.minute
	if hour >= 24 then
		hour = hour - 24
	elseif hour < 0 then
		hour = hour + 24
	end

	setTime(hour, minute)
	nextrefresh = (60-realtime.second) * 1000
	setMinuteDuration( nextrefresh )
	setTimer( setMinuteDuration, nextrefresh + 5, 1, 60000 )
end

addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), realTime )
setTimer( realTime, 1800000, 0 )

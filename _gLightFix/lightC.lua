--[[
*******************************************************
	Project owner:		Krumpli2, Thug
	Project name: 		internalGaming
	Developers:   		Scott, Krumpli2
	Version:    		v1.0
	Status:     		Stable release
********************************************************
--]]

local lightDissShader

addEventHandler( "onClientResourceStart", resourceRoot,
	function()
		lightDissShader, tec = dxCreateShader ( "light_disable.fx", 0, 0, false, "object" )
		if not lightDissShader then

		else
			engineApplyShaderToWorldTexture ( lightDissShader, "*" )
		end
	end
)

HC = require('HC');

require('src/objects/ball')
require('src/objects/map')

local lastbutton = "none"

function love.gamepadpressed(joystick, button)
    lastbutton = button
end

function love.draw()
	Ball:draw()
	Map:draw()
end

function love.load()
	local joysticks = love.joystick.getJoysticks()
	joystick = joysticks[1]

	Ball:load()	
	Map:load()
end

function love.update(dt)
	
	if not joystick then return end

	if joystick:isGamepadDown("rightshoulder") then
		love.load()
	end

	Ball:update(dt)
	Map:update(dt)	
end
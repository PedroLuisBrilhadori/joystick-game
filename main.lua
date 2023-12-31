local lastbutton = "none"

function love.gamepadpressed(joystick, button)
    lastbutton = button
end

function love.draw()
    local leftSize = (1-joystick:getGamepadAxis("triggerleft"))*leftCircle.size
	local rightSize = (1-joystick:getGamepadAxis("triggerright"))*rightCircle.size


	local distX = centerRightCircle.x - rightCircle.x
	local distY = centerRightCircle.y - rightCircle.y

	local dist = math.floor(math.sqrt(distX ^ 2 + distY ^ 2));

	love.graphics.print("circle dist ".. dist .. " circle size " .. rightCircle.size .. " circle x " .. rightCircle.x .. " circle y " .. rightCircle.y , 300, 400)
	love.graphics.print("center size " .. centerRightCircle.size .. " center x " .. centerRightCircle.x .. " center y " .. centerRightCircle.y , 300, 450)

    
	love.graphics.circle("line", leftCircle.x, leftCircle.y, leftSize)
	love.graphics.circle("line", rightCircle.x, rightCircle.y, rightSize)
	love.graphics.circle("line", centerLeftCircle.x, centerLeftCircle.y, centerLeftCircle.size)
	love.graphics.circle("line", centerRightCircle.x, centerRightCircle.y, centerRightCircle.size)


end

function love.load()
	local joysticks = love.joystick.getJoysticks()
	joystick = joysticks[1]

	leftCircle = {x = 200, y = 280, size = 100}
	rightCircle = {x = 600, y = 280, size = 100}
	centerLeftCircle = {x = 200, y = 280, size = 10}
	centerRightCircle = {x = 600, y = 280, size = 10}
	lastRigth = {x= 200, y= 280}
	speed = 600
end

function love.update(dt)
	
	if not joystick then return end

	if joystick:isGamepadDown("rightshoulder") then
		love.load()
	end

	centerLeftCircle.x = centerLeftCircle.x + dt*speed*joystick:getGamepadAxis("leftx")	
	centerLeftCircle.y = centerLeftCircle.y + dt*speed*joystick:getGamepadAxis("lefty")


	local distX = centerRightCircle.x - rightCircle.x
	local distY = centerRightCircle.y  - rightCircle.y
	local dist = centerRightCircle.size + rightCircle.size



	if (distX * distX + distY * distY <= dist * dist)  then 
		centerRightCircle.x = centerRightCircle.x + dt*speed*joystick:getGamepadAxis("rightx")
		centerRightCircle.y = centerRightCircle.y + dt*speed*joystick:getGamepadAxis("righty")
	end

end
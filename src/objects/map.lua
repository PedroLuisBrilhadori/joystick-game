Map = {}

function Map:load() 
    self.x = 600
    self.y = 280
    self.size = 80
    

    self.body = HC.circle(self.x, self.y, self.size)
end

function Map:update(dt)
end

function Map:draw()
    local rightSize = (1-joystick:getGamepadAxis("triggerright")) * self.size

    love.graphics.circle("line", self.x, self.y, rightSize)

    love.graphics.print('Map: ', 5, 35)
    love.graphics.print("size: " .. self.size .. " x: " .. self.x .. " y: " .. self.y , 5, 50)
end
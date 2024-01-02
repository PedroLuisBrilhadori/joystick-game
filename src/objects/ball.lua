Ball = {}

function Ball:load() 
    self.x = 600
    self.y = 280
    self.size = 10

    self.lastX = self.x
    self.lastY = self.y 

    self.speed = 600
    self.colision = 'false'

    self.xvel = self.speed * math.cos(math.pi / 4)
    self.yvel = self.speed * math.sin(math.pi / 4)

    self.body = HC.circle(self.x, self.y, self.size)
    self.dist = 0


    self.live = 5
    self.score = 0
    self.multiplier = 1

end

function Ball:update(dt)
    self.x = self.x + dt * self.speed * joystick:getGamepadAxis("rightx")
    self.y = self.y + dt * self.speed * joystick:getGamepadAxis("righty")


    self.dist = math.sqrt((self.x - Map.x) ^ 2 + (self.y - Map.y) ^ 2)

    -- TODO: fluid movement when colision
    if Map.size - self.size  >= self.dist then 
        self.colision = 'true'
        self.lastX = self.x
        self.lastY = self.y
    else
        self.colision = 'false'
        self.x = self.lastX
        self.y = self.lastY
    end
    
end

function Ball:draw()
    love.graphics.circle("line", self.x, self.y, self.size)

    love.graphics.print("colsion " .. self.colision .. " circle dist ".. self.dist .. " circle size " .. self.size .. " circle x " .. self.x .. " circle y " .. self.y , 5, 5)

end
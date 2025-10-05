Hud = {}
anim8 = require("libraries/anim8")
require('codes.player.pers')
love.graphics.setDefaultFilter("nearest", "nearest")

function Hud:load()
    --vida
    self.vd = 1
    self.life_sptSH = love.graphics.newImage('arts/huds/life.png')
    self.life_grid = anim8.newGrid(32,4,self.life_sptSH:getWidth(),self.life_sptSH:getHeight())
    self.lifeHud = {}
    self.lifeHud.lifes = anim8.newAnimation(self.life_grid('1-1',1),0.1)

    --armo
    self.arm = 1
    self.arm_sptSH = love.graphics.newImage('arts/huds/armo.png')
    self.arm_grid = anim8.newGrid(32,4,self.arm_sptSH:getWidth(),self.arm_sptSH:getHeight())
    self.armHud = {}

    --direcoes
    self.arm = 1
    self.direct_sptSH = love.graphics.newImage('arts/huds/direcoes.png')
    self.direct_grid = anim8.newGrid(50,50,self.direct_sptSH:getWidth(),self.direct_sptSH:getHeight())
    self.direct_Hud = {}
    self.direct_Hud.direcoes = anim8.newAnimation(self.life_grid('1-1',1),0.1)
    self.direct_x = float
    self.direct_y = float


end


function Hud:update(dt)
    self.lifeHud.lifes:update(dt)
    self.direct_Hud.direcoes:update(dt)
    self.armHud.arms = anim8.newAnimation(self.arm_grid(self.arm.. '-' ..1,1),0.1)

    if love.keyboard.isDown('q') then
        self.arm = self.arm + 1
    end
        self.armHud.arms:update(dt)

    self.direct_x = Pers.x + Pers.speed * dt 
    self.direct_y = Pers.y + Pers.speed * dt 


end


function Hud:draw()
    self.lifeHud.lifes:draw(self.life_sptSH,0,0,nil,8)
    self.armHud.arms:draw(self.arm_sptSH,0,4*6,nil,8)
     love.graphics.print(self.vd, 0,200)

    
end
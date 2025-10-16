Hud = {}
anim8 = require("libraries/anim8")
require('codes.player.pers')
require('libraries.cooldown')
love.graphics.setDefaultFilter("nearest", "nearest")

local Cdw = 2

function Hud:load()
    --vida
    self.vd = 5
    self.life_sptSH = love.graphics.newImage('arts/huds/life.png')
    self.life_grid = anim8.newGrid(32,4,self.life_sptSH:getWidth(),self.life_sptSH:getHeight())
    self.lifeHud = {}
 

    --armo
    self.arm = 5
    self.arm_sptSH = love.graphics.newImage('arts/huds/arm.png')
    self.arm_grid = anim8.newGrid(32,4,self.arm_sptSH:getWidth(),self.arm_sptSH:getHeight())
    self.armHud = {}

    --direcoes
    self.ponteiro = love.graphics.newImage('arts/huds/ponteiro.png')
    self.ang = 0

    self.time_regen = 2



end


function Hud:update(dt)

    Hud:life_armor(dt)

    self.direct_x = Pers.x + Pers.speed * dt 
    self.direct_y = Pers.y + Pers.speed * dt 


end


function Hud:draw()
    self.lifeHud.lifes:draw(self.life_sptSH,0,0,nil,8)
    self.armHud.arms:draw(self.arm_sptSH,0,4*6,nil,8)
    love.graphics.print(Cdw, 0,300)

    
end


function Hud:pont_dir()
    if (Pers.mx == -1) or (Controls.lx < 0) then self.ang = 5.5
    
    elseif (Pers.mx == 1) or (Controls.lx > 0) then self.ang = -5.5 * 3
    
    elseif (Pers.my == -1) or (Controls.ly < 0) then self.ang = -5.5
    
    elseif (Pers.my == 1) or (Controls.ly > 0)then self.ang = 5.5 *3
    
    
    end

    if (Pers.mx == -1 and Pers.my == -1) or (Controls.lx < 0 and Controls.ly < 0 ) then self.ang = - 5.5 * 8
    
    elseif (Pers.mx == -1 and Pers.my == 1) or (Controls.lx < 0 and Controls.ly > 0) then self.ang = 5.5 * 2
    
    elseif (Pers.mx == 1 and Pers.my == -1) or (Controls.lx > 0 and Controls.ly < 0) then self.ang = -5.5  * 2
    
    elseif (Pers.mx == 1 and Pers.my == 1) or (Controls.lx > 0 and Controls.ly > 0)then self.ang = 5.5 * 4
    end
end

function Hud:draw_pont()
    love.graphics.draw(self.ponteiro,Pers.x+0.5,Pers.y+2.6,self.ang,nil,nil,21,22)
    
end

function Hud:life_armor(dt)


    self.lifeHud.lifes = anim8.newAnimation(self.life_grid(self.vd.. '-' ..1,1),0.1)
    self.armHud.arms = anim8.newAnimation(self.arm_grid(self.arm.. '-' ..1,1),0.1)


    if love.keyboard.isDown('q') then
        self.arm = self.arm - 1
        Cdw = 0

        if self.arm <=0 then
            self.arm =  1
            self.vd = self.vd-1
            if self.vd <=1 then
                self.vd = 1
            end
        end
    end


    if self.arm < 5 and Cdw == 2  then
        self.arm = self.arm + 1
        Cdw = 0
    end

    if Cdw < 2 then
        Cdw = reload(Cdw,true,0.5,2,dt)
    end

end
    

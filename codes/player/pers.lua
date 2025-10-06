anim8 = require("libraries/anim8")
love.graphics.setDefaultFilter("nearest", "nearest")
Pers = {}

function Pers:load()
    self.x = 145
    self.y = 0
    self.speed = 50
    self.mx = 0
    self.my = 0
    self.flip = false
    Controls:load_gamepad()

-- animaçao do jogador
    Pers:animacoes()
end


function Pers:update(dt)

    self.anims.aniM:update(dt)
    self.anims.aniMf:update(dt)
    self.anims.aniP:update(dt)
end

function Pers:draw()

    Pers:drAn()

end



function Pers:animacoes()
    self.spriteSheet = love.graphics.newImage('arts/player/knigt_move.png')
    self.grid = anim8.newGrid(32,32, self.spriteSheet:getWidth(), self.spriteSheet:getHeight())
    self.anims = {}
    self.anims.aniM = anim8.newAnimation( self.grid('1-4', 1), 0.2 )
    self.anims.aniMf =self.anims.aniM:clone():flipH()
    self.anims.aniP = anim8.newAnimation( self.grid('2-2', 1), 0.1 )
    self.anims.aniPf =self.anims.aniP:clone():flipH()
end

function Pers:drAn()
    if (self.mx ~= 0 or self.my ~= 0) or (Controls.lx ~=0 or Controls.ly ~= 0) then
        if (self.mx < 0) or (Controls.lx < 0) then
            self.anims.aniM:draw(self.spriteSheet,self.x,self.y,nil,nil,nil,16,16)
            self.flip = false
        else
            self.anims.aniMf:draw(self.spriteSheet,self.x,self.y,nil,nil,nil,16,16)
            self.flip = true
        end

    else
        if self.flip == false then

            self.anims.aniP:draw(self.spriteSheet, self.x, self.y,nil,nil,nil,16,16)
        else

            self.anims.aniPf:draw(self.spriteSheet, self.x, self.y,nil,nil,nil,16,16)
        end
    end
    
end



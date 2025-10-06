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
    Controls:teclado(dt)
    Controls:gamepad(dt)


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


Controls = {

    lx = 0,
    ly = 0
}

--CONTROLES DO JOGO [TECLADO]
function Controls:teclado(dt)
    Pers.mx = love.keyboard.isDown('a') and -1 or love.keyboard.isDown('d') and 1 or 0
    Pers.x = Pers.x + Pers.mx * Pers.speed * dt
    Pers.my = love.keyboard.isDown('w') and -1 or love.keyboard.isDown('s') and 1 or 0
    Pers.y = Pers.y + Pers.my * Pers.speed * dt

    if love.keyboard.isDown('space') then
        Pers.speed = 500
    end
end

--CONTROLES DO JOGO [GAMEPAD]




function Controls:load_gamepad(dt)



    Controls.joysticks = love.joystick.getJoysticks()
    Controls.joystick = Controls.joysticks[1] -- pega o primeiro controle conectado
    
end

function Controls:gamepad(dt)
    Controls:teclado(dt)
     if Controls.joystick then
        -- lê analógico esquerdo
         Controls.lx = Controls.joystick:getAxis(1) -- eixo X
         Controls.ly = Controls.joystick:getAxis(2) -- eixo Y

        -- zona morta (para evitar movimento com leve toque)
        if math.abs(Controls.lx) < 0.2 then Controls.lx = 0 end
        if math.abs(Controls.ly) < 0.2 then Controls.ly = 0 end

        -- movimento
        Pers.x = Pers.x + Controls.lx * Pers.speed * dt
        Pers.y = Pers.y + Controls.ly * Pers.speed * dt
    end
    
end
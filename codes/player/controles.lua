require('codes.player.pers')

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
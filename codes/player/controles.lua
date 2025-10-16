require('codes.player.pers')
require('libraries.cooldown')

local run = 0

Controls = {

    lx = 0,
    ly = 0
}
-- CORRIDA E DASH
    dash = 2
function Controls:run(dt)
    run = reload(run,true,0.5,2,dt)

    if run >= 2 then
        Pers.speed = 100
    else
        Pers.speed = 50
    end

    if (Pers.mx == 0 and Pers.my == 0) and (Controls.lx == 0 and Controls.ly == 0) then
        run = 0
    
    end
    

    dash = reload(dash,true,1,2,dt)


   function love.keypressed(key)
        if key == 'space' and dash >= 2 then
            Pers.speed = 2500/2
            dash = 0
        end
       
    end


end

function love.gamepadpressed(joystick, button)
    -- botão A (geralmente 1) para dash
    if button == "a" and dash >= 2 then
        Pers.speed = 2500 / 2
        dash = 0
    end
end


--CONTROLES DO JOGO [TECLADO]
function Controls:teclado(dt)
    
    Pers.mx = love.keyboard.isDown('a') and -1 or love.keyboard.isDown('d') and 1 or 0
    Pers.x = Pers.x + Pers.mx * Pers.speed * dt
    Pers.my = love.keyboard.isDown('w') and -1 or love.keyboard.isDown('s') and 1 or 0
    Pers.y = Pers.y + Pers.my * Pers.speed * dt

   
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

function Controls:prints()
    love.graphics.print(dash,0,350,0,2)
end
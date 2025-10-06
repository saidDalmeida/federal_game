require("codes/player/pers")
require("codes/player/controles")
require('codes/maps/mapa')
require('codes/hud')
camera = require('libraries.camera')
cam = camera()
function love.load()
    Controls:load_gamepad()
    Maps:load()
    Pers:load()
    Hud:load()
end

function love.update(dt)
    Controls:teclado(dt)
    Controls:gamepad(dt)
    Hud:pont_dir()
    Pers:update(dt)
    Hud:update(dt)
    cameras()
   
end


function love.draw()

    cam:attach()
        Maps:draw()
        Pers:draw()
        mapatst:drawLayer(mapatst.layers['avr2'])
        Hud:draw_pont()

    cam:detach() --[ delimita o espaço da camera, oq estiver fora n~ao sera renderizado "foi oq entendi" ]
        Hud:draw()
        love.graphics.print(mapx,0)
        love.graphics.print(mapy,0,50)
        love.graphics.print(cam.x,0,100)
        love.graphics.print(cam.y,0,150)

   
   
end

function cameras()
     local zm = 5
    -- tentativa de camera para o jogo(e uma coisa que temos que trabalhar mais, muito chato de fazer) [mas pelo menos seram coisa feitas uma vez para nunca mais]
    cam:zoomTo(zm)
    local w = love.graphics.getWidth()
    local h = love.graphics.getHeight()

    --[[Atualiza a câmera para seguir o jogador--]]
    cam:lookAt(Pers.x, Pers.y)
    
    if cam.x < (w/2) / zm then
        cam.x = (w/2) / zm
    end
     if cam.y < (h/2) / zm then
        cam.y = (h/2) / zm
    end

     mapx = mapatst.width * mapatst.tilewidth /4
     mapy = mapatst.height * mapatst.tileheight / (zm/2)


    if cam.x > mapx then
        cam.x = mapx 
    end

    if cam.y > mapy then
        cam.y = mapy
    end
  

    -- Aqui você pode adicionar limites máximos, se quiser que a câmera não passe do mapa
    -- ex: cam.x > mapa.width - half_w então cam.x = mapa.width - half_w
    
end
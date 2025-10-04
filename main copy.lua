--[[require("codes/player/pers")
require('codes/maps/mapa')
camera = require('libraries.camera')
cam = camera()
function love.load()
    Maps:load()
    Pers:load()
end

function love.update(dt)
    Pers:update(dt)

    -- tentativa de camera para o jogo(e uma coisa que temos que trabalhar mais, muito chato de fazer) [mas pelo menos seram coisa feitas uma vez para nunca mais]

    --[[Atualiza a câmera para seguir o jogador
    cam:lookAt(Pers.x, Pers.y)
    
    -- Limita a câmera para não sair dos limites do mapa
    local w = love.graphics.getWidth()
    local h = love.graphics.getHeight()
    local zoom = 5
    cam:zoomTo(zoom)

    -- Como a câmera está com zoom, os limites precisam considerar a escala
    local half_w = (w / 2) / zoom
    local half_h = (h / 2) / zoom
    cam:lookAt(Pers.x, Pers.y)

  

    -- Aqui você pode adicionar limites máximos, se quiser que a câmera não passe do mapa
    -- ex: cam.x > mapa.width - half_w então cam.x = mapa.width - half_w
end


function love.draw()

            cam:attach() -- mostra oque tiver dentro na camera ]
                Maps:draw()
                Pers:draw()
            cam:detach() --[ delimita o espaço da camera, oq estiver fora n~ao sera renderizado "foi oq entendi" ]
        --love.graphics.print(w,0)
        --love.graphics.print(h,0,50)

   
   
end
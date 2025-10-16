sti =require("libraries/sti")

Maps = {}

function Maps:load()
    mapatst = sti('mapas/mp_tst.lua')
end

function Maps:update(dt)
    
end

function Maps:draw()
    --love.graphics.push()
   --love.graphics.scale(5, 5)   -- reduce everything by 50% in both X and Y coordinates
        mapatst:drawLayer(mapatst.layers['terreno'])
        mapatst:drawLayer(mapatst.layers['sub1'])
        mapatst:drawLayer(mapatst.layers['avr1'])
        
   --love.graphics.pop()
    
end
require('codes.player.pers')

Controls = {}

function Controls:move(dt)
    Pers.mx = love.keyboard.isDown('a') and -1 or love.keyboard.isDown('d') and 1 or 0
    Pers.x = Pers.x + Pers.mx * Pers.speed * dt
    Pers.my = love.keyboard.isDown('w') and -1 or love.keyboard.isDown('s') and 1 or 0
    Pers.y = Pers.y + Pers.my * Pers.speed * dt

    if love.keyboard.isDown('space') then
        Pers.speed = 500
    end
end
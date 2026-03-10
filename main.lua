function love.load()
    Tiles = {}
    Tiles.posX = 500
    Tiles.posY = 500
    Tiles.sizeX = 50
    Tiles.sizeY = 50
    Tiles.color = {{0, 0, 0},{255, 255, 255}}
    Tiles.color.bg = {255, 255, 255, 0.1}
end

function love.update(dt)

end

function love.draw()
    for i = 10, 1, -1 do
        for j = 10, 1, -1 do
            love.graphics.setColor(Tiles.color.bg)
            love.graphics.rectangle("fill", Tiles.posX-Tiles.sizeX * i, Tiles.posY-Tiles.sizeY * j, Tiles.sizeX, Tiles.sizeY)
        end
    end
    for i = 8, 1, -1 do
        for j = 8, 1, -1 do
            if (i + j) % 2 == 1 then
                love.graphics.setColor(Tiles.color[1])
            else
                love.graphics.setColor(Tiles.color[2])
            end
            love.graphics.rectangle("fill", Tiles.posX-Tiles.sizeX - Tiles.sizeX * i, Tiles.posY - Tiles.sizeY - Tiles.sizeY * j, Tiles.sizeX, Tiles.sizeY)
        end
    end
end

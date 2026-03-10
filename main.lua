function love.load()
    Tiles = {}
    Tiles.posX = 0
    Tiles.posY = Tiles.posX
    Tiles.sizeX = 50
    Tiles.sizeY = Tiles.sizeX
    Tiles.color = {{0, 0, 0},{255, 255, 255}}
    Tiles.color.bg = {255, 255, 255, 0.1}
end

function love.update(dt)

end

function love.draw()
    for i = 0, 9, 1 do
        for j = 0, 9, 1 do
            love.graphics.setColor(Tiles.color.bg)
            love.graphics.rectangle("fill", Tiles.posX + i * Tiles.sizeX, Tiles.posY + j * Tiles.sizeY, Tiles.sizeX, Tiles.sizeY)
        end
    end
    for i = 1, 8, 1 do
        for j = 1, 8, 1 do
            if (i + j) % 2 == 1 then
                love.graphics.setColor(Tiles.color[1])
            else
                love.graphics.setColor(Tiles.color[2])
            end
            love.graphics.rectangle("fill", Tiles.posX + i * Tiles.sizeX, Tiles.posY + j * Tiles.sizeY, Tiles.sizeX, Tiles.sizeY)
        end
    end
    love.graphics.print("Curseur position X : " .. love.mouse.getX() .. ", position Y : " .. love.mouse.getY(), 10, 10)
end

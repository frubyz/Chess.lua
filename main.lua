local case = {}

case.posX = 500
case.posY = 500
case.sizeX = 50
case.sizeY = 50
case.color = {{255, 0, 0, 100},{0, 0, 255, 100},{255, 0, 0, 100},{0, 0, 255, 100},{255, 0, 0, 100},{0, 0, 255, 100},{255, 0, 0, 100},{0, 0, 255, 100}}

function love.load()

end

function love.update(dt)
    if love.window.isVisible == false then
        love.window.close()
    end
end

function love.draw()
    for i = 10, 1, -1 do
        for j = 10, 1, -1 do
            love.graphics.setColor(255, 255, 255, 0.1)
            love.graphics.rectangle("fill", case.posX-50*i, case.posY-50*j, case.sizeX, case.sizeY)
        end
    end
    for i = 8, 1, -1 do
        for j = 8, 1, -1 do
            if (i + j) % 2 == 1 then
                love.graphics.setColor(0, 0, 0)
            else
                love.graphics.setColor(255, 255, 255)
            end
            love.graphics.rectangle("fill", case.posX-50-50*i, case.posY-50-50*j, case.sizeX, case.sizeY)
        end
    end
end
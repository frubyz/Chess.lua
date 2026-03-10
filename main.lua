function love.load()
    Tiles = {}
    Tiles.posX = 0
    Tiles.posY = Tiles.posX
    Tiles.sizeX = 50
    Tiles.sizeY = Tiles.sizeX
    Tiles.color = {{0, 0, 0},{255, 255, 255}}
    Tiles.color.bg = {255, 255, 255, 0.1}

    Cursor = {}
    Cursor.posX = 0
    Cursor.posY = 0
    Cursor.tileX = 0
    Cursor.tileY = 0

    Chessman = {}
    Chessman.texture = {}
    Chessman.b = {}
    Chessman.w = {}
    
    Chessman.texture.bp = love.graphics.newImage("Textures/Chessman/bp.png")
    Chessman.texture.br = love.graphics.newImage("Textures/Chessman/br.png")
    Chessman.texture.bn = love.graphics.newImage("Textures/Chessman/bn.png")
    Chessman.texture.bb = love.graphics.newImage("Textures/Chessman/bb.png")
    Chessman.texture.bk = love.graphics.newImage("Textures/Chessman/bk.png")
    Chessman.texture.bq = love.graphics.newImage("Textures/Chessman/bq.png")

    Chessman.texture.wp = love.graphics.newImage("Textures/Chessman/wp.png")
    Chessman.texture.wr = love.graphics.newImage("Textures/Chessman/wr.png")
    Chessman.texture.wn = love.graphics.newImage("Textures/Chessman/wn.png")
    Chessman.texture.wb = love.graphics.newImage("Textures/Chessman/wb.png")
    Chessman.texture.wk = love.graphics.newImage("Textures/Chessman/wk.png")
    Chessman.texture.wq = love.graphics.newImage("Textures/Chessman/wq.png")

    Chessman.b.coords = {{"K", 5, 1}, {"Q", 4, 1}, {"R", 1, 1}, {"R", 8, 1}, {"N", 2, 1}, {"N", 7, 1}, {"B", 3, 1}, {"B", 6, 1},
                        {"P", 1, 2}, {"P", 2, 2}, {"P", 3, 2}, {"P", 4, 2}, {"P", 5, 2}, {"P", 6, 2}, {"P", 7, 2}, {"P", 8, 2}}
    Chessman.w.coords = {{"K", 5, 8}, {"Q", 4, 8}, {"R", 1, 8}, {"R", 8, 8}, {"N", 2, 8}, {"N", 7, 8}, {"B", 3, 8}, {"B", 6, 8},
                        {"P", 1, 7}, {"P", 2, 7}, {"P", 3, 7}, {"P", 4, 7}, {"P", 5, 7}, {"P", 6, 7}, {"P", 7, 7}, {"P", 8, 7}}
end

function love.update(dt)
    if love.mouse.isDown(1) then
        Cursor.posX = love.mouse.getX()
        Cursor.posY = love.mouse.getY()
        Cursor.tileX = math.floor(Cursor.posX / Tiles.sizeX)
        Cursor.tileY = math.floor(Cursor.posY / Tiles.sizeY)
    end
end

function love.draw()
    for i = 1, 10, 1 do
        for j = 1, 10, 1 do
            love.graphics.setColor(Tiles.color.bg)
            love.graphics.rectangle("fill", Tiles.posX + (i - 1) * Tiles.sizeX, Tiles.posY + (j - 1) * Tiles.sizeY, Tiles.sizeX, Tiles.sizeY)
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

    for i = 1, 16, 1 do
        if Chessman.b.coords[i][1] == "K" then
            love.graphics.draw(Chessman.texture.bk, Chessman.b.coords[i][2] * Tiles.sizeX, Chessman.b.coords[i][3] * Tiles.sizeY)
        elseif Chessman.b.coords[i][1] == "Q" then
            love.graphics.draw(Chessman.texture.bq, Chessman.b.coords[i][2] * Tiles.sizeX, Chessman.b.coords[i][3] * Tiles.sizeY)
        elseif Chessman.b.coords[i][1] == "R" then
            love.graphics.draw(Chessman.texture.br, Chessman.b.coords[i][2] * Tiles.sizeX, Chessman.b.coords[i][3] * Tiles.sizeY)
        elseif Chessman.b.coords[i][1] == "N" then
            love.graphics.draw(Chessman.texture.bn, Chessman.b.coords[i][2] * Tiles.sizeX, Chessman.b.coords[i][3] * Tiles.sizeY)
        elseif Chessman.b.coords[i][1] == "B" then
            love.graphics.draw(Chessman.texture.bb, Chessman.b.coords[i][2] * Tiles.sizeX, Chessman.b.coords[i][3] * Tiles.sizeY)
        elseif Chessman.b.coords[i][1] == "P" then
            love.graphics.draw(Chessman.texture.bp, Chessman.b.coords[i][2] * Tiles.sizeX, Chessman.b.coords[i][3] * Tiles.sizeY)
        end
    end

    for i = 1, 16, 1 do
        if Chessman.w.coords[i][1] == "K" then
            love.graphics.draw(Chessman.texture.wk, Chessman.w.coords[i][2] * Tiles.sizeX, Chessman.w.coords[i][3] * Tiles.sizeY)
        elseif Chessman.w.coords[i][1] == "Q" then
            love.graphics.draw(Chessman.texture.wq, Chessman.w.coords[i][2] * Tiles.sizeX, Chessman.w.coords[i][3] * Tiles.sizeY)
        elseif Chessman.w.coords[i][1] == "R" then
            love.graphics.draw(Chessman.texture.wr, Chessman.w.coords[i][2] * Tiles.sizeX, Chessman.w.coords[i][3] * Tiles.sizeY)
        elseif Chessman.w.coords[i][1] == "N" then
            love.graphics.draw(Chessman.texture.wn, Chessman.w.coords[i][2] * Tiles.sizeX, Chessman.w.coords[i][3] * Tiles.sizeY)
        elseif Chessman.w.coords[i][1] == "B" then
            love.graphics.draw(Chessman.texture.wb, Chessman.w.coords[i][2] * Tiles.sizeX, Chessman.w.coords[i][3] * Tiles.sizeY)
        elseif Chessman.w.coords[i][1] == "P" then
            love.graphics.draw(Chessman.texture.wp, Chessman.w.coords[i][2] * Tiles.sizeX, Chessman.w.coords[i][3] * Tiles.sizeY)
        end
    end
end

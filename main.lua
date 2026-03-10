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
    Chessman.tileX = {}
    Chessman.tileY = {}
    
    Chessman.texture.bp = love.graphics.newImage("Textures/Chessman/bp.png")
    Chessman.tileX.bp = {1, 2, 3, 4, 5, 6, 7, 8}
    Chessman.tileY.bp = {2, 2, 2, 2, 2, 2, 2 ,2}
    Chessman.texture.br = love.graphics.newImage("Textures/Chessman/br.png")
    Chessman.tileX.br = {1, 8}
    Chessman.tileY.br = {1, 1}
    Chessman.texture.bn = love.graphics.newImage("Textures/Chessman/bn.png")
    Chessman.tileX.bn = {2, 7}
    Chessman.tileY.bn = {1, 1}
    Chessman.texture.bb = love.graphics.newImage("Textures/Chessman/bb.png")
    Chessman.tileX.bb = {3, 6}
    Chessman.tileY.bb = {1, 1}
    Chessman.texture.bk = love.graphics.newImage("Textures/Chessman/bk.png")
    Chessman.tileX.bk = 5
    Chessman.tileY.bk = 1
    Chessman.texture.bq = love.graphics.newImage("Textures/Chessman/bq.png")
    Chessman.tileX.bq = 4
    Chessman.tileY.bq = 1

    Chessman.texture.wp = love.graphics.newImage("Textures/Chessman/wp.png")
    Chessman.tileX.wp = {1, 2, 3, 4, 5, 6, 7, 8}
    Chessman.tileY.wp = {7, 7, 7, 7, 7, 7, 7 ,7}
    Chessman.texture.wr = love.graphics.newImage("Textures/Chessman/wr.png")
    Chessman.tileX.wr = {1, 8}
    Chessman.tileY.wr = {8, 8}
    Chessman.texture.wn = love.graphics.newImage("Textures/Chessman/wn.png")
    Chessman.tileX.wn = {2, 7}
    Chessman.tileY.wn = {8, 8}
    Chessman.texture.wb = love.graphics.newImage("Textures/Chessman/wb.png")
    Chessman.tileX.wb= {3, 6}
    Chessman.tileY.wb = {8, 8}
    Chessman.texture.wk = love.graphics.newImage("Textures/Chessman/wk.png")
    Chessman.tileX.wk = 5
    Chessman.tileY.wk = 8
    Chessman.texture.wq = love.graphics.newImage("Textures/Chessman/wq.png")
    Chessman.tileX.wq = 4
    Chessman.tileY.wq = 8
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
    for i = 1, 8, 1 do
        love.graphics.draw(Chessman.texture.bp, Chessman.tileX.bp[i] * Tiles.sizeX, Chessman.tileY.bp[i] * Tiles.sizeY)
    end
    for i = 1, 2, 1 do
        love.graphics.draw(Chessman.texture.br, Chessman.tileX.br[i] * Tiles.sizeX, Chessman.tileY.br[i] * Tiles.sizeY)
    end
    for i = 1, 2, 1 do
        love.graphics.draw(Chessman.texture.bn, Chessman.tileX.bn[i] * Tiles.sizeX, Chessman.tileY.bn[i] * Tiles.sizeY)
    end
    for i = 1, 2, 1 do
        love.graphics.draw(Chessman.texture.bb, Chessman.tileX.bb[i] * Tiles.sizeX, Chessman.tileY.bb[i] * Tiles.sizeY)
    end
    love.graphics.draw(Chessman.texture.bk, Chessman.tileX.bk * Tiles.sizeX, Chessman.tileY.bk * Tiles.sizeY)
    love.graphics.draw(Chessman.texture.bq, Chessman.tileX.bq * Tiles.sizeX, Chessman.tileY.bq * Tiles.sizeY)
    
    for i = 1, 8, 1 do
        love.graphics.draw(Chessman.texture.wp, Chessman.tileX.wp[i] * Tiles.sizeX, Chessman.tileY.wp[i] * Tiles.sizeY)
    end
    for i = 1, 2, 1 do
        love.graphics.draw(Chessman.texture.wr, Chessman.tileX.wr[i] * Tiles.sizeX, Chessman.tileY.wr[i] * Tiles.sizeY)
    end
    for i = 1, 2, 1 do
        love.graphics.draw(Chessman.texture.wn, Chessman.tileX.wn[i] * Tiles.sizeX, Chessman.tileY.wn[i] * Tiles.sizeY)
    end
    for i = 1, 2, 1 do
        love.graphics.draw(Chessman.texture.wb, Chessman.tileX.wb[i] * Tiles.sizeX, Chessman.tileY.wb[i] * Tiles.sizeY)
    end
    love.graphics.draw(Chessman.texture.wk, Chessman.tileX.wk * Tiles.sizeX, Chessman.tileY.wk * Tiles.sizeY)
    love.graphics.draw(Chessman.texture.wq, Chessman.tileX.wq * Tiles.sizeX, Chessman.tileY.wq * Tiles.sizeY)
end

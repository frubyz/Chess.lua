function love.load()
    Tiles = {}
    Tiles.posX = 0
    Tiles.posY = Tiles.posX
    Tiles.sizeX = 50
    Tiles.sizeY = Tiles.sizeX
    Tiles.color = {{0, 0, 0},{255, 255, 255}}
    Tiles.color.bg = {255, 255, 255, 0.1}

    Cursor = {}
    Cursor.pos = 0
    Cursor.tile = 0
    Cursor.selected = false
    Cursor.presssed = false

    Cursor2 = {}
    Cursor2.pos = 0
    Cursor2.tile = 0

    Chessman = {}
    Chessman[1] = {}
    Chessman[2]= {}
    Chessman[1].texture = {}
    Chessman[2].texture = {}
    Chessman.selected = {}

    Chessman[1].texture.p = love.graphics.newImage("Textures/Chessman/bp.png")
    Chessman[1].texture.r = love.graphics.newImage("Textures/Chessman/br.png")
    Chessman[1].texture.n = love.graphics.newImage("Textures/Chessman/bn.png")
    Chessman[1].texture.b = love.graphics.newImage("Textures/Chessman/bb.png")
    Chessman[1].texture.k = love.graphics.newImage("Textures/Chessman/bk.png")
    Chessman[1].texture.q = love.graphics.newImage("Textures/Chessman/bq.png")

    Chessman[2].texture.p = love.graphics.newImage("Textures/Chessman/wp.png")
    Chessman[2].texture.r = love.graphics.newImage("Textures/Chessman/wr.png")
    Chessman[2].texture.n = love.graphics.newImage("Textures/Chessman/wn.png")
    Chessman[2].texture.b = love.graphics.newImage("Textures/Chessman/wb.png")
    Chessman[2].texture.k = love.graphics.newImage("Textures/Chessman/wk.png")
    Chessman[2].texture.q = love.graphics.newImage("Textures/Chessman/wq.png")

    Chessman[1].coords = {{"K", 5, 1, false}, {"Q", 4, 1, false}, {"R", 1, 1, false}, {"R", 8, 1, false}, {"N", 2, 1, false}, {"N", 7, 1, false}, {"B", 3, 1, false}, {"B", 6, 1, false},
                          {"P", 1, 2, false}, {"P", 2, 2, false}, {"P", 3, 2, false}, {"P", 4, 2, false}, {"P", 5, 2, false}, {"P", 6, 2, false}, {"P", 7, 2, false}, {"P", 8, 2, false}}

    Chessman[2].coords = {{"K", 5, 8, false}, {"Q", 4, 8, false}, {"R", 1, 8, false}, {"R", 8, 8, false}, {"N", 2, 8, false}, {"N", 7, 8, false}, {"B", 3, 8, false}, {"B", 6, 8, false},
                          {"P", 1, 7, false}, {"P", 2, 7, false}, {"P", 3, 7, false}, {"P", 4, 7, false}, {"P", 5, 7, false}, {"P", 6, 7, false}, {"P", 7, 7, false}, {"P", 8, 7, false}}
end

function love.update(dt)
    if love.mouse.isDown(1) and Cursor.presssed == false and (Chessman.selected[1] and Chessman.selected[2]) == nil then

        Cursor.pos = {love.mouse.getPosition()}
        Cursor.tile = {math.floor(Cursor.pos[1] / Tiles.sizeX), math.floor(Cursor.pos[2] / Tiles.sizeY)}

        for i = 1, 2, 1 do
            for j = 1, 16, 1 do
                if Cursor.tile[1] == Chessman[i].coords[j][2] and Cursor.tile[2] == Chessman[i].coords[j][3] then
                    Chessman.selected = {i, j}
                end
            end
        end
                
    elseif love.mouse.isDown(1) and Cursor.presssed == false then

        Cursor.pos = {love.mouse.getPosition()}
        Cursor.tile = {math.floor(Cursor.pos[1] / Tiles.sizeX), math.floor(Cursor.pos[2] / Tiles.sizeY)}

        Chessman[Chessman.selected[1]].coords[Chessman.selected[2]][2] = Cursor.tile[1]
        Chessman[Chessman.selected[1]].coords[Chessman.selected[2]][3] = Cursor.tile[2]

        Chessman.selected = {}
       
    end

    if love.mouse.isDown(1) then
        Cursor.presssed = true
    else
        Cursor.presssed = false
    end
end

function love.draw()
    for x = 0, 9, 1 do
        for y = 0, 9, 1 do
            if (x == 9) or (x == 0) or (y == 9) or (y == 0) then
                love.graphics.setColor(Tiles.color.bg)
            elseif (x + y) % 2 == 1 then
                love.graphics.setColor(Tiles.color[1])
            else
                love.graphics.setColor(Tiles.color[2])
            end
            love.graphics.rectangle("fill", Tiles.posX + x * Tiles.sizeX, Tiles.posY + y * Tiles.sizeY, Tiles.sizeX, Tiles.sizeY)
        end
    end

    love.graphics.setColor(255, 255, 255, 1)

    for i = 1, 2, 1 do
        for j = 1, 16, 1 do
            if Chessman[i].coords[j][1] == "K" then
                love.graphics.draw(Chessman[i].texture.k, Chessman[i].coords[j][2] * Tiles.sizeX, Chessman[i].coords[j][3] * Tiles.sizeY)
            elseif Chessman[i].coords[j][1] == "Q" then
                love.graphics.draw(Chessman[i].texture.q, Chessman[i].coords[j][2] * Tiles.sizeX, Chessman[i].coords[j][3] * Tiles.sizeY)
            elseif Chessman[i].coords[j][1] == "R" then
                love.graphics.draw(Chessman[i].texture.r, Chessman[i].coords[j][2] * Tiles.sizeX, Chessman[i].coords[j][3] * Tiles.sizeY)
            elseif Chessman[i].coords[j][1] == "N" then
                love.graphics.draw(Chessman[i].texture.n, Chessman[i].coords[j][2] * Tiles.sizeX, Chessman[i].coords[j][3] * Tiles.sizeY)
            elseif Chessman[i].coords[j][1] == "B" then
                love.graphics.draw(Chessman[i].texture.b, Chessman[i].coords[j][2] * Tiles.sizeX, Chessman[i].coords[j][3] * Tiles.sizeY)
            elseif Chessman[i].coords[j][1] == "P" then
                love.graphics.draw(Chessman[i].texture.p, Chessman[i].coords[j][2] * Tiles.sizeX, Chessman[i].coords[j][3] * Tiles.sizeY)
            end
        end
    end
end

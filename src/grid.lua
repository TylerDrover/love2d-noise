grid = {}

local cols, rows
local map 

local freq, dist 

function grid.load()
    cols = love.graphics.getWidth() / 32
    rows = love.graphics.getHeight() / 32
    map = {}
    for col = 0,cols do
        map[col] = {}
        for row = 0,rows do 
            map[col][row] = {}
            map[col][row].color = {col*5/255, row*5/255, col+row/255, 1}
        end
    end

    freq = 0.25
    dist = 1
end

function grid.update(dt)
    mx,my = love.mouse.getPosition()
    if love.mouse.isDown(1) then
        if my >= 24 and my <= 32 then
            if mx >= 100 and mx <= 250 then
                freq = (mx - 100)/ (150*4)
            end
        end
        if my >= 54 and my <= 62 then
            if mx >= 100 and mx <= 250 then
                dist = (mx - 100)/ 75
            end
        end
    end

    for col = 0,cols do
        for row = 0,rows do 
            shade = math.pow(love.math.noise( col * freq, row * freq) + 0.5*love.math.noise(2* col * freq, 2* row * freq), dist)
            map[col][row].color = {shade, shade, shade, 1}
        end
    end

    if love.keyboard.isDown('`') then
        log.info('Shutting Down...')
        love.event.quit()
    end
end

function grid.draw()
    for col = 0,cols do
        for row = 0,rows do 
            love.graphics.setColor(map[col][row].color)
            love.graphics.rectangle('fill', col*32, row*32, 32, 32)
        end
    end

    -- Box
    love.graphics.setColor(1,1,1,1)
    love.graphics.rectangle('fill',  10, 10, 400, 100)

    -- Outline
    love.graphics.setColor(0.4,0.4,0.4,1)
    love.graphics.rectangle('line',  10, 10, 400, 100)
    -- Frequency
    love.graphics.print('frequency', 20, 20)
    love.graphics.line(100, 28, 250, 28)
    love.graphics.print(freq, 265, 20)
    -- Distribution
    love.graphics.print('distribution', 20, 50)
    love.graphics.line(100, 58, 250, 58)
    love.graphics.print(dist, 265, 50)
    -- 
    love.graphics.print('math.pow(love.math.noise( x * freq, y * freq), dist)', 20, 80)
    
    -- Circles
    love.graphics.circle('fill', freq*600+100, 28, 8)
    love.graphics.circle('fill', dist*75+100, 58, 8)

    love.graphics.setColor(1,1,1,1)
    love.graphics.circle('fill', freq*600+100, 28, 4)
    love.graphics.circle('fill', dist*75+100, 58, 4)
end
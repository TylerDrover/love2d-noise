log = require('utils.log')

require('src.grid')

DEBUG = true

function love.load()
    log.info('DIR Path: '..love.filesystem.getSaveDirectory())
    grid.load()
end


function love.update(dt)
    grid.update()
end

function love.draw()
    grid.draw()
end
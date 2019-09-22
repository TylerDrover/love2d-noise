local log = {}

function log.info(msg)
    if DEBUG then
        print("\27[32m[INFO]: "..msg.."\27[0m")
    end
end

function log.error(msg)
    if DEBUG then
        print("\27[31m[ERROR] "..msg.."\27[0m")
    end
end

function log.debug(msg)
    if DEBUG then
        print("\27[35m[DEBUG]  "..msg.."\27[0m")
    end
end

function log.screen(msg, x, y, w)
    if DEBUG then
        love.graphics.setColor(1,0,1,1)
        love.graphics.print(msg, x, y)
    end
end

return log
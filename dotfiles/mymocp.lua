-- A module of awesome-wm widget plugin for moc-player

local io = require('io')
local os = require('os')
local awful = require('awful')

local CMDS = {
    ["START"] = 'mocp --server && mocp --play',
    ["PLAY"]  = 'mocp --play',
    ["PAUSE"] = 'mocp --toggle-pause',
    ["NEXT"]  = 'mocp --next',
    ["PREV"]  = 'mocp --previous' ,
    ["STOP"]  = 'mocp --stop',
    ["INFO"]  = 'mocp --info',
    ["EXIT"]  = 'mocp --exit'
}

local mocp = { }

-- @text_wid: widget for update mocp state
-- @icon_wid: icon widget
function mocp:setup(icon_wid, text_wid)
    mocp.text_wid = text_wid
    mocp.icon_wid = icon_wid
end

function mocp:started()
    local fd = io.popen('pgrep mocp')
    local ran = fd:read('*a')

    fd:close()
    if ran == '' or ran == nil then
        return false
    else
        return true
    end
end

function mocp:state()
    local fd = {}
    local state = nil

    if mocp.started() then
        fd = io.popen(CMDS['INFO'])
        state = string.gsub(fd:read(), "State:%s*", "")
        fd:close()

        return string.lower( state )
    else
        -- Empty
        return ""
    end
end

function mocp:update_state()
    mocp.text_wid.text = mocp.state()
end

-- Play or next
function mocp:play()
    local running = mocp.started()
    if not running then
        os.execute( CMDS['START'] )
    end
    if running then
        os.execute(CMDS['NEXT'])
    end
    mocp.update_state()
end

function mocp:prev()
    if mocp.started() then
        os.execute(CMDS['PREV'])
        mocp.update_state()
    else
        mocp.play()
    end
end

function mocp:toggle()
    if mocp.started() then
        os.execute(CMDS['PAUSE'])
        mocp.update_state()
    else
        mocp.play()
    end
end

function mocp:exit()
    if mocp.started() then
        os.execute(CMDS['EXIT'])
        naughty.notify({
            title="mocp",
            text = "Shutting down mocp..."
        })
    end
    mocp.update_state()
end

return mocp

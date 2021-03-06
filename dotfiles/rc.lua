-- {{{ License
--
-- Awesome configuration, using awesome 3.4.10 on Ubuntu 11.10
--   * Tony N <tony@git-pull.com>
--
-- This work is licensed under the Creative Commons Attribution-Share
-- Alike License: http://creativecommons.org/licenses/by-sa/3.0/
-- based off Adrian C. <anrxc@sysphere.org>'s rc.lua
-- }}}


-- {{{ Libraries
require("awful")
require("awful.rules")
require("awful.autofocus")
require("naughty")
-- User libraries
require("vicious") -- ./vicious
require("helpers") -- helpers.lua
require('teardrop')
-- }}}

-- {{{ Default configuration
altkey = "Mod1"
modkey = "Mod4" -- your windows/apple key

terminal = whereis_app('urxvtcd') and 'urxvtcd' or 'x-terminal-emulator' -- also accepts full path
editor = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor
chrome = 'google-chrome'
gvim = 'gvim'
emacs = 'emacs'
gitg = 'gitg'
xscreensaver = 'xscreensaver-command -lock'

wallpaper_app = "feh" -- if you want to check for app before trying
wallpaper_dir = os.getenv("HOME") .. "/Dropbox/media/wallpapers" -- wallpaper dir

-- taglist numerals
--- arabic, chinese, {east|persian}_arabic, roman, thai, random
taglist_numbers = "chinese" -- we support arabic (1,2,3...),

cpugraph_enable = true -- Show CPU graph
cputext_format = " $1%" -- %1 average cpu, %[2..] every other thread individually

membar_enable = true -- Show memory bar
memtext_format = " $1%" -- %1 percentage, %2 used %3 total %4 free

date_format = "%a %m/%d/%Y %l:%M%p" -- refer to http://en.wikipedia.org/wiki/Date_(Unix) specifiers

local function get_networks()
    local ret = {}
    for line in io.lines('/proc/net/dev') do
        local name = string.match(line, "^[%s]?[%s]?[%s]?[%s]?([%w]+):")
        if name ~= nil and name ~= 'lo' then
            table.insert(ret, name)
        end
    end
    return ret
end
local networks = get_networks()

require_safe('personal')

-- Create personal.lua in this same directory to override these defaults


-- }}}

-- {{{ Variable definitions
local wallpaper_cmd = "find " .. wallpaper_dir .. " -type f -name '*.jpg'  -print0 | shuf -n1 -z | xargs -0 feh --bg-scale"
local home   = os.getenv("HOME")
local exec   = awful.util.spawn
local sexec  = awful.util.spawn_with_shell

-- Beautiful theme
beautiful.init(awful.util.getdir("config") .. "/themes/zhongguo/zhongguo.lua")

-- Window management layouts
layouts = {
  awful.layout.suit.tile,
  awful.layout.suit.tile.bottom,
  awful.layout.suit.tile.top,
  awful.layout.suit.spiral,
  --awful.layout.suit.fair,
  awful.layout.suit.max,
  awful.layout.suit.magnifier,
  --awful.layout.suit.floating
}
-- }}}

-- {{{ Tags

-- Taglist numerals
taglist_numbers_langs = { 'arabic', 'tagged', 'chinese', 'east_arabic', 'persian_arabic', }
taglist_numbers_sets = {
	arabic={ 1, 2, 3, 4, 5, 6, 7, 8, 9 },
	tagged={ '1@', '2#', '3!', '4+', 5, 6, 7, 8, 9 },
	chinese={"一", "二", "三", "四", "五", "六", "七", "八", "九", "十"},
	east_arabic={'١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'}, -- '٠' 0
	persian_arabic={'٠', '١', '٢', '٣', '۴', '۵', '۶', '٧', '٨', '٩'},
	roman={'I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX', 'X'},
	thai={'๑', '๒', '๓', '๔', '๕', '๖', '๗', '๘', '๙', '๑๐'},
}
-- }}}

tags = {}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
      --tags[s] = awful.tag({"一", "二", "三", "四", "五", "六", "七", "八", "九", "十"}, s, layouts[1])
      --tags[s] = awful.tag(taglist_numbers_sets[taglist_numbers], s, layouts[1])
	if taglist_numbers == 'random' then
		math.randomseed(os.time())
		local taglist = taglist_numbers_sets[taglist_numbers_langs[math.random(table.getn(taglist_numbers_langs))]]
		tags[s] = awful.tag(taglist, s, layouts[1])
	else
		tags[s] = awful.tag(taglist_numbers_sets[taglist_numbers], s, layouts[1])
	end
    --tags[s] = awful.tag({ 1, 2, 3, 4, 5, 6, 7, 8, 9 }, s, layouts[1])
end
-- }}}


-- {{{ Wibox
--
-- {{{ Widgets configuration
--
-- {{{ Reusable separator
separator = widget({ type = "imagebox" })
separator.image = image(beautiful.widget_sep)

spacer = widget({ type = "textbox" })
spacer.width = 3
-- }}}

-- {{{ CPU usage

-- cpu icon
cpuicon = widget({ type = "imagebox" })
cpuicon.image = image(beautiful.widget_cpu)

-- check for cpugraph_enable == true in config
if cpugraph_enable then
	-- Initialize widget
	cpugraph  = awful.widget.graph()

	-- Graph properties
	cpugraph:set_width(40):set_height(16)
	cpugraph:set_background_color(beautiful.fg_off_widget)
	cpugraph:set_gradient_angle(0):set_gradient_colors({
	   beautiful.fg_end_widget, beautiful.fg_center_widget, beautiful.fg_widget
	})

	-- Register graph widget
	vicious.register(cpugraph,  vicious.widgets.cpu,      "$1")
end

-- cpu text widget
cpuwidget = widget({ type = "textbox" }) -- initialize
vicious.register(cpuwidget, vicious.widgets.cpu, cputext_format, 3) -- register

-- temperature
tzswidget = widget({ type = "textbox" })
vicious.register(tzswidget, vicious.widgets.thermal,
	function (widget, args)
		if args[1] > 0 then
			tzfound = true
			return " " .. args[1] .. "C°"
		else return ""
		end
	end
	, 19, "thermal_zone0")

-- }}}

-- {{{ cpu freq
cpufreq_widget = widget({ type = "textbox" })
vicious.register(cpufreq_widget,  function ()
    local f = { cpu0 = 0, cpu1 = 0, cpu2 = 0, cpu3 = 0 }

    for k, _ in pairs(f) do
        f[k] = math.floor(vicious.widgets.cpufreq('', k)[1]/100)
    end

    return "<span color='yellow'>"..f.cpu0.."</span>"..f.cpu1 .."<span color='yellow'>"..f.cpu2 .."</span>"..f.cpu3

    end, 10)
-- }}}
--

-- taskbar {{{
taskbar = {}
taskbar.buttons = awful.util.table.join(
awful.button({ }, 1, function (c)
    if c == client.focus then
        c.minimized = true
    else
        if not c:isvisible() then
            local tag = awful.tag.selected()
            awful.tag.viewonly(tag)
        end
        -- This will also un-minimize
        -- the client, if needed
        client.focus = c
        c:raise()
    end
end),

awful.button({ }, 3, function ()
    if instance then
        instance:hide()
        instance = nil
    else
        instance = awful.menu.clients({ width=250 })
    end
end),
awful.button({ }, 4, function ()
    awful.client.focus.byidx(1)
    if client.focus then client.focus:raise() end
end),
awful.button({ }, 5, function ()
    awful.client.focus.byidx(-1)
    if client.focus then client.focus:raise() end
end))


--}}}

--{{{
myawesomemenu = {
    { "manual", terminal .. " -e man awesome" },
    { "edit config", "gvim ~/.config/awesome/rc.lua" },
    { "restart", awesome.restart },
    { "quit", awesome.quit }
}

mymainmenu = awful.menu.new({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
{ "open terminal", terminal },
{ "chrome","google-chrome" },
{ "gvim", "gvim" },
{ "emacs", "emacs" },
{ "gimp", "gimp" },
{ "firefox", "firefox" },
{ "monitor", "gnome-system-monitor" },
{ "pdf", "evince" }
}})
--}}}

-- {{{ Battery state

-- Initialize widget
batwidget = widget({ type = "textbox" })
baticon = widget({ type = "imagebox" })

-- Register widget
vicious.register(batwidget, vicious.widgets.bat,
	function (widget, args)
		if args[2] == 0 then return ""
		else
			baticon.image = image(beautiful.widget_bat)
            if args[2] < 40 then
                baticon.image = image(beautiful.widget_bat_low)
            end

            if args[1] == '-' or args[1] == '+' then
                -- dynamically change the background color by power status
                local red_value = ( (100 - args[2]) / 100 * (0xff - 0x3f) ) + 0x3f;
                batwidget.bg = string.format('#%0.2x3f3f', red_value)
            end

            -- battery is full of charge
            if args[3] == "N/A" then
                return "<span color='green'>".. args[1] .. args[2] .. "%</span>"
            else
                -- power is low.
                if args[2] <= 30 and args[1] == '-' and ( args[2] % 5 ) == 0 then
                    naughty.notify{
                        preset = naughty.config.presets.critical,
                        title = "电量警报",
                        text = '电池电量只剩下 ' .. args[2] .. '% 了！',
                    }
                end
                return ''..args[1] .. args[2] .. "%@" .. args[3]
            end
		end
	end, 61, "BAT0"
)
-- }}}


-- {{{ Memory usage

-- icon
memicon = widget({ type = "imagebox" })
memicon.image = image(beautiful.widget_mem)

if membar_enable then
	-- Initialize widget
	membar = awful.widget.progressbar()
	-- Pogressbar properties
	membar:set_vertical(true):set_ticks(true)
	membar:set_height(16):set_width(8):set_ticks_size(2)
	membar:set_background_color(beautiful.fg_off_widget)
	membar:set_gradient_colors({ beautiful.fg_widget,
	   beautiful.fg_center_widget, beautiful.fg_end_widget
	}) -- Register widget
	vicious.register(membar, vicious.widgets.mem, "$1", 13)
end

-- mem text output
memtext = widget({ type = "textbox" })
vicious.register(memtext, vicious.widgets.mem, memtext_format, 13)
-- }}}

-- {{{ File system usage
fsicon = widget({ type = "imagebox" })
fsicon.image = image(beautiful.widget_fs)
-- Initialize widgets
fs = {
  r = awful.widget.progressbar(), s = awful.widget.progressbar()
}
-- Progressbar properties
for _, w in pairs(fs) do
  w:set_vertical(true):set_ticks(true)
  w:set_height(16):set_width(5):set_ticks_size(2)
  w:set_border_color(beautiful.border_widget)
  w:set_background_color(beautiful.fg_off_widget)
  w:set_gradient_colors({ beautiful.fg_widget,
     beautiful.fg_center_widget, beautiful.fg_end_widget
  }) -- Register buttons
  w.widget:buttons(awful.util.table.join(
    awful.button({ }, 1, function () exec("dolphin", false) end)
  ))
end -- Enable caching
vicious.cache(vicious.widgets.fs)
-- Register widgets
vicious.register(fs.r, vicious.widgets.fs, "${/ used_p}",            599)
vicious.register(fs.s, vicious.widgets.fs, "${/media/files used_p}", 599)
-- }}}

-- {{{ Network usage
function print_net(name, down, up)
    return '<span color="'
    .. beautiful.fg_netdn_widget ..'">' .. down .. '</span> <span color="'
    .. beautiful.fg_netup_widget ..'">' .. up  .. '</span>'
end

dnicon = widget({ type = "imagebox" })
upicon = widget({ type = "imagebox" })

-- Initialize widget
netwidget = widget({ type = "textbox" })
-- Register widget
vicious.register(netwidget, vicious.widgets.net,
function (widget, args)
    local carrier = nil
    for _,device in pairs(networks) do
        carrier = tonumber(args["{".. device .." carrier}"])
        if  carrier and carrier > 0 then
            netwidget.found = true
            dnicon.image = image(beautiful.widget_net)
            upicon.image = image(beautiful.widget_netup)
            return print_net(device, args["{"..device .." down_kb}"], args["{"..device.." up_kb}"])
        end
    end
end, 3)
-- }}}



-- {{{ Volume level
volicon = widget({ type = "imagebox" })
volicon.image = image(beautiful.widget_vol)
-- Initialize widgets
volbar    = awful.widget.progressbar()
volwidget = widget({ type = "textbox" })
-- Progressbar properties
volbar:set_vertical(true):set_ticks(true)
volbar:set_height(16):set_width(8):set_ticks_size(2)
volbar:set_background_color(beautiful.fg_off_widget)
volbar:set_gradient_colors({ beautiful.fg_widget,
   beautiful.fg_center_widget, beautiful.fg_end_widget
}) -- Enable caching
vicious.cache(vicious.widgets.volume)
-- Register widgets
vicious.register(volbar,    vicious.widgets.volume,  "$1",  2, "Master")
vicious.register(volwidget, vicious.widgets.volume, function (widget, args)
    -- Mute
    volicon.image = ( args[2] == "♩" and image(beautiful.widget_mute) ) or image(beautiful.widget_vol)
    return " "..args[1].."%"
end, 2, "Master")
-- Register buttons
function volume_control(dir)
    local func = function ()
        exec("amixer -q set Master 1%"..dir, false)
        vicious.force({volbar, volwidget})
    end
    return func
end
function volumetoggle() 
    exec("amixer -D pulse set Master 1+ toggle")
    local master = io.popen('amixer sget Master')
    local isoff = string.find(master:read('*a'), 'off')
    if isoff == nil then
        volicon.image = image(beautiful.widget_mute)
    else
        volicon.image = image(beautiful.widget_vol)
    end
    master:close()
end

volbar_buttons = awful.util.table.join(
   awful.button({ }, 1, volumetoggle),
   awful.button({ }, 4, volume_control('+')),
   awful.button({ }, 5, volume_control('-'))
)

volbar.widget:buttons(volbar_buttons) -- Register assigned buttons
volwidget:buttons(volbar_buttons)
volicon:buttons(volbar_buttons)
-- }}}

-- {{{mocp widget
mocp_icon = widget({ type = 'imagebox' })
mocp_icon.image = image(beautiful.widget_music)
mocp_txt = widget({ type = 'textbox' })
mocp_txt.text = ''   -- hidden

mocp = require('mymocp')
mocp.setup(mocp_icon, mocp_txt)
-- setup
-- mocp.icon_wid = mocp_icon
-- mocp.text_wid = mocp_txt

mocp_buttons = awful.util.table.join(
    awful.button({  }, 1, mocp.play),
    awful.key({  }, "XF86AudioNext", mocp.play),
    awful.button({  }, 2, mocp.toggle),
    awful.key({  }, "XF86AudioPlay", mocp.toggle),
    awful.button({ modkey }, 2, mocp.exit),
    awful.button({  }, 3, mocp.prev),
    awful.key({  }, "XF86AudioPrev", mocp.prev)
)

mocp_icon:buttons(mocp_buttons)
mocp_txt:buttons(mocp_buttons)
-- }}}


-- {{{ Date and time
dateicon = widget({ type = "imagebox" })
dateicon.image = image(beautiful.widget_date)
-- Initialize widget
datewidget = widget({ type = "textbox" })
-- Register widget
vicious.register(datewidget, vicious.widgets.date, date_format, 61)
require('calendar2')
calendar2.addCalendarToWidget(datewidget)
-- }}}

-- {{{ Gmail checker
gmailicon = widget({ type = "imagebox" })
gmailicon.image = image(beautiful.widget_mail)
-- Initialize widget
gmailwidget = widget({ type = "textbox" })
-- Register widget
gmail_buttons = awful.button({ }, 1, function ()
       awful.util.spawn('xdg-open https://mail.google.com/mail/u/0/#inbox')
   end)
gmailicon:buttons(gmail_buttons)
gmailwidget:buttons(gmail_buttons)
vicious.register(gmailwidget, vicious.widgets.gmail,  "<span color='yellow'>${count}</span>", 120)
-- }}}

-- {{{ mpd

if whereis_app('curl') and whereis_app('mpd') then
	mpdwidget = widget({ type = "textbox" })
	vicious.register(mpdwidget, vicious.widgets.mpd,
		function (widget, args)
			if args["{state}"] == "Stop" or args["{state}"] == "Pause" or args["{state}"] == "N/A"
				or (args["{Artist}"] == "N/A" and args["{Title}"] == "N/A") then return ""
			else return '<span color="white">музыка:</span> '..
			     args["{Artist}"]..' - '.. args["{Title}"]
			end
		end
	)
end

-- }}}


-- {{{ System tray
systray = widget({ type = "systray" })
-- }}}
-- }}}

-- {{{ Wibox initialisation
wibox     = {}
promptbox = {}
layoutbox = {}
taglist   = {}
taglist.buttons = awful.util.table.join(
    awful.button({ },        1, awful.tag.viewonly),
    awful.button({ modkey }, 1, awful.client.movetotag),
    awful.button({ },        3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, awful.client.toggletag),
    awful.button({ },        4, awful.tag.viewnext),
    awful.button({ },        5, awful.tag.viewprev
))


for s = 1, screen.count() do
    -- Create a promptbox
    promptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
    -- Create a layoutbox
    layoutbox[s] = awful.widget.layoutbox(s)
    layoutbox[s]:buttons(awful.util.table.join(
        awful.button({ }, 1, function () awful.layout.inc(layouts,  1) end),
        awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
        awful.button({ }, 4, function () awful.layout.inc(layouts,  1) end),
        awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)
    ))

    -- Create the taglist
    taglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, taglist.buttons)

    -- Create a tasklist widget
    taskbar[s] = awful.widget.tasklist(function(c)
        return awful.widget.tasklist.label.currenttags(c, s)
                                          end, taskbar.buttons)

    -- Create the wibox
    wibox[s] = awful.wibox({      screen = s,
        fg = beautiful.fg_normal, height = 16,
        bg = beautiful.bg_normal, position = "top",
        border_color = beautiful.border_normal,
        border_width = beautiful.border_width
    })
    -- Add widgets to the wibox
    wibox[s].widgets = {
        {   taglist[s], layoutbox[s], separator, promptbox[s],
            mpdwidget and spacer, mpdwidget or nil,
            ["layout"] = awful.widget.layout.horizontal.leftright
        },
        --s == screen.count() and systray or nil, -- show tray on last screen
        s == 1 and systray or nil, -- only show tray on first screen
        s == 1 and separator or nil, -- only show on first screen
        datewidget, dateicon,
        gmailwidget, gmailicon,
        baticon.image and separator, batwidget, baticon or nil,
        separator, mocp_txt, mocp_icon, separator,volwidget,  volbar.widget, volicon,
        dnicon.image and separator, upicon, netwidget, dnicon or nil,
        separator, fs.r.widget, fs.s.widget, fsicon,
        separator, memtext, membar_enable and membar.widget or nil, memicon,
        separator, tzfound and tzswidget or nil,
        cpugraph_enable and cpugraph.widget or nil, cpuwidget, cpuicon,
        cpufreq_widget,
        taskbar[s],
        ["layout"] = awful.widget.layout.horizontal.rightleft
    }
end
-- }}}
-- }}}


-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))

-- Client bindings
clientbuttons = awful.util.table.join(
    awful.button({ },        1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize)
)
-- }}}

local function setToAllClients( prop, value )
    local clts = awful.tag.selected():clients()
    for i = 1, #clts do
        clts[i][prop] = value
    end
end
-- {{{ Key bindings
globalkeys = awful.util.table.join(
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "w", function () mymainmenu:show({keygrabber=true}) end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ }, "XF86AudioRaiseVolume", function () awful.util.spawn("amixer set Master 9%+", false) end),
    awful.key({ }, "XF86AudioLowerVolume", function () awful.util.spawn("amixer set Master 9%-", false) end),
    awful.key({ }, "XF86AudioMute", volumetoggle),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

    -- toggle only focusing client
    awful.key({ modkey, }, "o",
        function ()
            local clients = awful.client.visible()
            if #clients <= 1 then
                setToAllClients('minimized', false)
            else
                for i = 1, #clients do
                    if client.focus ~= clients[i] then
                        clients[i].minimized = true
                    end
                end
            end
        end
    ),

    -- show all clients in selected tag
    awful.key({ modkey }, "a",
        function ()
            setToAllClients('minimized', false)
        end
    ),

    -- hide focus client
    awful.key({ modkey, }, "n", 
    function()
        client.focus.minimized = true
    end),

    -- Standard program
    awful.key({ modkey, "Shift"   }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey,           }, ",",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey,           }, ".",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

    awful.key({ modkey }, "b", function ()
         wibox[mouse.screen].visible = not wibox[mouse.screen].visible
    end),
    awful.key({ modkey }, "p", function ()
        teardrop('urxvt', 'bottom', 'center', 600, 230, true)
    end),
    awful.key({ modkey }, "i", function ()
        teardrop('gvim', 'bottom', 'center', 600, 400, true)
    end),

    -- Prompt
    awful.key({ modkey },            "r",     function () promptbox[mouse.screen]:run() end),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  promptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end),
    -- custum
    awful.key({ modkey, "Control"   }, "g", function () awful.util.spawn(gitg) end),
    awful.key({ modkey,           }, "v", function () awful.util.spawn(gvim) end),
    awful.key({ modkey,           }, "e", function () awful.util.spawn(emacs) end),
    awful.key({ modkey,           }, "g", function () awful.util.spawn(chrome) end),
    awful.key({ modkey, "Control" }, "l", function () os.execute(xscreensaver) end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey,           }, "t",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Shift" }, "t", function (c)
        if   c.titlebar then awful.titlebar.remove(c)
           else awful.titlebar.add(c, { modkey = modkey }) end
    end),
    awful.key({ modkey,           }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey, "Shift"   }, "r",      function (c) c:redraw()                       end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber));
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        if tags[screen][i] then
                            awful.tag.viewonly(tags[screen][i])
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      if tags[screen][i] then
                          awful.tag.viewtoggle(tags[screen][i])
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.movetotag(tags[client.focus.screen][i])
                      end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.toggletag(tags[client.focus.screen][i])
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}


-- {{{ Rules
awful.rules.rules = {
    { rule = { }, properties = {
      focus = true,      size_hints_honor = false,
      keys = clientkeys, buttons = clientbuttons,
      border_width = beautiful.border_width,
      border_color = beautiful.border_normal }
    },
    { rule = { class = "ROX-Filer" },   properties = { floating = true } },
    { url= { class="gvim" }, properties = { opacity = 0.8 } }
}
-- }}}


-- {{{ Signals
--
-- {{{ Manage signal handler
client.add_signal("manage", function (c, startup)
    -- Add titlebar to floaters, but remove those from rule callback
    if awful.client.floating.get(c)
    or awful.layout.get(c.screen) == awful.layout.suit.floating then
        if   c.titlebar then awful.titlebar.remove(c)
        else awful.titlebar.add(c, {modkey = modkey}) end
    end

    -- Enable sloppy focus
    c:add_signal("mouse::enter", function (c)
        if  awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
        and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    -- Client placement
    if not startup then
        awful.client.setslave(c)

        if  not c.size_hints.program_position
        and not c.size_hints.user_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end
end)
-- }}}

-- {{{ Focus signal handlers
client.add_signal("focus",   function (c) c.border_color = beautiful.border_focus  end)
client.add_signal("unfocus", function (c) c.border_color = beautiful.border_normal end)
-- }}}

-- {{{ Arrange signal handler
for s = 1, screen.count() do screen[s]:add_signal("arrange", function ()
    local clients = awful.client.visible(s)
    local layout = awful.layout.getname(awful.layout.get(s))

    for _, c in pairs(clients) do -- Floaters are always on top
        if   awful.client.floating.get(c) or layout == "floating"
        then if not c.fullscreen then c.above       =  true  end
        else                          c.above       =  false end
    end
  end)
end
-- }}}
-- }}}

x = 0

-- setup the timer
wptimer = timer { timeout = x }
wptimer:add_signal("timeout", function()

  -- tell awsetbg to randomly choose a wallpaper from your wallpaper directory
  if file_exists(wallpaper_dir) and whereis_app('feh') then
	  os.execute(wallpaper_cmd)
  end
  -- stop the timer (we don't need multiple instances running at the same time)
  wptimer:stop()

  -- define the interval in which the next wallpaper change should occur in seconds
  -- (in this case anytime between 10 and 20 minutes)
  x = math.random( 600, 1200)

  --restart the timer
  wptimer.timeout = x
  wptimer:start()
end)

-- initial start when rc.lua is first run
wptimer:start()

require_safe('autorun')
sexec('dropbox start -i')
-- sexec('conky')
sexec('xscreensaver -no-splash')
sexec("/home/unclebill/Downloads/shadowsocks-local-linux32 /home/unclebill/Downloads/config.json &")
-- sexec("python /home/unclebill/projects/goagent/local/proxy.py $1 > /dev/null 2>&1")
--sexec('indicator-cpufreq')
--sexec('everpad')
-- run_once('jupiter')
run_once('stardict -h')
-- bind PrintScrn to capture a screen
awful.key(
   {},
   "Print",
   function()
       awful.util.spawn_with_shell("import -window root -quality 98 ~/Downloads/screen-$(date +%m-%d-%y).png")
   end
)

-- send a foretune adage.
sexec('__fortune=$(fortune) && notify-send "$__fortune" -u normal')

-- run once
function run_once(prg)
    if not prg then
        do return nil end
    end
    sexec("pgrep -f " .. prg .. " || (" .. prg .. ")")
end
--run_once('sh /home/unclebill/Dropbox/media/wallpapers/nasaBackground.sh')
-- vim:fdm=marker

--[[

     Multicolor Awesome WM theme 2.0
     github.com/lcpz

--]]

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")

-- Volume Arc widget
local volumearc_widget = require("awesome-wm-widgets.volumearc-widget.volumearc")

-- Volume Bar widget
local volumebar_widget = require("awesome-wm-widgets.volumebar-widget.volumebar")

-- Brightness Arc widget
local brightnessarc_widget = require("awesome-wm-widgets.brightnessarc-widget.brightnessarc")

-- Brightness widget
local brightness_widget = require("awesome-wm-widgets.brightness-widget.brightness")

-- Batter widget
local battery_widget = require("awesome-wm-widgets.battery-widget.battery")

-- Batteryarc Widget
local batteryarc_widget = require("awesome-wm-widgets.batteryarc-widget.batteryarc")

-- Calendar Widget
local calendar_widget = require("awesome-wm-widgets.calendar-widget.calendar")

-- Filesystem Widget
local fs_widget = require("awesome-wm-widgets.fs-widget.fs-widget")

-- Spotify Widget
-- local spotify_widget = require("awesome-wm-widgets.spotify-widget.spotify")

-- Logout Widget
-- local logout = require("awesome-wm-widgets.logout-widget.logout")

-- For powerline separators
local separators = lain.util.separators

local os = os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local theme                                     = {}
theme.confdir                                   = os.getenv("HOME") .. "/.config/awesome/themes/custom"
theme.multicolor_icons                          = os.getenv("HOME") .. "/.config/awesome/themes/multicolor"
-- theme.wallpaper                                 = theme.confdir .. "/starwars.jpg"
theme.font                                      = "Mononoki Nerd Font 9"
theme.taglist_font                              = "Droid Sans Bold 7"
theme.fg_normal                                 = "#ffffff"
theme.fg_focus                                  = "#A77AC4"
theme.fg_urgent                                 = "#b74822"
theme.bg_normal                                 = "#282a36"
theme.bg_focus                                  = "#7197E7"
theme.bg_urgent                                 = "#3F3F3F"
theme.taglist_fg_focus                          = "#282a36"
theme.tasklist_bg_focus                         = "#000000"
theme.tasklist_fg_focus                         = "#A77AC4"
theme.border_width                              = 2
theme.border_normal                             = "#282a36"
theme.border_focus                              = "#F07178"
theme.border_marked                             = "#CC9393"
theme.titlebar_bg_focus                         = "#3F3F3F"
theme.titlebar_bg_normal                        = "#3F3F3F"
theme.titlebar_bg_focus                         = theme.bg_focus
theme.titlebar_bg_normal                        = theme.bg_normal
theme.titlebar_fg_focus                         = theme.fg_focus
theme.menu_height                               = 20
theme.menu_width                                = 140
theme.menu_submenu_icon                         = theme.confdir .. "/icons/submenu.png"
theme.menu_fg_normal                            = "#aaaaaa"
theme.menu_fg_focus                             = "#ff8c00"
theme.menu_bg_normal                            = "#050505dd"
theme.menu_bg_focus                             = "#050505dd"
theme.widget_temp                               = theme.confdir .. "/icons/thermometer.svg"
theme.widget_uptime                             = theme.multicolor_icons .. "/icons/ac.png"
theme.widget_cpu                                = theme.multicolor_icons .. "/icons/cpu.png"
theme.widget_weather                            = theme.multicolor_icons .. "/icons/dish.png"
theme.widget_fs                                 = theme.confdir .. "/icons/fs.png"
theme.widget_mem                                = theme.multicolor_icons .. "/icons/mem.png"
theme.widget_netdown                            = theme.multicolor_icons .. "/icons/net_down.png"
theme.widget_netup                              = theme.multicolor_icons .. "/icons/net_up.png"
theme.widget_mail                               = theme.multicolor_icons .. "/icons/mail.png"
theme.widget_batt                               = theme.multicolor_icons .. "/icons/bat.png"
theme.widget_clock                              = theme.multicolor_icons .. "/icons/clock.png"
theme.widget_vol                                = theme.confdir .. "/icons/vol.png"
theme.widget_music                              = theme.confdir .. "/icons/note.png"
theme.widget_music_on                           = theme.confdir .. "/icons/note.png"
theme.widget_music_pause                        = theme.confdir .. "/icons/pause.png"
theme.widget_music_stop                         = theme.confdir .. "/icons/stop.png"
theme.taglist_squares_sel                       = theme.confdir .. "/icons/square_a.png"
theme.taglist_squares_unsel                     = theme.confdir .. "/icons/square_b.png"
theme.taglist_spacing                           = 6
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = false
theme.useless_gap                               = 2
theme.layout_tile                               = theme.confdir .. "/icons/tile.png"
theme.layout_tilegaps                           = theme.confdir .. "/icons/tilegaps.png"
theme.layout_tileleft                           = theme.confdir .. "/icons/tileleft.png"
theme.layout_tilebottom                         = theme.confdir .. "/icons/tilebottom.png"
theme.layout_tiletop                            = theme.confdir .. "/icons/tiletop.png"
theme.layout_fairv                              = theme.confdir .. "/icons/fairv.png"
theme.layout_fairh                              = theme.confdir .. "/icons/fairh.png"
theme.layout_spiral                             = theme.confdir .. "/icons/spiral.png"
theme.layout_dwindle                            = theme.confdir .. "/icons/dwindle.png"
theme.layout_max                                = theme.confdir .. "/icons/max.png"
theme.layout_fullscreen                         = theme.confdir .. "/icons/fullscreen.png"
theme.layout_magnifier                          = theme.confdir .. "/icons/magnifier.png"
theme.layout_floating                           = theme.confdir .. "/icons/floating.png"
theme.titlebar_close_button_normal              = theme.confdir .. "/icons/titlebar/close_normal.png"
theme.titlebar_close_button_focus               = theme.confdir .. "/icons/titlebar/close_focus.png"
theme.titlebar_minimize_button_normal           = theme.confdir .. "/icons/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus            = theme.confdir .. "/icons/titlebar/minimize_focus.png"
theme.titlebar_ontop_button_normal_inactive     = theme.confdir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive      = theme.confdir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active       = theme.confdir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active        = theme.confdir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_sticky_button_normal_inactive    = theme.confdir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive     = theme.confdir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active      = theme.confdir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active       = theme.confdir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_floating_button_normal_inactive  = theme.confdir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive   = theme.confdir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active    = theme.confdir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active     = theme.confdir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_maximized_button_normal_inactive = theme.confdir .. "/icons/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = theme.confdir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active   = theme.confdir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active    = theme.confdir .. "/icons/titlebar/maximized_focus_active.png"

local markup = lain.util.markup

beautiful.awesome_icon = theme.confdir .. "/icons/arch.png"
mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })

-- Battery Widget
bat_widget = battery_widget({
    show_current_level          = true,
    display_notification        = true,
})

-- Volume Arc config
local volarc = volumearc_widget({
    main_color = '#FFFFFF',
    mute_color = '#ff0000',
    path_to_icon = "/usr/share/icons/Arc/status/symbolic/audio-volume-high-symbolic.svg",
    thickness = 3,
    height = 25,
    get_volume_cmd = "amixer sget Master",
    inc_volume_cmd = "amixer set Master 5%+",
    dec_volume_cmd = "amixer set Master 5%-",
    button_press = function(_, _, _, button)   -- Overwrites the button press behaviour to open pavucontrol when clicked
        if (button == 1) then awful.spawn('pavucontrol --tab=3', false)
        end
    end
})

-- Volume Bar config
local volicon = wibox.widget.imagebox(theme.widget_vol)
local volbar = volumebar_widget({
    main_color = '#FFFFFF',
    mute_color = '#ff0000',
    path_to_icon = "/usr/share/icons/Arc/status/symbolic/audio-volume-high-symbolic.svg",
    width = 80,
    get_volume_cmd = "amixer sget Master",
    inc_volume_cmd = "amixer set Master 5%+",
    dec_volume_cmd = "amixer set Master 5%-",
    shape = 'rounded_bar', -- octogon, hexagon, powerline, etc
    -- bar's height = wibar's height minus 2x margins
    margins = 8
})

-- Brightness arc widget
local brightarc = brightnessarc_widget({
    get_brightness_cmd = 'light -G',
    inc_brightness_cmd = 'light -A 5',
    dec_brightness_cmd = 'light -U 5',
    path_to_icon = theme.confdir .. "/icons/brighness-7.svg"
})

-- Brightness widget
local bright = brightness_widget({
    get_brightness_cmd = 'light -G',
    inc_brightness_cmd = 'light -A 1',
    dec_brightness_cmd = 'light -U 1',
})
bright:connect_signal("button::press", 
    function(_, _, _, button)
        if button == 1 then
            awful.spawn.with_shell("light -S 100")
        end
        if button == 2 then
            awful.spawn.with_shell("light -S 0")
        end
    end
)

-- Textclock
os.setlocale(os.getenv("LANG")) -- to localize the clock
local mytextclock = wibox.widget.textclock()

-- Create a textclock widget
-- default
local cw = calendar_widget()
mytextclock:connect_signal("button::press", 
    function(_, _, _, button)
        if button == 1 then cw.toggle() end
    end
)

-- Weather
local weathericon = wibox.widget.imagebox(theme.widget_weather)
theme.weather = lain.widget.weather({
    city_id = 1706090, -- Lipa City
    notification_preset = { font = "Noto Sans Mono Medium 10", fg = theme.fg_normal },
    weather_na_markup = markup.fontfg(theme.font, "#FFFFFF", "N/A "),
    settings = function()
        descr = weather_now["weather"][1]["description"]:lower()
        units = math.floor(weather_now["main"]["temp"])
        widget:set_markup(markup.fontfg(theme.font, "#FFFFFF", descr .. " @ " .. units .. "°C "))
    end
})

-- CPU widget
local cpu_widget = require("awesome-wm-widgets.cpu-widget.cpu-widget")

-- Filesystem widget
local fsicon = wibox.widget.imagebox(theme.widget_fs)

-- CPU
local cpuicon = wibox.widget.imagebox(theme.widget_cpu)
local cpu = lain.widget.cpu({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, "#e33a6e", cpu_now.usage .. "% "))
    end
})

-- Coretemp
local tempicon = wibox.widget.imagebox(theme.widget_temp)
local temp = lain.widget.temp({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, "#f1af5f", coretemp_now .. "°C "))
    end
})

-- ALSA volume
-- theme.volume = lain.widget.alsa({
--     settings = function()
--         if volume_now.status == "off" then
--             volume_now.level = volume_now.level .. "M"
--         end

--         widget:set_markup(markup.fontfg(theme.font, "#7493d2", volume_now.level .. "% "))
--     end
-- })

-- Spotify
-- local spt_widget = spotify_widget({
--     font = 'Ubuntu Mono 9',
--     play_icon = '/usr/share/icons/Papirus-Light/24x24/categories/spotify.svg',
--     pause_icon = '/usr/share/icons/Papirus-Dark/24x24/panel/spotify-indicator.svg',
--     dim_when_paused = true,
--     dim_opacity = 0.5,
--     max_length = -1,
--     show_tooltip = false
-- })

-- Logout Widget
-- local logout_widget = logout.widget{
--     bg_color = "#261447", accent_color = "#ff4365", text_color = '#f706cf', icon_size = 40, icon_margin = 16, -- outrun
--     -- bg_color = "#0b0c10", accent_color = "#1f2833", text_color = '#66fce1', -- dark
--     -- bg_color = "#3B4252", accent_color = "#88C0D0", text_color = '#D8DEE9', -- nord
--     -- bg_color = "#282a36", accent_color = "#ff79c6", phrases = {}, -- dracula, no phrase
--     phrases = {"exit(0)", "Don't forget to be awesome.", "Yippee ki yay!"},
-- }


-- Net
local netdownicon = wibox.widget.imagebox(theme.widget_netdown)
local netdowninfo = wibox.widget.textbox()
local netupicon = wibox.widget.imagebox(theme.widget_netup)
local netupinfo = lain.widget.net({
    settings = function()
        if iface ~= "network off" and
           string.match(theme.weather.widget.text, "N/A")
        then
            theme.weather.update()
        end

        widget:set_markup(markup.fontfg(theme.font, "#e54c62", net_now.sent .. " "))
        netdowninfo:set_markup(markup.fontfg(theme.font, "#87af5f", net_now.received .. " "))
    end
})

-- MEM
local memicon = wibox.widget.imagebox(theme.widget_mem)
local memory = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, "#e0da37", mem_now.used .. "M "))
    end
})

memicon:connect_signal("button::press", 
    function(_, _, _, button)
        if button == 1 then 
            awful.spawn("terminator -e bpytop")    
        end
    end)


function theme.at_screen_connect(s)
   
    -- If wallpaper is a function, call it with the screen
    -- local wallpaper = theme.wallpaper
    -- if type(wallpaper) == "function" then
    --     wallpaper = wallpaper(s)
    -- end
    -- gears.wallpaper.maximized(wallpaper, s, true)

    -- Tags
    -- awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

    -- First
    awful.tag.add("Internet", {
        icon               = theme.confdir .. "/icons/taglist/brave.svg",
        layout             = awful.layout.suit.tile,
        -- master_fill_policy = "master_width_factor",
        gap_single_client  = true,
        gap                = 3,
        screen             = s,
        selected           = true,
        icon_only           = true,
    })
    -- Second
    awful.tag.add("Code", {
        icon                = theme.confdir .. "/icons/taglist/code-braces.svg",
        layout              = awful.layout.suit.max,
        screen              = s,
        icon_only           = true,
    })
    -- Third
    awful.tag.add("Terminal", {
        icon                = theme.confdir .. "/icons/taglist/terminal.png",
        layout              = awful.layout.suit.tile,
        screen              = s,
        icon_only           = true,
    })
    -- Fourth
    awful.tag.add("Chat", {
        icon                = theme.confdir .. "/icons/taglist/forum.svg",
        layout              = awful.layout.suit.max,
        screen              = s,
        icon_only           = true,
    })
    -- Fifth
    awful.tag.add("Document", {
        icon                = theme.confdir .. "/icons/taglist/folder.svg",
        layout              = awful.layout.suit.max,
        screen              = s,
        icon_only           = true,
    })
    -- Sixth
    awful.tag.add("Games", {
        icon                = theme.confdir .. "/icons/taglist/google-controller.svg",
        layout              = awful.layout.suit.max,
        screen              = s,
        icon_only           = true,
    })
    -- Seventh
    awful.tag.add("Videos", {
        icon                = theme.confdir .. "/icons/taglist/video.png",
        layout              = awful.layout.suit.max,
        screen              = s,
        icon_only           = true,
    })
    -- Eight
    awful.tag.add("Music", {
        icon                = theme.confdir .. "/icons/taglist/music.svg",
        layout              = awful.layout.suit.max,
        screen              = s,
        icon_only           = true,
    })

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(my_table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen   = s,
        filter   = awful.widget.tasklist.filter.currenttags,
        buttons  = awful.util.tasklist_buttons,
        style    = {
            shape_border_width = 1,
            shape_border_color = '#777777',
            shape  = gears.shape.rectangle,
        },
        layout   = {
            layout  = wibox.layout.flex.horizontal
        },
        -- Notice that there is *NO* wibox.wibox prefix, it is a template,
        -- not a widget instance.
        widget_template = {
            {
                {
                    {
                        {
                            id     = 'icon_role',
                            widget = wibox.widget.imagebox,
                        },
                        margins = 2,
                        widget  = wibox.container.margin,
                    },
                    {
                        id     = 'text_role',
                        widget = wibox.widget.textbox,
                    },
                    layout = wibox.layout.fixed.horizontal,
                },
                left  = 10,
                right = 10,
                widget = wibox.container.margin
            },
            id     = 'background_role',
            widget = wibox.container.background,
        },
    }

-- Separators
local arrow = separators.arrow_left
local separator = wibox.widget.textbox(" | ")

function theme.powerline_rl(cr, width, height)
    local arrow_depth, offset = height/2, 0

    -- Avoid going out of the (potential) clip area
    if arrow_depth < 0 then
        width  =  width + 2*arrow_depth
        offset = -arrow_depth
    end

    cr:move_to(offset + arrow_depth         , 0        )
    cr:line_to(offset + width               , 0        )
    cr:line_to(offset + width - arrow_depth , height/2 )
    cr:line_to(offset + width               , height   )
    cr:line_to(offset + arrow_depth         , height   )
    cr:line_to(offset                       , height/2 )

    cr:close_path()
end

local function pl(widget, bgcolor, padding)
    return wibox.container.background(wibox.container.margin(widget, 10, 10), bgcolor, theme.powerline_rl)
end

    -- Create the wibox
    s.mywibox = awful.wibar({ 
        position = "top", 
        screen = s, 
        height = 20, 
        bg = theme.bg_normal, 
        fg = theme.fg_normal
     })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        {
            layout = wibox.layout.fixed.horizontal,
            mylauncher,
            s.mytaglist,
        },
        --s.mytasklist, -- Middle widget
        nil,
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            s.systray,
            separator,
            volicon,
            volbar,
            separator,
            bright,
            separator,
            bat_widget,
            separator,
            weathericon,
            theme.weather,
            separator,
            mytextclock,
        },
    }

    s.mybottomwibox = awful.wibar({ 
        position = "bottom", 
        screen = s, 
        height = 20, 
        bg = theme.bg_normal, 
        fg = theme.fg_normal
     })

     s.mybottomwibox:setup {
        layout = wibox.layout.align.horizontal,
        nil,
        s.mytasklist,
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            netdownicon,
            netdowninfo,
            netupicon,
            netupinfo.widget,
            memicon,
            memory.widget,
            -- cpuicon,
            -- cpu.widget,
            cpu_widget(
                {
                    enable_kill_button = true,
                }
            ),
            tempicon,
            temp.widget,
            fsicon,
            fs_widget({ mounts = { '/' , '/home'} }),
            s.mylayoutbox,
        },
    }
end

return theme

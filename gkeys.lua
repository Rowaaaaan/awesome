local gears                 = require("gears")
local lain                  = require("lain")
local awful                 = require("awful")
local beautiful             = require("beautiful")

local hotkeys_popup = require("awful.hotkeys_popup").widget
                      require("awful.hotkeys_popup.keys")

-- ===================================================================
-- Personal variables
-- ===================================================================

local scrlocker         = "betterlockscreen -l"
local terminal          = "kitty"
local calculator        = "rofi -show calc -modi calc -no-show-match -no-sort"
local launcher          = "rofi -combi-modi window,drun,run -show combi -modi combi"
--local browser           = "firefox"
--local editor            = os.getenv("EDITOR") or "nvim"
--local editorgui         = "geany"
--local filemanager       = "pcmanfm"
--local mailclient        = "geary"
--local mediaplayer       = "celluloid"

-- Keys table
local keys = {}
local altkey = "Mod1"
local meta = "Mod4"
local ctrl = "Control"

-- ===================================================================
-- Desktop Key bindings
-- ===================================================================

keys.globalkeys = gears.table.join(

    -- {{{ Personal keybindings
    -- rofi
    awful.key({ altkey }, "space",
        function ()
            awful.spawn(launcher, beautiful.bg_normal, beautiful.fg_normal, beautiful.bg_focus, beautiful.fg_focus)
        end,
        {description = "Rofi launcher", group = "hotkeys"}
    ),
    awful.key({ meta }, "c",
        function ()
            awful.spawn(calculator, beautiful.bg_normal, beautiful.fg_normal, beautiful.bg_focus, beautiful.fg_focus)
        end,
        {description = "Rofi Calc", group = "hotkeys"}
    ),
    awful.key({ meta , altkey }, "l",
        function ()
            awful.spawn(scrlocker)
        end,
        {description = "Lock screen", group = "Session"}
    ),

    -- Toggle system tray
    awful.key({ meta }, "=",
        function()
            awful.screen.focused().systray.visible = not awful.screen.focused().systray.visible
        end,
        {description = "Toggle systray", group = "hotkeys"}
    ),

    -- screenshots
    awful.key({ }, "Print", function () awful.util.spawn("flameshot gui") end,
        {description = "Flameshot", group = "screenshots"}),
    awful.key({ "Shift" }, "Print", function () os.execute("flameshot full -p ~/Pictures/Screenshots") end,
        {description = "Flameshot full ~/Pictures/Screenshots", group = "screenshots"}),

    awful.key({ meta, altkey }, "h",      hotkeys_popup.show_help,
        {description = "show help", group="awesome"}),

    -- Tag browsing with meta
    awful.key({ meta,           }, "Left",   awful.tag.viewprev,
        {description = "view previous", group = "tag"}),
    awful.key({ meta,           }, "Right",  awful.tag.viewnext,
        {description = "view next", group = "tag"}),
    awful.key({ altkey,           }, "Escape", awful.tag.history.restore,
        {description = "go back", group = "tag"}),

     -- Tag browsing alt + tab
    awful.key({ altkey,           }, "Tab",   awful.tag.viewnext,
        {description = "view next", group = "tag"}),
    awful.key({ altkey, "Shift"   }, "Tab",  awful.tag.viewprev,
        {description = "view previous", group = "tag"}),

     -- Tag browsing meta + tab
    awful.key({ meta,           }, "Tab",   awful.tag.viewnext,
        {description = "view next", group = "tag"}),
    awful.key({ meta, "Shift"   }, "Tab",  awful.tag.viewprev,
        {description = "view previous", group = "tag"}),


    -- Non-empty tag browsing
    --awful.key({ meta }, "Left", function () lain.util.tag_view_nonempty(-1) end,
              --{description = "view  previous nonempty", group = "tag"}),
   -- awful.key({ meta }, "Right", function () lain.util.tag_view_nonempty(1) end,
             -- {description = "view  previous nonempty", group = "tag"}),

    -- Default client focus
    awful.key({ meta,           }, "k",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ meta,           }, "j",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),

    -- By direction client focus
    -- awful.key({ meta }, "j",
    --     function()
    --         awful.client.focus.global_bydirection("down")
    --         if client.focus then client.focus:raise() end
    --     end,
    --     {description = "focus down", group = "client"}),
    -- awful.key({ meta }, "k",
    --     function()
    --         awful.client.focus.global_bydirection("up")
    --         if client.focus then client.focus:raise() end
    --     end,
    --     {description = "focus up", group = "client"}),
    awful.key({ meta }, "h",
        function()
            awful.client.focus.global_bydirection("left")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus left", group = "client"}),
    awful.key({ meta }, "l",
        function()
            awful.client.focus.global_bydirection("right")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus right", group = "client"}),


        -- By direction client focus with arrows
        awful.key({ ctrl, meta }, "Down",
            function()
                awful.client.focus.global_bydirection("down")
                if client.focus then client.focus:raise() end
            end,
            {description = "focus down", group = "client"}),
        awful.key({ ctrl, meta }, "Up",
            function()
                awful.client.focus.global_bydirection("up")
                if client.focus then client.focus:raise() end
            end,
            {description = "focus up", group = "client"}),
        awful.key({ ctrl, meta }, "Left",
            function()
                awful.client.focus.global_bydirection("left")
                if client.focus then client.focus:raise() end
            end,
            {description = "focus left", group = "client"}),
        awful.key({ ctrl, meta }, "Right",
            function()
                awful.client.focus.global_bydirection("right")
                if client.focus then client.focus:raise() end
            end,
            {description = "focus right", group = "client"}),

    awful.key({ meta,           }, "w", function () awful.util.mymainmenu:show() end,
              {description = "show main menu", group = "awesome"}),

    -- Layout manipulation
    awful.key({ meta, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),
    awful.key({ meta, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),
    awful.key({ meta }, ".", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),
    awful.key({ meta }, ",", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),
    awful.key({ meta, "Control" }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),
    -- awful.key({ ctrl,           }, "Tab",
    --     function ()
    --         awful.client.focus.history.previous()
    --         if client.focus then
    --             client.focus:raise()
    --         end
    --     end,
    --     {description = "go back", group = "client"}),

    -- Show/Hide Wibox
    awful.key({ meta }, "b", function ()
            for s in screen do
                s.mywibox.visible = not s.mywibox.visible
                if s.mybottomwibox then
                    s.mybottomwibox.visible = not s.mybottomwibox.visible
                end
            end
        end,
        {description = "toggle wibox", group = "awesome"}),

    -- On the fly useless gaps change
    awful.key({ altkey, "Control" }, "j", function () lain.util.useless_gaps_resize(1) end,
              {description = "increment useless gaps", group = "tag"}),
    awful.key({ altkey, "Control" }, "l", function () lain.util.useless_gaps_resize(-1) end,
              {description = "decrement useless gaps", group = "tag"}),

    -- Dynamic tagging
    awful.key({ meta, "Shift" }, "n", function () lain.util.add_tag() end,
              {description = "add new tag", group = "tag"}),
    awful.key({ meta, "Control" }, "r", function () lain.util.rename_tag() end,
              {description = "rename tag", group = "tag"}),
    awful.key({ meta, "Shift" }, "Left", function () lain.util.move_tag(-1) end,
              {description = "move tag to the left", group = "tag"}),
    awful.key({ meta, "Shift" }, "Right", function () lain.util.move_tag(1) end,
              {description = "move tag to the right", group = "tag"}),
    awful.key({ meta, "Shift" }, "d", function () lain.util.delete_tag() end,
              {description = "delete tag", group = "tag"}),

    -- Standard program
    awful.key({ meta,           }, "Return", function () awful.spawn( terminal) end,
              {description = "Terminal", group = "super"}),
    awful.key({ meta, "Shift" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),

    awful.key({ altkey, "Shift"   }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),
    awful.key({ altkey, "Shift"   }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    awful.key({ meta, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),
    awful.key({ meta, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),
    awful.key({ meta, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),
    awful.key({ meta, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),
    awful.key({ meta,           }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next", group = "layout"}),
    --awful.key({ meta, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
             -- {description = "select previous", group = "layout"}),

    awful.key({ meta, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                      client.focus = c
                      c:raise()
                  end
              end,
              {description = "restore minimized", group = "client"}),

    -- Dropdown application
    awful.key({ meta, }, "z", function () awful.screen.focused().quake:toggle() end,
              {description = "dropdown application", group = "super"}),

   -- =========================================
   -- FUNCTION KEYS
   -- =========================================

   -- Brightness
   awful.key({}, "XF86MonBrightnessUp",
      function()
         awful.spawn("light -A 10", false)
      end,
      {description = "+10%", group = "hotkeys"}
   ),
   awful.key({}, "XF86MonBrightnessDown",
      function()
         awful.spawn("light -U 10", false)
      end,
      {description = "-10%", group = "hotkeys"}
   ),

   -- ALSA volume control
   awful.key({}, "XF86AudioRaiseVolume",
      function()
         awful.spawn("amixer -D pulse sset Master 5%+", false)
         awesome.emit_signal("volume_change")
      end,
      {description = "volume up", group = "hotkeys"}
   ),
   awful.key({}, "XF86AudioLowerVolume",
      function()
         awful.spawn("amixer -D pulse sset Master 5%-", false)
         awesome.emit_signal("volume_change")
      end,
      {description = "volume down", group = "hotkeys"}
   ),
   awful.key({}, "XF86AudioMute",
      function()
         awful.spawn("amixer -D pulse set Master 1+ toggle", false)
         awesome.emit_signal("volume_change")
      end,
      {description = "toggle mute", group = "hotkeys"}
   ),
   awful.key({}, "XF86AudioNext",
      function()
         awful.spawn("mpc next", false)
      end,
      {description = "next music", group = "hotkeys"}
   ),
   awful.key({}, "XF86AudioPrev",
      function()
         awful.spawn("mpc prev", false)
      end,
      {description = "previous music", group = "hotkeys"}
   ),
   awful.key({}, "XF86AudioPlay",
      function()
         awful.spawn("mpc toggle", false)
      end,
      {description = "play/pause music", group = "hotkeys"}
   ),

   -- Screenshot on prtscn using scrot
   awful.key({}, "Print",
      function()
         awful.util.spawn(apps.screenshot, false)
      end
   ),

    awful.key({ ctrl, "Shift" }, "m",
        function ()
            os.execute("amixer -q set %s 100%%")
        end),
    awful.key({ ctrl, "Shift" }, "0",
        function ()
            os.execute("amixer -q set %s 0%%")
        end),

    -- Copy primary to clipboard (terminals to gtk)
    awful.key({ meta, "Shift" }, "c", function () awful.spawn.with_shell("xsel | xsel -i -b") end,
              {description = "copy terminal to gtk", group = "hotkeys"}),
    -- Copy clipboard to primary (gtk to terminals)
    awful.key({ meta, "Shift" }, "v", function () awful.spawn.with_shell("xsel -b | xsel") end,
              {description = "copy gtk to terminal", group = "hotkeys"}),

    -- Default
    --[[ Menubar

    awful.key({ meta }, "p", function() menubar.show() end,
              {description = "show the menubar", group = "super"})
    --]]

    awful.key({ altkey, "Shift" }, "x",
              function ()
                  awful.prompt.run {
                    prompt       = "Run Lua code: ",
                    textbox      = awful.screen.focused().mypromptbox.widget,
                    exe_callback = awful.util.eval,
                    history_path = awful.util.get_cache_dir() .. "/history_eval"
                  }
              end,
              {description = "lua execute prompt", group = "awesome"})
    --]]
)

keys.clientkeys = gears.table.join(
    awful.key({ altkey, "Shift"   }, "m",      lain.util.magnify_client,
              {description = "magnify client", group = "client"}),
    awful.key({ meta,           }, "g",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    awful.key({ meta , "Shift" }, "q",      function (c) c:kill()                         end,
              {description = "close", group = "hotkeys"}),
    awful.key({ meta, "Shift" }, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),
    awful.key({ meta, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),
    awful.key({ meta, "Shift" }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),
    awful.key({ meta,           }, "t",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client"}),
    awful.key({ meta,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),
    awful.key({ meta,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "maximize", group = "client"})
)

keygroup = {'a', 's', 'd', 'f', 'u', 'i', 'o', 'p'}

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 8 do
    -- Hack to only show tags 1 and 9 in the shortcut window (mod+s)
    local descr_view, descr_toggle, descr_move, descr_toggle_focus
    if i == 1 or i == 8 then
        descr_view = {description = "view tag #", group = "tag"}
        descr_toggle = {description = "toggle tag #", group = "tag"}
        descr_move = {description = "move focused client to tag #", group = "tag"}
        descr_toggle_focus = {description = "toggle focused client on tag #", group = "tag"}
    end
    keys = gears.table.join(keys,
        -- View tag only.
        awful.key({ meta }, keygroup[i],
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  descr_view),
        -- Toggle tag display.
        awful.key({ meta, "Control" }, keygroup[i],
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  descr_toggle),
        -- Move client to tag.
        awful.key({ meta, "Shift" }, keygroup[i],
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  descr_move),
        -- Toggle tag on focused client.
        awful.key({ meta, "Control", "Shift" }, keygroup[i],
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  descr_toggle_focus)
    )
end

return keys

-- {{{ Required libraries

-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Awesome Stdlib
local gears         = require("gears")
local awful         = require("awful")
require("awful.autofocus")

-- Widget and Layout Library
local wibox         = require("wibox")

-- Theme handling library
local beautiful     = require("beautiful")

-- Notification Library
local naughty       = require("naughty")
local menubar       = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

local lain          = require("lain")
local freedesktop   = require("freedesktop")

local mytable       = awful.util.table or gears.table -- 4.{0,1} compatibility

-- Default image size on notifications
naughty.config.defaults['icon_size'] = 100

-- Error notifications
require("config.error_notif")

-- Startup Programs
require("config.startup")

-- Useful variables
local modkey       = "Mod4"
local terminal     = "alacritty"
local vi_focus     = false
local cycle_prev   = true
local editor       = "setsid -f emacsclient -c"
local browser      = "firefox"
awful.util.terminal = terminal

-- Tags setup
awful.util.tagnames = { "1", "2", "3", "4", "5", "6", "7", "8", "9" }
awful.layout.layouts = {
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.tile,
    awful.layout.suit.fair,
    awful.layout.suit.floating,
 
}

-- Mouse bindings for tags
awful.util.taglist_buttons = mytable.join(
    awful.button({ }, 1, function(t) t:view_only() end),
    awful.button({ modkey }, 1, function(t)
        if client.focus then client.focus:move_to_tag(t) end
    end),
    awful.button({ }, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, function(t)
        if client.focus then client.focus:toggle_tag(t) end
    end),
    awful.button({ }, 4, function(t) awful.tag.viewprev(t.screen) end),
    awful.button({ }, 5, function(t) awful.tag.viewnext(t.screen) end)
)

awful.util.tasklist_buttons = mytable.join(
     awful.button({ }, 1, function(c)
         if c == client.focus then
             c.minimized = true
         else
             c:emit_signal("request::activate", "tasklist", { raise = true })
         end
     end),
     awful.button({ }, 3, function()
         awful.menu.client_list({ theme = { width = 250 } })
     end),
     awful.button({ }, 4, function() awful.client.focus.byidx(-1) end),
     awful.button({ }, 5, function() awful.client.focus.byidx(1) end)
)


-- Init theme
beautiful.init(string.format("%s/.config/awesome/theme/theme.lua", os.getenv("HOME")))

-- {{{ Menu

-- Create a launcher widget and a main menu
local myawesomemenu = {
   { "Hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
   { "Manual", string.format("%s -e man awesome", terminal) },
   { "Edit config", string.format("%s -e %s %s", terminal, editor, awesome.conffile) },
   { "Restart", awesome.restart },
   { "Quit", function() awesome.quit() end },
}

awful.util.mymainmenu = freedesktop.menu.build {
    before = {
        { "Awesome", myawesomemenu, beautiful.awesome_icon },
        -- other triads can be put here
    },
    after = {
        { "Open terminal", terminal },
        -- other triads can be put here
    }
}

-- Set the Menubar terminal for applications that require it
menubar.utils.terminal = terminal

-- {{{ Screen

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", function(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end)

-- No borders when rearranging only 1 non-floating or maximized client
screen.connect_signal("arrange", function (s)
    local only_one = #s.tiled_clients == 1
    for _, c in pairs(s.clients) do
        if only_one and not c.floating or c.maximized or c.fullscreen then
            c.border_width = 0
        else
            c.border_width = beautiful.border_width
        end
    end
end)

-- Create a wibox for each screen and add it
awful.screen.connect_for_each_screen(function(s) beautiful.at_screen_connect(s) end)

-- Mouse button bindings when interacting with desktop
root.buttons(mytable.join(
    awful.button({ }, 3, function () awful.util.mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewprev),
    awful.button({ }, 5, awful.tag.viewnext)
))

-- Key bindings
globalkeys = gears.table.join(
   -- Show help
   awful.key({ modkey,           }, "s",      hotkeys_popup.show_help, {description="show help", group="awesome"}),

   -- Tag browsing
   awful.key({ modkey,           }, "Left",   awful.tag.viewprev, {description = "view previous", group = "tag"}),
   awful.key({ modkey,           }, "Right",  awful.tag.viewnext, {description = "view next", group = "tag"}),
   awful.key({ modkey,           }, "Escape", awful.tag.history.restore, {description = "go back", group = "tag"}),

   -- Default client focus
   awful.key({ modkey,           }, "j",
      function ()
         awful.client.focus.byidx( 1)
      end,
      {description = "focus next by index", group = "client"}
   ),
   awful.key({ modkey,           }, "k",
      function ()
         awful.client.focus.byidx(-1)
      end,
      {description = "focus previous by index", group = "client"}
   ),

   -- Menu
   awful.key({ modkey,           }, "w", function () awful.util.mymainmenu:show() end, {description = "show main menu", group = "awesome"}),

   -- Layout manipulation
   awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1) end, {description = "swap with next client by index", group = "client"}),
   awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1) end, {description = "swap with previous client by index", group = "client"}),
   awful.key({ modkey,           }, ".", function () awful.screen.focus_relative( 1) end, {description = "focus the next screen", group = "screen"}),
   awful.key({ modkey,           }, ",", function () awful.screen.focus_relative(-1) end, {description = "focus the previous screen", group = "screen"}),
   awful.key({ modkey,           }, "u", awful.client.urgent.jumpto, {description = "jump to urgent client", group = "client"}),
   awful.key({ modkey,           }, "Tab",
      function ()
         if cycle_prev then
            awful.client.focus.history.previous()
         else
            awful.client.focus.byidx(-1)
         end
         if client.focus then
            client.focus:raise()
         end
      end,
      {description = "cycle with previous/go back", group = "client"}),

   -- Show/hide wibox
   awful.key({ modkey }, "b", function ()
         for s in screen do
            s.mywibox.visible = not s.mywibox.visible
            if s.mybottomwibox then
               s.mybottomwibox.visible = not s.mybottomwibox.visible
            end
         end
   end,
      {description = "toggle wibox", group = "awesome"}),

   -- On-the-fly useless gaps change
   awful.key({ modkey, "Control" }, "=", function () lain.util.useless_gaps_resize(1) end, {description = "increment useless gaps", group = "tag"}),
   awful.key({ modkey, "Control" }, "-", function () lain.util.useless_gaps_resize(-1) end, {description = "decrement useless gaps", group = "tag"}),

   -- Dynamic tagging
   awful.key({ modkey, "Shift" }, "n", function () lain.util.add_tag() end, {description = "add new tag", group = "tag"}),
   awful.key({ modkey, "Shift" }, "r", function () lain.util.rename_tag() end, {description = "rename tag", group = "tag"}),
   awful.key({ modkey, "Shift" }, "Left", function () lain.util.move_tag(-1) end, {description = "move tag to the left", group = "tag"}),
   awful.key({ modkey, "Shift" }, "Right", function () lain.util.move_tag(1) end, {description = "move tag to the right", group = "tag"}),
   awful.key({ modkey, "Shift" }, "d", function () lain.util.delete_tag() end, {description = "delete tag", group = "tag"}),

   -- Standard program
   awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end, {description = "open a terminal", group = "launcher"}),
   awful.key({ modkey, "Control" }, "r", awesome.restart, {description = "reload awesome", group = "awesome"}),
   awful.key({ modkey, "Control" }, "q", awesome.quit, {description = "quit awesome", group = "awesome"}),

   awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end, {description = "increase master width factor", group = "layout"}),
   awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end, {description = "decrease master width factor", group = "layout"}),
   awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end, {description = "increase the number of master clients", group = "layout"}),
   awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end, {description = "decrease the number of master clients", group = "layout"}),
   awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end, {description = "increase the number of columns", group = "layout"}),
   awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end, {description = "decrease the number of columns", group = "layout"}),
   awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end, {description = "select next", group = "layout"}),
   awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end, {description = "select previous", group = "layout"}),
   awful.key({ modkey, "Shift"   }, "-", function ()
         local c = awful.client.restore()
         -- Focus restored client
         if c then
            c:emit_signal("request::activate", "key.unminimize", {raise = true})
         end
   end, {description = "restore minimized", group = "client"}),

   -- Screen brightness
   awful.key({ }, "XF86MonBrightnessUp", function () os.execute("xbacklight -inc 10") end, {description = "+10%", group = "hotkeys"}),
   awful.key({ }, "XF86MonBrightnessDown", function () os.execute("xbacklight -dec 10") end, {description = "-10%", group = "hotkeys"}),

   -- User programs
   awful.key({ modkey, "Shift" }, "b", function () awful.spawn("firefox") end, {description = "open a browser", group = "launcher"}),
   awful.key({ modkey, "Shift" }, "p", function () awful.spawn("rofi -show drun") end, {description = "open rofi (drun) (program launcher)", group = "launcher"}),
   awful.key({ modkey          }, "p", function () awful.spawn("rofi -show run") end, {description = "open rofi (run) (program launcher)", group = "launcher"}),
   awful.key({ modkey, "Shift" }, "e", function () awful.spawn(editor) end, {description = "open emacs", group = "launcher"}),
   awful.key({ modkey, "Shift" }, "f", function () awful.spawn(terminal .. " -e nnn") end, {description = "open file manager", group = "launcher"})

   -- awful.key({ }, "XK_Print", function() awful.spawn("flameshot gui") end,
   --    {description = "take a screenshot", group = "launcher"}),

   -- Menubar
   -- awful.key({ modkey }, "p", function() menubar.show() end,
   --    {description = "show the menubar", group = "launcher"})

   )

clientkeys = mytable.join(
    awful.key({ modkey, "Shift"   }, "m",      lain.util.magnify_client, {description = "magnify client", group = "client"}),
    awful.key({ modkey,           }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),
    awful.key({ modkey, "Shift"   }, "q",      function (c) c:kill()                         end, {description = "close", group = "client"}),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     , {description = "toggle floating", group = "client"}),
    awful.key({ modkey, "Shift"   }, "Return", function (c) c:swap(awful.client.getmaster()) end, {description = "move to master", group = "client"}),
    awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end, {description = "move to screen", group = "client"}),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end, {description = "toggle keep on top", group = "client"}),
    awful.key({ modkey,           }, "-",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "(un)maximize", group = "client"}),
    awful.key({ modkey, "Control" }, "m",
        function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end ,
        {description = "(un)maximize vertically", group = "client"}),
    awful.key({ modkey, "Shift"   }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end ,
        {description = "(un)maximize horizontally", group = "client"})
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = mytable.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

clientbuttons = mytable.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(globalkeys)

-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     callback = awful.client.setslave,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen,
                     size_hints_honor = false
     }
    },

    -- Floating clients.
    { rule_any = {
        instance = {
          "DTA",  -- Firefox addon DownThemAll.
          "copyq",  -- Includes session name in class.
          "pinentry",
        },
        class = {
          "Arandr",
          "Blueman-manager",
          "Gpick",
          "Kruler",
          "MessageWin",  -- kalarm.
          "Sxiv",
          "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
          "Wpa_gui",
          "veromix",
          "xtightvncviewer"},

        -- Note that the name property shown in xprop might be set slightly after creation of the client
        -- and the name shown there might not match defined rules here.
        name = {
          "Event Tester",  -- xev.
        },
        role = {
          "AlarmWindow",  -- Thunderbird's calendar.
          "ConfigManager",  -- Thunderbird's about:config.
          "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
        }
      }, properties = { floating = true }},

    -- Add titlebars to normal clients and dialogs
    { rule_any = {type = { "normal", "dialog" }, properties = { titlebars_enabled = false }}},

    -- Social & Messengers always open at 6
    { rule = { class = "TelegramDesktop" },
      properties = { screen = 1, tag = "6" } },
    { rule = { class = "Discord" },
      properties = { screen = 1, tag = "6" } },
    { rule = { class = "Skype" },
      properties = { screen = 1, tag = "6" } },

    -- Game-related programs always open at 7
    { rule = { class = "Steam" },
      properties = { screen = 1, tag = "7" } },

    { rule = { class = "Tauon Music Box" },
      properties = { screen = 1, tag = "8" } },
    { rule = { class = "qBittorrent" },
      properties = { screen = 1, tag = "8" } },

    { rule = { class = "obsidian" },
      properties = { screen = 1, tag = "9" } },
    { rule = { class = "Thunderbird" },
      properties = { screen = 1, tag = "9" } },
}

-- {{{ Signals

-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = vi_focus})
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

function add_and_show_titlebar(c)
  -- buttons for the titlebar
  local buttons = gears.table.join(
       awful.button({ }, 1, function()
           c:emit_signal("request::activate", "titlebar", {raise = true})
           awful.mouse.client.move(c)
       end),
       awful.button({ }, 3, function()
           c:emit_signal("request::activate", "titlebar", {raise = true})
           awful.mouse.client.resize(c)
       end)
   )

   awful.titlebar(c) : setup {
       { -- Left
           awful.titlebar.widget.iconwidget(c),
           buttons = buttons,
           layout  = wibox.layout.fixed.horizontal
       },
       { -- Middle
           { -- Title
               align  = "center",
               widget = awful.titlebar.widget.titlewidget(c)
           },
           buttons = buttons,
           layout  = wibox.layout.flex.horizontal
       },
       { -- Right
           awful.titlebar.widget.floatingbutton (c),
           awful.titlebar.widget.maximizedbutton(c),
           awful.titlebar.widget.stickybutton   (c),
           awful.titlebar.widget.ontopbutton    (c),
           awful.titlebar.widget.closebutton    (c),
           layout = wibox.layout.fixed.horizontal()
       },
       layout = wibox.layout.align.horizontal
   }
   awful.titlebar.show(c)
end


-- Titlebars only on floating windows
client.connect_signal("property::floating", function(c)
    if c.floating and not c.fullscreen then
        add_and_show_titlebar(c)
    else
        awful.titlebar.hide(c)
    end
end)

function dynamic_title(c)
    if c.floating or c.first_tag.layout.name == "floating" then
        add_and_show_titlebar(c)
    else
        awful.titlebar.hide(c)
    end
end

tag.connect_signal("property::layout", function(t)
    local clients = t:clients()
    for k,c in pairs(clients) do
        if c.floating or c.first_tag.layout.name == "floating" then
            add_and_show_titlebar(c)
        else
            awful.titlebar.hide(c)
        end
    end
end)

-- }}}

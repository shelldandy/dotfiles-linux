local awful = require("awful")
local wibox = require("wibox")
local hotkeys_popup = require("awful.hotkeys_popup")
local beautiful = require("beautiful")

local bar = {}

-- Keyboard map indicator and switcher
local mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Wibar
-- Create a textclock widget
local mytextclock = wibox.widget.textclock()

-- {{{ Menu
-- Create a launcher widget and a main menu
local myawesomemenu = {
  { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
  { "manual", terminal .. " -e man awesome" },
  { "edit config", editor_cmd .. " " .. capi.awesome.conffile },
  { "restart", capi.awesome.restart },
  { "quit", function() capi.awesome.quit() end },
}

local mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
    { "open terminal", terminal }
  }
})

local mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
  menu = mymainmenu })

bar.setup_bar = function (screen)
  -- Create the wibox
  screen.mywibox = awful.wibar({ position = "top", screen = screen })

  -- Add widgets to the wibox
  screen.mywibox:setup {
    layout = wibox.layout.align.horizontal,
    { -- Left widgets
      layout = wibox.layout.fixed.horizontal,
      mylauncher,
      screen.mytaglist,
      screen.mypromptbox,
    },
    screen.mytasklist, -- Middle widget
    { -- Right widgets
      layout = wibox.layout.fixed.horizontal,
      mykeyboardlayout,
      wibox.widget.systray(),
      mytextclock,
      screen.mylayoutbox,
    },
  }
end

return bar
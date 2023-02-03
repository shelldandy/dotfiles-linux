local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Sandbox globals for linter purposes
local capi = {
  awesome = awesome,
  client = client,
}

local keybindings = {}

local modkey = "Mod4"
local terminal = "kitty"

local function client_focus(index)
  awful.client.focus.byidx(index)
end

local function focus_history_previous()
  awful.client.focus.history.previous()
  if capi.client.focus then
    capi.client.focus:raise()
  end
end

-- {{{ Key bindings
keybindings.globalkeys = gears.table.join(
  awful.key({ modkey,           }, "s",      hotkeys_popup.show_help, {description="show help", group="awesome"}),
  awful.key({ modkey,           }, "Left",   awful.tag.viewprev, {description = "view previous", group = "tag"}),
  awful.key({ modkey,           }, "Right",  awful.tag.viewnext, {description = "view next", group = "tag"}),
  awful.key({ modkey,           }, "Escape", function() awful.spawn.with_shell("xscreensaver-command -lock") end, {description = "Lock screen", group = "client"}),

  awful.key({ modkey,           }, "j", function () client_focus(1) end, {description = "focus next by index", group = "client"}),
  awful.key({ modkey,           }, "k", function () client_focus(-1) end, {description = "focus previous by index", group = "client"}),

  -- Layout manipulation
  awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(-1)    end, {description = "swap with previous client by index", group = "client"}),
  awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx(1)    end, {description = "swap with next client by index", group = "client"}),
  awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative(-1) end, {description = "focus the previous screen", group = "screen"}),
  awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(1) end, {description = "focus the next screen", group = "screen"}),
  awful.key({ modkey,           }, "u", awful.client.urgent.jumpto, {description = "jump to urgent client", group = "client"}),
  awful.key({ modkey,           }, "Tab", focus_history_previous, {description = "go back", group = "client"}),

  -- Standard program
  awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end, {description = "open a terminal", group = "launcher"}),
  awful.key({ modkey,           }, "b", function () awful.spawn("firefox") end, {description = "open firefox", group = "applications"}),
  awful.key({ modkey,           }, "\\", function () awful.spawn("spectacle") end, {description = "take a screenshot and copy it", group = "applications"}),
  awful.key({ modkey, "Control" }, "r", capi.awesome.restart, {description = "reload awesome", group = "awesome"}),
  awful.key({ modkey, "Shift"   }, "q", capi.awesome.quit, {description = "quit awesome", group = "awesome"}),

  awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact(-0.05)          end, {description = "decrease master width factor", group = "layout"}),
  awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(0.05)           end, {description = "increase master width factor", group = "layout"}),
  awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end, {description = "increase the number of master clients", group = "layout"}),
  awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end, {description = "decrease the number of master clients", group = "layout"}),
  awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end, {description = "increase the number of columns", group = "layout"}),
  awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end, {description = "decrease the number of columns", group = "layout"}),
  awful.key({ modkey,           }, "space", function () awful.layout.inc( 1)                end, {description = "select next", group = "layout"}),
  awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end, {description = "select previous", group = "layout"}),

  awful.key({ modkey, "Control" }, "n",
    function ()
      local c = awful.client.restore()
      -- Focus restored client
      if c then
        c:emit_signal(
          "request::activate", "key.unminimize", {raise = true}
          )
      end
    end,
    {description = "restore minimized", group = "client"}),

  -- Prompt
  awful.key({ modkey },            "r",     function () awful.spawn.with_shell("rofi -show") end, {description = "app launcher", group = "launcher"}),

  awful.key({ modkey }, "x",
    function ()
      awful.prompt.run {
        prompt       = "Run Lua code: ",
        textbox      = awful.screen.focused().mypromptbox.widget,
        exe_callback = awful.util.eval,
        history_path = awful.util.get_cache_dir() .. "/history_eval"
      }
    end,
    {description = "lua execute prompt", group = "awesome"}),
  -- Volume Keys
  awful.key({}, "XF86AudioLowerVolume", function ()
  awful.util.spawn("amixer -q -D pulse sset Master 5%-", false) end),
  awful.key({}, "XF86AudioRaiseVolume", function ()
  awful.util.spawn("amixer -q -D pulse sset Master 5%+", false) end),
  awful.key({}, "XF86AudioMute", function ()
  awful.util.spawn("amixer -D pulse set Master 1+ toggle", false) end),
  -- Media Keys
  awful.key({}, "XF86AudioPlay", function()
  awful.util.spawn("playerctl play-pause", false) end),
  awful.key({}, "XF86AudioNext", function()
  awful.util.spawn("playerctl next", false) end),
  awful.key({}, "XF86AudioPrev", function()
  awful.util.spawn("playerctl previous", false) end)
  )

return keybindings
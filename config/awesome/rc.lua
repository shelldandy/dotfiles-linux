-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Theme handling library
local beautiful = require("beautiful")
-- Globals
require("components.globals")
-- Components
require("components.layouts")
require("components.error_handling")
require("components.wibar")
require("components.mousebindings")
require("components.keybindings")
require("components.client")
require("components.signals")

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")

-- Padding between windows
beautiful.useless_gap = 8

-- Autostart Applications
local autorun = true
local shell_autorun_apps = {
  "~/.bin/autorun.sh",
}

if autorun then
  for app = 1, #shell_autorun_apps do
    awful.spawn.with_shell(shell_autorun_apps[app])
  end
end

require("globals")

local awful = require("awful")
local beautiful = require("beautiful")
local desktop_utils = require("utils.desktop")
local config = require("config")

awful.util.shell = config.apps.shell
desktop_utils.terminal = config.apps.terminal

beautiful.init(config.places.theme .. "/theme.lua")

require("core")
require("services")
require("ui")

awful.spawn.with_shell("~/.bin/autorun.sh")

collectgarbage("setpause", 110)
collectgarbage("setstepmul", 1000)

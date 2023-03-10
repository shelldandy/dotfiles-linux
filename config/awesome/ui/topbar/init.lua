local capi = {
    awesome = awesome,
    mouse = mouse,
    screen = screen,
}
local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")
local config = require("config")
local layoutbox_widget = require("ui.topbar.layoutbox")
local clientlist_widget = require("ui.topbar.clientlist")
local taglist_widget = require("ui.topbar.taglist")
local systray_widget = require("ui.topbar.systray")
local torrent_widget = require("ui.topbar.torrent")
local network_widget = require("ui.topbar.network")
local volume_widget = require("ui.topbar.volume")
local weather_widget = require("ui.topbar.weather")
local datetime_widget = require("ui.topbar.datetime")
local power_widget = require("ui.topbar.power")


capi.screen.connect_signal("request::desktop_decoration", function(screen)
    local is_primary = screen == capi.screen.primary
    local wibar = awful.wibar {
        position = "top",
        screen = screen,
        widget = {
            layout = wibox.layout.align.horizontal,
            expand = "outside",
            {
                id = "#left",
                layout = wibox.layout.fixed.horizontal,
                spacing = beautiful.wibar.spacing,
            },
            {
                layout = wibox.container.margin,
                left = beautiful.wibar.spacing * 2,
                right = beautiful.wibar.spacing * 2,
                {
                    id = "#middle",
                    layout = wibox.layout.fixed.horizontal,
                    spacing = beautiful.wibar.spacing,
                },
            },
            {
                layout = wibox.container.place,
                halign = "right",
                fill_horizontal = true,
                {
                    id = "#right_container",
                    layout = wibox.layout.fixed.horizontal,
                    spacing = beautiful.wibar.spacing,
                    {
                        id = "#right",
                        layout = wibox.layout.fixed.horizontal,
                        spacing = beautiful.wibar.spacing,
                        reverse = true,
                    },
                },
            },
        },
    }

    screen.topbar = {
        wibox = wibar,
        clientlist = clientlist_widget.new(wibar),
        systray = is_primary and systray_widget.new(wibar),
        taglist = taglist_widget.new(wibar),
    }

    local left = wibar:get_children_by_id("#left")[1]
    left:add(layoutbox_widget.new(wibar))
    left:add(screen.topbar.clientlist)
    if screen.topbar.systray then
        screen.topbar.systray:set_container(left)
    end

    local middle = wibar:get_children_by_id("#middle")[1]
    middle:add(screen.topbar.taglist)

    local right = wibar:get_children_by_id("#right")[1]
    if is_primary then
        if config.features.torrent_widget then
            right:add(torrent_widget.new(wibar))
        end
        right:add(network_widget.new(wibar))
        right:add(volume_widget.new(wibar))
        if config.features.weather_widget then
            right:add(weather_widget.new(wibar))
        end
        right:add(datetime_widget.new(wibar))
        right:add(power_widget.new(wibar))
    else
        right:add(datetime_widget.new(wibar))
        right:add(power_widget.new(wibar))
    end
end)

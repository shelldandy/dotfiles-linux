local awful = require("awful")

local layouts = {}

layouts.set_layouts = function ()
  -- Table of layouts to cover with awful.layout.inc, order matters.
  awful.layout.layouts = {
    awful.layout.suit.tile.right,
    awful.layout.suit.spiral,
    awful.layout.suit.floating,
    awful.layout.suit.magnifier,
    awful.layout.suit.max,
    --awful.layout.suit.spiral.dwindle,
    --awful.layout.suit.tile,
    --awful.layout.suit.tile.bottom,
    --awful.layout.suit.tile.top,
    --awful.layout.suit.fair,
    --awful.layout.suit.fair.horizontal,
    --awful.layout.suit.max.fullscreen,
    --awful.layout.suit.corner.nw,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
  }
  -- }}}
end

return layouts

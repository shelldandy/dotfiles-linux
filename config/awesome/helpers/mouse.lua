local capi = {
    mouse = mouse,
    mousegrabber = mousegrabber,
}
local min, max = math.min, math.max
local binding = require("io.binding")
local mod = binding.modifier
local btn = binding.button


local mouse_helper = {}

function mouse_helper.grab_horizontal(args)
    local calculate_value
    if args.minimum and args.maximum then
        assert(args.minimum < args.maximum)
        local size = args.maximum - args.minimum
        calculate_value = function(value)
            return args.minimum + min(max(0, value * size), size)
        end
    else
        calculate_value = function(value)
            return value
        end
    end
    args.widget:connect_signal("button::press",
        function(widget, x, y, button, modifiers, geometry)
            if button ~= (args.button or btn.left) or capi.mousegrabber.isrunning() then
                return
            end

            if args.start and not args.start() then
                return
            end

            local wibox_geometry = args.wibox and args.wibox:geometry()
            local wibox_x = wibox_geometry and wibox_geometry.x or 0

            args.change(calculate_value(x / geometry.width))

            capi.mousegrabber.run(function(grab)
                local value = calculate_value((grab.x - geometry.x - wibox_x) / geometry.width)
                if grab.buttons[button] then
                    args.change(value)
                    return true
                else
                    args.change(value, true)
                    return false
                end
            end, args.cursor or "sb_up_arrow")
        end)
end

return mouse_helper

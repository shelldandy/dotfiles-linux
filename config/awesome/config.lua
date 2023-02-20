-- DEPENDENCIES (see below)

local filesystem = require("gears.filesystem")


local config = {}

config.features = {
    screenshot_tools = true,
    torrent_widget = false,
    weather_widget = false,
    redshift_widget = false,
    wallpaper_menu = true,
}

config.places = {}
config.places.home = os.getenv("HOME")
config.places.config = os.getenv("XDG_CONFIG_HOME") or (config.places.home .. "/.config")
config.places.awesome = string.match(filesystem.get_configuration_dir(), "^(/?.-)/*$")
config.places.theme = config.places.awesome .. "/theme"
config.places.screenshots = config.places.home .. "/Pictures/Screenshots"
config.places.wallpapers = config.places.home .. "/Pictures/Wallpapers"

local terminal = "kitty"
local terminal_execute = terminal .. " -e "

config.apps = {
    shell = "bash",
    terminal = terminal,
    editor = terminal_execute .. "nvim",
    browser = "firefox",
    private_browser = "librewolf --private-window",
    file_manager = "dolphin",
    calculator = "speedcrunch",
    mixer = terminal_execute .. "pulsemixer",
    bluetooth_control = terminal_execute .. "bluetoothctl",
    music_streaming = "spotify",
    video_streaming = "freetube",
}

config.power = {
    shutdown = "systemctl poweroff",
    reboot = "systemctl reboot",
    suspend = "systemctl suspend",
    kill_session = "loginctl kill-session",
    lock_session = "loginctl lock-session",
    lock_screen = "light-locker-command --lock",
}

config.actions = {
    qr_code_clipboard = "qrclip",
    show_launcher = "~/.config/rofi/launcher/run.sh",
    show_power_menu = "~/.config/rofi/powermenu/run.sh",
    show_emoji_picker = config.places.config .. "/rofi/emoji-run.sh",
}

config.commands = {
    magnifier = "slop --shader boxzoom --tolerance 0 --bordersize 3 | xclip -selection primary",
}

function config.commands.open(path)
    return "xdg-open \"" .. path .. "\""
end

function config.commands.copy_text(text)
    return "echo -n \"" .. text .. "\" | xclip -selection clipboard"
end

return config

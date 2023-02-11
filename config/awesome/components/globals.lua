-- Gruvbox colors
gb_green = "#b8bb26"
gb_blue = "#83a598"
gb_gray = "#928374"

-- Sandbox globals for linter purposes
capi = {
  awesome = awesome,
  client = client,
  root = root,
}

-- This is used later as the default terminal and editor to run.
terminal = "kitty"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

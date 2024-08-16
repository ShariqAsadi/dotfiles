local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 16

config.color_scheme = 'Dracula'

config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.window_background_opacity = 0.9
config.macos_window_background_blur = 10

config.window_background_gradient = {
  orientation = "Vertical",

  colors = {
    "#223343",
    "#000000"
  },

  interpolation = "Linear",
  blend = "Rgb"
}

config.keys = {
  {
    key = "f",
    mods = "CTRL|CMD",
    action = wezterm.action.ToggleFullScreen
  },
}

return config
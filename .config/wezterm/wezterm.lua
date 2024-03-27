local wezterm = require("wezterm")

return {
  font = wezterm.font("Iosevka Term"),
  font_size = 14,
  color_scheme = "nord",

  native_macos_fullscreen_mode = true,
  window_decorations = "RESIZE",
  tab_bar_at_bottom = true,
  use_fancy_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,

  colors = {
    tab_bar = {
      background = "#3f3f3f",
      active_tab = { bg_color = "#282c34", fg_color = "#abb2bf" },
      inactive_tab = { bg_color = "#3f3f3f", fg_color = "#bfc5ce", italic = true },
      new_tab = { bg_color = "#3f3f3f", fg_color = "#bfc5ce" },
    },
  },

  exit_behavior = "Close",

  keys = {
    { key = "f", mods = "CMD|CTRL", action = "ToggleFullScreen" },
  },
}

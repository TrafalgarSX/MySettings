local backdrops = require("utils.backdrops")

return {
  -- https://wezterm.org/config/key-encoding.html
  -- https://github.com/wezterm/wezterm/issues/3180
  allow_win32_input_mode = false,
  term = "xterm-256color",
  animation_fps = 60,
  max_fps = 60,
  front_end = "WebGpu",
  webgpu_power_preference = "HighPerformance",

  -- color scheme
  -- colors = colors,
  color_scheme = "Gruvbox dark, medium (base16)",

  -- background
  window_background_opacity = 1.00,
  win32_system_backdrop = "Acrylic",
  window_background_gradient = {
    colors = { "#1D261B", "#261A25" },
    -- Specifices a Linear gradient starting in the top left corner.
    orientation = { Linear = { angle = -45.0 } },
  },
   -- background
  background = backdrops:initial_options(false), -- set to true if you want wezterm to start on focus mode

  -- scrollbar
  enable_scroll_bar = true,
  min_scroll_bar_height = "3cell",
  colors = {
    scrollbar_thumb = "#34354D",
  },

  -- tab bar
  enable_tab_bar = true,
  hide_tab_bar_if_only_one_tab = false,
  use_fancy_tab_bar = true,
  tab_max_width = 25,
  show_tab_index_in_tab_bar = true,
  switch_to_last_active_tab_when_closing_tab = true,

  -- cursor
  default_cursor_style = "BlinkingBlock",
  cursor_blink_ease_in = "Constant",
  cursor_blink_ease_out = "Constant",
  cursor_blink_rate = 700,

  -- window
  adjust_window_size_when_changing_font_size = false,
  window_decorations = "INTEGRATED_BUTTONS|RESIZE",
  integrated_title_button_style = "Windows",
  integrated_title_button_color = "auto",
  integrated_title_button_alignment = "Right",
  initial_cols = 160,
  initial_rows = 40,
  window_padding = {
    left = 5,
    right = 10,
    top = 12,
    bottom = 7,
  },
  window_close_confirmation = "NeverPrompt", -- AlwaysPrompt
  window_frame = {
    active_titlebar_bg = "#0F2536",
    inactive_titlebar_bg = "#0F2536",
    -- font = fonts.font,
    -- font_size = fonts.font_size,
  },
  inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 },
}

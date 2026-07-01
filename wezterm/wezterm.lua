local wezterm = require 'wezterm'
local config = wezterm.config_builder()

local is_windows = wezterm.target_triple:find("windows") ~= nil

-- Font & window
config.font = wezterm.font("Mononoki Nerd Font")
config.font_size = 14.0
config.window_background_opacity = 0.90
config.window_decorations = "RESIZE"
config.warn_about_missing_glyphs = false

-- Colors
config.colors = {
  foreground    = "#d4d4d4",
  background    = "#000000",
  cursor_bg     = "#1adf96",
  cursor_fg     = "#000000",
  cursor_border = "#1adf96",
  selection_fg  = "#000000",
  selection_bg  = "#536359",
  scrollbar_thumb = "#414d45",
  split           = "#414d45",

  ansi = {
    "#232323",  -- black
    "#95f2d0",  -- red
    "#1adf96",  -- green
    "#75a7a2",  -- yellow
    "#568782",  -- blue
    "#536359",  -- magenta
    "#55ebb4",  -- cyan
    "#d4d4d4",  -- white
  },

  brights = {
    "#414d45",  -- bright black
    "#95f2d0",  -- bright red
    "#35e7a6",  -- bright green
    "#b7d1ce",  -- bright yellow
    "#8bb5b1",  -- bright blue
    "#75efc2",  -- bright magenta
    "#95f2d0",  -- bright cyan
    "#ffffff",  -- bright white
  },

  tab_bar = {
    background   = "#052b1d",
    active_tab   = { bg_color = "#1adf96", fg_color = "#000000" },
    inactive_tab = { bg_color = "#000000", fg_color = "#536359" },
    inactive_tab_hover = { bg_color = "#052b1d", fg_color = "#d4d4d4" },
    new_tab      = { bg_color = "#000000", fg_color = "#536359" },
    new_tab_hover = { bg_color = "#052b1d", fg_color = "#d4d4d4" },
  },
}

-- Tab bar
config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = true

-- Shell (OS-specific)
if is_windows then
  local cmder = 'D:\\cmder'
  config.default_prog = { 'cmd.exe', '/k', cmder .. '\\vendor\\init.bat' }
  config.set_environment_variables = {
    CMDER_ROOT = cmder,
    ARCHITECTURE = '64',
  }
else
  config.default_prog = { '/bin/zsh', '--login' }
end

-- Keybindings
config.keys = {
  { key = '1', mods = 'CTRL', action = wezterm.action.ActivateTab(0) },
  { key = '2', mods = 'CTRL', action = wezterm.action.ActivateTab(1) },
  { key = '3', mods = 'CTRL', action = wezterm.action.ActivateTab(2) },
  { key = '4', mods = 'CTRL', action = wezterm.action.ActivateTab(3) },
  { key = '5', mods = 'CTRL', action = wezterm.action.ActivateTab(4) },
  { key = '6', mods = 'CTRL', action = wezterm.action.ActivateTab(5) },
  { key = '7', mods = 'CTRL', action = wezterm.action.ActivateTab(6) },
  { key = '8', mods = 'CTRL', action = wezterm.action.ActivateTab(7) },
  { key = '9', mods = 'CTRL', action = wezterm.action.ActivateTab(-1) },
  { key = 'w', mods = 'CTRL', action = wezterm.action.CloseCurrentTab { confirm = true } },
  { key = 't', mods = 'CTRL', action = wezterm.action.SpawnTab('CurrentPaneDomain') },
}

return config

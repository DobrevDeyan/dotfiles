local wezterm = require 'wezterm'
local config = wezterm.config_builder()

local is_windows = wezterm.target_triple:find("windows") ~= nil

-- Font & window
config.font = wezterm.font("Mononoki Nerd Font")
config.font_size = 14.0
config.window_background_opacity = 0.90
config.window_decorations = "RESIZE"
config.warn_about_missing_glyphs = false
config.send_composed_key_when_left_alt_is_pressed = false

-- Colors: Catppuccin, Mocha for dark mode / Latte for light mode
local function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return "Dark"
end

config.color_scheme = get_appearance():find("Dark") and "Catppuccin Mocha" or "Catppuccin Latte"

-- Tab bar (retro style honors colors.tab_bar; fancy tab bar ignores it and uses window_frame instead)
config.use_fancy_tab_bar = false
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
  -- Move tab left with Ctrl + Shift + Left Arrow
  { key = 'LeftArrow', mods = 'CTRL|SHIFT', action = wezterm.action.MoveTabRelative(-1) },
  -- Move tab right with Ctrl + Shift + Right Arrow
  { key = 'RightArrow', mods = 'CTRL|SHIFT', action = wezterm.action.MoveTabRelative(1) },
}

return config

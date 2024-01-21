-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end


-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Aura (Gogh)'

config.font_size = 16.0

local act = wezterm.action

config.keys = {
    -- Turn off the default CMD-m Hide action, allowing CMD-m to
    -- be potentially recognized and handled by the tab
    {
      key = 't',
      mods = 'CTRL',
      action = act.SpawnTab "CurrentPaneDomain",
    },
    {
        key = 'w',
        mods = 'CTRL',
        action = act.CloseCurrentTab { confirm = true },
    },
    { key = 'k', mods = 'CTRL|SHIFT', action = act.ScrollByLine(-1) },
    { key = 'j', mods = 'CTRL|SHIFT', action = act.ScrollByLine(1) },
}

config.window_background_opacity = 1
config.text_background_opacity = 0.6

-- and finally, return the configuration to wezterm
return config

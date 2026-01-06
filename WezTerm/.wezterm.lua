-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

config.initial_cols = 120
config.initial_rows = 20

config.font_size = 18
config.color_scheme = 'ayu'

-- Finally, return the configuration to wezterm:
return config

-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- For example, changing the color scheme:
config = {
	color_scheme = "Tokyo Night",
	font = wezterm.font("Mononoki Nerd Font"),
	hide_tab_bar_if_only_one_tab = true,
	window_decorations = "RESIZE",
	-- set_environment_variables = {
	-- 	NU_CONFIG_DIR = "/Users/moacir/.config/nushell",
	-- },
	-- default_prog = { "/opt/homebrew/bin/nu" },
}

-- and finally, return the configuration to wezterm
return config

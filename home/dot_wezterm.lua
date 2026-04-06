local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.automatically_reload_config = true
config.scrollback_lines = 10000
config.hyperlink_rules = wezterm.default_hyperlink_rules()

config.initial_cols = 120
config.initial_rows = 30

-- Shell
config.default_prog = { "nu" }

-- Appearance
config.font_size = 11
config.font = wezterm.font({
	family = "Maple Mono NF",
	weight = "DemiBold",
	harfbuzz_features = { "calt", "liga" },
})
config.color_scheme = "Catppuccin Mocha"
config.use_fancy_tab_bar = false
config.enable_scroll_bar = true
config.window_frame = {
	font = wezterm.font({ family = "Roboto", weight = "Bold" }),
	font_size = 12.0,
	active_titlebar_bg = "#181825",
	inactive_titlebar_bg = "#11111B",
}
config.colors = {
	tab_bar = {
		inactive_tab_edge = "#1E1E2E",
	},
}
config.colors = {
	tab_bar = {
		background = "#181825",
		active_tab = {
			bg_color = "#1E1E2E",
			fg_color = "#cdd6f4",
			intensity = "Normal",
			underline = "None",
			italic = false,
			strikethrough = false,
		},
		inactive_tab = {
			bg_color = "#181825",
			fg_color = "#cdd6f4",
		},
		inactive_tab_hover = {
			bg_color = "#1E1E2E",
			fg_color = "#cdd6f4",
			italic = true,
		},
		new_tab = {
			bg_color = "#181825",
			fg_color = "#cdd6f4",
		},
		new_tab_hover = {
			bg_color = "#1E1E2E",
			fg_color = "#cdd6f4",
			italic = true,
		},
	},
}
config.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.8,
}

return config

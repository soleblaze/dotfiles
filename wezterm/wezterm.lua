-- Pull in the wezterm API
local wezterm = require("wezterm")
local mux = wezterm.mux
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

config.front_end = "WebGpu"
config.window_decorations = "RESIZE"

config.font = wezterm.font({
	family = "DejaVuSansM Nerd Font Mono",
})

config.font_size = 20.0
config.dpi = 140

config.hide_tab_bar_if_only_one_tab = true

config.skip_close_confirmation_for_processes_named = {}

config.exit_behavior = "Close"

config.use_dead_keys = false
config.scrollback_lines = 5000
config.adjust_window_size_when_changing_font_size = false

-- config.leader = { key = " ", mods = "CTRL", timeout_milliseconds = 2000 }

config.colors = {
	foreground = "#fefefe",
	-- The default background color
	background = "#193549",

	-- Overrides the cell background color when the current cell is occupied by the
	-- cursor and the cursor style is set to Block
	cursor_bg = "#ffc600",
	-- Overrides the text color when the current cell is occupied by the cursor
	-- cursor_fg = "#fefefe",
	-- Specifies the border color of the cursor when the cursor style is set to Block,
	-- or the color of the vertical or horizontal bar when the cursor style is set to
	-- Bar or Underline.
	cursor_border = "ffc600",

	-- the foreground color of selected text
	selection_fg = "#fefefe",
	-- the background color of selected text
	selection_bg = "#275d84",

	-- The color of the scrollbar "thumb"; the portion that represents the current viewport
	-- scrollbar_thumb = "#222222",

	-- The color of the split lines between panes
	split = "1460D2",

	ansi = {
		"#000000",
		"#ff2600",
		"#3ad900",
		"#ffc600",
		"#1478db",
		"#ff2c70",
		"#00c5c7",
		"#c7c7c7",
	},
	brights = {
		"#808080",
		"#ff0000",
		"#33ff00",
		"#ffff00",
		"#1478db",
		"#cc00ff",
		"#00ffff",
		"#fefefe",
	},

	-- Arbitrary colors of the palette in the range from 16 to 255
	indexed = {
		[16] = "#ff8c00",
		[17] = "#0088ff",
		[18] = "#5555ff",
		[237] = "#555555",
	},

	-- Since: 20220319-142410-0fcdea07
	-- When the IME, a dead key or a leader key are being processed and are effectively
	-- holding input pending the result of input composition, change the cursor
	-- to this color to give a visual cue about the compose state.
	compose_cursor = "#1478db",

	-- Colors for copy_mode and quick_select
	-- available since: 20220807-113146-c2fee766
	-- In copy_mode, the color of the active text is:
	-- 1. copy_mode_active_highlight_* if additional text was selected using the mouse
	-- 2. selection_* otherwise
	copy_mode_active_highlight_bg = { Color = "#ffff00" },
	copy_mode_inactive_highlight_bg = { Color = "#ffc600" },

	quick_select_label_bg = { Color = "#275d84" },
	quick_select_label_fg = { Color = "#fefefe" },
	quick_select_match_bg = { Color = "#33ff00" },
	quick_select_match_fg = { Color = "#fefefe" },
}

return config

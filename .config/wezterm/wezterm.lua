--
-- ██╗    ██╗███████╗███████╗████████╗███████╗██████╗ ███╗   ███╗
-- ██║    ██║██╔════╝╚══███╔╝╚══██╔══╝██╔════╝██╔══██╗████╗ ████║
-- ██║ █╗ ██║█████╗    ███╔╝    ██║   █████╗  ██████╔╝██╔████╔██║
-- ██║███╗██║██╔══╝   ███╔╝     ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║
-- ╚███╔███╔╝███████╗███████╗   ██║   ███████╗██║  ██║██║ ╚═╝ ██║
--  ╚══╝╚══╝ ╚══════╝╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝
-- A GPU-accelerated cross-platform terminal emulator
-- https://wezfurlong.org/wezterm/

local dark_opacity = 0.65
local light_opacity = 0.90

local wallpapers_glob = os.getenv("HOME") .. "/Documents/Obsidian Vault/03 - Resources/wallpapers macos/**"

local b = require("utils/background")
local h = require("utils/helpers")
local w = require("utils/wallpaper")

local wezterm = require("wezterm")
local mux = wezterm.mux

---@type Config
---@diagnostic disable: missing-fields
local config = {
	background = {
		w.get_wallpaper(wallpapers_glob),
		b.get_background(dark_opacity, light_opacity),
	},

	font_size = 20,

	-- line_height = 1.1,

	font = wezterm.font_with_fallback({ "CommitMono", "JetBrains Mono" }),

	color_scheme = "nord",

	window_padding = {
		left = 100,
		right = 100,
		top = 50,
		bottom = 50,
	},

	set_environment_variables = {
		-- BAT_THEME = h.is_dark() and "Catppuccin-mocha" or "Catppuccin-latte",
		LC_ALL = "en_US.UTF-8",
		-- TODO: audit what other variables are needed
	},

	-- general options
	adjust_window_size_when_changing_font_size = false,
	initial_rows = 200,
	initial_cols = 134,
	debug_key_events = false,
	enable_tab_bar = false,
	native_macos_fullscreen_mode = false,
	window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE",
}

wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

return config

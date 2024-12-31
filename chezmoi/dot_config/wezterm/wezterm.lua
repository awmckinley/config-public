-- add local lib to path
package.path = package.path .. ";" .. os.getenv("HOME") .. "/.local/lib/lua/?.lua"

-- load WezTerm API
local wezterm = require("wezterm")
local act = wezterm.action

local schemes = {
	["catppuccin-frappe"] = "Catppuccin Frappe",
	["catppuccin-latte"] = "Catppuccin Latte",
	["catppuccin-macchiato"] = "Catppuccin Macchiato",
	["catppuccin-mocha"] = "Catppuccin Mocha",
	["default-dark"] = "Default Dark (base16)",
	["default-light"] = "Default Light (base16)",
	["dracula"] = "Dracula (Official)",
	["github"] = "GitHub Light",
	["onedark"] = "OneDarkPro",
	["onedark-dark"] = "OneDarkPro Dark",
	["ros-pine"] = "Rosé Pine",
	["ros-pine-dawn"] = "Rosé Pine Dawn",
	["ros-pine-moon"] = "Rosé Pine Moon",
	["tokyo-night-dark"] = "Tokyo Night",
	["tokyo-night-light"] = "Tokyo Night Day",
	["tokyo-night-moon"] = "Tokyo Night Moon",
	["tokyo-night-storm"] = "Tokyo Night Storm",
	["tokyodark"] = "Tokyo Dark",
}

-- translate input to WezTerm scheme
local function get_color_scheme(mode)
	-- https://wezfurlong.org/wezterm/colorschemes/index.html
	local input = require("dotenv").theme(mode)
	local scheme = schemes[input.SLUG]
	return scheme
end

-- what system?
local is_darwin = wezterm.target_triple:find("darwin") ~= nil
local is_linux = wezterm.target_triple:find("linux") ~= nil

-- respond to folke/zen-mode.nvim
wezterm.on("user-var-changed", function(window, pane, name, value)
	local overrides = window:get_config_overrides() or {}
	if name == "ZEN_MODE" then
		local incremental = value:find("+")
		local number_value = tonumber(value)
		if incremental ~= nil then
			while number_value > 0 do
				window:perform_action(act.IncreaseFontSize, pane)
				number_value = number_value - 1
			end
			overrides.enable_tab_bar = false
		elseif number_value < 0 then
			window:perform_action(act.ResetFontSize, pane)
			overrides.font_size = nil
			overrides.enable_tab_bar = true
		else
			overrides.font_size = number_value
			overrides.enable_tab_bar = false
		end
	end
	window:set_config_overrides(overrides)
end)

-- when the config reloads, check light/dark mode
wezterm.on("window-config-reloaded", function(window)
	local overrides = window:get_config_overrides() or {}
	local appearance = window:get_appearance()

	local scheme
	if appearance:find("Dark") then
		scheme = get_color_scheme("dark")
	else
		scheme = get_color_scheme("light")
	end

	if overrides.color_scheme ~= scheme then
		overrides.color_scheme = scheme
		window:set_config_overrides(overrides)
	end
end)

local config = {}

-- use `config_builder` for better errors
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Homebrew/Nix manages updates
config.check_for_updates = false

-- default to dark
config.color_scheme = get_color_scheme("dark")

-- blinking cursor
config.cursor_blink_rate = 400

-- a classic style
config.default_cursor_style = "BlinkingBlock"

-- nonlogin zsh
config.default_prog = { "zsh" }

-- KiTTY compatibility
config.enable_kitty_graphics = true

-- get it OUT
config.enable_scroll_bar = false

-- allows TMUX session to survive
config.exit_behavior = "Close"

-- fonts
config.font = wezterm.font({
	family = "TX-02",
	harfbuzz_features = {},
})
if is_darwin then
	config.font_size = 13.5
else
	config.font_size = 11
end

-- https://github.com/wez/wezterm/issues/5990
config.front_end = "WebGpu"

-- tab bar
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false

-- assign keys
config.keys = {
	{ key = "Enter", mods = "ALT", action = act.DisableDefaultAssignment },
	{ key = "p", mods = "SUPER", action = act.ActivateCommandPalette },
}

-- use wezterm terminfo
config.term = "wezterm"

-- try to keep the window size aligned with cells
config.use_resize_increments = false

-- Yabai handles transparency
config.window_background_opacity = 1.0

-- don't show title bar
config.window_decorations = "RESIZE|TITLE"

-- minimal padding
config.window_padding = {
	bottom = 0,
	left = 0,
	right = 0,
	top = 0,
}

return config

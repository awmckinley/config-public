--[[
Automatically change the editor appearance based on system settings.

NOTE: `ros-pine` is a quirk of my theme.*.env files.
--]]

local schemes = {
	["catppuccin-frappe"] = "catppuccin-frappe",
	["catppuccin-latte"] = "catppuccin-latte",
	["catppuccin-macchiato"] = "catppuccin-macchiato",
	["catppuccin-mocha"] = "catppuccin-mocha",
	["default-dark"] = "default",
	["default-light"] = "default",
	["dracula"] = "dracula",
	["github"] = "github_light",
	["onedark"] = "onedark",
	["onedark-dark"] = "onedark_dark",
	["ros-pine"] = "rose-pine-main",
	["ros-pine-dawn"] = "rose-pine-dawn",
	["ros-pine-moon"] = "rose-pine-moon",
	["tokyo-night-dark"] = "tokyonight-night",
	["tokyo-night-light"] = "tokyonight-day",
	["tokyo-night-moon"] = "tokyonight-moon",
	["tokyo-night-storm"] = "tokyonight-storm",
	["tokyodark"] = "tokyodark",
}

local dark = require("dotenv").theme("dark")
local light = require("dotenv").theme("light")

local function enabled(theme)
	return dark.SLUG:match(theme) or light.SLUG:match(theme)
end

return {
	{
		"f-person/auto-dark-mode.nvim",
		opts = {
			set_dark_mode = function()
				vim.opt.background = "dark"
				local scheme = schemes[dark.SLUG]
				if scheme ~= nil then
					vim.cmd("colorscheme " .. scheme)
				end
			end,
			set_light_mode = function()
				vim.opt.background = "light"
				local scheme = schemes[light.SLUG]
				if scheme ~= nil then
					vim.cmd("colorscheme " .. scheme)
				end
			end,
		},
		pin = true,
	},

	{
		"catppuccin/nvim",
		name = "catppuccin",
		enabled = enabled("catppuccin"),
		pin = true,
	},

	{
		"dracula/vim",
		name = "dracula",
		enabled = enabled("dracula"),
		pin = true,
	},

	{
		"projekt0n/github-nvim-theme",
		enabled = enabled("github"),
		pin = true,
	},

	{
		"olimorris/onedarkpro.nvim",
		enabled = enabled("onedark"),
		pin = true,
	},

	{
		"rose-pine/neovim",
		name = "rose-pine",
		enabled = enabled("ros-pine"),
		pin = true,
	},

	{
		"tiagovla/tokyodark.nvim",
		enabled = enabled("tokyodark"),
		pin = true,
	},

	{
		"folke/tokyonight.nvim",
		enabled = enabled("tokyonight"),
		pin = true,
	},
}

--[[
Set options.
--]]

local custom = require("custom.util")

-- use system clipboard
vim.opt.clipboard = {
	"unnamedplus",
}

-- long lines indicator
vim.opt.colorcolumn = {
	"80",
}

-- better insert mode completion
vim.opt.completeopt = {
	"menu",
	"menuone",
	"noselect",
}

-- use concealment
vim.opt.concealcursor = ""
vim.opt.conceallevel = 2

-- use histogram algorithm for diff mode
vim.opt.diffopt = {
	"algorithm:histogram",
	"closeoff",
	"filler",
	"internal",
}

-- show folds
vim.opt.foldcolumn = "1"

-- keep folds open after expr
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99

-- leave short things unfolded
vim.opt.foldminlines = 3

-- normal display for closed folds
vim.opt.foldtext = ""

-- improve cursor visibility
vim.opt.guicursor = {
	"n-v-c:block",
	"i-ci-ve:ver25",
	"r-cr:hor20",
	"o:hor50",
	"a:blinkwait700-blinkoff400-blinkon400-Cursor/lCursor",
	"sm:block-blinkwait175-blinkoff150-blinkon150",
}

-- search ignores case until PATTERN
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- preview window during substitute
vim.opt.inccommand = "split"

-- use global statusline
vim.opt.laststatus = 3

-- explicit whitespace
vim.opt.list = true

-- explicit whitespace characters
if custom.ansi256() then
	vim.opt.listchars = {
		tab = "» ",
		trail = "·",
		nbsp = "␣",
	}
else
	vim.opt.listchars = {
		tab = "> ",
		trail = "-",
		nbsp = "+",
	}
end

-- use mouse
vim.opt.mouse = "a"

-- allow mouse to work for statuscol
vim.opt.mousemodel = "extend"

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- keep lines visible
vim.opt.scrolloff = 8

-- lualine shows the mode
vim.opt.showmode = false

-- always show signcolumn
vim.opt.signcolumn = "yes:1"

-- split below or right
vim.opt.splitbelow = true
vim.opt.splitright = true

-- save undo history
vim.opt.undofile = true
vim.opt.undolevels = 10000

-- shorten update time
vim.opt.updatetime = 250

-- disable visual wrapping
vim.opt.wrap = false

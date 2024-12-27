--[[
Neovim configuration.

:help quickref
:help lua-guide-config
:help lua-guide
--]]

-- add local lib to path
local libpath = vim.env.HOME .. "/.local/lib"
vim.opt.rtp:append(libpath)

-- configure lazy
require("custom.lazy")

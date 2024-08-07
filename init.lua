--[[


Guy Delarea NEOVIM Config


]]

-- Configuratig Lazynvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
-- Loading Basic Neovim Configurauon
require("guydelarea.nvim-options")
-- Loading Lazy
require("lazy").setup("plugins")
-- Setting VIM Notify Plugin
vim.notify = require("notify")
print("Guy Delarea NEOVIM CONFIG V2")

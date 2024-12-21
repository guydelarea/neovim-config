--[[


Guy Delarea NEOVIM Config


]]

-- Configuration Lazynvim
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
-- Loading Basic Neovim Configuration
require("config.guydelarea")
-- Loading Lazy
require("lazy").setup("plugins")
print("Guy Delarea NEOVIM CONFIG V2.1")

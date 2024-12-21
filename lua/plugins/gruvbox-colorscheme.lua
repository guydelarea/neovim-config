return {
	"sainnhe/gruvbox-material",
	priority = 1000,
	config = function()
		-- Load Gruvbox
        vim.cmd.colorscheme("gruvbox-material")
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        vim.cmd([[highlight Normal guibg=NONE]])
        vim.cmd([[highlight NormalNC guibg=NONE]])
	end,
}


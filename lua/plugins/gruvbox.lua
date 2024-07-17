return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	lazy = false,
	config = function()
		-- Load Gruvbox
		vim.cmd.colorscheme("gruvbox")
		vim.cmd.hi("Comment gui=none")
		-- Transperant background
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	end,
}

return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "wombat",
                section_separators = { left = '', right = '' },
                icons_enabled = true,
			},
		})
	end,
}

return {
	"mfussenegger/nvim-dap-python",
	config = function()
		require("dap-python").setup("/home/guy/.pyenv/shims/python")
		table.insert(require("dap").configurations.python, {
			type = "python",
			request = "launch",
			name = "My custom launch configuration",
			program = "${file}",
			-- ... more options, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
		})
		vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "", numhl = "" })
		vim.fn.sign_define("DapStopped", { text = "▶️", texthl = "", linehl = "", numhl = "" })
	end,
}

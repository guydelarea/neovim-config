--[[

Guy Delarea Neovim Config

--]]

-- Neovim Global Settings
vim.wo.number = true
vim.g.mapleader = " "
vim.wo.relativenumber = true
-- AutoComplete Popup
vim.o.completeopt = "menuone,noselect"
-- Notify
vim.opt.termguicolors = true
-- Save undo history
vim.opt.undofile = true
-- Obsidian
vim.opt.conceallevel = 2
-- Ident
vim.opt.list = true
vim.opt.listchars:append "space:⋅"
-- Groovy
-- Jenkinsfile as groovy
vim.cmd([[
augroup filetypedetect
    autocmd BufRead,BufNewFile Jenkinsfile set filetype=groovy
augroup END
]])
-- Locals
local map = vim.api.nvim_set_keymap
-- Git
vim.g.gitblame_display_virtual_text = 1 -- Enable virtual text for git
-- Main KeyMaps
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- Keybinds
map("n", "<C-a>", ":NvimTreeToggle<CR>", { silent = true })
map("n", "<C-g>", ":LazyGit<CR>", { silent = true })
map("n", "<C-f>", ":lua vim.lsp.buf.format()<CR>", { silent = true })
map("n", "<C-i>", ":lua vim.diagnostic.open_float()<CR>", { silent = true })
map("n", "<C-s>", ":SessionManager save_current_session<CR>", { silent = true })
map("n", "<C-l>", ":SessionManager load_current_dir_session<CR>", { silent = true })
map("n", "<leader>t", ":TroubleToggle<CR>", { silent = true })
map("n", "<C-d>", "<C-d>zz", { silent = true })
map("n", "<C-u>", "<C-u>zz", { silent = true })
map("n", "n", "nzz", { silent = true })
map("n", "N", "Nzz", { silent = true })
vim.keymap.set("n", "<C-k>", function()
	vim.lsp.buf.signature_help()
end)
-- Tabs
vim.api.nvim_set_keymap("n", "<C-t>", "<cmd>tabnew<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-q>", "<cmd>BufferClose<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "gt", "<cmd>BufferNext<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "gr", "<cmd>BufferPrevious<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>gt", "<cmd>BufferMoveNext<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>gr", "<cmd>BufferMovePrevious<CR>", { noremap = true })
-- Debugger
vim.keymap.set("n", "<F4>", function()
	require("dap").close()
end)
vim.keymap.set("n", "<F3>", function()
	require("dapui").toggle()
end)
vim.keymap.set("n", "<F5>", function()
	require("dap").continue()
end)
vim.keymap.set("n", "<F10>", function()
	require("dap").step_over()
end)
vim.keymap.set("n", "<F9>", function()
	require("dap").step_into()
end)
vim.keymap.set("n", "<F12>", function()
	require("dap").step_out()
end)
vim.keymap.set("n", "<Leader>b", function()
	require("dap").toggle_breakpoint()
end)
vim.keymap.set("n", "<Leader>B", function()
	require("dap").set_breakpoint(vim.fn.input("Breakpoint Condition: "))
end)
vim.keymap.set("n", "<Leader>lp", function()
	require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end)
vim.keymap.set("n", "<Leader>dr", function()
	require("dap").repl.open()
end)
vim.keymap.set("n", "<Leader>dl", function()
	require("dap").run_last()
end)
vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
	require("dap.ui.widgets").hover()
end)
vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
	require("dap.ui.widgets").preview()
end)
vim.keymap.set("n", "<Leader>df", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.frames)
end)
vim.keymap.set("n", "<Leader>ds", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.scopes)
end)

-- Sets
vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"
vim.opt.foldlevel = 20
vim.opt.foldmethod = "indent"
vim.opt.foldignore = ""
vim.opt.splitright = false

-- Obsidian Keymaps
vim.api.nvim_set_keymap("n", "<Leader>oo", "<cmd>ObsidianFollowLink<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>qs", "<cmd>ObsidianQuickSwitch<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>bl", "<cmd>ObsidianBacklinks<CR>", { noremap = true })
vim.keymap.set("n", "<Leader>cb", function()
	require("obsidian").util.toggle_checkbox()
end)


-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.get_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.get_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Neovim Spelling
vim.opt.spelllang = 'en_us'
vim.opt.spell = true

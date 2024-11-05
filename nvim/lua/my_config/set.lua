vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"
vim.opt.textwidth = 80

vim.g.name = "value"
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

vim.keymap.set(
	{ "n", "o", "x" },
	"<leader>w",
	"<cmd>lua require('spider').motion('w')<CR>",
	{ desc = "Spider-w" }
)
vim.keymap.set(
	{ "n", "o", "x" },
	"<leader>e",
	"<cmd>lua require('spider').motion('e')<CR>",
	{ desc = "Spider-e" }
)
vim.keymap.set(
	{ "n", "o", "x" },
	"<leader>b",
	"<cmd>lua require('spider').motion('b')<CR>",
	{ desc = "Spider-b" }
)

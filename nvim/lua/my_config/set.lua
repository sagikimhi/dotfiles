vim.g.name = "value"
vim.g.loaded_node_provider = 0

vim.opt.nu = true
vim.opt.signcolumn = "yes"
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.scrolloff = 10
vim.opt.textwidth = 78
vim.opt.updatetime = 50
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.colorcolumn = "80"
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.isfname:append("@-@")
vim.opt.termguicolors = true

vim.opt.foldlevel = 99
vim.opt.foldcolumn = '1'
vim.opt.foldenable = true
vim.opt.foldlevelstart = 99

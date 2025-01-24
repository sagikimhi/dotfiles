vim.g.name = "value"

vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.opt.undofile = true

vim.opt.nu = true
vim.opt.rnu = true
vim.opt.signcolumn = "yes"

vim.opt.tabstop = 4
vim.opt.scrolloff = 10
vim.opt.updatetime = 50
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.colorcolumn = "80"
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.foldlevel = 99
vim.opt.foldcolumn = '1'
vim.opt.foldenable = true
vim.opt.foldlevelstart = 99

vim.opt.isfname:append("@-@")
vim.opt.termguicolors = true

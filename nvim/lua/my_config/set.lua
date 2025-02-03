vim.g.name = "value"

vim.opt.nu = true
vim.opt.rnu = true
vim.opt.wrap = false
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.signcolumn = "yes:1"
vim.opt.cursorline = true
vim.opt.termguicolors = true

vim.opt.backup = true
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.opt.backupdir = os.getenv("HOME") .. "/.nvim/backup"

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.foldlevel = 99
vim.opt.foldcolumn = '1'
vim.opt.foldenable = true
vim.opt.foldlevelstart = 99

vim.opt.fo="croqwjp"
vim.opt.tw=72
vim.opt.sel="old"
vim.opt.splitright=true

vim.opt.mouse='a'
vim.opt.scrolloff = 10
vim.opt.updatetime = 50
vim.opt.sidescrolloff = 25
vim.opt.colorcolumn = "80"
vim.opt.isfname:append("@-@")
vim.opt.diffopt = "internal,filler,closeoff,algorithm:histogram,linematch:60,iblank"

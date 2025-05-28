-- ----------------------------------------------------------------------------
-- LazyVim Globals
-- ----------------------------------------------------------------------------

vim.g.lazyvim_picker = "snacks"
vim.g.lazyvim_python_lsp = "basedpyright"
vim.g.lazyvim_python_ruff = "ruff"

-- ----------------------------------------------------------------------------
-- Neovim Globals
-- ----------------------------------------------------------------------------

-- vim.g.clipboard = fn.get_clipboard()
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.ruby_host_prog = "~/.local/share/gem/ruby/3.3.0/bin/neovim-ruby-host"
vim.g.loaded_perl_provider = 0
vim.g.python3_host_prog = os.execute("~/.local/bin/uv python find")

-- ----------------------------------------------------------------------------
-- Neovim Options
-- ----------------------------------------------------------------------------

-- vim.o.shell = "/bin/zsh"
vim.opt.backup = true
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.undodir = vim.fn.stdpath("state") .. "/.nvim/undodir"
vim.opt.backupdir = vim.fn.stdpath("state") .. "/.nvim/backup"

vim.opt.nu = true
vim.opt.rnu = true
vim.opt.wrap = false
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.signcolumn = "yes:1"
vim.opt.cursorline = true
vim.opt.termguicolors = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.foldlevel = 99
vim.opt.foldcolumn = "0"
vim.opt.foldenable = true
vim.opt.foldlevelstart = 99

vim.opt.fo = "croqwjp"
vim.opt.tw = 78
vim.opt.sel = "old"
vim.opt.splitright = true

vim.opt.mouse = "a"
vim.opt.scrolloff = 10
vim.opt.updatetime = 50
vim.opt.sidescrolloff = 25
vim.opt.colorcolumn = "80"
vim.opt.isfname:append("@-@")
vim.opt.diffopt = "internal,filler,closeoff,algorithm:histogram,linematch:60,iblank"

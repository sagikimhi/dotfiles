-- ----------------------------------------------------------------------------
-- Neovim Globals
-- ----------------------------------------------------------------------------

vim.g.mapleader = " "
vim.g.autoformat = false
vim.g.maplocalleader = "\\"

vim.g.ruby_host_prog = "~/.local/share/gem/ruby/3.3.0/bin/neovim-ruby-host"

vim.g.loaded_perl_provider = 0

vim.g.python3_host_prog = "uv run python"
vim.g.lazyvim_picker = "snacks"
vim.g.lazyvim_python_lsp = "ty"
vim.g.lazyvim_python_ruff = "ruff"

-- ----------------------------------------------------------------------------
-- UI Options
-- ----------------------------------------------------------------------------

-- vim.ui.input = Snacks.input
-- vim.ui.select = Snacks.picker.select

-- ----------------------------------------------------------------------------
-- Neovim Options
-- ----------------------------------------------------------------------------

vim.o.shell = "/bin/zsh"
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

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.foldlevel = 99
vim.opt.foldcolumn = "0"
vim.opt.foldenable = true
vim.opt.foldlevelstart = 99

vim.opt.fo = "croqnlM1j"
vim.opt.tw = 78
vim.opt.sel = "inclusive"
vim.opt.splitright = true

vim.opt.mouse = "a"
vim.opt.scrolloff = 10
vim.opt.colorcolumn = "80"
vim.opt.sidescrolloff = 25
vim.opt.isfname:append("@-@")
vim.opt.diffopt = "internal,filler,closeoff,algorithm:minimal,linematch:60,iblank"
vim.opt.background = "dark"
vim.opt.termguicolors = true

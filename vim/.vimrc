syntax on
set nocompatible
filetype plugin on

set re=1
set noerrorbells

" Tab width, auto indentation, and search and replace case sens and highlighting
set foldcolumn=3
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartcase
set nowrap
set nohls
set incsearch

" line numbers and relative line numbers
set nu
set rnu

" an undo directory - works awesome with the undotree plugin
set undodir=~/.vim/undodir
set undofile

" additional personal preference sets, use :h <setting> to learn more about
" each set
"set foldmethod=syntax
set noswapfile
set nobackup
set complete=.,w,b,t,u
set completeopt=menuone,preview
set textwidth=0
set mouse=a
set paste
set showcmd
set cursorline
set scrolloff=8
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgray
set updatetime=50

" Plugins
call plug#begin('~/.vim/bundle')
Plug 'mbbill/undotree'
Plug 'vim-utils/vim-man'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'will133/vim-dirdiff'
Plug 'joshdick/onedark.vim'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/AutoComplPop'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vhda/verilog_systemverilog.vim'
call plug#end()

" Autocmds to reduce vim slowness when using a fold method other than manual
autocm InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif


"Color theme settings - if you dont like this theme you can try out gruvbox plugin instead,
"its awesome as well (use it's dark theme)
if (has("autocmd"))
  augroup colorextend
    autocmd!
    " Make `Function`s bold in GUI mode
    autocmd ColorScheme * call onedark#extend_highlight("Function", { "gui": "bold" })
    " Override the `Statement` foreground color in 256-color mode
    autocmd ColorScheme * call onedark#extend_highlight("Statement", { "fg": { "cterm": 128 } })
    " Override the `Identifier` background color in GUI mode
    autocmd ColorScheme * call onedark#extend_highlight("Identifier", { "bg": { "gui": "#333333" } })
  augroup END
endif

let g:airline_theme='onedark'
let g:onedark_termcolors=256
let g:onedark_terminal_italics=1
colorscheme onedark

highlight Comment term=NONE cterm=NONE ctermbg=NONE ctermfg=DarkGray
highlight Normal ctermfg=White
highlight IncSearch ctermbg=Cyan

"----------------------- key remaps -----------------------"

let mapleader = " "

" NerdTree Remaps - Toggle, or toggle and goto file in current buffer
nnoremap <leader>pv :NERDTreeToggle<Enter> <bar> :vertical resize 40<CR>
nnoremap <leauer>pf :NERDTreeFind<CR> <bar> :vertical resize 40<CR>

" Window navigation mappings:
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" run ripgrep in workspace for an input string
nnoremap <Leader>ps :Rg<SPACE>

" Undo/redo tree plugin toggling
nnoremap <leader>u :UndotreeShow<CR>

"Vertical resize mappings:
nnoremap <leader>vr :vertical resize 25<CR>
nnoremap <silent><leader>+ :vertical resize +5<CR>
nnoremap <silent><leader>- :vertical resize -5<CR>

"Auto Complete Keybind settings:
" Navigation with up and down, right arrow or return for completion, left arrow
" for cancelation
inoremap <expr> <Down> pumvisible() ? "<C-N>" :"<Down>"
inoremap <expr> <Up> pumvisible() ? "<C-P>" :"<Up>"
inoremap <expr> <Right> pumvisible() ? "<C-Y>" :"<Right>"
inoremap <expr> <Left> pumvisible() ? "<C-E>" :"<Left>"
inoremap <S-Right> <C-P>

"delete what is marked, without saving it to paste reg, and paste whats currently saved
"to the paste register.
vnoremap <leader>p "_dP

" Moving lines along the file - these are so amazing! try out the visual mode
" setting! its a must i swear.
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <leader>J :m .+1<CR>==
nnoremap <leader>K :m .-2<CR>==
inoremap <C-j> <esc>:m .+1<CR>==i
inoremap <C-k> <esc>:m .-2<CR>==i

" Keeps the cursor centered while jumping between definitions, Ctrl+j/k keeps it
" centered when navigating up/down through the file.
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap } }zzzv
nnoremap { {zzzv

" Fix the inlining of J to remove spaces
nnoremap J mzJ`z

" Search and replace word under cursor
nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

" Documentation remaps
nmap <leader>- yyp^gccv$r-^gcc
nmap <leader>_ <leader>-yykP
nnoremap <leader>== yypwC-----------------------------------------------------------------------------<Esc>yykPj
nnoremap <leader>=j yypwC-----------------------------------------------------------------------------<Esc>k
nnoremap <leader>=k yypwC-----------------------------------------------------------------------------<Esc>j

let g:verilog_syntax_fold_lst = 'class,function,task,interface,clocking,covergroup,property,block,block_named,instance,define'
let g:verilog_disable_indent_lst = "eos"
let g:verilog_efm_level = ""
let g:verilog_efm_uvm_lst = ""

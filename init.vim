" let g:python3_host_prog='~/.local/share/virtualenvs/nvim-neovim-G1pBjwa_/bin/python'
"
set langmenu=en_US.UTF-8
syntax on
syntax enable
filetype plugin indent on
set number
set lazyredraw
set relativenumber
set noswapfile
set wildmenu ""
set backspace=indent,eol,start  "ensure proper backspace functionality
set undodir=~/.cache/nvim/undo  "undo ability will persist after exiting file
set undofile                    "see :help undodir and :help undofile
set incsearch                   "see results while search is being typed, see :help incsearch
set smartindent                 "auto indent on new lines, see :help smartindent
set ignorecase                          "ignore case when searching
set colorcolumn=80
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set listchars=tab:\|\ 
set list
"set nocompatible
"set t_Co=256
set smarttab
set cursorline
set clipboard=unnamedplus

" Setting leader to space
nnoremap <SPACE> <Nop>
let mapleader=" "
" Folding
set foldnestmax=10
"set nofoldenable
set foldlevel=1
set foldmethod=indent
nnoremap <M-w> za
vnoremap <M-w> zf
tnoremap <Esc> <C-\><C-n>

" UI configuration
let base16colorspace=256
if has('termguicolors')
    set termguicolors
endif
if has("gui_running")
  set guicursor=n-v-c-sm:block,i-ci-ve:block,r-cr-o:blocks
endif
set hidden
set mouse=a
set noshowmode
set smartcase " turn on smartcase

let g:plugged_home = '~/.vim/plugged'
call plug#begin(g:plugged_home)
  " A fuzzy file finder
  "Plug 'kien/ctrlp.vim'
  " Comment/Uncomment tool
  Plug 'scrooloose/nerdcommenter'
  " Switch to the begining and the end of a block by pressing %
  Plug 'tmhedberg/matchit'
  " A Tree-like side bar for better navigation
  Plug 'preservim/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  " A cool status bar
  Plug 'vim-airline/vim-airline'
  " Airline themes
  Plug 'vim-airline/vim-airline-themes'
  " Nord Theme
  "Plug 'arcticicestudio/nord-vim'
  " One half theme
  "Plug 'sonph/onehalf', { 'rtp': 'vim' }
  " Better syntax-highlighting for filetypes in vim
  Plug 'sheerun/vim-polyglot'
  " Intellisense engine
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Git integration
  Plug 'tpope/vim-fugitive'
  " Auto-close braces and scopes
  Plug 'jiangmiao/auto-pairs'
  " startify
  Plug 'mhinz/vim-startify'
  " fzf
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  " python text objects
  Plug 'jeetsukumaran/vim-pythonsense'
  " Additional text objects
  Plug 'wellle/targets.vim'
  " Move lines up and down
  Plug 'matze/vim-move'
  " Surround
  Plug 'tpope/vim-surround'
  " Auto save
  Plug '907th/vim-auto-save'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  " Easy motion
  "Plug 'easymotion/vim-easymotion'
  " Sneak
  Plug 'justinmk/vim-sneak'
  " Visual multi
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  " Dracula theme
  Plug 'dracula/vim', { 'as': 'dracula' }
  " docstrings, use with C-a C-a
  Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }
  Plug 'tpope/vim-obsession'
  Plug 'bfredl/nvim-ipy'
  Plug 'hkupty/iron.nvim'
  "Plug 'kana/vim-textobj-user'
  "Plug 'kana/vim-textobj-line'
  "Plug 'GCBallesteros/vim-textobj-hydrogen'
  "Plug 'GCBallesteros/jupytext.vim'
call plug#end()

imap jj <Esc>

" Yank to outside
"vnoremap <C-c> "+y
" Git
nmap <F6> :vert Git<CR>
" pydocstring
let g:pydocstring_doq_path = '/home/wcheek/.local/share/virtualenvs/2022_Chatbot-JRxR2F_A/bin/doq'
nmap <silent> <C-a> <Plug>(pydocstring)
let g:pydocstring_formatter = 'google'
" Sneak
let g:sneak#streak = 1
let g:sneak#label = 1
" Auto save
let g:auto_save = 1 
"" Nord theme
"let g:airline_theme = 'nord'
"colorscheme nord
" Dracula theme
set bg=light
colorscheme dracula
let g:airline_theme='dracula'
" Reconfiguring visual multi
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-d>'           " replace C-n
let g:VM_maps['Find Subword Under'] = '<C-d>'           " replace visual C-n
" Open fzf buffers
nnoremap <C-p> :<C-u>FZF<CR> 
nnoremap <silent> <C-b> :Buffers<CR>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
" COC settings
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Open definition in a split window
nmap <silent> gv :vsp<CR><Plug>(coc-definition)<C-W>L

" NERD Tree
map <F7> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1 
" NERD commenter
map <M-q> <plug>NERDCommenterToggle

" airline Configurations Part
let g:airline_left_sep  = ''
let g:airline_right_sep = ''
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'
" Running python scripts
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

luafile $HOME/.config/nvim/plugins.lua

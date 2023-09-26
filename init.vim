set langmenu=en_US.UTF-8
syntax on
syntax enable
filetype plugin indent on
"set title
set completeopt
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
set timeoutlen=200 " key timeoutlen for like double tap keys

" Insert new lines without entering insert mode
nmap oo o<Esc>k
nmap OO O<Esc>j

let g:plugged_home = '~/.vim/plugged'
call plug#begin(g:plugged_home)
  " A fuzzy file finder
  "Plug 'kien/ctrlp.vim'
  " Comment/Uncomment tool
  Plug 'scrooloose/nerdcommenter'
  Plug 'ryanoasis/vim-devicons'
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
  "Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }
  Plug 'tpope/vim-obsession'
  Plug 'bfredl/nvim-ipy'
  Plug 'hkupty/iron.nvim'
  "Plug 'kana/vim-textobj-user'
  "Plug 'kana/vim-textobj-line'
  "Plug 'GCBallesteros/vim-textobj-hydrogen'
  "Plug 'GCBallesteros/jupytext.vim'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'mfussenegger/nvim-dap'
  Plug 'nvim-telescope/telescope-dap.nvim'
  Plug 'mfussenegger/nvim-dap-python'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'posva/vim-vue'
  Plug 'pangloss/vim-javascript'    " JavaScript support
  Plug 'leafgarland/typescript-vim' " TypeScript syntax
  Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
  call plug#end()

" Better comments
" exit insert modewith jj 
imap jj <Esc>
" tmux navigator
let g:coc_global_extensions = ['coc-tsserver']
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-p> :TmuxNavigatePrevious<cr>
let g:tmux_navigator_save_on_switch = 2
" Yank to outside
"vnoremap <C-c> "+y
" Git
" Sneak
let g:sneak#streak = 1
let g:sneak#label = 1
" Auto save
let g:auto_save = 0 
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
"nnoremap <C-p> :<C-u>FZF<CR> 
nnoremap <silent> <C-b> :Buffers<CR>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
" COC settings
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" sort imports on save.
autocmd BufWritePre *.py silent! :call CocAction('runCommand', 'python.sortImports')
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
"let g:airline_left_sep  = ''
"let g:airline_right_sep = ''
"let g:airline#extensions#ale#enabled = 1
"let airline#extensions#ale#error_symbol = 'E:'
"let airline#extensions#ale#warning_symbol = 'W:'
let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
" Running python scripts
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

"luafile $HOME/.config/nvim/plugins.lua
" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
"if has('nvim-0.4.0') || has('patch-8.2.0750')
  "nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  "nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  "inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  "inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  "vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  "vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Cleaning up buffers
" kill-all but visible buffers with Alt-Backspace
nnoremap <silent> <M-BS> :call Delete_buffers()<CR>:echo "Non-windowed buffers are deleted"<CR>
func! Delete_buffers()
    let l:buffers = filter(getbufinfo(), {_, v -> v.hidden})
    if !empty(l:buffers)
        execute 'bwipeout' join(map(l:buffers, {_, v -> v.bufnr}))
    endif
endfunc

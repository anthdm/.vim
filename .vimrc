call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'fatih/vim-go'
Plug 'vim-airline/vim-airline'
Plug 'suan/vim-instant-markdown'
Plug 'scrooloose/nerdtree'
Plug 'altercation/vim-colors-solarized'
Plug 'posva/vim-vue'
Plug 'pangloss/vim-javascript'
Plug 'morhetz/gruvbox'
Plug 'vim-scripts/ibmedit.vim'
Plug 'tpope/vimeqfugitive'
Plug 'fugalh/desert.vim'
Plug 'albertorestifo/vim-playground-colors'
Plug 'chriskempson/base16-vim'
Plug 'rust-lang/rust.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'tell-k/vim-autopep8'
Plug 'tomlion/vim-solidity'
Plug 'mhinz/vim-mix-format'
Plug 'vim-syntastic/syntastic.git'
Plug 'mileszs/ack.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()

""""""""""""""""""""""""""""
" COLOR SCHEME AND APPERANCE 
""""""""""""""""""""""""""""
syntax enable
colorscheme base16-atelier-dune
set background=dark
set number

""""""""""""""""""
" GENERAL SETTINGS 
""""""""""""""""""
set tabstop=4
set shiftwidth=4
set expandtab
set noswapfile
set timeout timeoutlen=5000 ttimeoutlen=100
set hlsearch
set incsearch
set ignorecase
set smartcase
set smartindent
set autoindent
set hidden
set colorcolumn=80

"""""""""""""""
" OPTIMIZATIONS
"""""""""""""""
let loaded_matchparen = 1 " avoid loading the param pluging


""""""""""""""
" KEY BINDINGS 
""""""""""""""
imap jj <Esc>
let mapleader="\<SPACE>"
nmap <silent> <leader>v :vsp<CR>
nmap <silent> <leader>h :wincmd h<CR>
nmap <silent> <leader>l :wincmd l<CR>
nmap <silent> mm :noh<CR>

"""""
" ACK
"""""
nnoremap <Leader>f :Ack!<Space>

""""""""""
" NERDTREE
""""""""""
nmap <leader>k :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"

"""""""
" CTRLP
"""""""
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = ':CtrlP'
let g:ctrlp_working_path_mode = 0

"""""""""
" AIRLINE
"""""""""
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

"""""""""
" DEOPLETE
"""""""""
let g:deoplete#enable_at_startup = 1

"""""""""""""
" GUI OPTIONS 
"""""""""""""
if has('gui_running')
set guicursor+=i:block-cursor " Always use blockcursor.
set linespace=4
set antialias
set guioptions-=r
set guioptions-=L
set lines=999 columns=9999
" set the cursor to block even in insert mode.
set guicursor+=a:blinkon0
set guifont=Menlo\ Regular:h12
endif

""""""""""""""""""""""""
" LANGUAGE CONFIGURATION
""""""""""""""""""""""""
" GOLANG
let g:go_fmt_command="goimports"
" ELIXIR
let g:mix_format_on_save = 1
" RUST
let g:rustfmt_autosave = 1

""""""""""""""""
" CUSTOM SCRIPTS
""""""""""""""""
" Set the current indentation :Ident <number>
:command -nargs=1 Ee :ident <args>

fun! s:ident(indent)
    execute ':set tabstop=' . a:indent
    execute ':set shiftwidth=' . a:indent
endfun

" Search and replace :Replace <origin> <dest>
fun! s:sub(search, replace)
    execute ':%s/' . a:search . '/' . a:replace . '/gc'
endfun

command! -nargs=+ Replace call s:sub(<f-args>)
command! -nargs=+ Ident call s:ident(<f-args>)

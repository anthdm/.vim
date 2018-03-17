call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'fatih/vim-go'
Plug 'vim-airline/vim-airline'
Plug 'suan/vim-instant-markdown'
Plug 'scrooloose/nerdtree'
Plug 'altercation/vim-colors-solarized'
Plug 'posva/vim-vue'
Plug 'pangloss/vim-javascript'

call plug#end()

syntax enable
set background=dark
colorscheme solarized 

" Use 4 spaces for each tab indentation.
set tabstop=4
set shiftwidth=4
set expandtab

set noswapfile
set timeout timeoutlen=5000 ttimeoutlen=100
set hlsearch
set incsearch
set smartindent
set autoindent
set hidden

imap jj <Esc>

let mapleader="\<SPACE>"

" Toggle NerdTree
nmap <leader>k :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"

" ctrlp configuration
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = ':CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|bower_components\|vendor'

" airline configuration
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

nmap <silent> <leader>h :wincmd h<CR>
nmap <silent> <leader>l :wincmd l<CR>
" clear search highlights
nmap <silent> mm :noh<CR>
" split screen
nmap <silent> <leader>v :vsp<CR>

if has('gui_running')
" settings for macvim or other vim GUI's.
set guioptions-=r
set guioptions-=L
set lines=999 columns=9999
set antialias
set linespace=4
" set the cursor to block even in insert mode.
set guicursor+=i:block-cursor
set guicursor+=a:blinkon0
set guifont=Menlo\ Regular:h12
endif

" Personal editor commands
:command -nargs=1 Ee :tabe <args>

" golang 
let g:go_fmt_command="goimports"

" Search and replace (:Replace origin dest)
fun! s:sub(search, replace)
    execute ':%s/' . a:search . '/' . a:replace . '/gc'
endfun
command! -nargs=+ Replace call s:sub(<f-args>)

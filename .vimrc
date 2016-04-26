call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'fatih/vim-go'
Plug 'nanotech/jellybeans.vim'
Plug 'easysid/mod8.vim'
Plug 'vim-scripts/fu'
Plug 'chriskempson/base16-vim'
Plug 'fugalh/desert.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/Wombat'
Plug 'w0ng/vim-hybrid'
Plug 'vyshane/vydark-vim-color'
Plug 'jnurmine/Zenburn'
Plug 'flazz/vim-colorschemes'
Plug 'suan/vim-instant-markdown'
Plug 'ciaranm/inkpot'

call plug#end()

" zenburn colorscheme configuration
let g:zenburn_disable_label_underline = 1

syntax enable
"set background=dark

colorscheme molokai
let g:molokai_original = 1

set tabstop=4
set shiftwidth=4
set noswapfile
set timeout timeoutlen=5000 ttimeoutlen=100
set hlsearch
set incsearch
set smartindent
set autoindent
set hidden

imap jj <Esc>

let mapleader="\<SPACE>"

" ctrlp configuration
let g:ctrlp_map = '<leader>e'
let g:ctrlp_cmd = ':CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_files=50

" airline configuration
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

" prev and next buffer
nmap <leader>} :bnext<CR>
nmap <leader>{ :bprevious<CR>
" close buffer
nmap <leader>w :bd<CR>

nmap <silent> <leader>h :wincmd h<CR>
nmap <silent> <leader>l :wincmd l<CR>
nmap <silent> mm :noh<CR>
nmap <silent> <leader>v :vsp<CR>

" macvim configuration
set guioptions-=r
set guioptions-=L
set lines=999 columns=9999
set antialias
set linespace=2
" set the cursor to block even in insert mode.
set guicursor+=i:block-cursor

" Personal editor commands
:command -nargs=1 Ee :tabe <args>

fun! s:sub(search, replace)
    execute ':%s/' . a:search . '/' . a:replace . '/gc'
endfun
command! -nargs=+ Replace call s:sub(<f-args>)

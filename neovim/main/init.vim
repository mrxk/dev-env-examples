call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'hrsh7th/nvim-compe'
Plug 'itchyny/lightline.vim'
Plug 'sbdchd/neoformat'
Plug 'tomasiser/vim-code-dark'
Plug 'tpope/vim-fugitive'
call plug#end()

set completeopt=menuone,preview
set diffopt+=vertical
set expandtab
set hidden
set hlsearch
set ignorecase
set incsearch
set nobackup
set noshowmode
set nowritebackup
set number
set shiftwidth=4
set signcolumn=yes
set spell
set tabstop=4
set termguicolors
set updatetime=500

filetype plugin indent on

let mapleader=" "
let g:markdown_fenced_languages=['javascript', 'json=javascript', 'bash=sh', 'go', 'python']
let g:gitgutter_set_sign_backgrounds=1
let g:lightline = {
	\ 'active': {
	\ 	'left': [ [ 'mode', 'paste' ],
	\		[ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
	\	},
	\ 'component_function': {
	\ 	'gitbranch': 'FugitiveHead'
	\	},
	\ }
let g:compe={}
let g:compe.source={}
let g:compe.source.path=v:true
let g:compe.source.buffer=v:true
let g:compe.source.spell=v:true

highlight! link SignColumn LineNr

autocmd BufWritePre * Neoformat

nmap <S-tab> :tabp<cr>
nmap <tab> :tabn<cr>
nmap F :Neoformat<cr>


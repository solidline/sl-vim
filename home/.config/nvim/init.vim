set nocompatible          " disable compatibility to old-time vi
set showmatch             " show matching brackets.
set ignorecase            " case insensitive matching
set mouse=v               " middle-click paste with mouse
set hlsearch              " highlight search results
set tabstop=4             " number of columns occupied by a tab character
set softtabstop=4         " see multiple spaces as tabstops so <BS> does the right thing
set expandtab             " converts tabs to white space
set shiftwidth=4          " width for autoindents
set autoindent            " indent a new line the same amount as the line just typed
set number                " add line numbers
set wildmode=longest,list " get bash-like tab completions
" set cc=80                 " set an 80 column border for good coding style
set mouse=a               " enable mouse mode
set clipboard+=unnamed
let mapleader = ","       " change <leader>

" start interactive easyalign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign) 
nmap ga <Plug>(EasyAlign)

" nerdtree
nnoremap <leader>n :NERDTreeFocus<CR> " nerdtree
nnoremap <C-n> :NERDTree<CR>          " nerdtree
nnoremap <C-t> :NERDTreeToggle<CR>    " nerdtree
nnoremap <C-f> :NERDTreeFind<CR>      " nerdtree

" global
nnoremap <leader>w :w<CR>

set dictionary+=/usr/share/dict/words
set complete+=k



filetype plugin indent on " allows auto-indenting depending on file type
syntax on                 " syntax highlighting

call plug#begin(stdpath('data') . '/plugged')

Plug 'junegunn/vim-easy-align'

Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'voldikss/vim-floaterm'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/goyo.vim'
Plug 'vimwiki/vimwiki'
Plug 'alok/notational-fzf-vim'
Plug 'michal-h21/vim-zettel'
Plug 'dhruvasagar/vim-table-mode'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

call plug#end()

" let g:vimwiki_list = [{
" 	\ 'path': '~/vimwiki',
" 	\ 'syntax': 'markdown',
" 	\ 'ext': '.md',
" 	\ 'path_html': '~/vimwiki_html/',
" 	\ 'custom_wiki2html': 'vimwiki_markdown',
" 	\ 'template_ext': '.tpl'}]

let vimwiki_path=$HOME.'/vimwiki/'
let vimwiki_html_path=$HOME.'/vimwiki_html/'

let g:vimwiki_list = [{'path_html':vimwiki_html_path,
            \ 'syntax': 'markdown',
            \ 'ext': '.md',
         	\ 'custom_wiki2html': 'vimwiki_markdown',
            \ 'template_path':vimwiki_html_path.'vimwiki-assets/',
            \ 'template_default': 'default',
            \ 'template_ext': '.tpl',
            \ 'auto_export': 0}]


" markdown style tables
let g:table_mode_corner='|'

let g:floaterm_wintype = 'split'
let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_toggle = '<F12>'

" no swap warning
set shortmess+=A

let g:gutentags_ctags_exclude = ['@.ctagsignore']

" preview markdown with any file
let g:mkdp_command_for_global = 1

" define NV search paths
let g:nv_search_paths = ['~/vimwiki']

" zettle
let g:zettel_fzf_command = "rg --column --line-number --ignore-case --no-heading --color=always "
let g:zettel_format = "%y%m%d-%H%M-%title"


" new
nnoremap <leader>zn :ZettelNew<space>
nnoremap <silent> <c-s> :NV<CR>
nnoremap <leader>mp :MarkdownPreview<CR>

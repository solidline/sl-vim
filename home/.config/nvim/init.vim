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
set cc=80                 " set an 80 column border for good coding style
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

filetype plugin indent on " allows auto-indenting depending on file type
syntax on                 " syntax highlighting

call plug#begin(stdpath('data') . '/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree'

Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'voldikss/vim-floaterm'
Plug 'tpope/vim-unimpaired'

call plug#end()

lua << EOF
vim.lsp.set_log_level("debug")
EOF


lua << EOF

require'lspconfig'.graphql.setup{}

require'lspconfig'.java_language_server.setup { 
    cmd = {
        "/Users/tsanden/.local/share/java-language-server/dist/lang_server_mac.sh" 
    }
}

EOF


set clipboard=unnamed
set shortmess=at

syntax on

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

Plugin 'chriskempson/base16-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-tbone'
Plugin 'wincent/command-t'
Plugin 'mileszs/ack.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'bronson/vim-visual-star-search'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'vim-ruby/vim-ruby'
Plugin 'keith/swift.vim'
Plugin 'rking/ag.vim'
Plugin 'udalov/kotlin-vim'
Plugin 'tfnico/vim-gradle'
Plugin 'vimwiki/vimwiki'
Plugin 'itchyny/calendar.vim'
Plugin 'godlygeek/tabular'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'metakirby5/codi.vim'
Plugin 'elzr/vim-json'
Plugin 'jparise/vim-graphql'
Plugin 'gregsexton/gitv'
Plugin 'leafgarland/typescript-vim'
Plugin 'akhaku/vim-java-unused-imports'
Plugin 'nelstrom/vim-qargs'

" All of your Plugins must be added before the following line
call vundle#end()            " required


if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

filetype plugin indent on    " required

map ,s :Gstatus<CR>
map ,e :w<CR>

" Toggle folds.
nnoremap <Space> za
 
" Provide a character to show when line wrap happens.
set showbreak=↪  

" Apple-* Highlight all occurrences of current word (like '*' but without moving)
" http://vim.wikia.com/wiki/Highlight_all_search_pattern_matches
nnoremap <D-*> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

" keybindings
  " Press i to enter insert mode, and kj to exit.
  :inoremap jk <Esc>
  :inoremap kj <Esc>

  " Disable paste mode when leaving insert
   au InsertLeave * set nopaste

" no swap file
  set noswapfile
  set nobackup
  set nowb

scriptencoding utf-8

 " Change <Leader>
  let mapleader = ","

" When scrolling off-screen do so 3 lines at a time, not 1
  set scrolloff=3

  " enable line numbers 
  set number
  setlocal numberwidth=5

  " Nice statusbar
  set laststatus=2
  set statusline=\ "
  set statusline+=%f\ " file name
  set statusline+=[
  set statusline+=%{strlen(&ft)?&ft:'none'}, " filetype
  set statusline+=%{&fileformat}] " file format
  set statusline+=%h%1*%m%r%w%0* " flag
  set statusline+=%= " right align
  set statusline+=%-14.(%l,%c%V%)\ %<%P " offset

  " can has foldin plz?
  set foldenable
  set foldmethod=syntax
  set foldlevel=999 " make it really high, so they're not displayed by default

  " highlight search
  set hlsearch

  set autoindent shiftwidth=2 softtabstop=2 tabstop=2 expandtab " set the default

" better buffer management
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>


map <Leader>t4 :set tabstop=4 softtabstop=4 shiftwidth=4 expandtab<CR>
map <Leader>t2 :set tabstop=2 softtabstop=2 shiftwidth=2 expandtab<CR>

nmap <Leader>st4 :set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab<CR>
nmap <Leader>st2 :set tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab<CR>

" Select text that has just been pasted.
nnoremap gp `[v`]

map ,gs :Gdiff<CR>
map ,gw :Gwrite<CR>
map ,bo :BufOnly<CR>

nmap [h <Plug>GitGutterPrevHunk
nmap ]h <Plug>GitGutterNextHunk

let g:github_enterprise_urls = ['https://git.gbl.experiancs.com']


" Send more characters for redraws
set ttyfast

" Enable mouse use in all modes
set mouse=a

" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
set ttymouse=xterm2

set cursorline

let g:syntastic_quiet_messages = { "type": "style" }

let g:Gitv_OpenHorizontal = 1
map ,gv :Gitv<CR>

:set wildignore+=*/node_modules

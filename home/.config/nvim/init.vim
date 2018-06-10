" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
 set nocompatible
endif

" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
 call dein#begin('~/.cache/dein')

 call dein#add('~/.cache/dein')
 call dein#add('Shougo/deoplete.nvim')

 call dein#add('chriskempson/base16-vim')
 call dein#add('tpope/vim-fugitive')
 call dein#add('int3/vim-extradite')
 call dein#add('tpope/vim-rhubarb')
 call dein#add('tpope/vim-vinegar')
 call dein#add('tpope/vim-abolish')
 call dein#add('tpope/vim-unimpaired')
 call dein#add('tpope/vim-markdown')
 call dein#add('tpope/vim-surround')
 call dein#add('tpope/vim-commentary')
 call dein#add('tpope/vim-tbone')
 call dein#add('wincent/command-t', {'build': 'cd ruby/command-t/ext/command-t && { make clean; ruby extconf.rb && make }'})

 call dein#add('mileszs/ack.vim')
 call dein#add('bronson/vim-visual-star-search')
 call dein#add('vim-ruby/vim-ruby')
 call dein#add('keith/swift.vim')
 call dein#add('rking/ag.vim')
 call dein#add('udalov/kotlin-vim')
 call dein#add('tfnico/vim-gradle')
 call dein#add('vimwiki/vimwiki')
 call dein#add('itchyny/calendar.vim')
 call dein#add('godlygeek/tabular')
 call dein#add('skywind3000/asyncrun.vim')
 call dein#add('metakirby5/codi.vim')
 call dein#add('elzr/vim-json')
 call dein#add('jparise/vim-graphql')
 call dein#add('gregsexton/gitv')
 call dein#add('leafgarland/typescript-vim')
 call dein#add('pangloss/vim-javascript')
 call dein#add('mxw/vim-jsx')
 call dein#add('nelstrom/vim-qargs')
 call dein#add('ludovicchabant/vim-gutentags')
 call dein#add('w0rp/ale')

call dein#add('artur-shaik/vim-javacomplete2')
		call dein#config('artur-shaik/vim-javacomplete2', {
		\ 'hook_source': 'autocmd FileType java
		\                 setlocal omnifunc=javacomplete#Complete'
		\ })

 if !has('nvim')
   call dein#add('roxma/nvim-yarp')
   call dein#add('roxma/vim-hug-neovim-rpc')
 endif

 call dein#end()
 call dein#save_state()

endif

filetype plugin indent on
syntax enable

call deoplete#enable()

" javacomplete
nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)

imap <F4> <Plug>(JavaComplete-Imports-AddSmart)

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

set cursorline

let g:syntastic_quiet_messages = { "type": "style" }

let g:Gitv_OpenHorizontal = 1
map ,gv :Gitv<CR>

:set wildignore+=*/node_modules

nmap =j :%!python -m json.tool<CR>

set clipboard=unnamed

" Resize panes faster
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" command-t

let g:CommandTWildIgnore=&wildignore . ",*/bower_components,*.class,build,.DS_Store,out"

nmap <silent> <Leader>t <Plug>(CommandT)
nmap <silent> <Leader>b <Plug>(CommandTBuffer)
nmap <silent> <Leader>j <Plug>(CommandTJump)

" javacomplete

  " let g:JavaComplete_LibsPath = './app/build/classes/java/main'

  nmap <leader>jI <Plug>(JavaComplete-Imports-AddMissing)
  nmap <leader>jR <Plug>(JavaComplete-Imports-RemoveUnused)
  nmap <leader>ji <Plug>(JavaComplete-Imports-AddSmart)
  nmap <leader>jii <Plug>(JavaComplete-Imports-Add)

  imap <C-j>I <Plug>(JavaComplete-Imports-AddMissing)
  imap <C-j>R <Plug>(JavaComplete-Imports-RemoveUnused)
  imap <C-j>i <Plug>(JavaComplete-Imports-AddSmart)
  imap <C-j>ii <Plug>(JavaComplete-Imports-Add)

  nmap <leader>jM <Plug>(JavaComplete-Generate-AbstractMethods)

  imap <C-j>jM <Plug>(JavaComplete-Generate-AbstractMethods)

  nmap <leader>jA <Plug>(JavaComplete-Generate-Accessors)
  nmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
  nmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
  nmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)
  nmap <leader>jts <Plug>(JavaComplete-Generate-ToString)
  nmap <leader>jeq <Plug>(JavaComplete-Generate-EqualsAndHashCode)
  nmap <leader>jc <Plug>(JavaComplete-Generate-Constructor)
  nmap <leader>jcc <Plug>(JavaComplete-Generate-DefaultConstructor)

  imap <C-j>s <Plug>(JavaComplete-Generate-AccessorSetter)
  imap <C-j>g <Plug>(JavaComplete-Generate-AccessorGetter)
  imap <C-j>a <Plug>(JavaComplete-Generate-AccessorSetterGetter)

  vmap <leader>js <Plug>(JavaComplete-Generate-AccessorSetter)
  vmap <leader>jg <Plug>(JavaComplete-Generate-AccessorGetter)
  vmap <leader>ja <Plug>(JavaComplete-Generate-AccessorSetterGetter)

  nmap <silent> <buffer> <leader>jn <Plug>(JavaComplete-Generate-NewClass)
  nmap <silent> <buffer> <leader>jN <Plug>(JavaComplete-Generate-ClassInFile)

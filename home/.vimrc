runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

colorscheme Tomorrow-Night
set background=dark

set hidden

" save buffer to the mac clipboard
  set clipboard=unnamed

" NERDTree - Make nerdtree look nice
  let NERDTreeMinimalUI = 1
  let NERDTreeDirArrows = 1
  let g:NERDTreeWinSize = 30

  " quit NERDTree after openning a file
  let NERDTreeQuitOnOpen=1

  " colored NERD Tree
  let NERDChristmasTree = 1
  let NERDTreeHighlightCursorline = 1
  let NERDTreeShowHidden = 1
  " map enter to activating a node
  let NERDTreeMapActivateNode='<CR>'
  let NERDTreeIgnore=['\.git','\.DS_Store','\.pdf','.classpath','.project','.settings']

  " close nerdtree if its the last buffer open.
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

  " Open the project tree and expose current file in the nerdtree with Ctrl-\
  nnoremap <silent> <C-\> :NERDTreeFind<CR>

  map ,s :Gstatus<CR>
  map ,e :w<CR>

" command-t
:set wildignore+=*.o,*.obj,.git,target,*.class,*.png,*.jpg

" Type ,hl to toggle highlighting on/off, and show current value.
noremap ,hl :set hlsearch! hlsearch?<CR>

" Apple-* Highlight all occurrences of current word (like '*' but without moving)
" http://vim.wikia.com/wiki/Highlight_all_search_pattern_matches
nnoremap <D-*> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

" keybindings
  " Press i to enter insert mode, and kj to exit.
  :inoremap kj <Esc>

" no swap file
  set noswapfile
  set nobackup
  set nowb

scriptencoding utf-8

  " These two enable syntax highlighting
  set nocompatible          " We're running Vim, not Vi!
  syntax on                 " Enable syntax highlighting

  " Change <Leader>
  let mapleader = ","

  " Set temporary directory (don't litter local dir with swp/tmp files)
  set directory=/tmp/

  " When scrolling off-screen do so 3 lines at a time, not 1
  set scrolloff=3

  " enable line numbers 
  set number
  setlocal numberwidth=5

  " Display extra whitespace
  "set list listchars=tab:»·,trail:·

  " don't make it look like there are line breaks where there aren't:
  "set nowrap

  " assume the /g flag on :s substitutions to replace all matches in a line:
  set gdefault

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

  augroup myfiletypes
    " Clear old autocmds in group
    autocmd!
    " autoindent with two spaces, always expand tabs
    autocmd FileType ruby,eruby,yaml set autoindent shiftwidth=2 softtabstop=2 tabstop=2 expandtab
    autocmd FileType python set autoindent shiftwidth=4 softtabstop=4 expandtab
    autocmd FileType javascript,html,htmldjango,css set autoindent shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType java,xml set autoindent shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType vim set autoindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType cucumber set autoindent tabstop=2 shiftwidth=2 softtabstop=2 expandtab
    au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab
    au BufRead,BufNewFile *etc/nginx/* set ft=nginx 
    " treat rackup files like ruby
    au BufRead,BufNewFile *.ru set ft=ruby
    au BufRead,BufNewFile Gemfile set ft=ruby
    autocmd BufEnter *.haml setlocal cursorcolumn
    au BufRead,BufNewFile Gemfile set ft=ruby                                   
    au BufRead,BufNewFile Capfile set ft=ruby                                   
    au BufRead,BufNewFile Thorfile set ft=ruby                                   
    au BufRead,BufNewFile *.god set ft=ruby  
    au BufRead,BufNewFile .caprc set ft=ruby  
  augroup END


  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endi

  " Turn on language specific omnifuncs
  autocmd FileType ruby set omnifunc=rubycomplete#Complete
  autocmd FileType python set omnifunc=pythoncomplete#Complete
  autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
  autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
  autocmd FileType php set omnifunc=phpcomplete#CompletePHP
  autocmd FileType c set omnifunc=ccomplete#Complete


  " Remap F1 from Help to ESC.  No more accidents.
  nmap <F1> <Esc>
  map! <F1> <Esc>



" via: http://rails-bestpractices.com/posts/60-remove-trailing-whitespace
" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
command! StripTrailingWhitespaces call <SID>StripTrailingWhitespaces()
nmap ,w :StripTrailingWhitespaces<CR>



" Use Q to intelligently close a window 
" (if there are multiple windows into the same buffer)
" or kill the buffer entirely if it's the last window looking into that buffer
function! CloseWindowOrKillBuffer()
  let number_of_windows_to_this_buffer = len(filter(range(1, winnr('$')), "winbufnr(v:val) == bufnr('%')"))

  if number_of_windows_to_this_buffer > 1
    wincmd c
  else
    bdelete
  endif
endfunction

nnoremap <silent> Q :call CloseWindowOrKillBuffer()<CR>

" indent xml code
augroup xml
    map ,mf !xmllint --format --recover - 2>/dev/null<CR>
"    au!
"    autocmd BufWrite *xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"
augroup END

set wildmenu
set wildmode=full

" better buffer management
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" expand the current buffer path
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" vimux
" Run the current file with rspec
map <Leader>rb :call RunVimTmuxCommand("clear; ruby " . bufname("%"))<CR>

" Run command without sending sending a return
map <Leader>rq :call RunVimTmuxCommand("clear; ruby " . bufname("%"), 0)<CR>

" Prompt for a command to run
map <Leader>rp :PromptVimTmuxCommand<CR>

" Run last command executed by RunVimTmuxCommand
map <Leader>rl :RunLastVimTmuxCommand<CR>

" Move into the tmux runner pane created by RunVimTmuxCommand and enter copy mode (scroll mode).
" Inspect runner pane
map <Leader>ri :InspectVimTmuxRunner<CR>

" Close all other tmux panes in current window
map <Leader>rx :CloseVimTmuxPanes<CR>

" Interrupt any command running in the runner pane
map <Leader>rs :InterruptVimTmuxRunner<CR>


"When typing a string, your quotes auto complete. Move past the quote
"while still in insert mode by hitting Ctrl-a. Example:
" type 'foo<c-a>
imap <C-a> <esc>wa

" When using delimitMate typing "{" produces "{}" this breaks the brackets out
imap ,a <return><esc>O<tab>

" Select text that has just been pasted.
nnoremap gp `[v`]`

" eclim

"  Search for the javadocs of the element under the cursor with <leader>d.
nnoremap <silent> <buffer> ,d :JavaDocSearch -x declarations<cr>

" Import the class under the cursor with <leader>i.
nnoremap <silent> <buffer> ,i :JavaImport<cr>

" Perform a context sensitive search of the element under the cursor with <enter>.
nnoremap <silent> <buffer> <cr> :JavaSearchContext<cr>

" Hide dos linebreaks
nnoremap <silent> <buffer> ,m :ed ++ff=dos %<cr> 

filetype plugin indent on


nnoremap ,c :!/usr/local/bin/ctags -R<cr>

" Inable matchit plugin to use % to jump between other tags, html, ruby, etc.
set nocompatible
runtime macros/matchit.vim

" maven refresh
map ,r :ProjectClose caui<cr>:!mvn clean<cr>:!mvn elipse:clean<cr>:!mvn eclipse:eclipse<cr>:ProjectOpen caui<cr>:ProjectRefresh caui<cr>

nnoremap <F3> :NumbersToggle<CR>

" GUI
set gfn=Monaco:h14

" Specify the types of modes to check for.
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['javascript', 'java'],
                           \ 'passive_filetypes': ['html'] }

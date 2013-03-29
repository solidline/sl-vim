execute pathogen#infect()
syntax on
filetype plugin indent on


colorscheme Tomorrow
" set background=dark

set hidden
set clipboard=unnamed


""""""""""
" NERDTree
""""""""""

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30

" quit NERDTree after openning a file
let NERDTreeQuitOnOpen=1

" colored NERD Tree
let NERDChristmasTree = 1
let NERDTreeHighlightCursorline = 1
let NERDTreeShowHidden = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeMouseMode = 3
" map enter to activating a node
" let NERDTreeMapActivateNode='<C-j>'
let NERDTreeIgnore=['\.git','\.DS_Store','\.pdf','.classpath','.project','.settings', '\.svn', '\.gems', '\.rbenv-version']

" close nerdtree if its the last buffer open.
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

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
nmap ,ws :StripTrailingWhitespaces<CR>
nmap ,w :wq!<CR>
nmap ,q :q!<CR>

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

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
map <Leader>rb :call RunVimTmuxCommand("clear; rspec " . bufname("%"))<CR>

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

" Enable matchit plugin to use % to jump between other tags, html, ruby, etc.
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

" Neocache
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
" inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

set linespace=2


" Example:
"
"   Before:
"
"   UI.Layout = Marionette.Layout.extend({
"
"
"   After:
"
"   // UI.Layout
"   // ---------
"   
"   // Hello
"   UI.Layout = Marionette.Layout.extend({

function CommentJSClass()
  normal yypki// f=Dxyyplllv$r-0o0Do		// Hello
endfunction


" Javascript create comment
nnoremap <leader>cj :call CommentJSClass()<CR>

" vimux commands
 map <Leader>rr :call VimuxRunCommand("clear; ruby " . bufname("%"))<CR>

 " Prompt for a command to run
 map <Leader>rp :VimuxPromptCommand<CR>
 
 " Run last command executed by VimuxRunCommand
 map <Leader>rl :VimuxRunLastCommand<CR>
 
 " Inspect runner pane
 map <Leader>ri :VimuxInspectRunner<CR>
 
 " Close all other tmux panes in current window
 map <Leader>rx :VimuxClosePanes<CR>
 
 " Close vim tmux runner opened by VimuxRunCommand
 map <Leader>rq :VimuxCloseRunner<CR>
 
 " Interrupt any command running in the runner pane
 map <Leader>rc :VimuxInterruptRunner<CR>

" toggle paste
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" eclim settings
" Eclim settings
" ,i imports whatever is needed for current line
nnoremap <silent> <Leader>i :JavaImport<cr>
" ,d opens javadoc for statement in browser
nnoremap <silent> <Leader>d :JavaDocSearch -x declarations<cr>
" ,<enter> searches context for statement
nnoremap <silent> <Leader><cr> :JavaSearchContext<cr>
" ,jv validates current java file
nnoremap <silent> <Leader>jv :Validate<cr>
" ,jc shows corrections for the current line of java
nnoremap <silent> <Leader>jc :JavaCorrect<cr>

" ,ju run unit test for current file.
nnoremap <silent> <Leader>ju :JUnit<cr>
" 'open' on OSX will open the url in the default browser without issue
let g:EclimBrowser='open'
" Disable Eclim's taglisttoo because I use the regular taglist plugin
"let g:taglisttoo_disabled = 1
" Disable HTML
let g:EclimHtmlValidate = 0

let g:EclimValidateSortResults = "errors"

" tmux will only forward escape sequences to the terminal if surrounded by a DCS sequence
" http://sourceforge.net/mailarchive/forum.php?thread_name=AANLkTinkbdoZ8eNR1X2UobLTeww1jFrvfJxTMfKSq-L%2B%40mail.gmail.com&forum_name=tmux-users
 
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" This was a life saver:
" https://wincent.com/blog/tweaking-command-t-and-vim-for-use-in-the-terminal-and-tmux
if has('mouse')
  set mouse=a
  if &term =~ "xterm" || &term =~ "screen"
    " for some reason, doing this directly with 'set ttymouse=xterm2'
    " doesn't work -- 'set ttymouse?' returns xterm2 but the mouse
    " makes tmux enter copy mode instead of selecting or scrolling
    " inside Vim -- but luckily, setting it up from within autocmds
    " works                   
    autocmd VimEnter * set ttymouse=xterm2
    autocmd FocusGained * set ttymouse=xterm2
    autocmd BufEnter * set ttymouse=xterm2
  endif
endif

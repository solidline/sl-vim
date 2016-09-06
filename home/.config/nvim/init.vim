execute pathogen#infect()
syntax on
filetype plugin indent on

colorscheme base16-default-dark

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Change <Leader>
let mapleader = ","

set termguicolors

" Toggle folds.
nnoremap <Space> za

" can has foldin plz?
set foldenable
set foldmethod=syntax
set foldlevel=999 " make it really high, so they're not displayed by default

" Fugitive
autocmd User Fugitive noremap <buffer> <Leader>gd :Gdiff<cr>
" Show git status for the repo
autocmd User Fugitive noremap <buffer> <leader>gs :Gstatus<cr>

" Write the current buffer to git index
autocmd User Fugitive noremap <buffer> <leader>gw :Gwrite<cr>

" Place the cursor at the top of the buffer
autocmd VimEnter .git/COMMIT_EDITMSG exe 'normal! gg'



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
nmap ,q :set nowarn<CR>:qall!<CR>

nmap <silent> <leader>f <Plug>DashSearch

" format json
map <Leader>j !python -m json.tool<CR>

" better buffer management
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

map <Leader>t4 :set tabstop=4 softtabstop=4 shiftwidth=4 expandtab<CR>
map <Leader>t2 :set tabstop=2 softtabstop=2 shiftwidth=2 expandtab<CR>

nmap <Leader>st4 :set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab<CR>
nmap <Leader>st2 :set tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab<CR>

map ,gs :Gdiff<CR>
map ,gw :Gwrite<CR>
map ,bo :BufOnly<CR>G


set linespace=2

let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])

" the_platinum_searcher
if executable('pt')
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor'
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_grep_encoding = 'utf-8'
endif

nnoremap <C-l> :Unite -no-split -start-insert buffer file file_rec/neovim<CR>
nnoremap <C-j> :Unite -start-insert file_mru<CR>
nnoremap <C-r> :source ~/.config/nvim/init.vim<CR>

autocmd! BufWritePost * Neomake

let g:EclimCompletionMethod = 'omnifunc'

nmap <silent> <leader>d <Plug>DashSearch

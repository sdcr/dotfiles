colorscheme evening
set number
set tags=tags;/
set hlsearch
filetype plugin on
filetype indent on

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

set foldmethod=marker
let g:erlang_folding=1

execute pathogen#infect()
execute pathogen#helptags()
syntax on

"Needed to get Alt+? to work
let c='#'
while c <= 'z'
  if c!='>' && c!='['
    exec "set <A-".c.">=\e".c
    exec "imap \e".c." <A-".c.">"
  endif
let c = nr2char(1+char2nr(c))
endw
set timeout ttimeoutlen=50

"Shifting lines up or down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

"So that multiple pasting can be done
xnoremap p pgvy

"Easy switching between tabs
"nnoremap <C-x> :tabn<CR>
"inoremap <C-x> :tabn<CR>
"vnoremap <C-x> :tabn<CR>
"
"nnoremap <C-z> :tabp<CR>
"inoremap <C-z> :tabp<CR>
"vnoremap <C-z> :tabp<CR>

"Easily open a new tab
nnoremap <C-c> :tabnew 

"Easily close a tab
nnoremap <C-s> :tabclose<CR>

"Allow navigation over windows
nmap <silent> <A-k> :wincmd k<CR>
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-g> :wincmd h<CR>
nmap <silent> <A-l> :wincmd l<CR>

"Easily search for the word under the cursoe in othe files
"function CursorwordGrep()
"	let cursorword=expand("<cword>")
"	:tabnew
"	:execute ':vimgrep ' . cursorword . ' ~/**/*.*'
"	:cw
"endfunction
"
"nmap <C-@> :call CursorwordGrep()<CR>

"Easy using tags
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp<CR>:exec("tag ".expand("<cword>"))<CR>

nnoremap <silent> <F8> :TlistToggle<CR>

" Switch to alternate file
map <C-n> :bnext<CR>
map <C-m> :bprevious<CR>
map <C-b> :Bclose<CR>

autocmd VimEnter * NERDTree
set runtimepath^=~/.vim/bundle/ctrlp.vim

colorscheme evening
set number
set tags=tags;/
filetype plugin on

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
nnoremap <C-l> :tabn<CR>
inoremap <C-l> :tabn<CR>
vnoremap <C-l> :tabn<CR>

nnoremap <C-h> :tabp<CR>
inoremap <C-h> :tabp<CR>
vnoremap <C-h> :tabp<CR>

"Easily open a new tab
nnoremap <C-c> :tabnew 

"Easily close a tab
nnoremap <C-q> :tabclose<CR>

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


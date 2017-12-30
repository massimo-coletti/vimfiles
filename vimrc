" Vim config modification: 16 Oct 2016 22:00
"-------------------------------------------
"  List of my plugins:
"  *) mark.vim (by Ingo Karkat): Highlight several words in
"     different colors simultaneously.
"  *) vim-signature: Place bookmarks in gutter.
"  *) HiCursorWords: Highlights words under the cursor.
"     (packadd hicursorwords)
"  *) vim-colorstepper (packadd colorstepper)

set nocompatible
syntax on
filetype plugin indent on
runtime macros/matchit.vim

"Show line numbers
set number

"Incremental search + search highlight
set incsearch hlsearch

"Case insensitive search unless using at least one uppercase char
set ignorecase smartcase

"Minimal number of screen lines to keep above and below the cursor
set scrolloff=2

"Set status line
set laststatus=2
set statusline=%f\ %h  "File name, Blank, Help buffer flag
set statusline+=%m%r   "Modified flag ([+]/[-]), Read-only flag
set statusline+=%=     "Switch to right
set statusline+=%-28.(ln:%l/%L\ col:%c%V%) "Line/total, col, virtual col
set statusline+=\ %P   "Percentage

"Report all changes
set report=0

"Set font
if has('gui_running')
   "set guifont=Courier_New:h11:cANSI
   "set guifont=Lucida_Sans_Typewriter_Regular:h11:cANSI
   set guifont=Consolas:h12:cANSI
endif

"Setup tabs and indentation
set expandtab     "Insert spaces when tab key is pressed
set tabstop=4     "Insert 4 spaces for a tab
set shiftwidth=4  "Indentation is 4 spaces

"Symbols to show whitespace in line. See digraph list (:digraphs)
set listchars=eol:§,tab:¤›,extends:»,precedes:«,nbsp:‡

"Wrap long lines at whitespace
set linebreak

"Indent wrapped lines with same indentation as beginning of line
set breakindent

"Set color scheme
color mnhlight01
"color mnhdark01

"Highlight trailing whitespace with error color
match ErrorMsg '\s\+$'

"Disable mouse
set mouse=

"Set visual bell
set visualbell

"Remap syntax elements of various languages
highlight! link shDerefVar Identifier
highlight! link shDerefSimple Identifier
highlight! link vimOption Identifier
highlight! link vimHiAttrib Constant
highlight! link vimHiGui Statement
highlight! link vimHiGuiFgBg Statement
highlight! link makeCommands Statement
highlight! link xmlTag Identifier
highlight! link xmlTagName Identifier

"--------------------------------------------------
"Show the syntax highlighting group under the cursor
function! Mnh_showSyntaxGroup()
    let l:synid = synID(line("."),col("."),0)
    let l:synname1 = synIDattr(l:synid,"name")
    let l:synname2 = synIDattr(synIDtrans(l:synid),"name")
    return l:synname1 . ' --> ' . l:synname2
endfunction
map <F10> :echo Mnh_showSyntaxGroup()<CR>

"--------------------------------------------------
"Hitting Enter in Normal mode highlights the word under
"the cursor and allows searching for it with n/N as usual.
let g:CRhisearch = 0
function! CR_hisearch()
  if g:CRhisearch == 1 && @/ =~ '^\\<'.expand('<cword>').'\\>$'
    let g:CRhisearch = 0
    return ":silent nohlsearch\<CR>"
  endif
  let @/ = '\<'.expand('<cword>').'\>'
  let g:CRhisearch = 1
  return ":silent set hlsearch\<CR>"
endfunction
nnoremap <silent> <expr> <CR> CR_hisearch()
"In the quickfix window, Enter is used to position buffers to
"the location under the cursor, so undefine the mapping there.
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

"--------------------------------------------------
"Select whole line (excluding newline) and copy to clipboard;
"then reselect the line from end to start, because seeing the
"selection is visually more satisfying.
nnoremap vv 0vg_"+yg_v0

"Use Control+TAB to cycle between tabs
nnoremap <C-tab> :tabnext<CR>

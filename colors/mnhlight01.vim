" These lines are suggested to be at the top of every colorscheme
hi clear
if exists("syntax_on")
  syntax reset
endif

" Load the 'base' colorscheme - the one you want to alter
runtime colors/zellner.vim

set background=light

" Set name of color scheme according to name of file
let g:colors_name = expand('<sfile>:t:r')

"---------------------"
" Set your new colors "
"---------------------"
highlight Normal guifg=black guibg=Seashell gui=bold
" guibg=White, OldLace, Linen, Cornsilk, Ivory, Seashell, FloralWhite

highlight Comment guifg=DarkOliveGreen4 gui=italic
highlight Statement guifg=NavyBlue gui=none
highlight Function guifg=NavyBlue gui=bold
highlight Type guifg=DeepPink4 gui=bold
highlight Identifier guifg=Brown4 gui=none
highlight Constant guifg=DarkGreen gui=bold
highlight String guifg=Red gui=italic
highlight Visual guifg=Black guibg=MistyRose2 gui=none
highlight PreProc guifg=Cyan4 gui=bold
highlight Special guifg=HotPink3 gui=bold
highlight StatusLine guibg=Gray30 guifg=Yellow gui=none
highlight StatusLineNC guibg=Gray55 guifg=LightGoldenRod gui=none
highlight MatchParen guifg=Black guibg=DarkOliveGreen2
highlight WarningMsg guifg=Black guibg=white gui=bold
highlight PmenuSel guifg=White guibg=VioletRed4 gui=bold
highlight Pmenu guifg=Yellow guibg=Gray55 gui=NONE
highlight ErrorMsg guifg=Yellow guibg=Red2 gui=bold
highlight Search guifg=Black guibg=PaleTurquoise2 gui=none
highlight IncSearch guifg=White guibg=CadetBlue4 gui=bold
highlight Title guifg=Black gui=bold
highlight Cursor guifg=White guibg=Purple4 gui=bold
highlight CursorColumn guibg=#ebdada
highlight LineNr guifg=Gray49 gui=none
highlight CursorLineNr guifg=Black gui=bold
highlight clear CursorLine
highlight Folded gui=italic
highlight NonText guifg=Purple gui=italic


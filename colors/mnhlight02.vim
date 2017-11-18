highlight clear
if exists("syntax_on")
  syntax reset
endif

" Load the 'base' colorscheme - the one you want to alter
source ~\vimfiles\colors\mnhlight01.vim

" Set name of color scheme according to name of file
let g:colors_name = expand('<sfile>:t:r')

"---------------------"
" Set your new colors "
"---------------------"
highlight Normal guifg=black guibg=OldLace gui=bold
" guibg=White, OldLace, Linen, Cornsilk, Ivory, Seashell,
" FloralWhite, MintCream

highlight PreProc guifg=DeepPink3 gui=none
highlight Special guifg=DarkGreen gui=bold
highlight Comment guifg=Gray40 gui=italic
highlight Identifier guifg=Brown4 gui=none
highlight Constant guifg=DeepSkyBlue4 gui=bold

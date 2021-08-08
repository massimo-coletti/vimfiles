" Works well with unix shell scripts, vim scripts, .reg files,
" ------------------------------------------------------------
highlight clear
if exists("syntax_on")
  syntax reset
endif

" Load the 'base' colorscheme - the one you want to alter
source ~\vimfiles\colors\mnhdark01.vim

" Set name of color scheme according to name of file
let g:colors_name = expand('<sfile>:t:r')

"---------------------"
" Set your new colors "
"---------------------"
highlight Statement gui=none
highlight Type guifg=#b2ffff gui=none
highlight PreProc guifg=DarkTurquoise gui=none
highlight String guifg=PeachPuff gui=italic
"highlight MatchParen guifg=Black guibg=PaleGreen3 gui=bold
hi MatchParen guifg=yellow guibg=black gui=underline,bold

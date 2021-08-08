" Works well with perl, C/C++
" ---------------------------
set background=dark
if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name = expand('<sfile>:t:r')

highlight Normal guifg=White guibg=#191919
highlight LineNr guifg=Orange4 guibg=Black gui=none

highlight Cursor guifg=Black guibg=Orange1
highlight CursorColumn guibg=Gray28 gui=bold
highlight ColorColumn guibg=Gray27 gui=none
highlight CursorLineNr guifg=Pink1 guibg=Black gui=bold
highlight clear CursorLine

highlight StatusLine guifg=White guibg=DarkGoldenRod4 gui=none

"Status lines of non-current windows. If this is equal to 'StatusLine'
"then Vim will use '^^^' in the status line of the current window.
highlight StatusLineNC guifg=Black guibg=Gray50 gui=none

"Hit-enter prompt and yes/no questions
highlight Question guifg=#00ff7f gui=bold

"Any erroneous construct
highlight Error guifg=white guibg=Red1 gui=bold

"Error messages on the command line
highlight ErrorMsg guifg=White guibg=Red

highlight MoreMsg guifg=#00ff7f gui=bold
highlight Ignore guifg=#666666

"Anything needing attention e.g. keywords TODO , FIXME and XXX
highlight Todo guifg=#f9f747 guibg=#d75f00 gui=bold

highlight VertSplit guibg=PeachPuff4 guifg=Black gui=none

highlight Folded guifg=Pink1 guibg=Gray20 gui=italic
highlight FoldColumn guifg=#d2b48c guibg=#222222
highlight SignColumn guibg=Gray7

highlight Search guibg=#205520 guifg=ivory gui=none
highlight IncSearch guibg=Chocolate4 guifg=white gui=bold

"Meta and special keys listed with :map. Generally, text
"that is displayed differently from what it really is.
highlight SpecialKey guifg=#9acd32

highlight Title guifg=LemonChiffon gui=bold
highlight Visual guifg=black guibg=MistyRose gui=none
highlight WarningMsg guifg=LightGoldenRod1 gui=bold
"highlight MatchParen guibg=Blue2 guifg=NONE gui=bold
hi MatchParen guifg=yellow guibg=black gui=underline,bold

highlight DiffAdd guifg=#d7ffaf guibg=#5f875f
highlight DiffChange guifg=#d7d7ff guibg=#5f5f87
highlight DiffDelete guifg=#ff8080 guibg=#cc6666
highlight DiffText guifg=#5f5f87 guibg=#81a2be

highlight Pmenu guifg=#eeeeee guibg=#444444
highlight PmenuSel guifg=SpringGreen guibg=#555555 gui=bold
highlight PmenuSbar guibg=#666666
highlight PmenuThumb guibg=#606060

highlight Identifier guifg=PaleGreen gui=none
highlight Comment guifg=Gray60 gui=italic
highlight Constant guifg=DarkOrange1 gui=none
highlight Statement guifg=Khaki gui=bold
highlight PreProc guifg=PeachPuff gui=bold
highlight Type guifg=CadetBlue1 gui=bold
highlight Special guifg=LightMagenta gui=none
highlight Function guifg=PaleVioletRed1 gui=bold
highlight String guifg=DarkGoldenrod1 gui=italic
highlight ModeMsg guifg=HoneyDew
highlight NonText guifg=White guibg=#313131 gui=italic

" vim: set fdl=0 fdm=marker:

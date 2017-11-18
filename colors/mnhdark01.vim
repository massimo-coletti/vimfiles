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

  " functions {{{
  " returns an approximate grey index for the given grey level
  fun! <SID>grey_number(x)
    if &t_Co == 88
      if a:x < 23
        return 0
      elseif a:x < 69
        return 1
      elseif a:x < 103
        return 2
      elseif a:x < 127
        return 3
      elseif a:x < 150
        return 4
      elseif a:x < 173
        return 5
      elseif a:x < 196
        return 6
      elseif a:x < 219
        return 7
      elseif a:x < 243
        return 8
      else
        return 9
      endif
    else
      if a:x < 14
        return 0
      else
        let l:n = (a:x - 8) / 10
        let l:m = (a:x - 8) % 10
        if l:m < 5
          return l:n
        else
          return l:n + 1
        endif
      endif
    endif
  endfun

  " returns the actual grey level represented by the grey index
  fun! <SID>grey_level(n)
    if &t_Co == 88
      if a:n == 0
        return 0
      elseif a:n == 1
        return 46
      elseif a:n == 2
        return 92
      elseif a:n == 3
        return 115
      elseif a:n == 4
        return 139
      elseif a:n == 5
        return 162
      elseif a:n == 6
        return 185
      elseif a:n == 7
        return 208
      elseif a:n == 8
        return 231
      else
        return 255
      endif
    else
      if a:n == 0
        return 0
      else
        return 8 + (a:n * 10)
      endif
    endif
  endfun

  " returns the palette index for the given grey index
  fun! <SID>grey_color(n)
    if &t_Co == 88
      if a:n == 0
        return 16
      elseif a:n == 9
        return 79
      else
        return 79 + a:n
      endif
    else
      if a:n == 0
        return 16
      elseif a:n == 25
        return 231
      else
        return 231 + a:n
      endif
    endif
  endfun

  " returns an approximate color index for the given color level
  fun! <SID>rgb_number(x)
    if &t_Co == 88
      if a:x < 69
        return 0
      elseif a:x < 172
        return 1
      elseif a:x < 230
        return 2
      else
        return 3
      endif
    else
      if a:x < 75
        return 0
      else
        let l:n = (a:x - 55) / 40
        let l:m = (a:x - 55) % 40
        if l:m < 20
          return l:n
        else
          return l:n + 1
        endif
      endif
    endif
  endfun

  " returns the actual color level for the given color index
  fun! <SID>rgb_level(n)
    if &t_Co == 88
      if a:n == 0
        return 0
      elseif a:n == 1
        return 139
      elseif a:n == 2
        return 205
      else
        return 255
      endif
    else
      if a:n == 0
        return 0
      else
        return 55 + (a:n * 40)
      endif
    endif
  endfun

  " returns the palette index for the given R/G/B color indices
  fun! <SID>rgb_color(x, y, z)
    if &t_Co == 88
      return 16 + (a:x * 16) + (a:y * 4) + a:z
    else
      return 16 + (a:x * 36) + (a:y * 6) + a:z
    endif
  endfun

  " returns the palette index to approximate the given R/G/B color levels
  fun! <SID>color(r, g, b)
    " get the closest grey
    let l:gx = <SID>grey_number(a:r)
    let l:gy = <SID>grey_number(a:g)
    let l:gz = <SID>grey_number(a:b)

    " get the closest color
    let l:x = <SID>rgb_number(a:r)
    let l:y = <SID>rgb_number(a:g)
    let l:z = <SID>rgb_number(a:b)

    if l:gx == l:gy && l:gy == l:gz
      " there are two possibilities
      let l:dgr = <SID>grey_level(l:gx) - a:r
      let l:dgg = <SID>grey_level(l:gy) - a:g
      let l:dgb = <SID>grey_level(l:gz) - a:b
      let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
      let l:dr = <SID>rgb_level(l:gx) - a:r
      let l:dg = <SID>rgb_level(l:gy) - a:g
      let l:db = <SID>rgb_level(l:gz) - a:b
      let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
      if l:dgrey < l:drgb
        " use the grey
        return <SID>grey_color(l:gx)
      else
        " use the color
        return <SID>rgb_color(l:x, l:y, l:z)
      endif
    else
      " only one possibility
      return <SID>rgb_color(l:x, l:y, l:z)
    endif
  endfun

  " returns the palette index to approximate the 'rrggbb' hex string
  fun! <SID>rgb(rgb)
    if a:rgb == "ffffff"
      return 15
    endif

    let l:r = ("0x" . strpart(a:rgb, 0, 2)) + 0
    let l:g = ("0x" . strpart(a:rgb, 2, 2)) + 0
    let l:b = ("0x" . strpart(a:rgb, 4, 2)) + 0

    return <SID>color(l:r, l:g, l:b)
  endfun

  " sets the highlighting for the given group, add optional fg, bg and attr
  " values to override the terminal settings
  fun! <SID>X(group, fg, bg, attr, ...)
    let l:ctermfg   = (a:0 > 0 && a:1 != "") ? a:1 : <SID>rgb(a:fg)
    let l:ctermbg   = (a:0 > 1 && a:2 != "") ? a:2 : <SID>rgb(a:bg)
    let l:ctermattr = (a:0 > 2 && a:3 != "") ? a:3 : a:attr

    if a:fg != ""
      exec "hi " . a:group . " guifg=#" . a:fg . " ctermfg=" . l:ctermfg
    endif
    if a:bg != ""
      exec "hi " . a:group . " guibg=#" . a:bg . " ctermbg=" . l:ctermbg
    endif
    if a:attr != ""
      exec "hi " . a:group . " gui=" . a:attr
    endif
    if l:ctermattr != ""
      exec "hi " . a:group . " cterm=" . l:ctermattr
    endif
  endfun
  " }}}

  highlight Normal guifg=White guibg=#191919
  highlight LineNr guifg=Orange4 guibg=Black gui=none

  highlight Cursor guifg=Black guibg=Orange1
  highlight CursorColumn guibg=Gray28 gui=bold
  highlight ColorColumn guibg=Gray27 gui=none
  highlight CursorLineNr guifg=Pink1 guibg=Black gui=bold
  highlight clear CursorLine

  highlight StatusLine guifg=White guibg=DarkGoldenRod4 gui=none
  highlight StatusLineNC guifg=Black guibg=Gray50 gui=none

  call <SID>X("Question", "00ff7f", "", "bold")
  highlight Error guifg=white guibg=Red1 gui=bold
  highlight ErrorMsg guifg=White guibg=Red
  call <SID>X("MoreMsg", "00ff7f", "", "bold")
  call <SID>X("Ignore", "666666", "", "")
  call <SID>X("Todo", "f9f747", "d75f00", "bold")

  highlight VertSplit guibg=PeachPuff4 guifg=Black gui=none

  highlight Folded guifg=Pink1 guibg=Gray20 gui=italic
  call <SID>X("FoldColumn", "d2b48c", "222222", "")
  highlight SignColumn guibg=Gray7

  highlight Search guibg=#205520 guifg=ivory gui=none
  highlight IncSearch guibg=Chocolate4 guifg=white gui=bold

  call <SID>X("SpecialKey", "9acd32", "", "")

  "call <SID>X("Title", "cd5c5c", "", "")
  highlight Title guifg=LemonChiffon gui=bold
  " call <SID>X("Visual", "", "2e5e73", "bold")
  highlight Visual guifg=black guibg=MistyRose gui=none
  call <SID>X("VisualNOS", "", "254A59", "bold")
  highlight WarningMsg guifg=LightGoldenRod1 gui=bold
  highlight MatchParen guibg=Blue2 guifg=NONE gui=bold

  call <SID>X("DiffAdd", "d7ffaf", "5f875f", "")
  call <SID>X("DiffChange", "d7d7ff", "5f5f87", "")
  call <SID>X("DiffDelete", "ff8080", "cc6666", "")
  call <SID>X("DiffText", "5f5f87", "81a2be", "")

  call <SID>X("Pmenu", "eeeeee", "444444", "")
  call <SID>X("PmenuSel", "ffffff", "555555", "bold")
  call <SID>X("PmenuSbar", "", "666666", "")
  call <SID>X("PmenuThumb", "", "606060", "")

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

  "delete functions {{{
  delf <SID>X
  delf <SID>rgb
  delf <SID>color
  delf <SID>rgb_color
  delf <SID>rgb_level
  delf <SID>rgb_number
  delf <SID>grey_color
  delf <SID>grey_level
  delf <SID>grey_number
  "}}}

" vim: set fdl=0 fdm=marker:

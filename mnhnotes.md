# Vim Notes

* Revert `Enter` to default mapping for current buffer:
  `nnoremap <buffer> <CR> <CR>`

* Highlight trailing whitespace with error color:
  `match ErrorMsg '\s\+$'`

* Fold by indentation: `setlocal foldmethod=indent`

* Add subdirectories to path (enables recursive search):
  :set path+=**

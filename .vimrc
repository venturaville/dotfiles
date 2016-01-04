syntax on
set nocompatible
set shiftwidth=2
set softtabstop=2
set undolevels=5000
set modeline
set modelines=5
set expandtab

execute pathogen#infect()
filetype plugin indent on

au! BufRead,BufNewFile *.go	set filetype=go
au! BufRead,BufNewFile *.pp	set filetype=ruby
au! BufRead,BufNewFile *.rst	set filetype=vst
au! BufRead,BufNewFile *.json   set filetype=json 
" for XML folding
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax
" Use font colors appropriate for dark background
set bg=dark
" force 4 spaces for json
augroup json_autocmd
  autocmd!
  autocmd FileType json set autoindent
  autocmd FileType json set formatoptions=tcq2l
  autocmd FileType json set textwidth=78 shiftwidth=4
  autocmd FileType json set softtabstop=4 tabstop=4
  autocmd FileType json set expandtab
  "autocmd FileType json set foldmethod=syntax 
augroup END
" force 4 spaces for markdown
augroup markdown_autocmd
  autocmd!
  autocmd FileType markdown set shiftwidth=4
  autocmd FileType markdown set softtabstop=4 tabstop=4
augroup END

" ruby doesn't work for youcompleteme without vim version 7.4.314 or later
"let g:ycm_filetype_whitelist = { 'cpp': 1, 'c': 1, 'python':1 }

autocmd! FileType go setlocal shiftwidth=8 softtabstop=8 tabstop=8
let g:go_fmt_command = "goimports"


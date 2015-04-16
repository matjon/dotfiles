" Vim filetype plugin
" Language: My notes
" Maintainer: Mateusz Jończyk


" In default vimrc from Ubuntu, files with extension *.txt are detected as
" plain text files (filetype=text). There is no support for syntax
" highlighting (or other special features) for them apart from 
" setting textwidth=78 in default .vimrc:
"
"     " For all text files set 'textwidth' to 78 characters.   
"     autocmd FileType text setlocal textwidth=78              
"

setlocal textwidth=80
setlocal nospell
setlocal nonumber
setlocal colorcolumn=0

" I don't remember why I have been using it
" I should check the settings below
"
" They may have been copied from some other plugin or website.
setlocal nosmartindent
setlocal nosmarttab
setlocal noshiftround
setlocal noexpandtab

" trim 'comments' a bit, most importantly remove 'b:#'
" original version (vim default):
"       setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal comments=s1:/*,mb:*,ex:*/,://,n:>,fb:-


" Support for folding markdown-style headers
" This uses plugin vim-markdown-folding

" TODO: expand undo_ftplugin
let b:undo_ftplugin = ''
let g:markdown_fold_style = 'nested'
runtime ftplugin/markdown/folding.vim

" Unfortunately the above script makes editing really slow, so disable it by
" now. It can be enabled by doing 
"       :set foldmethod=expr
set foldmethod=manual

" autocmd CursorHoldI * silent wall
" autocmd CursorHold * silent wall

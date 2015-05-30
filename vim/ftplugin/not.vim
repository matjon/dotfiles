" Vim filetype plugin
" Language: My notes
" Maintainer: Mateusz Jończyk

" Options:
"        g:markdown_fold_style - folding style (as used by vim-markdown-folding)

" In default vimrc from Ubuntu, files with extension *.txt are detected as
" plain text files (filetype=text). There is no support for syntax
" highlighting (or other special features) for them apart from 
" setting textwidth=78 in default .vimrc:
"
"     " For all text files set 'textwidth' to 78 characters.   
"     autocmd FileType text setlocal textwidth=78              
"

setlocal textwidth=0
setlocal wrap
setlocal linebreak

setlocal nospell
setlocal nonumber
setlocal colorcolumn=0

" TODO: check the four settings below, I don't remember why I set them
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
" This uses vim-markdown-folding plugin

" HACK: ftplugin/markdown/folding.vim expects b:undo_ftplugin to be set
" TODO: add own commands to undo_ftplugin
let b:undo_ftplugin = ''
runtime ftplugin/markdown/folding.vim
setlocal foldmethod=expr


" autocmd CursorHoldI * silent wall
" autocmd CursorHold * silent wall

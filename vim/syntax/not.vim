" Vim syntax file
" Language: Moje notatki
" Maintainer: Mateusz
" Latest Revision: 17 X 2014

" TODO: use custom match names instead of standard ones

syn match Type '^\(pon\|wto\|śro\|czw\|pią\|sob\|nie\)\, \d\+ \(sty\|lut\|mar\|kwi\|maj\|cze\|lip\|sie\|wrz\|paź\|lis\|gru\) 201\d\, \d\d:\d\d:\d\d \(CEST\|CET\)'
syn match Comment 'EDIT\: \(pon\|wto\|śro\|czw\|pią\|sob\|nie\)\, \d\+ \(sty\|lut\|mar\|kwi\|maj\|cze\|lip\|sie\|wrz\|paź\|lis\|gru\) 201\d\, \d\d:\d\d:\d\d \(CEST\|CET\)'

syn match Todo 'IMPORTANT'
syn match Todo 'ISTOTNE'
syn match Todo 'WAŻNE'
syn match Todo 'WAZNE'

syn match Constant '\v\# .+'
syn match Constant '\v\#\# .+'
syn match Constant '\v\#\#\#+ .+'

" URLs
" syn match Constant '\v<(http|https|ftp)\:\S*'
" syn match Constant '\v<www\.\S*'
" syn match Constant '\v<mam-efke\.pl\/forum\/\S*'
"

" Pliki o rozszerzeniu *.txt są wykrywane jako pliki tekstowe (filetype=text)
" Nie istnieje wsparcie dla kolorowania składni i podobnych rzeczy dla plików
" o filetype=text, jedynie w pliku .vimrc jest ustawiane:
"
"     " For all text files set 'textwidth' to 78 characters.   
"     autocmd FileType text setlocal textwidth=78              
"
" tutaj to też ustawiam.
"
" TODO: extract these into ftplugin

setlocal textwidth=78
setlocal nospell
setlocal nonumber
setlocal colorcolumn=0

" I don't remember why I have been using it
" I should check the settings below
setlocal nosmartindent
setlocal nosmarttab
setlocal noshiftround

setlocal noexpandtab

" trim 'comments' a bit, most importantly remove 'b:#'
" original version (vim default):
"       setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal comments=s1:/*,mb:*,ex:*/,://,n:>,fb:-

" autocmd CursorHoldI * silent wall
" autocmd CursorHold * silent wall

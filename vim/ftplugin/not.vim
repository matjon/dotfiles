
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

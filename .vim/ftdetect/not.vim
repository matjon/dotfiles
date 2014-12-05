
" Wszystkie pliki z rozszerzeniem *.txt traktujemy jako pliki z notatkami
" Zobacz więcej :help new-filetype 
" 	- przypadek A
au BufRead,BufNewFile *.txt      set filetype=not

" Wszystkie pliki, których typu nie udało się wykryć, zawierają
" prawdopodobnie notatki. W ten sposób, zezwalamy na pliki z notatkami bez
" rozszerzenia jednocześnie zachowując kolorowanie składni plików .html, .vim
" i podobnych.
" Zobacz więcej :help new-filetype 
" 	- przypadek B
"au BufRead,BufNewFile *            setfiletype not

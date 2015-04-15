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

syn match Constant '\v^\# .+'
syn match Constant '\v^\#\# .+'
syn match Constant '\v^\#\#\#+ .+'

syn match Constant '\v^\!\!\!.+'

" URLs
" syn match Constant '\v<(http|https|ftp)\:\S*'
" syn match Constant '\v<www\.\S*'
" syn match Constant '\v<mam-efke\.pl\/forum\/\S*'
"


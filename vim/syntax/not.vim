" Vim syntax file
" Language: My notes
" Maintainer: Mateusz Jończyk

" TODO: use custom match names instead of standard ones

syn match Type '^\(pon\|wto\|śro\|czw\|pią\|sob\|nie\)\, \d\+ \(sty\|lut\|mar\|kwi\|maj\|cze\|lip\|sie\|wrz\|paź\|lis\|gru\) 20\d\d\, \d\d:\d\d:\d\d \(CEST\|CET\)'
syn match Type '^\(Mon\|Tue\|Wed\|Thu\|Fri\|Sat\|Sun\) \d\+ \(Jan\|Feb\|Mar\|Apr\|May\|Jun\|Jul\|Aug\|Sep\|Oct\|Nov\|Dec\) 20\d\d \d\d:\d\d:\d\d \(AM\|PM\) \(CEST\|CET\)'

syn match Comment 'EDIT\: \(pon\|wto\|śro\|czw\|pią\|sob\|nie\)\, \d\+ \(sty\|lut\|mar\|kwi\|maj\|cze\|lip\|sie\|wrz\|paź\|lis\|gru\) 20\d\d\, \d\d:\d\d:\d\d \(CEST\|CET\)'
syn match Comment 'EDIT\: \(Mon\|Tue\|Wed\|Thu\|Fri\|Sat\|Sun\) \d\+ \(Jan\|Feb\|Mar\|Apr\|May\|Jun\|Jul\|Aug\|Sep\|Oct\|Nov\|Dec\) 20\d\d \d\d:\d\d:\d\d \(AM\|PM\) \(CEST\|CET\)'

syn match Todo 'IMPORTANT'
syn match Todo 'ISTOTNE'
syn match Todo 'WAŻNE'
syn match Todo 'WAZNE'
syn match Todo 'READ_IN_A_YEAR'
syn match Todo 'PRZECZYTAC_ZA_ROK'

syn match Constant '\v^\# .+'
syn match Constant '\v^\#\# .+'
syn match Constant '\v^\#\#\#+ .+'

syn match Constant '\v^\!\!\!.+'


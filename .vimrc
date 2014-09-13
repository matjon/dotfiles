" This vimrc file is based on:
"       - the example vimrc file as found in Ubuntu:
"
"               Maintainer:	Bram Moolenaar <Bram@vim.org>
"               Last change:	2011 Apr 15
"       - natural.vim:
"               https://github.com/hkjels/natural.vim
"
"               The MIT License (MIT)
"
"               Copyright (c) 2013 Henrik Kjelsberg
"
"               Permission is hereby granted, free of charge, to any person obtaining a copy of
"               this software and associated documentation files (the "Software"), to deal in
"               the Software without restriction, including without limitation the rights to
"               use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
"               the Software, and to permit persons to whom the Software is furnished to do so,
"               subject to the following conditions:
"
"               The above copyright notice and this permission notice shall be included in all
"               copies or substantial portions of the Software.
"
"               THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
"               IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
"               FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
"               COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
"               IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
"               CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
"
"
"
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=500		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
"if has('mouse')
"  set mouse=a
"endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

set showmatch


"--------------------------
"MY MODIFICATIONS
"--------------------------
" set mouse=a

execute pathogen#infect()


set fileencodings=ucs-bom,utf-8,cp1250

set expandtab
"set cinoptions+={2
set gdefault

set ignorecase
set autowrite


" set clang_library_path /usr/lib/i386-linux-gnu/libclang-3.4.so.1
"

autocmd BufNewFile,BufRead *.cpp set textwidth=100
autocmd BufNewFile,BufRead *.h set textwidth=100

"autocmd BufNewFile,BufRead *.txt set wrap textwidth=0 wrapmargin=80










" keyboard shortcuts    {

        " http://www.cs.oberlin.edu/~kuperman/help/vim/indenting.html
        set pastetoggle=<F5>

        " F2 - wstawia datę na końcu pliku i otwiera poniżej do edycji
        " (wzorowane na przykładie w map.txt)
        map <F2> Go<CR><C-R>=strftime("%c %Z")<CR><CR>
        imap <F2> <Esc>Go<CR><C-R>=strftime("%c %Z")<CR><CR>

        " shortcuts to type less and overload small fingers less
        map s :A<CR>
        " imap <F3> <Esc>:A<CR>
        map gn :make<CR>
        " map gu p
        map gj :cn<CR>
        map gk :cprev<CR>
        map gl :clist!<CR>
        map go :tabedit src/
        map gr gT
        map ga :wall<CR>

        " zamiana <Esc> oraz Caps Locka - w ustawieniach klawiatury Gnome
        " I don't use zz at all
        map zz ZZ

        " map vim behaviour consistent
        map Y y$

        " zmniejsza obciążenie małego palca
        map gu :


" }







" enable line numbering
set number
set numberwidth=5


" Strip whitespace at the end of line
" http://stackoverflow.com/questions/356126/how-can-you-automatically-remove-trailing-whitespace-in-vim
autocmd BufWritePre *.c :%s/\s\+$//e
autocmd BufWritePre *.cpp :%s/\s\+$//e
autocmd BufWritePre *.h :%s/\s\+$//e


" http://stackoverflow.com/questions/102384/using-vims-tabs-like-buffers
" do not clear undo history when switching between buffers with :A
set hidden
set switchbuf=usetab,newtab

set makeprg=make\ -j2
set clipboard=unnamed

" _______________ NERDTree support
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
" go to the NERDTree window
map gw <C-W>l

" map <F3> :NERDTree<CR> <C-W>L 20<C-W><
let g:nerdtree_tabs_open_on_console_startup = 1
let g:NERDTreeWinPos = 'right'
let g:NERDTreeWinSize = 21
let g:NERDTreeIgnore = ['\.o_p$', '\.o_d$', '\.d$', '\.CHECK', '\.swp', '\~$']

" do not show separate status lines for windows
set laststatus=0
" let  NERDTreeMapOpenInTab = '<CR>'
" ______________ end of NERDTree support


"________________ OmniCppCOmplete
" set tags+=/home/mateusz/.vim/tags_global
" it does not work
"

set nowrap

" http://www.vim.org/scripts/script.php?script_id=4988 - auto lang detection
set spell spelllang=en_us,pl
" How to generate polish language spell file:
"        cd ~/.vim/spell/
"        Open vim
"        :mkspel pl /usr/share/dict/polish


" todo: languagetool:
" let g:languagetool_jar = '/home/mateusz/.vim/languagetool-commandline.jar'

" vim-airline                                   {
let g:airline#extensions#tabline#enabled = 1
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

  " unicode symbols
  " let g:airline_left_sep = '»'
  let g:airline_left_sep = '▶'
  " let g:airline_right_sep = '«'
  let g:airline_right_sep = '◀'
  " let g:airline_symbols.linenr = '␊'
  " let g:airline_symbols.linenr = '␤'
  let g:airline_symbols.linenr = '¶'
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = 'ρ'
  " let g:airline_symbols.paste = 'Þ'
  " let g:airline_symbols.paste = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
" }

" TODO: Ctrl+Shift+Page{Up,Down} - przesuwa obecną kartę
" użyć: tabpagenr
" map <C:execute (tabpagenr() +1) . 'tabmove' 
"  - tego niestety nie da się zrobić, bo terminal nie potrafi wysłać
"  Ctrl+Shift+PgUp

" TODO:
" https://github.com/hkjels/natural.vim/blob/master/plugin/natural.vim

" should come last
autocmd BufRead COMMIT_EDITMSG goto 1
autocmd BufRead COMMIT_EDITMSG startinsert

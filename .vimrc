" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2011 Apr 15
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

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

" F2 - wstawia datę na końcu pliku i otwiera poniżej do edycji

" map <F2> Go<Esc>:r!date<CR>Go
" (wzorowane na przykładie w map.txt)
" tak jest szybciej
map <F2> Go<CR><C-R>=strftime("%c %Z")<CR><CR>
imap <F2> <Esc>Go<CR><C-R>=strftime("%c %Z")<CR><CR>
" map <F8> <Esc>:make<CR>
" map <F9> <Esc>:clist!<CR>
" map <F10> <Esc>:cn<CR>
" map <F11> <Esc>:cp<CR>

set ignorecase
set autowrite

" http://www.cs.oberlin.edu/~kuperman/help/vim/indenting.html
set pastetoggle=<F5>

" set dictionary=/usr/share/dict/british

" set clang_library_path /usr/lib/i386-linux-gnu/libclang-3.4.so.1
"

autocmd BufNewFile,BufRead *.cpp set textwidth=100
autocmd BufNewFile,BufRead *.h set textwidth=100

"autocmd BufNewFile,BufRead *.txt set wrap textwidth=0 wrapmargin=80


" shortcuts to type less and overload small fingers less
map s :A<CR>
" map <F3> :A<CR>
imap <F3> <Esc>:A<CR>
map gn :make<CR>
" map gu p
map gj :cn<CR>
map gk :cprev<CR>
map gl :clist!<CR>
map go :tabedit src/
map gr gT
map ga :wall<CR>

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

" do not show separate status lines for Windows
set laststatus=0
" let  NERDTreeMapOpenInTab = '<CR>'
" ______________ end of NERDTree support


"________________ OmniCppCOmplete
" set tags+=/home/mateusz/.vim/tags_global
" it does not work
"

set nowrap

" zmniejsza obciążenie małego palca
map gu :
" zamiana <Esc> oraz Caps Locka - w ustawieniach klawiatury Gnome

" ------------------------------NERDTree find
" from https://gist.github.com/ashwin/3c6a40b2d1245f1c5b96
" http://choorucode.com/2014/05/05/how-to-highlight-current-file-in-nerdtree/

" Check if NERDTree is open or active
function! rc:isNERDTreeOpen()
return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction
 
" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! rc:syncTree()
        if &modifiable && rc:isNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
                NERDTreeFind
                wincmd p
        endif
endfunction
 
" Highlight currently open buffer in NERDTree
autocmd BufEnter * call rc:syncTree()
" ---------------------------- end of NERDTree find

" should come last
autocmd BufRead COMMIT_EDITMSG goto 1
autocmd BufRead COMMIT_EDITMSG startinsert

" This vimrc file is based on (among others):
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

set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
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


" TODO: integrate with rest of the file
" imported from natural.vim -----------------------------------------------{
" diff -U3 works correctly

if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" I/O ------------------------------------------------------------------ {{{
  set ttyfast                         " Faster repeated editing
                        " it's on by default
  set ttimeout                        " Use timeout for key sequence
" set ttimeoutlen=50                  " Time you have to complete a key sequence
  set ttimeoutlen=10                  " Time you have to complete a key sequence
" set mouse=a                         " Enable mouse-input
" set autowriteall                    " Save when shifting focus
" set autoread                        " Reload files changed outside of vim
" set visualbell                      " No bells!
  set noerrorbells                    " No whistles!
  set ffs=unix,dos,mac                " Default file types
  set backspace=indent,eol,start      " Make backspace behave normally.
" set modelines=0                     " Prevents modeline exploits
  set nostartofline                   " Keep cursor-position when switching buffers
  set backup                          " Turn on backup
                               " NOTE: this is not enabled automatically
" set backupdir=~/.vim/backup         " Where to store backup files
" set directory=~/.vim/swap           " Where to store swap files
" }}}


" Wild menu ------------------------------------------------------------ {{{
  if has("wildmenu")
    set wildmenu                             " Completions in a menu
    set wildmode=list:longest,full           " Fine grained completion
    set wildignore+=_darcs,.hg,.git,.svn     " Ignore vc directories

    " Case-insensitive completion
    if exists("&wildignorecase")
      set wildignorecase
    endif
  endif
" }}}

" Scratch -------------------------------------------------------------- {{{
  set hidden                          " Allow un-saved buffers in background
" }}}

" History -------------------------------------------------------------- {{{
" set history=32768                   " A longer history
  set history=100000                  " A longer history
  set undolevels=1000                 " Changing history is useful to
" }}}

" Aesthetics ----------------------------------------------------------- {{{
"  set list listchars=tab:→\ ,trail:·  " Show 'invisible characters'
  set colorcolumn=80                  " Practice short code
  set number                          " Show line-numbers
  set nowrap                          " Don't wrap lines
  set guicursor+=a:blinkon0           " Disable the blinking cursor
  set showmatch                       " Show matching parenthesis
" set scrolloff=10                    " Keep the cursor close to center
  set scrolloff=5                    " Keep the cursor close to center
" set sidescrolloff=3                " and middle
  set splitbelow                      " New window will appear below the current window
  set splitright                      " New window will appear to the right of the current window
" }}}

" Search --------------------------------------------------------------- {{{
  set gdefault                        " Search with global by default
  set hlsearch                        " Highlight terms
  set ignorecase                      " Ignore case by default
" set smartcase                       " Do not ignore case if pattern has uppercase letters
  set incsearch                       " Show search matches as you type
" }}}

" Text editing --------------------------------------------------------- {{{
  set spell                           " Use spell-checker
  set encoding=utf-8                  " Default encoding
" set synmaxcol=500                   " Disable highlighting for lines longer than 500 chars
        " it is annoying, when I have a very long string in C, 
        " it does not recognize the closing aposrophe: "
        " and colors all text as red
" }}}

" Indentation ---------------------------------------------------------- {{{
" set cindent                         " C indentation rules
  set autoindent                      " Indent based on ruleset of language
  set smartindent                     " Indent first line according to previous
  set smarttab                        " Use shiftwidth to emulate tabs
  set shiftround                      " Round indent to multiple of shiftwidth
" }}}

" Key-bindings --------------------------------------------------------- {{{
  " Navigate by row instead of line
  nnoremap j gj
  nnoremap k gk
  nnoremap gj j
  nnoremap gk k

  " Make yank´s behavior consistent
  nnoremap Y y$

  " Remove highlighted search-query with enter-key
  nnoremap <cr> :nohlsearch<cr>

  " Normalize regular-expression searches
" nnoremap / /\v
" vnoremap / /\v
" nnoremap ? ?\v
" vnoremap ? ?\v
" cnoremap s/ s/\v
" cnoremap s@ s@\v

" very nomagic is very convenient when pasting input from web pages
  nnoremap / /\V
  vnoremap / /\V
  nnoremap ? ?\V
  vnoremap ? ?\V
  cnoremap s/ s/\V
  cnoremap s@ s@\V

  " Prevent de-select when indenting blocks
  vnoremap < <gv
  vnoremap > >gv
" }}}


" }

execute pathogen#infect()

set fileencodings=ucs-bom,utf-8,cp1250
        " if there is a BOM, use it,
        " otherwise check if the file is valid UTF-8, if not, try to open
        " in cp1250 as a last resorts



" HANDLING OF STRUCTURED FILES ------------------------------------------{

        set expandtab
        "set cinoptions+={2

        autocmd BufNewFile,BufRead *.cpp set textwidth=100
        autocmd BufNewFile,BufRead *.h set textwidth=100

        "autocmd BufNewFile,BufRead *.txt set wrap textwidth=0 wrapmargin=80

        set nowrap

        " line numbering
        set numberwidth=5

" }


" Strip whitespace at the end of line
" http://stackoverflow.com/questions/356126/how-can-you-automatically-remove-trailing-whitespace-in-vim
if !exists(":Stripws")
  command Stripws :%s/\m\s\+$//e
endif

autocmd BufWritePre *.c :Stripws
autocmd BufWritePre *.cpp :Stripws
autocmd BufWritePre *.h :Stripws
autocmd BufWritePre *.tex :Stripws


" http://stackoverflow.com/questions/102384/using-vims-tabs-like-buffers
" do not clear undo history when switching between buffers with :A
set hidden
set switchbuf=usetab,newtab

set makeprg=make\ -j2
set autowrite           " execute :wall when doing :make
set clipboard=unnamed

set title




set spelllang=en_us,pl
" How to generate polish language spell file:
"        cd ~/.vim/spell/
"        Open vim
"        :mkspel pl /usr/share/dict/polish



" KEYBOARD SHORTCUTS  -----------------------------------------------------{

        " http://www.cs.oberlin.edu/~kuperman/help/vim/indenting.html
        set pastetoggle=<F5>

        " F2 - inserts a date at the end of a file and starts insert mode
        "      below it. Great for keeping NOTES.
        "      (based on an example in map.txt in vim documentation)
        map  <F2>      Go<CR><C-R>=strftime("%c %Z")<CR><Esc><<<<<<<<<<o
        imap <F2> <Esc>Go<CR><C-R>=strftime("%c %Z")<CR><Esc><<<<<<<<<<o
        map  <F3>      o<CR>EDIT: <C-R>=strftime("%c %Z")<CR><Esc><<<<<<<<<<o
        imap <F3> <Esc>o<CR>EDIT: <C-R>=strftime("%c %Z")<CR><Esc><<<<<<<<<<o

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

        " zmniejsza obciążenie małego palca
        map gu :

        map gf :tabedit <cfile><CR>
" }








" ----------------------------------------------------------------------------
" PLUGIN SUPPORT
" ----------------------------------------------------------------------------
"
" Plugins I use:
"
" autocomplpop          - automatic word completion
" a.vim                 - automatic switching between *.c <-> *.h
" nerdtree              - a file browser on the right
" vim-nerdtree-tabs     - make the file browser work correctly with multiple tabs
" vim-airline           - used only for the tab line
" LanguageTool          - grammar checking
"
" Plugins worth considering:
" conqueterm_2.2.vmb  natural.vim  OmniCppComplete  vim-fugitive  vim-signify
" tabline.vim
"

" NERDTree support ----------------------------------------------------{

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
        let g:NERDTreeIgnore = ['\.o$', '\.swp', '\~$']
        let g:NERDTreeShowHidden=1

        " do not show separate status lines for windows
        set laststatus=0
        " let  NERDTreeMapOpenInTab = '<CR>'

" }





" VIM-AIRLINE CONFIG --------------------------------------------------------{

        " based on some sample config from vim-airline
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

" LanguageTool CONFIG -----------------------------------------------------{
        let g:languagetool_jar = '/home/mateusz/.vim/LanguageTool-2.6/languagetool-commandline.jar'
        let g:languagetool_lang = 'pl'
" }


" TODO:
"       - moving current tab with Ctrl+Shift+Page{Up,Down}
"         we could use tabpagenr:
"                map <C:execute (tabpagenr() +1) . 'tabmove'
"
"         Unfortunately this won't work because the terminal cannot send
"         Ctrl+Shift+PgUp

"       - https://github.com/hkjels/natural.vim/blob/master/plugin/natural.vim
"               - sprawdzić też git log -p

"       - OmniCppCOmplete
"               set tags+=/home/mateusz/.vim/tags_global
"               it does not work
"       - completion with clang:
"               set clang_library_path /usr/lib/i386-linux-gnu/libclang-3.4.so.1
"               - also doesn't work
"
"       - http://www.vim.org/scripts/script.php?script_id=4988 - automatic language
"               detection
"               - we don't need it as we currently use
"                 set spelllang=pl,en
"
"       - vim-autocorrect
"               automatyczne podstawianie słów w angielskim,
"               https://github.com/panozzaj/vim-autocorrect/tree/master
"
"       - przejrzeć: https://github.com/modeset/dotset/tree/master/bin

" should come last
autocmd BufRead COMMIT_EDITMSG goto 1
autocmd BufRead COMMIT_EDITMSG startinsert

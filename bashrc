#this file is based on /etc/skel/.bashrc

#TODO:
#       see /etc/bash*  , /etc/profile
#       see /usr/share/doc/bash/examples
#       check other shopt options to see if they make sense
#       http://www.thegeekstuff.com/tag/productivity-tips-for-geeks/
#       http://www.thegeekstuff.com/2008/10/6-awesome-linux-cd-command-hacks-productivity-tip3-for-geeks/#more-233

# If not running interactively, don't do anything
[ -z "$PS1" ] && return



# ENVIRONMENT VARIABLES {{{
        #http://clang.llvm.org/docs/AddressSanitizer.html#introduction
        export ASAN_SYMBOLIZER_PATH=/usr/bin/llvm-symbolizer-3.4

        export PATH="/home/mateusz/dotfiles/copied_executables/:$PATH"
        export PATH="/media/Vista/install/nodejs/node-v8.11.1-linux-x86/bin:$PATH"
        export PATH="/media/Vista/bin/bin:$PATH"
        export PATH="/media/Vista/install/texlive/bin/i386-linux:$PATH"
        export PATH="/media/Vista/install/sleuthkit/bin:$PATH"
        export PATH="/media/Vista/install/jdk/jdk-11.0.1/bin:$PATH"
        export PATH="/media/Vista/install/phantomjs/phantomjs-2.1.1-linux-i686/bin:$PATH"
        export PATH="/media/Vista/install/sencha-cmd:$PATH"
        export PATH="/media/Vista/install/android/platform-tools:$PATH"

        export LD_LIBRARY_PATH=/media/Vista/bin/lib:$LD_LIBRARY_PATH
        export LD_LIBRARY_PATH=/media/Vista/bin/lib/gcc/i686-pc-linux-gnu/4.8.2/:$LD_LIBRARY_PATH
        export LD_LIBRARY_PATH="/media/Vista/install/sleuthkit/lib:$LD_LIBRARY_PATH"

        export JAVA_HOME="/media/Vista/install/jdk/jdk-11.0.1"

        #ignore case, useful for git
        export LESS="-I -R --long-prompt"
        export PAGER=less

        #for wodim
        export CDR_DEVICE="/dev/dvd3"

        export SOX_OPTS="--rate 44100 --channels 2"
# }}}

# COLOR SUPPORT {{{
        #Inspired by http://fedoraproject.org/wiki/Features/256_Color_Terminals
        #enable 256 color support
        if [[ "$TERM" == xterm ]]; then
                export TERM=xterm-256color
        fi


        #the code below is from /etc/skel/.bashrc

        # uncomment for a colored prompt, if the terminal has the capability; turned
        # off by default to not distract the user: the focus in a terminal window
        # should be on the output of commands, not on the prompt
        #color_prompt=yes
        if [ "$color_prompt" = yes ]; then
            PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
        else
            PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
        fi
        unset color_prompt

        # enable color support of ls and also add handy aliases
        if [ -x /usr/bin/dircolors ]; then
            test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
            alias ls='ls --color=auto'
            #alias dir='dir --color=auto'
            #alias vdir='vdir --color=auto'

            alias grep='grep --color=auto'
            alias fgrep='fgrep --color=auto'
            alias egrep='egrep --color=auto'
        fi

# }}}

# OPTIONS {{{
        # check the window size after each command and, if necessary,
        # update the values of LINES and COLUMNS.
        shopt -s checkwinsize

        # If set, the pattern "**" used in a pathname expansion context will
        # match all files and zero or more directories and subdirectories.
        #shopt -s globstar

        #it is safe because it is only used in interactive mode
        shopt -s cdspell
# }}}

# TERMINAL TITLE {{{
        # If this is an xterm set the title to user@host:dir
        case "$TERM" in
        xterm*|rxvt*)
                        #TODO: add a last command here
            PS1="\[\e]0;${debian_chroot:+($debian_chroot)} \W : \w \a\]$PS1"
            ;;
        *)
            ;;
        esac
# }}}

# ALIASES {{{

        # some more ls aliases
        alias ll='ls -alF'
        alias llt='ls -alF --sort=time'
        alias la='ls -A'

        #tell bash to sleep
        alias ZZ=exit
        #alias z=exit
        alias zz=exit
        alias zzz=exit
        alias zzzz=exit
        alias zzzzz=exit
        alias zzzzzz=exit
        alias zzzzzzz=exit

        #it is annoying when I type "FAHClient" instead of "FAHControl"
        #sl is a "steam locomotive"
        alias FAHClient='sl'

        #from /etc/skel/.bashrc
        # make less more friendly for non-text input files, see lesspipe(1)
        [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

        #inspired by: https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/git/git.plugin.zsh
        alias gc='git commit --verbose'
        alias gca='git commit --all --verbose'
        alias gs='git status'
        alias gd='git diff'
        alias gds='git diff --staged'
        alias gai='git add -i'
        alias ga='git add'

        alias gl='git log'
        alias gls='git log --stat'
        alias glp='git log -p'
        alias glo='git log --online'


        # www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html
        alias ..='cd ..'
        alias .2='cd ../..'
        alias .3='cd ../../..'
        alias .4='cd ../../../..'
        alias .5='cd ../../../../..'
        alias .6='cd ../../../../../..'

        alias bc='bc -l'


# }}}

# FUNCTIONS {{{

        # "repeat" command.  Like:
        #
        #	repeat 10 echo foo
        #From /usr/share/doc/bash/examples/startup-files/Bash_aliases
        repeat ()
        {
                local count="$1" i;
                shift;
                for i in $(_seq 1 "$count");
                do
                        eval "$@";
                done
        }

        # Subfunction needed by `repeat'.
        _seq ()
        {
                local lower upper output;
                lower=$1 upper=$2;

                if [ $lower -ge $upper ]; then return; fi
                while [ $lower -lt $upper ];
                do
                        echo -n "$lower "
                        lower=$(($lower + 1))
                done
                echo "$lower"
        }


        # Add an "alert" alias for long running commands.  Use like so:
        #   sleep 10; alert
        # This is from /etc/skel/.bashrc
        alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

        #dad - date dir
        function dad ()
        {
                local my_date=$(date '+%Y-%m-%d')
                mkdir -p $my_date
                cd $my_date
        }

        #compress
        #function c()
        #{
        #        tar -c -f "$1".tar.gz -a "$1"
        #}

        #mkdir and cd to it
        function md()
        {
                mkdir "$1"
                cd "$1"
        }

        function my_unix_to_localtime()
        {
                date --date="@$1"
        }


        # pią, 12 lut 2016, 17:22:27 CET
        # http://ubuntuforums.org/showthread.php?t=899179
        function odtgrep() {
                # styles.xml contains page header/footer text
                unzip -p "$2" content.xml styles.xml 2>/dev/null | grep "$1" >/dev/null;
                if [ $? -eq 0 ]; then
                        echo "$2"
                fi
        }

        function odtsearch() {
                for f in *.odt; do
                        odtgrep "$1" "$f"
                done
        }

        function odtsearch_r() {
                #HACK
                for f in *.odt */*.odt */*/*.odt */*/*/*.odt */*/*/*/*.odt      \
                                */*/*/*/*/*.odt */*/*/*/*/*/*.odt; do
                        odtgrep "$1" "$f"
                done
        }
# }}}




# HISTORY CONFIGURATION {{{
        #http://unix.stackexchange.com/questions/1288/preserve-bash-history-in-multiple-terminal-windows#3055135
        export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
        export HISTSIZE=100000000                   # big big history
        export HISTFILESIZE=100000000               # big big history
        export HISTTIMEFORMAT="%F %T " #MY ADDITION
        shopt -s histappend                      # append to history, don't overwrite it

        # Save and reload the history after each command finishes
        export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
# }}}


. ~/dotfiles/private/bashrc || true


#Disabling this makes execution of .bashrc blazing fast.
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
        . /etc/bash_completion
fi

# vim: foldmethod=marker

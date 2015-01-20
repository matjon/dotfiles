# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

#this file is based on /etc/skel/.bashrc
#TODO: see /etc/bash*  , /etc/profile
#TODO: see /usr/share/doc/bash/examples
#TODO: read other shopt options to see if they make sense
#TODO: http://www.thegeekstuff.com/tag/productivity-tips-for-geeks/
#TODO: http://www.thegeekstuff.com/2008/10/6-awesome-linux-cd-command-hacks-productivity-tip3-for-geeks/#more-233


#sometimes when running 
#sudo -u hidden bash 
#the variables may not be set correctly, and so this bashrc file will be sourced
#instead of the proper one in ~hidden
if [[ $UID == 990 ]]; then
	export TERM=xterm-256color
	export HOME=/home/hidden
	export DISPLAY=:0.0
	cd $HOME
	exec bash
fi

#if [[ $(tty | grep /dev/tty) ]]; then
#	exit;
#fi


# If not running interactively, don't do anything
[ -z "$PS1" ] && return


# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar


# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi



#it is safe because it is only used in interactive mode
shopt -s cdspell

# ENVIRONMENT VARIABLES {
        #export LARCH_PATH=~/bin/splint-3.1.1/lib
        #export LCLIMPORTDIR=~/bin/splint-3.1.1/imports
        #export TCL_LIBRARY=/usr/share/tcltk/tcl8.5

        #export PATH=$PATH:$HOME/bin/android/platform-tools:$HOME/bin/android/tools:$HOME/bin/android-ndk-r5c

        #http://clang.llvm.org/docs/AddressSanitizer.html#introduction
        export ASAN_SYMBOLIZER_PATH=/usr/bin/llvm-symbolizer-3.4

        export PATH="$HOME/bin:$PATH"
        export PATH="/media/Vista/bin/bin:$PATH"
        export PATH="/media/EXTERNAL/obszar_roboczy/tex/texlive/bin/i386-linux/:$PATH"
        export PATH="/media/Vista/install/sleuthkit/bin:$PATH"

        export LD_LIBRARY_PATH=/media/Vista/bin/lib:$LD_LIBRARY_PATH
        export LD_LIBRARY_PATH=/media/Vista/bin/lib/gcc/i686-pc-linux-gnu/4.8.2/:$LD_LIBRARY_PATH
        export LD_LIBRARY_PATH="/media/Vista/install/sleuthkit/lib:$LD_LIBRARY_PATH"

        #export DERBY_INSTALL=/home/mateusz/Studia/IOR/lib/db-derby-10.10.1.1-bin
        #export DERBY_HOME=$DERBY_INSTALL

        #ignore case, useful for git
        export LESS="-I -R"
        export PAGER=less

        unset ftp_proxy
# }

# COLOR SUPPORT {

        #Based on http://fedoraproject.org/wiki/Features/256_Color_Terminals

        # Set this variable in your local shell config if you want remote
        # xterms connecting to this system, to be sent 256 colors.
        # This can be done in /etc/csh.cshrc, or in an earlier profile.d script.
        #   SEND_256_COLORS_TO_REMOTE=1


        # Terminals with any of the following set, support 256 colors (and are local)
        local256="$COLORTERM$XTERM_VERSION$ROXTERM_ID$KONSOLE_DBUS_SESSION"

        if [ -n "$local256" ] || [ -n "$SEND_256_COLORS_TO_REMOTE" ]; then

           case "$TERM" in
              'xterm') TERM=xterm-256color;;
              'screen') TERM=screen-256color;;
              'Eterm') TERM=Eterm-256color;;
           esac
           export TERM

           if [ -n "$TERMCAP" ] && [ "$TERM" = "screen-256color" ]; then
             TERMCAP=$(echo "$TERMCAP" | sed -e 's/Co#8/Co#256/g')
             export TERMCAP
           fi
        # uncomment for a colored prompt, if the terminal has the capability; turned
        # off by default to not distract the user: the focus in a terminal window
        # should be on the output of commands, not on the prompt
           #color_prompt=yes
        fi

        unset local256


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

# } //END OF COLOR SUPPORT

# TERMINAL TITLE {
        # If this is an xterm set the title to user@host:dir
        case "$TERM" in
        xterm*|rxvt*)
                        #TODO: add a last command here
            PS1="\[\e]0;${debian_chroot:+($debian_chroot)} \W : \w \a\]$PS1"
            ;;
        *)
            ;;
        esac
# }

# ALIASES {

        # some more ls aliases
        alias ll='ls -alF'
        alias la='ls -A'
        alias l='ls -CF'
        alias ZZ=exit
        alias zz=exit

        #http://www.drbunsen.org/vim-croquet/
        alias vim='vim -w ~/.vimlog "$@"'

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


# }

# FUNCTIONS {

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
        alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


# }



# HISTORY CONFIGURATION
##### OLD HISTORY CONFIGURATION 
# handle history file gracefully for multiple windows open
#http://en.flossmanuals.net/command-line/ch019_command-history/
#shopt -s histappend
##export PROMPT_COMMAND='history -a; history -n'      #was disabled in the old config
#export PROMPT_COMMAND='history -a'

# 'normal' history stuff
#HISTFILESIZE=10000000
#HISTSIZE=10000000
#HISTTIMEFORMAT="%F %T "
#HISTCONTROL=
#export HISTFILESIZE
#export HISTSIZE
#export HISTTIMEFORMAT
#export HISTCONTROL

#http://unix.stackexchange.com/questions/1288/preserve-bash-history-in-multiple-terminal-windows#3055135
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000000                   # big big history
export HISTFILESIZE=100000000               # big big history
export HISTTIMEFORMAT="%F %T " #MY ADDITION
shopt -s histappend                      # append to history, don't overwrite it

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

#______________________________END OF HISTORY CONFIGURATION


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#Disabling this makes execution of .bashrc blazing fast.
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

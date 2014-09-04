# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

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

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
#HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
#shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
#HISTSIZE=1000
#HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi



#export PATH=/home/mateusz/bin:$PATH
export LARCH_PATH=~/bin/splint-3.1.1/lib
export LCLIMPORTDIR=~/bin/splint-3.1.1/imports

#export PATH=$PATH:$HOME/bin/android/platform-tools:$HOME/bin/android/tools:$HOME/bin/android-ndk-r5c

export PATH="/media/Vista/install/octave/prefix/bin:/media/Vista/bin/bin:$HOME/bin:$PATH"
export LD_LIBRARY_PATH=/media/Vista/install/octave/prefix/lib/octave/3.8.0/:/media/Vista/bin/lib/gcc/i686-pc-linux-gnu/4.8.2/:/media/Vista/bin/lib:$LD_LIBRARY_PATH

export DERBY_INSTALL=/home/mateusz/Studia/IOR/lib/db-derby-10.10.1.1-bin
export DERBY_HOME=$DERBY_INSTALL


#______________________________COLOR SUPPORT

#Z http://fedoraproject.org/wiki/Features/256_Color_Terminals

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

#______________________________END OF COLOR SUPPORT

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

export LARCH_PATH=~/bin/splint-3.1.1/lib
export LCLIMPORTDIR=~/bin/splint-3.1.1/imports
export TCL_LIBRARY=/usr/share/tcltk/tcl8.5


alias ZZ=exit

#dodałem pon, 1 wrz 2014, 10:17:20 CEST
alias zz=exit

#http://www.drbunsen.org/vim-croquet/
alias vim='vim -w ~/.vimlog "$@"'



#______________________________HISTORY CONFIGURATION

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

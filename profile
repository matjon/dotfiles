# This file is based on some default config from Ubuntu 12.04
#
# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.


# see http://superuser.com/a/789499 and man bash for details about these config 
# files
        
               
# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

#if [[ $(tty | grep /dev/tty) ]]; then
#        exit;
#fi



# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
#if [ -d "$HOME/bin" ] ; then
#fi
PATH="/media/Vista/bin/bin:$HOME/bin:$PATH"
LD_LIBRARY_PATH=/media/Vista/bin/lib/gcc/i686-pc-linux-gnu/4.8.2/:/media/Vista/bin/lib

#Z http://fedoraproject.org/wiki/Features/256_Color_Terminals
# Enable 256 color capabilities for appropriate terminals

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
fi

unset local256

export LARCH_PATH=~/bin/splint-3.1.1/lib
export LCLIMPORTDIR=~/bin/splint-3.1.1/imports
export TCL_LIBRARY=/usr/share/tcltk/tcl8.5

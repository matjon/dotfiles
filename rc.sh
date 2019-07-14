#!/bin/bash

# This file should be added to the list of startup programs,
# for example in gnome-session-properties

my_set_mouse
my_save_smart

my_clear_flash

rfkill block bluetooth


my_date=$(date "+%Y-%m-%d_%H-%M-%S")
cp -a .bash_history .bash_history_$my_date

~/dotfiles/private/rc.sh

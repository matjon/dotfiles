My configuration files.

## To install:

        git clone https://github.com/matjon/dotfiles
        cd dotfiles
        cd vim
        mkdir bundle
        cd bundle
        git clone https://github.com/gmarik/Vundle.vim

        #we install Recover.vim manually to get last stable version
        git clone https://github.com/chrisbra/Recover.vim
        cd Recover.vim
        #checkout last "stable" version
        git checkout e8bfc9f1d627c44c9eabadf88ac528bd0140408b

        #optionally install LanguageTool:
        cd ../.. 
        #we are now in ./vim/
        wget https://languagetool.org/download/LanguageTool-2.8.zip
        unzip LanguageTool-2.8.zip
        rm LanguageTool-2.8.zip


Then:

- add relevant symlinks in the home dir,

- run vim,

- execute :PluginInstall,

- restart vim,
        
Optionally: install Gedit syntax highlighting files:

        mkdir -p ~/.local/share/gtksourceview-3.0/language-specs/
        ln -s ~/dotfiles/gedit_syntax/notatka.lang  ~/.local/share/gtksourceview-3.0/language-specs/notatka.lang

Then open `gedit`, go to Edit -> Preferences, tab "Fonts and colors" and add `gedit_syntax/my_classic.xml` as a custom color scheme.


File vim/spell/pl.utf-8.spl was generated from /usr/share/dict/polish - package
wpolish. For license see
`http://changelogs.ubuntu.com/changelogs/pool/main/i/ipolish/ipolish_20130519-1/copyright`

    :mkspell! vim/spell/pl.utf-8.spl /usr/share/dict/polish

Then add ~/dotfiles/rc.sh to the list of startup programs, for example in
gnome-session-properties.

## Details about config files

- `man bash`
- http://superuser.com/a/789499
- https://help.ubuntu.com/community/EnvironmentVariables - section "Persistent environment variables"

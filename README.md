To install:

        git clone
        cd vim
        mkdir bundle
        cd bundle
        git clone https://github.com/gmarik/Vundle.vim

        #install Recover.vim manually to get last stable version
        git clone https://github.com/chrisbra/Recover.vim
        cd Recover.vim
        #specify commit SHA1 of last "stable" version
        git checkout e8bfc9f1d627c44c9eabadf88ac528bd0140408b

        cd ../.. 
        #we are now in ./vim/
        wget https://languagetool.org/download/LanguageTool-2.8.zip
        unzip LanguageTool-2.8.zip
        rm LanguageTool-2.8.zip

Then:

- add relevant symlinks in the home dir,

- run vim,

- execute :PluginInstall,

- restart vim.
        


File vim/spell/pl.utf-8.spl was generated from /usr/share/dict/polish - package
wpolish. For license see
http://changelogs.ubuntu.com/changelogs/pool/main/i/ipolish/ipolish_20130519-1/copyright


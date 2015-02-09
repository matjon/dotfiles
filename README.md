To install:

        git clone
        git submodule init
        git submodule update
        cd vim
        wget https://languagetool.org/download/LanguageTool-2.8.zip
        unzip LanguageTool-2.8.zip
        rm LanguageTool-2.8.zip

        #install Recover.vim manually to get last stable version
        cd bundle
        git clone https://github.com/chrisbra/Recover.vim
        cd Recover.vim
        #specify commit SHA1 of last "stable" version
        git checkout e8bfc9f1d627c44c9eabadf88ac528bd0140408b

Then:

- add relevant symlinks to the home dir,

- run vim,

- execute :PluginInstall,

- restart vim.
        


File vim/spell/pl.utf-8.spl was generated from /usr/share/dict/polish - package
wpolish. For license see
http://changelogs.ubuntu.com/changelogs/pool/main/i/ipolish/ipolish_20130519-1/copyright


What is it?
-----------

My personal vim settings and bundles.

How do I use it?
----------------

    # Change to your home directory
    cd ~/

    # Clone my vim settings to a .vim directory
    git clone git@github.com:duckworth/vim-settings.git .vim

    # Link standard vim settings file to the one .vim directory
    ln -s .vim/vimrc ~/.vimrc
    ln -s .vim/gvimrc ~/.gvimrc

    # Fetch all bundles
    cd .vim
    ruby update_bundles.rb

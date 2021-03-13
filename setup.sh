#!/bin/bash

# Instructions
# ============
# Install Vim 8+ and Python 3 manually if the script does not work.
# Delete existing dotfiles (e.g., ~/.vimrc, ~/.vim, ~/.tmux.conf).

# require vim 8+ and python 3
if [ -n "$(command -v apt-get)" ]; then
    sudo add-apt-repository ppa:jonathonf/vim
    sudo apt update 
    sudo apt install vim
    sudo apt install python3.6
fi

# download vim-plug
curl -fLo ./vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# setup symlinks
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
ln -s $DIR/vim ~/.vim
ln -s $DIR/vimrc ~/.vimrc
ln -s $DIR/tmux.conf ~/.tmux.conf

# download vim plugins
vim +PlugInstall +PlugClean! +qall



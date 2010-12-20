#!/bin/bash -x

# Script to autoinstall and configure settings for vim, bash etc.

if [ -d "$HOME/.vim" ] ; then
    echo "Removing .vim"
    rm -rf $HOME/.vim
    echo "Replacing .vim/"
    ln -s $HOME/dotfiles/vim $HOME/.vim
fi

if [ -f "$HOME/.vimrc" ] ; then
    echo "Removing .vimrc"
    rm -rf $HOME/.vimrc
    echo "Replacing .vimrc"
    ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc
fi

if [ -f "$HOME/.tmux.conf" ] ; then
    echo "Removing .tmux.conf"
    rm -rf $HOME/.tmux.conf
    echo "Replacing .tmux.conf"
    ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
fi

git submodule init
git submodule update

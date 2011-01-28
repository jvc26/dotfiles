#!/bin/bash

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

if [ -f "$HOME/.muttrc" ] ;  then
    echo "Removing .muttrc"
    rm -rf $HOME/.muttrc
    echo "Replacing .muttrc"
    ln -s $HOME/dotfiles/.muttrc $HOME/.muttrc
fi

if [ -f "$HOME/.bashrc" ] ; then
    echo "Removing .bashrc"
    rm -rf $HOME/.bashrc
    echo "Replacing .bashrc"
    ln -s $HOME/dotfiles/.bashrc $HOME/.bashrc
fi

git submodule init
git submodule update

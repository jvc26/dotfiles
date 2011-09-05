#!/bin/bash

# Script to autoinstall and configure settings for vim, bash etc.

if [ -d "$HOME/.vim" ] 
then
    echo "Replacing .vim/"
    rm -rf $HOME/.vim
    ln -s $HOME/dotfiles/vim $HOME/.vim
else
    echo "Inserting .vim/"
    ln -s $HOME/dotfiles/vim $HOME/.vim
fi

if [ -f "$HOME/.vimrc" ]
then
    echo "Replacing .vimrc"
    rm -rf $HOME/.vimrc
    ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc
else
    echo "Inserting .vimrc"
    ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc
fi

if [ -f "$HOME/.tmux.conf" ]
then
    echo "Replacing .tmux.conf"
    rm -rf $HOME/.tmux.conf
    ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
else
    echo "Inserting .tmux.conf"
    ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
fi

if [ -f "$HOME/.bashrc" ]
then
    echo "Replacing .bashrc"
    rm -rf $HOME/.bashrc
    ln -s $HOME/dotfiles/.bashrc $HOME/.bashrc
else
    echo "Inserting .bashrc"
    ln -s $HOME/dotfiles/.bashrc $HOME/.bashrc
fi

git submodule init
git submodule update

# Link desert256 theme into the correct place
if [ -f "$HOME/.vim/colors/desert256.vim" ]
then
    echo "Linking desert256 theme"
    ln -s $HOME/.vim/colors/desert256/colors/desert256.vim $HOME/.vim/colors/desert256.vim
else
    echo "Installing desert256 theme"
    ln -s $HOME/.vim/colors/desert256/colors/desert256.vim $HOME/.vim/colors/desert256.vim
fi

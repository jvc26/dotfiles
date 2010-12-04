#!/bin/bash -x

# Script to autoinstall and configure settings for vim, bash etc.

if [ -d "$HOME/.vim" ] ; then
    echo "Replacing .vim"
    rm -rf $HOME/.vim
fi

if [ -h "$HOME/.vimrc" ] ; then
    echo "Replacing .vimrc"
    rm -rf $HOME/.vimrc
fi

git clone git://github.com/jvc26/dotfiles.git

cd $HOME/dotfiles
git submodule init
git submodule update

cd $HOME
ln -s "$HOME/dotfiles/.vimrc" $HOME/.vimrc
ln -s "$HOME/dotfiles/vim" $HOME/.vim
#ln -s "dotfiles/.bashrc" .bashrc
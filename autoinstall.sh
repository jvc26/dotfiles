#!/bin/bash

# Script to autoinstall and configure settings for vim, bash etc.

submods(){
    git submodule add https://github.com/vim-scripts/LaTeX-Suite-aka-Vim-LaTeX.git vim/bundle/vim-latex
    git submodule add https://github.com/kchmck/vim-coffee-script.git vim/bundle/vim-coffee-script
    git submodule add https://github.com/tpope/vim-fugitive.git vim/bundle/vim-fugitive
    git submodule add https://github.com/tpope/vim-pathogen.git vim/external/vim-pathogen
    git submodule add https://github.com/hallison/vim-markdown.git vim/bundle/vim-markdown
    git submodule add https://jvc26@github.com/jvc26/vim-puppet.git vim/bundle/vim-puppet
    git submodule add https://github.com/gregsexton/MatchTag.git vim/bundle/vim-matchtag
    git submodule init
    git submodule update
}

while getopts ':p' opt; do
    case $opt in
        p)
            git submodule add git@bitbucket.org:jvc26/dofiles-private.git private
            submods
            if [ -d "$HOME/dotfiles/private" ]
                then
                    sh $HOME/dotfiles/private/setup.sh
            fi
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            ;;
    esac
done

if [ ! -d "$HOME/dotfiles/private" ]
then
    submods
fi

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

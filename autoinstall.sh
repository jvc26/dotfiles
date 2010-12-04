#!/bin/bash

# Script to autoinstall and configure settings for vim, bash etc.

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

git clone git://github.com/jvc26/dotfiles.git

cd dotfiles

git submodule init
git submodule update

cd ~
ln -s "dotfiles/.vimrc" .vimrc
#ln -s "dotfiles/.bashrc" .bashrc

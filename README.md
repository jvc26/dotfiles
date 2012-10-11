# jvc26's dotfiles

This contains my default dotfiles.

## Installation

Installation of all symlinked files (with .symlink suffix) is handled via 
the rakefile script from [Holman's repository](https://github.com/holman/dotfiles/blob/master/Rakefile).

Files are added to their respective subdirs and then installed using :

    rake install

## Vim Plugins

These are managed using vundle. Vundle docs can be found [here](https://github.com/gmarik/vundle). Essentially vim plugins are added to the
.vimrc and then installed using :BundleInstall. The Rake install script will run BundleInstall as part of its first run process.

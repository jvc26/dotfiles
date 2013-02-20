# jvc26's dotfiles

This contains my default dotfiles.

## Installation

Installation links all files with a .symlink suffix to their appropriate locations under `$HOME` via the installation script from [@Holman](https://github.com/holman/dotfiles/blob/master/script/bootstrap).

    $ scripts/bootstrap

This is a major improvement since the prior iteration which required ruby (which I never used aside from installation). It also now includes virtualenv base configs, and some tweaks to ZSH aliases which I use regularly.

## Vim Plugins

These are managed using vundle. Vundle docs can be found [here](https://github.com/gmarik/vundle). Essentially vim plugins are added to the
.vimrc and then installed using :BundleInstall. The Rake install script will run BundleInstall as part of its first run process.

## Acknowledgements

Thanks to [@Holman](https://github.com/holman/) for his [dotfiles](https://github.com/holman/dotfiles) repository which has offered two rounds of upgrades to the installation script. Also a note to [@gmarik](https://github.com/gmarik/vundle) for the great [vundle](https://github.com/gmarik/vundle).

## License

Licensed under the MIT License.

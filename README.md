jvc26's dotfiles
================
This contains the dotfiles which I use on a regular basis, as well
as a few other bits and pieces such as my notes LaTeX stylefile.

Additional plugins (such as those for vim in the .vim directory are
git submodules, and so a --recursive call to git clone must be made

    git clone --recursive git://github.com/jvc26/dotfiles.git

Submodules
==========
Submodules can be added via:

    git submodule add <url> <path>

Which will checkout the latest version, and update the .gitmodules 
file with the correct path from which to find the repository.
Updates can then be committed to the repository via

    git commit

Vim plugins at present have been taken from the following on github:

* https://github.com/vim-scripts
* https://github.com/tpope
* https://github.com/kchmck
* https://github.com/altercation
* https://github.com/hallison
* https://github.com/gregsexton
* https://github.com/Lokaltog
* https://github.com/jvc26

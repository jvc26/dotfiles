## Shell
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

alias ls='ls --color --hide="*.pyc"'
alias ll='ls -l --color --hide="*.pyc"'
alias la='ls -lAFh --color --hide="*.pyc"'

## Tail/Head etc.
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g M="| most"

## Safety interaction
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

## Rapid access to zsh
alias zshrc='vim ~/.zshrc'

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

## Grep
alias grep='grep --color'

## Git (Via [@holman](https://github.com/holman/dotfiles/blob/master/git/aliases.zsh))
alias gd='git diff'
alias gp='git push origin HEAD'alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gb='git branch'
alias gbd='git branch -D'
alias gs='git status -sb'
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"

## Rapid access to zshrc
alias zshrc='vim ~/.zshrc'
alias reload!='. ~/.zshrc'

# Historical options
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS


# Colours and Prompt config
autoload -Uz compinit
autoload -U colors
compinit
colors

setopt prompt_subst

# Version control stuff
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git hg svn
zstyle ':vcs_info:*' stagedstr "%F{yellow}+%f"
zstyle ':vcs_info:*' unstagedstr "%F{blue}+%f"
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        hook_com[staged]+="%F{white}+%f"
    fi
}

precmd () {
    # Load style info for vcs_info_msg
    zstyle ':vcs_info:*' formats "(%s) %F{cyan}[%f%F{yellow}%b%f%c%u%F{cyan}]%f"
    vcs_info
}

# Terminal warnings
warn () {
    printf "\r\033[2K  [\033[0;33mWARN\033[0m] $1\n"
}

success () {
    printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

usercolor=blue

case $USER in 
    *-adm) usercolor=red
esac

hostcolor=blue

PS1='
%* $[HISTCMD-1] [$?] ${vcs_info_msg_0_} %{$reset_color%}%~
%{$fg[$usercolor]%}%n%{$reset_color%}@%{$fg[$hostcolor]%}%m%{$reset_color%}%# '

PS2='%* [$?] %{$fg[magenta]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%}:%~%#_ '

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

# Inherited via @holman: https://github.com/holman/dotfiles/blob/master/git/aliases.zsh 
alias gl='git pull --prune'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gp='git push origin HEAD'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gcb='git copy-branch-name'
alias gb='git branch'
alias gs='git status -sb'

# Load local settings from ~/.localrc
if [[ -a ~/.localrc ]]
then
  source ~/.localrc
fi

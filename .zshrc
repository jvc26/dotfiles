# Historical options
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt share_history


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

    # If we are within a VCS dir, load the two-line prompt
    if [[ ${vcs_info_msg_0_} != '' ]]; then
        PS1="
%* [$?] ${vcs_info_msg_0_} %{$reset_color%}%~
%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[$hostcolor]%}%m%{$reset_color%}%# "
    else 
        PS1="%* [$?] %{$fg[magenta]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%}:%~%# "
    fi

}

hostcolor=yellow

# If there are local host-based colour changes to make
[[ -f $HOME/.zshrc.local ]] && source $HOME/.zshrc.local 

PS2='%* [$?] %{$fg[magenta]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%}:%~%#_ '

# Aliases
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -la --color=auto'

alias gist='git status'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias pcregrep='pcregrep --color=auto'
alias zgrep='zgrep --color=auto'

alias tmux='TERM=screen-256color-bce tmux'

# Suffix aliases
alias -s tex=vim
alias -s php=vim
alias -s py=vim
alias -s md=vim
alias -s txt=vim
alias -s pp=vim

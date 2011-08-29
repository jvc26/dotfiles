# jvc26 .bashrc 2010
# Thanks to mas90 for some of the bash prompt skills

export PATH="/var/lib/gems/1.8/bin:~/bin:/sbin:/usr/sbin:/usr/local/sbin:$PATH"
[ -x /usr/bin/vim ] && export EDITOR=/usr/bin/vim
export FQDN="`hostname -f 2>/dev/null || hostname`"
export IP="`hostname -i 2>/dev/null`"

# if not running interactively, don't do anything else
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
HISTCONTROL=ignoredups

# enlarge the history a bit
HISTSIZE=5000
HISTFILESIZE=5000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# report job status changes immediately
set -b

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

HOSTCOLOUR=30 #black
USERCOLOUR=30 #black
ATCOLOUR=34 #blue

case $FQDN in
    *.cambridgemedicine.org) HOSTCOLOR=1;34;;
esac

function findupwards() {
	readlink -f . &>/dev/null || return 1
	d=$(readlink -f .)
	while [ "$d" != "/" ]
	do
		if [ -e "$d/$1" ]
		then
			echo "$d/$1"
			return 0
		fi
		d=$(readlink -f "$d/..")
	done
	if [ -e "/$1" ]
	then
		echo "/$1"
		return 0
	fi
	return 1
}

function findvcs() {
	if [ "$PWD" != "$HOME" -a -d CVS ]
	then
		echo -n "(cvs)"
	fi
	if [ -d .svn ]
	then
		echo -n "(svn)"
	fi
	if findupwards .bzr >/dev/null
	then
		echo -n "(bzr)"
	fi
	if findupwards .git >/dev/null
	then
		echo -n "(git)"
	fi
}

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

# allow local overrides (including user/host colour changes)
if [ -f ~/.bashrc.local ]; then
	. ~/.bashrc.local
fi

# overly fancy prompt :)
PS1="${debian_chroot:+($debian_chroot)}"'$(c=$? ; if [ $c -ne 0 ] ; then echo -ne "\[\033[0;1;31m\]"; if [ $c -gt 128 -a $c -le 192 ] ; then echo -n "$( kill -l $(($c - 128)) ) " ; else echo -n "$c " ; fi ; fi)\[\033[0;36m\]\t $(jobs=$(jobs 2>/dev/null | sed "s/^.*\\[\\([0-9]\\+\\)\\][^A-Z]*\\([A-Z]\\).*/\\1\\l\\2/" ) ; [ "$jobs" != "" ] && echo -ne "\[\033[1;33m\]["$jobs"] ")\[\033[0;36m\]!\! \[\033[1;'$USERCOLOUR'm\]\u\[\033[1;'$ATCOLOUR'm\]@\[\033[1;'$HOSTCOLOUR'm\]\h\[\033[0m\]:\[\033[1;34m\]\w\[\033[0;1m\]$(findvcs)\[\033['$DOLLARCOLOUR'm\]\$\[\033[0m\] '

# if possible, set the terminal's title
case $TERM in
	xterm*|rxvt*|Eterm|eterm)
		PS1='\[\033]0;\u@\h:\w\007\]'"$PS1"
		;;
	screen)
		PS1='\[\033_\u@\h:\w\033\\\]'"$PS1"
		;;
esac

# enable color support of ls and grep
if [ "$TERM" != "dumb" ]; then
	eval "`dircolors -b &>/dev/null`"
	alias ls='ls --color=auto'
	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
	alias pcregrep='pcregrep --color=auto'
	alias zgrep='zgrep --color=auto'
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -la'
alias tatch='tmux attach-session -t jvc26'

# enable programmable completion features (unless they're there already)
if [ ! "$BASH_COMPLETION" -a -f /etc/bash_completion ]; then
	[ "$TERM" != "dumb" ] && echo -ne "[___]\r"
	. /etc/bash_completion
	[ "$TERM" != "dumb" ] && echo -ne "\r     \r"
fi

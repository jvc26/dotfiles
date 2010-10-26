# jvc26's Bashrc

# Thanks to mas90 for the clever additions to the prompt and screen title setting.

[ -x /usr/bin/vim ] && export EDITOR=/usr/bin/vim
export HOSTNAME="${HOSTNAME%%.*}"
export FQDN="`hostname -f 2>/dev/null || hostname`"
export IP="`hostname -i 2>/dev/null`"

# if not running interactively, don't do anything else
[ -z "$PS1" ] && return

# TERM is sometimes set suboptimally for various bad reasons
case "$TERM" in
	xterm) NEWTERM=putty-256color ;; 
	screen*) NEWTERM=screen-256color-bce ;;
	*256color*) NEWTERM="$TERM" ;;
	*) NEWTERM="$TERM-256color" ;;
esac

if [ "$(which infocmp 2>/dev/null)" ]
then
	# keep chopping off components of NEWTERM until we find something valid
	if ! infocmp "$NEWTERM" &>/dev/null
	then
		NEWTERM="${NEWTERM/-256color/}"
	fi
	while [ "$NEWTERM" != "${NEWTERM%-*}" ] && ! infocmp "$NEWTERM" &>/dev/null
	do
		NEWTERM="${NEWTERM%-*}"
	done
	if ! infocmp "$NEWTERM" &>/dev/null
	then
		if ! infocmp "$TERM" &>/dev/null
		then
			echo "[$TERM (invalid!)]"
		else
			echo "[$TERM :-(]"
		fi
	else
		export TERM="$NEWTERM"
		echo "[$TERM]"
	fi
else
	echo "[$TERM (no infocmp)]"
fi

unset NEWTERM

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

# Note these colours can be reset on a user-by-user basis/host basis

HOSTCOLOUR=37 # white
USERCOLOUR=37 # white
ATCOLOUR=33 # yellow

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

# overly fancy prompt :)
PS1="${debian_chroot:+($debian_chroot)}"'$(c=$? ; if [ $c -ne 0 ] ; then echo -ne "\[\033[0;1;31m\]"; if [ $c -gt 128 -a $c -le 192 ] ; then echo -n "$( kill -l $(($c - 128)) ) " ; else echo -n "$c " ; fi ; fi)\[\033[0;36m\]\t $(jobs=$(jobs 2>/dev/null | sed "s/^.*\\[\\([0-9]\\+\\)\\][^A-Z]*\\([A-Z]\\).*/\\1\\l\\2/" ) ; [ "$jobs" != "" ] && echo -ne "\[\033[1;33m\]["$jobs"] ")\[\033[0;36m\]!\! \[\033[1;'$USERCOLOUR'm\]\u\[\033[1;'$ATCOLOUR'm\]@\[\033[1;'$HOSTCOLOUR'm\]\h\[\033[0m\]:\[\033[1;34m\]\w\[\033[0;1m\]\[\033['$DOLLARCOLOUR'm\]\$\[\033[0m\] '

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

# enable programmable completion features (unless they're there already)
if [ ! "$BASH_COMPLETION" -a -f /etc/bash_completion ]; then
	[ "$TERM" != "dumb" ] && echo -ne "[___]\r"
	. /etc/bash_completion
	[ "$TERM" != "dumb" ] && echo -ne "\r     \r"
fi

# get keychain to import SSH keys if they and it exist
if [ "$(which keychain 2>/dev/null)" ]
then
	if [ '(' -f ~/.ssh/id_rsa -o -f ~/.ssh/id_dsa ')' -a "$(which ssh-add 2>/dev/null)" -a "$(which ssh-agent 2>/dev/null)" ]
	then
		# ssh-add -l returns 1 if there's no keys, or 2 if there's no agent
		ssh-add -l &>/dev/null || eval $(keychain --quiet --nogui --ignore-missing --eval --agents ssh ~/.ssh/id_rsa ~/.ssh/id_dsa)
	fi
	if [ ! "$GPG_AGENT_INFO" -a -f ~/.gnupg/secring.gpg -a "$(which gpg-agent 2>/dev/null)" ]
	then
		eval $(keychain --quiet --nogui --ignore-missing --eval --agents gpg --timeout 60)
	fi
fi

# set screen title on a per-user/host basis
if [ "${TERM:0:6}" = "screen" ]
then
	case "$USER" in
		*)
			echo -ne '\ek'"$USER@$HOSTNAME"'\e\\' ;;
	esac
fi

# allow local overrides
if [ -f ~/.bashrc.local ]; then
	. ~/.bashrc.local
fi


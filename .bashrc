#!/bin/bash

case $- in
    *i*) ;;
      *) return;;
esac

if [ -f ~/.bash/exports ]; then
    . ~/.bash/exports
fi

set -o vi
bind 'set bell-style none'

HISTCONTROL=ignoreboth # ignore duplicate lines and lines starting with space in history
HISTTIMEFORMAT="%Y-%m-%d %T "
HISTIGNORE="&:cle*:celar*"
HISTSIZE=1000
HISTFILESIZE=2000
PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"

shopt -s autocd
shopt -s histappend # append to the history file, don't overwrite it
shopt -s checkwinsize # check the window size after each command and, if necessary,
shopt -s globstar # setting pattern "**" to match files and directories in pathname

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)" # make less more friendly for non-text input files, see lesspipe(1)

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then # set variable identifying the chroot you work in (used in the prompt below)
    debian_chroot=$(cat /etc/debian_chroot)
fi

case "$TERM" in # set a fancy prompt (non-color, unless we know we "want" color)
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# add git branch if it is present to PS1

parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

if [ "$color_prompt" = yes ]; then
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[3;38;2;150;120;200m\]\u\[\033[00m\]\[\033[3;01m\]⚡ \[\033[00m\]\[\033[3;38;2;150;120;200m\]\h \[\033[00m\]\[\033[3;02m\]\w \[\033[00m\]\[\033[3;38;2;130;120;150m\]$(parse_git_branch)\[\033[00m\]\[\033[38;2;150;120;200m\]\n> \[\033[00m\]'
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[3;38;2;150;120;200m\]\u\[\033[00m\]\[\033[2;01m\]⚛  \[\033[00m\]\[\033[3;38;2;150;120;200m\]\h \[\033[00m\]\[\033[3;02m\]\w \[\033[00m\]\[\033[3;38;2;130;120;150m\]$(parse_git_branch)\[\033[00m\]\[\033[38;2;150;120;200m\]\n> \[\033[00m\]'
    PS1='${debian_chroot:+($debian_chroot)}\[\033[3;38;2;150;120;200m\]\u@\[\033[00m\]\[\033[2;01m\]\[\033[00m\]\[\033[3;38;2;150;120;200m\]\h \[\033[00m\]\[\033[3;02m\]\w \[\033[00m\]\[\033[3;38;2;130;120;150m\]$(parse_git_branch)\[\033[00m\]\[\033[38;2;150;120;200m\]\n> \[\033[00m\]'
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[2;01m\]⚛️ \[\033[00m\]\[\033[3;38;2;150;120;200m\]\u\[\033[00m\]\[\033[2;01m\]➰ \[\033[00m\]\[\033[3;38;2;150;120;200m\]\h \[\033[00m\]\[\033[3;02m\]\w \[\033[00m\]\[\033[3;38;2;130;120;150m\]$(parse_git_branch)\[\033[00m\]\[\033[38;2;150;120;200m\]\n> \[\033[00m\]'
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[2;01m\]⚛️ \[\033[00m\]\[\033[3;38;2;150;120;200m\]\u\[\033[00m\]\[\033[2;01m\]➰ \[\033[00m\]\[\033[3;02m\]\w \[\033[00m\]\[\033[3;38;2;130;120;150m\]$(parse_git_branch)\[\033[00m\]\[\033[38;2;150;120;200m\]\n> \[\033[00m\]'
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[2;01m\]⚛️ \[\033[00m\]\[\033[3;38;2;150;120;200m\]\u \[\033[00m\]\[\033[3;02m\]\w \[\033[00m\]\[\033[3;38;2;130;120;150m\]$(parse_git_branch)\[\033[00m\]\[\033[38;2;150;120;200m\]\n> \[\033[00m\]'
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\n\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    LS_COLORS=$LS_COLORS:'tw=00;33:ow=01;33:'; export LS_COLORS
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
if [ -f ~/.bash/aliases ]; then
    . ~/.bash/aliases
fi

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#command
[[ -n "$TMUX" ]] || tmux-auto

# activate vi mode

#set -o vi

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
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


# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

export JAVA_HOME="/usr/"
export PATH="$HOME/scripts:$HOME/scripts/i3:$HOME/.screenlayout:$PATH:$HOME/Applications:$HOME/.local/share/kservices5/ServiceMenus:$HOME/.cargo/bin"
export XDG_CURRENT_DESKTOP=KDE
export EDITOR="vim"

export CM_SELECTIONS="clipboard"
export CM_MAX_CLIPS=100
export CM_HISTLENGTH=10

# run and set ssh-agent

eval $(ssh-agent -s) > /dev/null
ssh-add ~/.ssh/id_rsa > /dev/null

# change command prompt dispay

export PROMPT_DIRTRIM=1

# show git branch name in command prompt
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\] \[\033[33;1m\]\w\[\033[m\] (\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)) \$ "

#Fuzzy finder
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#Auto jump
 . /usr/share/autojump/autojump.sh


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# source functions
if [ -f ~/.shell_functions.sh ]; then
    source ~/.shell_functions.sh
else
    print "404: ~/.shell_functions.sh not found."
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/frezer02/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/frezer02/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/frezer02/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/frezer02/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

neofetch
alias df-git='/usr/bin/git --git-dir=/home/frezer02/.cfg/ --work-tree=/home/frezer02'
alias df-git='/usr/bin/git --git-dir=/home/frezer02/.cfg/ --work-tree=/home/frezer02'
alias df-git='/usr/bin/git --git-dir=/home/frezer02/.cfg/ --work-tree=/home/frezer02'

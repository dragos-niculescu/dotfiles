# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
complete -cf sudo

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
#if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
#    debian_chroot=$(cat /etc/debian_chroot)
#fi

# set a fancy prompt (non-color, unless we know we "want" color)
#case "$TERM" in
#    xterm-color) color_prompt=yes;;
#    xterm-256color) color_prompt=yes;;
#esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

#if [ -n "$force_color_prompt" ]; then
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    #    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1='\[\e]0;@\h:\w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\w\$\[\033[00m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi



# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff='diff --color=auto'
#    alias less='vi -R -'
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -Al'
alias lt='ls -ltr'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

export HISTTIMEFORMAT="%F %T "
export HISTLASTCMD=''
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ; }"'CMD="$$ $USER $(history 1)";\
if [ "a${CMD}b" != "a${HISTLASTCMD}b" ];\
then \
 echo $CMD >> ~/.bash_eternal_history;\
 if [ "x${TMUX_PANE}x" != "xx" ]; then\
 tmux rename-window -t${TMUX_PANE} $(echo $CMD| cut -d \  -f 6); \
 fi;\
fi; \
export HISTLASTCMD=$CMD;'


incr () 
{ 
    if [ $# -lt 2 ]; then 
        eval "$1=\$((\$$1+1))"; 
    else 
        eval "$1=\$((\$$1+$2))"; 
    fi 
}


pwait() {
    if [ "$#" -eq 0 ]; then
        MAXPROC=4
    else
        MAXPROC=$1
    fi
    
    while [ $(jobs -p | wc -l) -ge $MAXPROC ]; do
        sleep 1
    done
}

which xsel > /dev/null  && alias pbcopy='xsel --clipboard --input' && alias pbpaste='xsel --clipboard --output'

export PATH=$PATH:~/bin:/opt/Android/sdk/platform-tools:/opt/bin


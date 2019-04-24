
EMACS=$(which emacs)
VIM=$(which vim)
VI=$(which vi)
if [ -e $EMACS ]; then
   export EDITOR="$EMACS -nw"
   export VISUAL="$EMACS -nw"	
elif [ -e ${VIM} ]; then
    export EDITOR=${VIM}
    export VISUAL=${VIM}
elif [ -e ${VI} ]; then 
    export EDITOR=${VI}
    export VISUAL=${VI}
fi

export IGNOREEOF=0

# Save path so, if we re-run ourselves, the path doesn't get needlessly long

if [ "${SAVED_PATH:-==Unset==}" = "==Unset==" ]; then
    export SAVED_PATH="${PATH}"
else
    export PATH="${SAVED_PATH}"
fi

# Some systems have less, some don't - if we don't, just use more

if ( type less > /dev/null 2>&1 ); then
    export LESS="-ImRs"
    export PAGER="less"
else
    alias less="more"
    export MORE="-is"
fi

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

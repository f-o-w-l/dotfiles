# bind 'set completion-ignore-case On'
# bind 'set expand-tilde on'
# bind 'set convert-meta off'
# bind 'set input-meta on'
# bind 'set output-meta on'
# bind 'set show-all-if-ambiguous on'
# bind 'set colored-stats on'
# bind 'set visible-stats on'

# bind TAB:menu-complete

if [ -s ~/.aliases -a -r ~/.aliases ]; then
    source ~/.aliases
fi

if [ -s /.prod.aliases -a -r ~/.prod.aliases ]; then
    source ~/.prod.aliases
fi

if [ $(uname -s) = "Darwin" ]; then
    # export EDITOR="codium"
    export EDITOR="nano"
else
    export EDITOR="code"
fi

export LS_COLORS="di=1;34:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90"
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h\[\033[m\]\$"
export CLICOLOR=1

export PKG_CONFIG_PATH="/usr/local/opt/curl/lib/pkgconfig"

export PATH=$PATH:/opt/arcanist/bin

export PATH=$PATH:/home/fowl/.yarn/bin:/home/fowl/.config/yarn/global/node_modules/.bin

export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin

export FLYCTL_INSTALL="/home/fowl/.fly"
export PATH=$PATH:$FLYCTL_INSTALL/bin

[ -s "/home/fowl/.jabba/jabba.sh" ] && source "/home/fowl/.jabba/jabba.sh"

zsh

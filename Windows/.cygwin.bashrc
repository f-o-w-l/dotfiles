bind 'set completion-ignore-case On'
bind 'set expand-tilde on'
bind 'set convert-meta off'
bind 'set input-meta on'
bind 'set output-meta on'
bind 'set show-all-if-ambiguous on'
bind 'set colored-stats on'
bind 'set visible-stats on'

bind TAB:menu-complete

export LS_COLORS="di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90"
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h\[\033[m\]\$"
export CLICOLOR=1

export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/opt/openssl/bin:/usr/X11/bin:/anaconda3/bin:$PATH
export EDITOR="code"

if [ -s ~/.aliases -a -r ~/.aliases ]; then
	source ~/.aliases
fi

cd /cygdrive/c/Users/$USER/Dropbox/
cl
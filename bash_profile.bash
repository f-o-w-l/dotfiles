bind 'set completion-ignore-case On'
bind 'set expand-tilde on'
bind 'set convert-meta off'
bind 'set input-meta on'
bind 'set output-meta on'
bind 'set show-all-if-ambiguous on'
bind 'set colored-stats on'
bind 'set visible-stats on'

bind TAB:menu-complete

if [ -s ~/.aliases -a -r ~/.aliases ]; then
	source ~/.aliases
fi

export EDITOR="subl -w"
export LS_COLORS="di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90"
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h\[\033[m\]\$"
export CLICOLOR=1

export HOMEBREW_GITHUB_API_TOKEN=747ab0a0e146f948d84cc151cffcc51ed904e02d
export JAVA_HOME="/Applications/Android Studio.app/Contents/jre/jdk/Contents/Home"
SSHUSER="olfowler"
export PKG_CONFIG_PATH="/usr/local/opt/curl/lib/pkgconfig"

export PATH=/usr/local/opt/curl/bin
export PATH=$PATH:/usr/local/bin/arcanist/bin
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export PATH=$PATH:/usr/local/opt/openssl/bin
export PATH=$PATH:$HOME/anaconda3/bin

export ANDROID_HOME=/Volumes/Samsung_T5/Android/sdk
export ANDROID_SDK_ROOT=/Volumes/Samsung_T5/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin

export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin
export PATH=$PATH:/usr/X11/bin

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/most_fowl/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/most_fowl/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/most_fowl/anaconda3/etc/profile.d/conda.sh"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

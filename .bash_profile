if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

if command -v zsh >/dev/null 2>&1; then
    exec zsh
fi

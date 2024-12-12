if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# SSH agent initialization for interactive shells only
if [ -n "$PS1" ]; then
    export SSHUSER="luke@kinetic.auto"
    SSH_ENV="$HOME/.ssh/agent-environment"

    function start_agent {
        echo "Initializing new SSH agent..."
        /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
        chmod 600 "${SSH_ENV}"
        . "${SSH_ENV}" > /dev/null
        /usr/bin/ssh-add < /dev/null
        echo "SSH agent initialized"
    }

    if [ -f "${SSH_ENV}" ]; then
        . "${SSH_ENV}" > /dev/null
        # ps ${SSH_AGENT_PID} doesn't work under cywgin
        ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
            start_agent
        }
    else
        start_agent
    fi
fi

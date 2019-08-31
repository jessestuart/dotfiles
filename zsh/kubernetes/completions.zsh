#!/usr/bin/env zsh
if (hash helm &>/dev/null); then source <(helm completion zsh); fi

# if (hash kubectl &>/dev/null); then
#   source <(kubectl completion zsh)
# fi
if (( $+commands[kubectl] )); then
    __KUBECTL_COMPLETION_FILE="${ZSH_CACHE_DIR}/kubectl_completion"

    if [[ ! -f $__KUBECTL_COMPLETION_FILE ]]; then
        kubectl completion zsh >! $__KUBECTL_COMPLETION_FILE
    fi

    [[ -f $__KUBECTL_COMPLETION_FILE ]] && source $__KUBECTL_COMPLETION_FILE

    unset __KUBECTL_COMPLETION_FILE
fi

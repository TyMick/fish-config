function git_default_branch
    command git rev-parse --git-dir &>/dev/null || return
    set -l remote_default (string match -r '[^ ]+$' (git branch -rl '*/HEAD')) || return
    string match -r "^[\s\*]*\K[^\s]*(?=.*$remote_default)" (git branch -vv)
end

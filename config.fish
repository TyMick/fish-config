if status is-interactive
    # Commands to run in interactive sessions can go here
end

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# Use node version in .nvmrc if present in directory hierarchy
nvm use &>/dev/null || true

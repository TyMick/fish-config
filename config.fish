if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -l os (uname)
if string match -q 'CYGWIN*' -- $os
    or string match -eiq Msys -- $os
    or string match -eiq mingw -- $os
    fish_add_path --append --path /c/Users/ty.mick/scoop/apps/nodejs-lts/current \
        /c/Users/ty.mick/scoop/apps/yarn/current/bin
end

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

abbr -a firefox /Applications/Firefox.app/Contents/MacOS/firefox

abbr -a gcaa 'git add --all && git commit -v'
abbr -a gcaa! 'git add --all && git commit -v --amend'
abbr -a gcaam 'git add --all && git commit -m'
abbr -a gcaam! 'git add --all && git commit --amend -m'
abbr -a gcaan! 'git add --all && git commit -v --no-edit --amend'
abbr -a gcaans! 'git add --all && git commit -v -s --no-edit --amend'
abbr -a gcmsg! git commit --amend -m
abbr -a gstaa git stash --all --include-untracked

# double-stash
abbr -a gdsta 'git stash push --keep-index && git stash push'
abbr -a gdstu 'git stash --all --include-untracked --keep-index && git stash --all --include-untracked'

# TODO: Find a way to run zmv from fish
# abbr -a mmv noglob zmv -W

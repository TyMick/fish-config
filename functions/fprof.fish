# Firefox user.js profile switch
function fprof
    osascript -e 'quit app "Firefox"'
    cd ~/code/TyMick/user.js
    git checkout $argv[1]
    cd -
    osascript -e 'tell application "Firefox" to activate'
end

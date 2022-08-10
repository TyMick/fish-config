# Switch Firefox user.js profiles
function fprof
    osascript -e 'quit app "Firefox"'
    cd $firefox_userjs_dir
    git checkout $argv[1]
    cd -
    osascript -e 'tell application "Firefox" to activate'
end

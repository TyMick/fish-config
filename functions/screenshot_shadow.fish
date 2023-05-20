function screenshot_shadow
    if test (uname) = Darwin
        echo 'This function is only available on macOS' >&2
        return 1
    end

    argparse --min-args 1 --max-args 1 -- $argv
    or return

    if test $argv = 'on'
        cmd.exe /c 'defaults write com.apple.screencapture disable-shadow -bool false && killall SystemUIServer'
        return
    end

    if test $argv = 'off'
        cmd.exe /c 'defaults write com.apple.screencapture disable-shadow -bool true && killall SystemUIServer'
        return
    end

    false
end

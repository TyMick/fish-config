function git --wraps git
    if in_windows_directory
        git.exe $argv
    else
        command git $argv
    end
end

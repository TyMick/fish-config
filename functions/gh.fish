function gh --wraps gh
    if in_windows_directory
        gh.exe $argv
    else
        command gh $argv
    end
end

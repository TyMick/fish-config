function yarn --wraps yarn
    if in_windows_directory
        powershell.exe -Command "yarn $argv"
    else
        command yarn $argv
    end
end

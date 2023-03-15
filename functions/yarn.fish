function yarn --wraps yarn
    if in_windows_directory
        yarn.cmd $argv
    else
        command yarn $argv
    end
end

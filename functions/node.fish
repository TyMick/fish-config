function node --wraps node
    if in_windows_directory
        node.exe $argv
    else
        command node $argv
    end
end

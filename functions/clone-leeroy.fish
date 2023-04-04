function clone-leeroy --wraps=clone-leeroy
    if in_windows_directory
        clone-leeroy.exe $argv
    else
        command clone-leeroy $argv
    end
end

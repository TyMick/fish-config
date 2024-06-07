function code --wraps code
    if not command --query wslpath
        code $argv
        return
    end

    for arg in $argv
        set -l transformed_arg (wslpath -w $arg)
        set -f windows_path_args $windows_path_args $transformed_arg

        if string match --quiet --regex '^[A-Z]:\\\\' $transformed_arg
            set -f contains_windows_paths true
        else if string match --quiet --regex '^\\\\\\\\wsl\.localhost\\\\' $transformed_arg
            set -f contains_wsl_paths true
        end
    end

    if test "$contains_wsl_paths" = true
        code $argv
    else if test "$contains_windows_paths" = true
        powershell.exe -Command "code $windows_path_args"
    else if in_windows_directory
        powershell.exe -Command "code $windows_path_args"
    else
        code $argv
    end
end

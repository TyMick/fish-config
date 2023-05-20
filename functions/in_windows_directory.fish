function in_windows_directory
    argparse --max-args 0 -- $argv
    or return

    if is_windows_directory $PWD
        true
    else
        false
    end
end

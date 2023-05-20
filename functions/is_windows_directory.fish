function is_windows_directory --argument-names path
    argparse --min-args 1 --max-args 1 -- $argv
    or return

    if string match --quiet --regex '^/mnt/c(/.*)?$' $path
        true
    else
        false
    end
end

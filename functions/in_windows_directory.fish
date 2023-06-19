function in_windows_directory
    argparse --max-args 0 -- $argv
    or return

    if command --query wslpath; and string match --quiet --regex '^[A-Z]:\\\\' (wslpath -w $PWD)
        true
    else
        false
    end
end

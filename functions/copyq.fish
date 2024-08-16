function copyq --wraps copyq
    if command --query copyq.exe
        set -l output (copyq.exe $argv)
        set -l exit_code $status
        printf '%s\n' $output
        return $exit_code
    else
        copyq $argv
    end
end

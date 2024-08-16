function pnpm --wraps pnpm
    if in_windows_directory
        pnpm.exe $argv
    else
        command pnpm $argv
    end
end

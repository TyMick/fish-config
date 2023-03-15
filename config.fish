if status is-interactive
    if string match --quiet '*-microsoft-standard-WSL2' (uname --kernel-release)
        nodenv init - fish | source
    end
end

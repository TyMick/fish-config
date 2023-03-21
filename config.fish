if status is-interactive
    set -l kernel_release (uname -r)
    if string match --quiet '*-microsoft-standard-WSL2' $kernel_release
        nodenv init - fish | source
    end
end

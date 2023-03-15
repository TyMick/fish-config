function in_windows_directory
    if string match --quiet --regex '^/mnt/c(/.*)?$' $PWD
        true
    else
        false
    end
end
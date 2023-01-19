function rename_last_download --argument-names new_name
    set last_download_file (ls -pt ~/Downloads | grep --invert-match '/$' | head -n1)
    mv ~/Downloads/$last_download_file ~/Downloads/$new_name
end

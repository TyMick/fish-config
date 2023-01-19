function rename_last_download --argument-names new_name
    set last_download (ls -t ~/Downloads | head -n1)
    mv ~/Downloads/$last_download ~/Downloads/$new_name
end

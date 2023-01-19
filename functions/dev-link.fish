function dev-link --description "Symlink the current directory into my dev folder hierarchy"
    for remote in upstream origin
        for regex in '^https?://(www\.)?(?<domain>[^/]+)/(?<account>[^/]+)/(?<repo>[^/]+)\.git' '^https?://(www\.)?(?<domain>[^/]+)/(?<account>[^/]+)/(?<repo>[^/]+)'
            if string match -rq $regex (git config --local remote.$remote.url)
                mkdir -p ~/code/$domain/$account
                ln -s "$PWD" ~/code/$domain/$account/$repo
                return
            end
        end
    end

    false
end

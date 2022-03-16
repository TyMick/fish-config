# Symlinks the current directory into my dev folder hierarchy.
function dev-link
    for remote in upstream origin
        for regex in '^https?://(www\.)?github.com/(?<account>[^/]+)/(?<repo>[^/]+)\.git' '^https?://(www\.)?github.com/(?<account>[^/]+)/(?<repo>[^/]+)'
            if string match -rq $regex (git config --local remote.$remote.url)
                mkdir -p ~/code/$account
                ln -s "$PWD" ~/code/$account/$repo
                return
            end
        end
    end

    false
end

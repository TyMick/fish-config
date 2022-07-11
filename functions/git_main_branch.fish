function git_main_branch
    if git_default_branch
        return
    end

    for ref in refs/{heads,remotes/{origin,upstream}}/{main,trunk}
        if command git show-ref -q --verify $ref
            echo (string split / $ref)[-1]
            return
        end
    end
    echo master
end

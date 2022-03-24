# Opens a local repo in VS Code if it exists on my machine. If it doesn't,
# searches for the repo on GitHub, forks it if it isn't mine, clones it onto my
# machine, and then opens it in VS Code.
function dev
    if string match -rq '^(?<account>[^/ ]+)/(?<repo>[^/ ]+)$' $argv[1]
        set -l workspace_paths ~/code/$account/$repo.code-workspace ~/code/$account/$repo/.vscode/$repo.code-workspace
        for workspace_path in $workspace_paths
            if test -e $workspace_path
                open $workspace_path
                return
            end
        end

        if test -e ~/code/$account/$repo
            # Parse symlinks so VS Code git integration doesn't get confused
            code (readlink ~/code/$account/$repo || echo ~/code/$account/$repo)
            return
        end

        mkdir -p ~/code/$account
        if test $account = $github_username
            if gh repo clone $account/$repo -- ~/code/$account/$repo
                code ~/code/$account/$repo
                return
            end
        else
            cd ~/code/$account
            if gh repo fork $account/$repo --clone=true
                cd -
                code ~/code/$account/$repo
                return
            end
            cd -
        end

    else if string match -rq '^(?<repo>[^/ ]+)$' $argv[1]
        set -l workspace_paths ~/code/*/$repo.code-workspace ~/code/*/$repo/.vscode/$repo.code-workspace
        for workspace_path in $workspace_paths
            if test -e $workspace_path
                open $workspace_path
                return
            end
        end

        set -l dir_paths ~/code/*/$repo
        for dir_path in $dir_paths
            # Parse symlinks so VS Code git integration doesn't get confused
            code (readlink $dir_path || echo $dir_path)
            return
        end

        if gh repo clone $github_username/$repo -- ~/code/$github_username/$repo
            code ~/code/$github_username/$repo
            return
        end

    end

    false
end

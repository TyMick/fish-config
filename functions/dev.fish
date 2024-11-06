function dev --description "Open a local repo in VS Code if it exists on my machine. If it doesn't, search for the repo on GitHub, fork it if it isn't mine, clone it onto my machine, and then open it in VS Code."
    set -f path (string split '/' $argv[1])
    set -f repo $path[-1]
    set -f account $path[-2]
    set -f domain $path[-3]

    # Try opening existing VS Code workspace
    if test -n "$domain"
        set -f workspace_paths ~/code/$domain/$account/$repo.code-workspace \
            ~/code/$domain/$account/$repo/$repo.code-workspace \
            ~/code/$domain/$account/$repo/.vscode/$repo.code-workspace
    else if test -n "$account"
        set -f workspace_paths ~/code/*/$account/$repo.code-workspace \
            ~/code/*/$account/$repo/$repo.code-workspace \
            ~/code/*/$account/$repo/.vscode/$repo.code-workspace
    else
        set -f workspace_paths ~/code/*/*/$repo.code-workspace \
            ~/code/*/*/$repo/$repo.code-workspace \
            ~/code/*/*/$repo/.vscode/$repo.code-workspace
    end
    for workspace_path in $workspace_paths
        if test -e $workspace_path
            code $workspace_path
            return
        end
    end

    # Try opening existing directory
    if test -n "$domain"
        set -f dir_paths ~/code/$domain/$account/$repo
    else if test -n "$account"
        set -f dir_paths ~/code/*/$account/$repo
    else
        set -f dir_paths ~/code/*/*/$repo
    end
    for dir_path in $dir_paths
        if test -e $dir_path
            # Parse symlinks so VS Code git integration doesn't get confused
            code (readlink $dir_path || echo $dir_path)
            return
        end
    end

    # Try forking and cloning repo (or just cloning if the repo's mine)
    if test -z "$domain"
        set -f domain 'github.com'
    end
    if test -z "$account"
        set -f account $github_username
    end
    mkdir -p ~/code/$domain/$account
    for user in $my_github_users
        if test "$domain/$account" = "$user"
            if gh repo clone $domain/$account/$repo -- ~/code/$domain/$account/$repo
                code ~/code/$domain/$account/$repo
                return
            end
        end
    end
    cd ~/code/$domain/$account
    if gh repo fork $domain/$account/$repo --clone --default-branch-only
        code $repo
        cd -
        return
    end
    cd -

    false
end

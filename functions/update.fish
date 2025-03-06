function update
    set -l config_dirs (find ~/code/github.com/TyMick -maxdepth 1 -type l) ~/code/github.com/TyMick/vscode-settings
    for dir in $config_dirs
        cd $dir
        git pull --autostash --quiet
        cd -
    end
    
    multiversal_variables

    if type --query brew
        brew autoremove
        brew upgrade
        brew autoremove
    end

    if type --query mas
        mas upgrade
    end

    if type --query zypper
        sudo zypper dist-upgrade --no-confirm
    end

    if type --query pnpm
        pnpm update --global --latest
    end

    if type --query gh
        gh extension upgrade --all
    end

    fisher update
end

function update
    set -l config_dirs (find ~/code/github.com/TyMick -maxdepth 1 -type l) ~/code/github.com/TyMick/vscode-settings
    for dir in $config_dirs
        cd $dir
        git pull --quiet
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

    if type --query winget
        gsudo winget upgrade --all
    end

    if type --query zypper
        sudo zypper dist-upgrade --no-confirm
    end

    if command --query pnpm
        command pnpm update --global --latest
    end
    if type --query pnpm.exe
        pnpm.exe update --global --latest
    end

    if command --query gh
        command gh extension upgrade --all
    end
    if type --query gh.exe
        gh.exe extension upgrade --all
    end

    fisher update
end

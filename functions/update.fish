function update
    set -l config_dirs (find ~/code/github.com/TyMick -maxdepth 1 -type l) ~/code/github.com/TyMick/vscode-settings
    for dir in $config_dirs
        cd $dir
        git pull --quiet
        cd -
    end

    brew autoremove
    brew upgrade
    brew autoremove
    mas upgrade
    pnpm update --global --latest
    fisher update
end

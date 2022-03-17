function update
    set -l config_dirs (find ~/code/TyMick -maxdepth 1 -type l) ~/code/TyMick/vscode-settings
    for dir in $config_dirs
        cd $dir
        git pull --quiet
        cd -
    end

    brew autoremove
    brew upgrade
    brew autoremove
    mas upgrade
    n lts
    yarn --silent global upgrade --latest
    fisher update
end

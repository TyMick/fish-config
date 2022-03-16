function update
    brew autoremove
    brew upgrade
    brew autoremove
    mas upgrade
    n lts
    yarn --silent global upgrade --latest
    fisher update
end

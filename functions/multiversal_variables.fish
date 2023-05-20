function multiversal_variables
    argparse --max-args 0 -- $argv
    or return

    echo 'Setting multiversal variables...'

    set -Ux DOTNET_CLI_TELEMETRY_OPTOUT true
    set -Ux EDITOR 'code --new-window --wait'
    set -Ux FUNCTIONS_CORE_TOOLS_TELEMETRY_OPTOUT 1
    set -Ux GATSBY_TELEMETRY_DISABLED 1
    set -Ux HOMEBREW_NO_ANALYTICS 1
    set -Ux NEXT_TELEMETRY_DISABLED 1
    set -Ux N_PRESERVE_NPM 1
    set -U fisher_path /Users/ty.mick/.config/fisher
    set -U github_username TyMick
    set -U my_github_users github.com/TyMick git.faithlife.dev/TyMick
end

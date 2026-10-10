{ inputs, lib, pkgs, ... }:

let
    themeSources = inputs.catppuccin.packages.${pkgs.stdenv.hostPlatform.system};
in
{
    programs.lazygit.enable = true;

    # Previous implicit source: the pinned theme uses gui.authorColors.
    # catppuccin.sources = themeSources;
    # Lazygit 0.66 moves it to gui.theme.authorColors and tries to save the
    # migration. Nix store files are read-only, so migrate during the build.
    # Preserve the full source set: overriding just one entry would discard
    # Catppuccin's flake defaults and re-source other themes from host Nixpkgs.
    catppuccin.sources = themeSources // {
        lazygit = themeSources.lazygit.overrideAttrs (old: {
            postInstall = (old.postInstall or "") + ''
                for theme in "$out"/*/*.yml; do
                    test -f "$theme"
                    # Leave already-migrated upstream themes unchanged.
                    hasAuthorColors=$(${lib.getExe pkgs.yq-go} '.gui | has("authorColors")' "$theme")
                    if [ "$hasAuthorColors" = true ]; then
                        ${lib.getExe pkgs.yq-go} -i '.gui.theme.authorColors = .gui.authorColors | del(.gui.authorColors)' "$theme"
                    fi
                done
            '';
        });
    };
}

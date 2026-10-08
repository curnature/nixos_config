{ pkgs, inputs, ... }:

{
    # Install your custom Neovim Flake
    home.packages = [
        # Outdated: `pkgs.system` is a deprecated alias in current Nixpkgs.
        # inputs.my-neovim.packages.${pkgs.system}.default
        inputs.my-neovim.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];

    # Set Neovim as your default global editor
    # home.sessionVariables = {
        # EDITOR = "nvim";
        # VISUAL = "nvim";
    # };
}
{ pkgs, inputs, ... }:

{
    # Install your custom Neovim Flake
    home.packages = [
        inputs.my-neovim.packages.${pkgs.system}.default
    ];

    # Set Neovim as your default global editor
    # home.sessionVariables = {
        # EDITOR = "nvim";
        # VISUAL = "nvim";
    # };
}
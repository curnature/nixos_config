{ ... }:

{
    imports = [
        ./git.nix
        ./packages.nix
        ./vim.nix
        ./zsh.nix
        ./fastfetch.nix
        ./theme.nix
        ./fonts.nix
        ./latex.nix
    ];

    # Set default environment variables here
    home.sessionVariables = {
        EDITOR = "vim";
        VISUAL = "vim";
        TERMINAL = "kitty";
        LANG = "en_US.UTF-8";
    };
    
    # Enable custom fonts
    fonts.fontconfig.enable = true;
}
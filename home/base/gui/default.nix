{ pkgs,  ... }:
{
    imports = [
        ./terminal/kitty.nix
        ./hyprland.nix
        ./waybar.nix
        ./plasma.nix
    ];

    home.packages = with pkgs; [
        # FIX: Override the package to install ONLY Mocha Lavender
        (catppuccin-kde.override {
            flavour = [ "mocha" ];
            accents = [ "lavender" ];
        })

        # Match the cursors too!
        catppuccin-cursors.mochaLavender

        # Keep the icons
        catppuccin-papirus-folders
    ];  
}

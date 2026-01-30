{ pkgs,  ... }:
{
    imports = [
        ./terminal/kitty.nix
        ./hyprland.nix
        ./waybar.nix
        ./plasma.nix
    ];

    home.packages = with pkgs; [
        
    ];  
}

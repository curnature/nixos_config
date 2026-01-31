{ pkgs,  ... }:
{
    imports = [
        ./terminal/kitty.nix
        ./hyprland.nix
        ./waybar.nix
        ./plasma.nix
        ./vscode.nix  
    ];

    home.packages = with pkgs; [
        
    ];  
}

{ pkgs,  ... }:
{
    imports = [
        ./terminal
        ./hyprland.nix
        ./waybar.nix
        ./plasma.nix
        ./vscode.nix  
    ];

    home.packages = with pkgs; [
        
    ]; 


}

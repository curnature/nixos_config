{ pkgs,  ... }:
{
    imports = [
        ./terminal
        ./hyprland.nix
        ./waybar.nix
        ./plasma.nix
        ./vscode.nix
        ./mpv.nix 

        ./niri
        ./noctalia 
    ];

    home.packages = with pkgs; [
        
    ]; 


}

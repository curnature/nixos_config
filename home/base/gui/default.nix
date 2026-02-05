{ pkgs,  ... }:
{
    imports = [
        ./terminal
        ./hyprland.nix
        ./waybar.nix
        # ./plasma.nix
        ./vscode.nix
        ./mpv.nix 
        # move to home/linux/gui/
        # ./niri
        # ./noctalia 
    ];

    home.packages = with pkgs; [
        
    ]; 


}

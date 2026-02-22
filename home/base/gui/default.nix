{ pkgs,  ... }:
{
    imports = [
        ./terminal
        ./vscode.nix
        ./mpv.nix 
        
    ];

    home.packages = with pkgs; [
        
    ]; 


}

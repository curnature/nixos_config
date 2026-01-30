{ pkgs, ... }:

{
    services.xserver.enable = true;

    services.desktopManager.plasma6.enable = true;
    # services.displayManager.defaultSession = "hyprland";
    
    # 1. Standard SDDM Configuration (Keep this simple)
    services.displayManager.sddm = {
        enable = true;
        wayland.enable = true;
        autoNumlock = true;
    
        # Remove the 'catppuccin = { ... }' block from here!
    };

    # 2. Catppuccin SDDM Configuration (MUST be at the root level)
    catppuccin.sddm = {
        enable = true;
        background = ../wallpapers/plana_bg4_2560_1440.jpg;
        font = "CommitMono Nerd Font";
        fontSize = "14";
        loginBackground = true;
    };      
}

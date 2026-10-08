{ pkgs, ... }:

{
    # 1. Shared Graphics Support
    hardware.graphics = {
        enable = true;
    };

    services.xserver.enable = true;

    services.desktopManager.plasma6.enable = true;
    # services.displayManager.defaultSession = "hyprland";
    
    # 2. Standard SDDM Configuration (Keep this simple)
    services.displayManager.sddm = {
        enable = true;
        wayland.enable = true;
        autoNumlock = true;

   
        # Remove the 'catppuccin = { ... }' block from here!
    };

    # 3. Catppuccin SDDM Configuration (MUST be at the root level)
    catppuccin.sddm = {
        enable = true;
        background = ../wallpapers/BA_alicekey_bg8_2560_1440.png; # ../wallpapers/plana_bg4_2560_1440.jpg;
        font = "CommitMono Nerd Font";
        fontSize = "14";
        loginBackground = true;
    };      
}

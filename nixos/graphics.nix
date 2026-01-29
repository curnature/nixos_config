{ pkgs, ... }:

{
    # Enable X11 and Wayland support
    services.xserver.enable = true;

    # ---------------------------------------------------------------------
    # SDDM Configuration
    # ---------------------------------------------------------------------
    services.displayManager.sddm = {
        enable = true;
        wayland.enable = true; # Improves performance for Hyprland
        theme = "catppuccin-mocha";
        # package = pkgs.kdePackages.sddm; # Use the Qt6 version for modern themes
    };

    # Install the theme directly as a configured package
    environment.systemPackages = [
        (pkgs.catppuccin-sddm.override {
            flavor = "mocha";
            font  = "Cousine Nerd Font";
            fontSize = "12";
            # Point to the image you saved in step 1
            background = "${./plana_bg_2560_1440.png}"; 
            loginBackground = true;
        })
    ];

    # ---------------------------------------------------------------------
    # Desktop Environments
    # ---------------------------------------------------------------------
    services.desktopManager.plasma6.enable = true;
    
    # Default to Hyprland
    services.displayManager.defaultSession = "hyprland";

    # Keymap
    services.xserver.xkb = {
        layout = "us";
        variant = "";
    };
}

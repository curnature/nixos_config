{ pkgs, ... }:

{
    services.xserver.enable = true;

    services.desktopManager.plasma6.enable = true;
    # services.displayManager.defaultSession = "hyprland";
    
    # 2. SDDM Configuration
    services.displayManager.sddm = {
        enable = true;
        wayland.enable = true;
        autoNumlock = true;
    
        # 3. Configure the Theme via Module Options
        # We no longer need to manually override the package!
        catppuccin = {
            background = ../wallpapers/plana_bg4_2560_1440.jpg;
            font = "CommitMono Nerd Font";
            fontSize = "14";
            loginBackground = true;
        };
    };
      
}

{ pkgs, ... }:

{
    services.xserver.enable = true;

    services.desktopManager.plasma6.enable = true;
    # services.displayManager.defaultSession = "hyprland";
    
    environment.systemPackages = [
        (pkgs.catppuccin-sddm.override {
            flavor = "mocha";
            # FIX 2: Explicitly set the accent
            accent = "mauve";
            font  = "CommitMono Nerd Font";
            fontSize = "14";
            # FIX 3: Use the README's suggested syntax for the image
            background = "${./../wallpapers/plana_bg_2560_1440.png}";
            loginBackground = true;
        })
    ];
  
    services.displayManager.sddm = {
        enable = true;
        wayland.enable = true;
        # FIX 1: Update the theme name to include the accent

        theme = "catppuccin-mocha-mauve";
        
        autoNumlock = true;  
    };

  
}

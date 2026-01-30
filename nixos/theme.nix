{ pkgs, ... }:

{
    # 1. Global System Theme
    # This themes the TTY (boot console), GRUB, and SDDM defaults automatically!
    catppuccin = {
        enable = true;
        flavor = "mocha";
        accent = "lavender"; # Syncs with your Hyprland
    
        # We disable GRUB here because we are using a custom fork in boot.nix
        grub.enable = false; 
    };
}
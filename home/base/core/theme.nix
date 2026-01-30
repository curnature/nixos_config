{ pkgs, inputs, ... }:

{
    imports = [
        inputs.catppuccin.homeModules.catppuccin
    ];

    # 1. Global Theme Settings
    catppuccin = {
        enable = true;
        # one of "latte", "frappe", "macchiato", "mocha"
        flavor = "mocha";
        # one of "blue", "flamingo", "green", "lavender", "maroon", "mauve", "peach", "pink", "red", "rosewater", "sapphire", "sky", "teal", "yellow"
        accent = "lavender";
    };

    # 2. Global Cursor (Replaces the manual cursor install)
    home.pointerCursor = {
        name = "catppuccin-mocha-lavender-cursors";
        package = pkgs.catppuccin-cursors.mochaLavender;
        size = 24;
        gtk.enable = true;
        x11.enable = true;
    };

    # 3. Install Theme Packages (Moved from default.nix)
    home.packages = with pkgs; [
        # KDE Theme assets (still needed for Plasma to see them)
        (catppuccin-kde.override {
            flavour = [ "mocha" ];
            accents = [ "lavender" ];
        })
        
        # Icons
        catppuccin-papirus-folders
    ];
}
{ pkgs, inputs, ... }:

{
    imports = [
        inputs.catppuccin.homeModules.catppuccin
    ];

    # 1. Global Theme Settings
    catppuccin = {
        # Old setting:
        # enable = true;
        # A single `enable` flag implicitly auto-enabled every integration. That
        # behavior is deprecated, so the global toggle and enrollment are now explicit.
        enable = true;
        autoEnable = true;
        # one of "latte", "frappe", "macchiato", "mocha"
        flavor = "mocha";
        # one of "blue", "flamingo", "green", "lavender", "maroon", "mauve", "peach", "pink", "red", "rosewater", "sapphire", "sky", "teal", "yellow"
        accent = "lavender";
    };

    # 2. Global Cursor (Replaces the manual cursor install)
    home.pointerCursor = {
        name = "catppuccin-mocha-lavender-cursors";
        package = pkgs.catppuccin-cursors.mochaLavender;
        # Old behavior: configuring `home.pointerCursor` implicitly enabled
        # cursor config generation. That implicit enablement is deprecated, so
        # the intended behavior is now declared explicitly.
        enable = true;
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
        # candy-icons
    ];
}
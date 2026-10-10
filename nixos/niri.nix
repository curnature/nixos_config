{ pkgs, inputs, ... }:

{
    # Import the official NixOS module from the flake
    imports = [ inputs.niri.nixosModules.niri ];

    programs.niri = {
        enable = true;
        # The flake module automatically handles the package version for you
    };

    # Previously inherited Niri's portal defaults without a FileChooser override.
    # GNOME's chooser now delegates to Nautilus, which is unavailable in this
    # session. Use the existing GTK chooser for Niri only; KDE is unchanged.
    # A desktop-specific config replaces the packaged file, so preserve its
    # other mappings (including GNOME for screen sharing) explicitly.
    xdg.portal.config.niri = {
        default = [ "gnome" "gtk" ];
        "org.freedesktop.impl.portal.Access" = [ "gtk" ];
        "org.freedesktop.impl.portal.Notification" = [ "gtk" ];
        "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
        "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
    };
}

{ pkgs, ... }:

{
    programs.hyprland = {
        enable = false;
        xwayland.enable = true; # Allow X11 apps to run
    };

    # Optional: Hint Electron apps to use Wayland
    environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
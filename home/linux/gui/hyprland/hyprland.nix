{ pkgs, vars, ... }:
let
  # 1. Define the wallpaper path (Nix handles the store path)
  wallpaperFile = ../../../wallpapers/plana_bg2_2560_1440.jpg;

  # 2. Create a script to force-apply the wallpaper
  # This matches the logic from the GitHub issue you shared.
  forceWallpaper = pkgs.writeShellScript "force-wallpaper" ''
    # Wait for Hyprland to fully initialize monitors
    sleep 2

    # Start the daemon if it's not running, or reload it
    if ! pgrep hyprpaper > /dev/null; then
      ${pkgs.hyprpaper}/bin/hyprpaper &
      sleep 1
    fi

    # Force the wallpaper using hyprctl (IPC)
    # This is more reliable than just the config file
    ${pkgs.hyprland}/bin/hyprctl hyprpaper unload all
    ${pkgs.hyprland}/bin/hyprctl hyprpaper preload "${wallpaperFile}"
    ${pkgs.hyprland}/bin/hyprctl hyprpaper wallpaper ",${wallpaperFile}"
  '';
in
{
    # DELETE THIS BLOCK (Moved to /base/core/theme.nix)
    # catppuccin = {
    #     enable = true;
    #     flavor = "mocha";
    #     accent = "lavender";
    # };

    # Keep the service enabled (so it installs the binary)
    # But we will mostly rely on the script below to do the heavy lifting.
    services.hyprpaper = {
        enable = true;
        settings = {
            ipc = "on";
            splash = false;
            preload = [ "${wallpaperFile}" ];
            wallpaper = [ ",${wallpaperFile}" ];
        };
    };

    wayland.windowManager.hyprland = {
        enable = true;
        
        settings = {
            "$mod" = "SUPER";
            "$terminal" = "${vars.terminal}";
            "$menu" = "wofi --show drun";

            # 3. Add the script to startup
            exec-once = [
                "waybar"
                "dunst"
                "${forceWallpaper}" # <--- Runs our script on login
            ];

            input = {
                kb_layout = "us";
                follow_mouse = 1;
                numlock_by_default = true;
            };

            general = {
                gaps_in = 5;
                gaps_out = 10;
                border_size = 2;
                layout = "dwindle";
                "col.active_border" = "$lavender";
                "col.inactive_border" = "$overlay0";
            };

            bind = [
                "$mod, Return, exec, $terminal"
                "$mod, Q, killactive,"
                "$mod, M, exit,"
                "$mod, E, exec, dolphin"
                "$mod, V, togglefloating,"
                "$mod, Space, exec, $menu"
                "$mod, left, movefocus, l"
                "$mod, right, movefocus, r"
                "$mod, up, movefocus, u"
                "$mod, down, movefocus, d"

                # SCREENSHOT BIND (Ctrl + Alt + a)
                # 1. Runs 'slurp' to let you select an area
                # 2. Runs 'grim' to save that area to a timestamped file in Pictures
                "CTRL ALT, a, exec, grim -g \"$(slurp)\" ~/Pictures/screenshot_$(date +'%Y%m%d_%H%M%S').png"  
            ];
        };
    };
    
    home.packages = with pkgs; [
        wofi
        dunst
        libnotify
        wl-clipboard

        grim   # Screenshot tool
        slurp  # Region selector
    ];
}

{ pkgs, vars, ... }:

{
    wayland.windowManager.hyprland = {
        enable = true;
        
        # Safe Basic Config
        settings = {
            "$mod" = "SUPER";
            
            # Apps
            "$terminal" = "${vars.terminal}"; # Uses your variable!
            "$menu" = "wofi --show drun";

            # Startup
            exec-once = [
                "waybar"
                "dunst"
            ];

            # Input
            input = {
                kb_layout = "us";
                follow_mouse = 1;
            };

            # Visuals
            general = {
                gaps_in = 5;
                gaps_out = 10;
                border_size = 2;
                "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
                "col.inactive_border" = "rgba(595959aa)";
                layout = "dwindle";
            };

            # Keybindings
            bind = [
                "$mod, Return, exec, $terminal"
                "$mod, Q, killactive,"
                "$mod, M, exit,"
                "$mod, E, exec, dolphin"
                "$mod, V, togglefloating,"
                "$mod, Space, exec, $menu"
                
                # Navigation
                "$mod, left, movefocus, l"
                "$mod, right, movefocus, r"
                "$mod, up, movefocus, u"
                "$mod, down, movefocus, d"
            ];
        };
    };
    
    # Install standard Wayland tools we need
    home.packages = with pkgs; [
        wofi        # App launcher
        dunst       # Notifications
        libnotify   # Notification tools
        wl-clipboard # Copy/paste
    ];
}
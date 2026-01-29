{ pkgs, ... }:

{
    programs.waybar = {
        enable = true;
        
        # Basic config to get you started
        settings = {
            mainBar = {
                layer = "top";
                position = "top";
                height = 30;
                modules-left = [ "hyprland/workspaces" ];
                modules-center = [ "clock" ];
                modules-right = [ "cpu" "memory" "battery" "tray" ];
            };
        };

        # Basic style
        style = ''
            * {
                border: none;
                border-radius: 0;
                font-family: "JetBrainsMono Nerd Font";
                font-size: 13px;
                min-height: 0;
            }
            window#waybar {
                background: transparent;
                color: white;
            }
        '';
    };
}
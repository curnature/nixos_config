{ pkgs, ... }:

{
    programs.waybar = {
        enable = true;

        settings = {
            mainBar = {
                layer = "top";
                position = "top";
                height = 30;
                
                modules-left = [ "hyprland/workspaces" ];
                modules-center = [ "clock" ];
                # ADDED: "custom/gpu-temp" and "temperature" to the left of cpu
                modules-right = [ "custom/gpu-temp" "temperature" "cpu" "memory" "battery" "tray" ];

                # --- SENSORS CONFIGURATION ---

                # 1. CPU Temperature (Built-in module)
                "temperature" = {
                    # "hwmon-path": "/sys/class/hwmon/hwmon2/temp1_input", # critical for some laptops if auto-detect fails
                    "critical-threshold" = 80;
                    "format" = "  {icon} {temperatureC}°C";
                    "format-icons" = ["" "" ""]; # Low, Med, High icons
                };

                # 2. GPU Temperature (Custom script for Nvidia)
                "custom/gpu-temp" = {
                    "exec" = "nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader";
                    "format" = "󰍹  {}°C";
                    "interval" = 5;
                };

                # --- EXISTING MODULES (Keep these!) ---

                "cpu" = {
                    "interval" = 5;
                    "format" = "  {usage}%";
                    "max-length" = 10;
                };

                "memory" = {
                    "interval" = 30;
                    "format" = "  {percentage}%";
                    "max-length" = 10;
                };

                "battery" = {
                    "interval" = 60;
                    "states" = {
                        "warning" = 30;
                        "critical" = 15;
                    };
                    "format" = "{icon}  {capacity}%";
                    "format-charging" = "  {capacity}%";
                    "format-plugged" = "  {capacity}%";
                    "format-icons" = ["" "" "" "" ""];
                };

                "clock" = {
                    "format" = "  {:%H:%M}";
                    "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
                    "format-alt" = "  {:%Y-%m-%d}";
                };
            };
        };

        # Add styling for the new modules
        style = ''
            * {
                border: none;
                border-radius: 0;
                font-family: "CommitMono Nerd Font"; 
                font-size: 14px;
                min-height: 0;
            }

            window#waybar {
                background-color: @base;
                color: @text;
                opacity: 0.9;
            }

            #clock,
            #cpu,
            #memory,
            #battery,
            #tray,
            #temperature,    /* Added styling target */
            #custom-gpu-temp /* Added styling target */
            {
                padding: 0 10px;
                color: @text;
            }
            
            #temperature.critical {
                color: @red; /* Turns red if CPU is overheating */
            }

            #workspaces button {
                padding: 0 5px;
                color: @overlay0; 
            }

            #workspaces button.active {
                color: @lavender;
            }

            #workspaces button:hover {
                background: @surface0;
            }
        '';
    };
}

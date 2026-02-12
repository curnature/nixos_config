{ config, pkgs, inputs, ... }:

{
    # Import the keybindings file so they are merged together
    imports = [ 
        ./keybindings.nix 
        ./visual.nix
    ];

    # --- ADD THIS SECTION ---
    home.packages = with pkgs; [
        grim         # Screenshot tool
        slurp        # Region selector
        wl-clipboard # Clipboard utility
        swappy       # (Optional) A quick editor to draw arrows/crop before saving
    ];
    # ------------------------

    programs.niri = {
        # 'enable = true' is handled automatically by the system module!
    
        settings = {
            # --- 1. Startup ---
            spawn-at-startup = [
                { command = ["noctalia-shell"]; }
            ];

            input = {
                keyboard = {
                    # This empty set {} tells Niri to enable the 'numlock' flag
                    numlock = true; 
          
                    # Optional: If you need a specific layout (e.g. US, DE, JP)
                    # xkb = {
                    #   layout = "us";
                    # };
                };
            }; 

            # --- 3. Noctalia Integration ---
            # Allow Noctalia to control windows (Essential for dock/launcher)
            debug = {
                honor-xdg-activation-with-invalid-serial = {};
            };

            # Force Noctalia Overview to the background (Wallpaper effect)
            layer-rules = [
                {
                    matches = [ { namespace = "^noctalia-overview*"; } ];
                    place-within-backdrop = true;
                }
            ];

            # --- 4. Window Rules (Ryan's Logic Translated) ---
            # window-rules = [
            # # Round Corners (Modern Look)
                # {
                    # geometry-corner-radius.bottom-left = 20.0;
                    # geometry-corner-radius.bottom-right = 20.0;
                    # geometry-corner-radius.top-left = 20.0;
                    # geometry-corner-radius.top-right = 20.0;
                    # clip-to-geometry = true;
                # }

            # Browsers -> Workspace 2
            #    {
            #        matches = [ { app-id = "^(firefox|google-chrome|chromium-browser)$"; } ];
            #        open-on-workspace = "2browser";
            #        open-maximized = true;
            #    }

            # Chat -> Workspace 3
            #    {
            #        matches = [ 
            #            { app-id = "^(wechat|QQ|telegram-desktop)$"; } 
            #        ];
            #        open-on-workspace = "3chat";
            #    }

        };
    };
}
{ ... }:

{
    programs.niri.settings = {
        # --- 1. Define Workspaces (The Clean Way) ---
        # This tells Niri: "These workspaces exist by default with these names."
        workspaces = {
            "1terminal" = {};  # Creates a workspace named "1terminal"
            "2browser" = {};   # Creates a workspace named "2browser"
            "3chat" = {};      # Creates a workspace named "3chat"
            "4file" = {};     # Creates a workspace named "4music"
            "5game" = {};      # Creates a workspace named "5mail"
            "6" = {};      # Creates a workspace named "6file"
            "7" = {};            # Creates a workspace named "7"
            "8" = {};            # Creates a workspace named "8"
            "9" = {};            # Creates a workspace named "9"
            "0other" = {};     # Creates a workspace named "0other"
        }; 
        
        # --- 2. Layout & Look ---
        layout = {
            gaps = 16;
            center-focused-column = "never";

            preset-column-widths = [
                { proportion = 1.0 / 3.0; }
                { proportion = 1.0 / 2.0; }
                { proportion = 2.0 / 3.0; }
            ]; 

            default-column-width = { proportion = 1.0 / 2.0; };

            focus-ring = {
                width = 4;
                active.color = "#ac7fff";
                inactive.color = "#505050";
            };

        };

        window-rules = [
            {
                clip-to-geometry = true;
                geometry-corner-radius = {
                    bottom-left = 20.0;
                    bottom-right = 20.0;
                    top-left = 20.0;
                    top-right = 20.0;
                };
            }
            # Terminals -> Workspace 1
            {
                matches = [ { app-id = "code"; } ];
                open-on-workspace = "1terminal";
                open-maximized = true;
            }
            
            {
                matches = [ { app-id = "kitty"; } ];
                open-on-workspace = "1terminal";
            }


            # Browsers -> Workspace 2
            {
                matches = [ { app-id = "firefox"; } ];
                open-on-workspace = "2browser";
                open-maximized = true;
            }

            # Chat -> Workspace 3
            #    {
            #        matches = [ 
            #            { app-id = "^(wechat|QQ|telegram-desktop)$"; } 
            #        ];
            #        open-on-workspace = "3chat";
            #    }
        ]; 
    };

}

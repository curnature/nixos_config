{ pkgs, ... }:

{
    programs.kitty = {
        enable = true;

        font = {
            name = "CommitMono Nerd Font";
            size = 14;
        };

        settings = {
            confirm_os_window_close = 0;
            dynamic_background_opacity = true;
            background_opacity = "0.5";
            background_blur = 0;
            mouse_hide_wait = "-1.0";
            enable_audio_bell = false;
        };
    };

    # OPTIONAL: Explicitly configure Catppuccin for Kitty
    # catppuccin.kitty = {
    #     enable = true; 
    #     flavor = "mocha"; 
    # };    
}

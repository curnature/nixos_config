{ config, pkgs, inputs, ... }:

{ 

  programs.niri = {

    settings = {
      # Auto-start Noctalia when Niri starts
      spawn-at-startup = [
        { command = ["noctalia-shell"]; }
      ];

      # Basic Keybindings to get you started
      binds = {
        "Mod+Shift+E".action.quit = {};
        "Mod+Q".action.close-window = {};
        "Mod+Return".action.spawn = "kitty";
        "Mod+D".action.spawn = "noctalia-launcher"; # Noctalia's app launcher
      };
    };
  };
}
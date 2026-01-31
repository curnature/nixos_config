{ pkgs, ... }:

{
    programs.vscode = {
        enable = true;
        package = pkgs.vscode;
        mutableExtensionsDir = true; # Allows you to install other extensions manually from the sidebar

        # Pre-install essential extensions
        profiles.default.extensions = with pkgs.vscode-extensions; [
            vscodevim.vim  # Since you use Neovim, you'll feel right at home!
            # Note: The Catppuccin theme extension is auto-installed by the module below
        ];

        # These settings are "locked" by Nix. 
        # You can still change other settings in the UI, but these will always reset on reload.
        profiles.default.userSettings = {
            "editor.fontFamily" = "'CommitMono Nerd Font', 'Droid Sans Mono', 'monospace', droid sans mono";
            "editor.fontSize" = 14;
            "editor.fontLigatures" = true;
            
            "window.titleBarStyle" = "custom";
            "telemetry.telemetryLevel" = "off";
            "git.confirmSync" = false;
            
            # Optional: Make the terminal background transparent to match your system
            "workbench.colorCustomizations" = {
                "terminal.background" = "#00000000";
            };
        };
    };

    # This module handles the theme installation and configuration automatically
    catppuccin.vscode.profiles.default = {
        enable = true;
        flavor = "mocha";
        accent = "lavender";
    };
}

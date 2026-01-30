{ pkgs, vars, inputs, ... }:

{
    imports = [
        # ---------------------------------------------------------------------
        # 1. Shared Configuration (The "Core")
        # ---------------------------------------------------------------------
        # Load the shared settings (stateVersion, username)
        ../home.nix  
        # Load the shared Core apps (Git, Vim, Zsh, etc)
        ../base/core 
        # Load the shared GUI apps (Kitty, etc)
        ../base/gui  
        # ../base/tui # Uncomment if/when you add TUI apps
        ../base/tui

        # ---------------------------------------------------------------------
        # 2. Linux-Specific Configuration
        # ---------------------------------------------------------------------
        # Load Linux-only CLI tools
        ./base 
        # Load Linux-only GUI apps
        ./gui  

        # ADD THIS: The Plasma Manager Module
        inputs.plasma-manager.homeModules.plasma-manager  
        
        inputs.catppuccin.homeModules.catppuccin  
    ];
}

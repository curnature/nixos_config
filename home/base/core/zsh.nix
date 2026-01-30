{ pkgs, vars, hostname, ... }:

{
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        
        # The Splash Screen
        initContent = ''
            fastfetch
        '';

        # ---------------------------------------------------------------------
        # The "Lazy Developer" Aliases
        # ---------------------------------------------------------------------
        shellAliases = {
            # 1. System & Home Manager Update (The "One Command to Rule Them All")
            # This rebuilds your system using the flake in your config directory
            update = "sudo nixos-rebuild switch --flake /home/${vars.username}/nixos_config#${hostname}";

            # 2. Quick Navigation
            # Jump directly to your config folder to make edits
            conf = "cd /home/${vars.username}/nixos_config";

            # 3. Flake Input Updates
            # Run this to download the latest version of packages (updates flake.lock)
            # You must run 'update' afterwards to actually apply the changes.
            flake-update = "nix flake update --flake /home/${vars.username}/nixos_config";

            # 4. Garbage Collection
            # Quickly clear space by deleting old generations
            gc = "nix-collect-garbage --delete-old";
            
            # 5. Standard Shortcuts
            ll = "ls -l";
        };
    };
}

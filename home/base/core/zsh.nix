{ pkgs, vars, hostname, ... }:

let
    # One host-specific target for both NixOS and its integrated Home Manager.
    flakeTarget = "/home/${vars.username}/nixos_config#${hostname}";
    # Fail if the inputs need relocking; dependency updates stay deliberate.
    rebuild = action: "nixos-rebuild ${action} --flake '${flakeTarget}' --no-update-lock-file";
    switchCommand = "sudo ${rebuild "switch"}";
in
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
            # 1. System & Integrated Home Manager Builds / Activation
            # Previous shortcut: no guard against implicit lock-file updates.
            # Keep the old setting for reference; the replacement uses pinned inputs.
            # update = "sudo nixos-rebuild switch --flake /home/${vars.username}/nixos_config#${hostname}";
            update = switchCommand;

            # Build only, show package differences, and leave ./result for inspection.
            os-build = "${rebuild "build"} --diff";
            # Preview service changes; this cannot guarantee Home Manager activation.
            os-preview = "sudo ${rebuild "dry-activate"}";
            # Live activation, including Home Manager; not a sandbox or boot default.
            os-test = "sudo ${rebuild "test"}";
            # Apply now and make the configuration the default for subsequent boots.
            os-switch = switchCommand;
            # Prepare the next boot without activating or rebooting now.
            os-boot = "sudo ${rebuild "boot"}";

            # Saved system generations, independent of the working configuration.
            os-generations = "nixos-rebuild list-generations";
            # Previous saved generation, not a Git/data rollback or an undo for os-test.
            os-rollback = "sudo nixos-rebuild switch --rollback";

            # Home Manager runs as a system service in this integrated setup.
            hm-status = "systemctl status home-manager-${vars.username}.service --no-pager";
            hm-log = "journalctl -b -u home-manager-${vars.username}.service -n 100 --no-pager";

            # 2. Quick Navigation
            # Jump directly to your config folder to make edits
            conf = "cd /home/${vars.username}/nixos_config";

            # 3. Flake Input Updates
            # Run this to download the latest version of packages (updates flake.lock)
            # You must run 'update' afterwards to actually apply the changes.
            # With no arguments, this updates ALL inputs, including Niri and Noctalia.
            # Append input names for a targeted update; do not run during routine tests.
            flake-update = "nix flake update --flake /home/${vars.username}/nixos_config";

            # 4. Garbage Collection
            # Quickly clear space by deleting old generations
            gc = "nix-collect-garbage --delete-old";

            # ==========================================
            # 5. Modern TUI Replacements
            # ==========================================
            
            # eza: The better 'ls'
            ls = "eza --icons=auto";
            ll = "eza -l --icons=auto";
            la = "eza -la --icons=auto";
            tree = "eza --tree --icons=auto";

            # bat: The better 'cat'
            cat = "bat";

            # zoxide: The smarter 'cd'
            cd = "z";

            # lazygit: Quick launch
            lg = "lazygit";

            # ripgrep & fd: Better search/find
            grep = "rg";
            find = "fd";    
        };
    };
}

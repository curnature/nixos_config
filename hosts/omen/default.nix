{ pkgs, vars, hostname, ... }:

{
    imports = [
        # 1. Hardware Scan
        ./hardware-configuration.nix

        # 2. Local Hardware Specifics
        ./nvidia.nix

        # 3. Generic System Modules (The "Toolbox")
        ../../nixos/boot.nix
        ../../nixos/nix.nix
        ../../nixos/time_lang.nix
        ../../nixos/network.nix
        ../../nixos/theme.nix
        ../../nixos/graphics.nix
        ../../nixos/audio.nix
        ../../nixos/user.nix
        ../../nixos/root_pkgs.nix
        ../../nixos/zsh.nix
        ../../nixos/hyprland.nix 
        ../../nixos/niri.nix
        ../../nixos/power.nix
        ../../nixos/steam.nix 
        
    ];

    # Force the hostname to match what we passed from the factory
    networking.hostName = hostname;

    # -------------------------------------------------------------------------
    # System Versioning
    # -------------------------------------------------------------------------
    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It is fine to keep this constant.
    # Outdated: the shared variable coupled this host's compatibility baseline
    # to Home Manager and allowed it to change during routine upgrades.
    # system.stateVersion = vars.stateVersion;
    system.stateVersion = "25.11";
}

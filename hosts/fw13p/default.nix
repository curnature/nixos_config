{ inputs, lib, vars, hostname, ... }:

let
    # Set this once from the NixOS installer used for this laptop, then never
    # advance it during normal upgrades.
    fw13pStateVersion = null;
in
{
    imports = [
        # 1. Hardware Scan
        # Generated on the physical laptop. Keep this disabled until that file
        # exists; do not copy the Omen hardware configuration.
        # ./hardware-configuration.nix

        # 2. Framework Hardware Profile
        inputs.nixos-hardware.nixosModules.framework-intel-core-ultra-series3
        inputs.nixos-hardware.nixosModules.common-gpu-intel

        # 3. Local Hardware Specifics
        ./intel.nix
        ../../nixos/kernel.nix

        # 4. Generic System Modules (The "Toolbox")
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

    # Force the hostname to match what we passed from the factory.
    networking.hostName = hostname;

    # Refuse to evaluate this host until its permanent compatibility baseline
    # has been copied from the installer configuration above.
    assertions = [
        {
            assertion = fw13pStateVersion != null;
            message = ''
                Set fw13pStateVersion in hosts/fw13p/default.nix to the NixOS
                release used for the first installation before enabling fw13p.
            '';
        }
    ];
}
// lib.optionalAttrs (fw13pStateVersion != null) {
    system.stateVersion = fw13pStateVersion;
}

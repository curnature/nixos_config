{ pkgs, username, hostname, ... }:

{
  imports = [
    # 1. Hardware Scan
    ./hardware-configuration.nix
    
    # 2. Local Hardware Specifics (Moved from modules!)
    ./nvidia.nix

    # 3. Generic System Modules (The "Toolbox")
    ../../nixos/boot.nix
    ../../nixos/nix.nix 
    ../../nixos/time_lang.nix
    ../../nixos/network.nix
    ../../nixos/graphics.nix
    ../../nixos/audio.nix
    ../../nixos/user.nix
    ../../nixos/root_pkgs.nix
    ../../nixos/zsh.nix
  ];

  # Force the hostname to match what we defined in vars
  networking.hostName = hostname;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you mean to use 24.05 or 25.05 (unstable)?
}
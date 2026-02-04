{ pkgs, inputs, ... }:

{
  # Import the official NixOS module from the flake
  imports = [ inputs.niri.nixosModules.niri ];

  programs.niri = {
    enable = true;
    # The flake module automatically handles the package version for you
  };
}
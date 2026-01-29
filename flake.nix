{
  description = "Modular NixOS Configuration";

  inputs = {
    # 1. Nix Packages
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    # 2. Home Manager
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # 3. Hardware Tweaks
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # 4. Plugins (Add NixVim back here when ready)
    # nixvim = { ... };
  };

  # Pass ALL inputs to the 'outputs' folder
  outputs = inputs: import ./outputs inputs;
}
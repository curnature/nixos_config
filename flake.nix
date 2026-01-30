{
    description = "Modular NixOS Configuration";

    inputs = {
        # ---------------------------------------------------------------------
        # 1. Nix Packages
        # ---------------------------------------------------------------------
        # Default system packages (Unstable)
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        # Optional: Specific channels for granular control
        nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
        nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";

        # ---------------------------------------------------------------------
        # 2. Home Manager
        # ---------------------------------------------------------------------
        # Managing user configurations (dotfiles, git, etc)
        home-manager = {
            url = "github:nix-community/home-manager/master"; # unstable
            # url = "github:nix-community/home-manager/release-25.11"; # stable

            # Ensure Home Manager uses the same pkgs as the system to avoid conflicts
            inputs.nixpkgs.follows = "nixpkgs";
        };
        # home=manager version options: 
        # https://github.com/nix-community/home-manager/blob/master/modules/misc/version.nix

        # ---------------------------------------------------------------------
        # 3. Hardware Support
        # ---------------------------------------------------------------------
        # Pre-configured hardware tweaks (GPU, Audio, etc)
        nixos-hardware.url = "github:NixOS/nixos-hardware/master";

        # ---------------------------------------------------------------------
        # 4. Plugins & Extras
        # ---------------------------------------------------------------------

        # nixvim = { ... }; # Uncomment when ready to migrate Neovim
        plasma-manager = {
            url = "github:nix-community/plasma-manager";
            inputs.nixpkgs.follows = "nixpkgs";
            inputs.home-manager.follows = "home-manager";
        };
        
        catppuccin.url = "github:catppuccin/nix";
    };

    # Pass ALL inputs to the 'outputs' directory to keep this file clean
    outputs = inputs: import ./outputs inputs;
}

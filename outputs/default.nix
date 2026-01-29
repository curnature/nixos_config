{ self, nixpkgs, home-manager, ... }@inputs:

let
    # -------------------------------------------------------------------------
    # 1. System Architecture & Libraries
    # -------------------------------------------------------------------------
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    lib = nixpkgs.lib;

    # -------------------------------------------------------------------------
    # 2. Import Global Variables (The "DNA")
    # -------------------------------------------------------------------------
    vars = import ../vars;

    # -------------------------------------------------------------------------
    # 3. The Builder Function (The "Factory")
    # -------------------------------------------------------------------------
    # This function creates a NixOS system configuration for a specific hostname.
    # It automatically injects 'inputs', 'vars', and 'hostname' into all modules.
    mkSystem = hostname: lib.nixosSystem {
        inherit system;

        # Pass arguments to every NixOS module
        specialArgs = { inherit inputs vars hostname; };

        modules = [
            # A. Host-Specific Configuration (Hardware, Drivers, etc.)
            ../hosts/${hostname}/default.nix

            # B. Home Manager Integration (Shared User Config)
            home-manager.nixosModules.home-manager
            {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;

                # Pass arguments to Home Manager modules as well
                home-manager.extraSpecialArgs = { inherit inputs vars hostname; };

                # C. The Master User Profile
                # Dynamically imports the user config based on the username variable.
                # Currently points to the Linux GUI profile.
                home-manager.users.${vars.username} = import ../home/linux/gui.nix;
            }
        ];
    };

in
{
    # -------------------------------------------------------------------------
    # 4. The Output: Machine Configurations
    # -------------------------------------------------------------------------
    nixosConfigurations = {
        # The Current Workstation
        omen = mkSystem "omen";

        # Future Machines (Uncomment when ready)
        # g14 = mkSystem "g14";
    };

    # -------------------------------------------------------------------------
    # 5. Tools & Utilities
    # -------------------------------------------------------------------------
    # Formatter for the codebase (run 'nix fmt')
    formatter.${system} = pkgs.nixfmt-rfc-style;
}
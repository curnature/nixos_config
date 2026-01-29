{ self, nixpkgs, home-manager, ... }@inputs:

let
  # 1. System Architecture
  system = "x86_64-linux";
  pkgs = nixpkgs.legacyPackages.${system};
  lib = nixpkgs.lib;

  # 2. Import your Variables
  vars = import ../vars;

  # 3. The Builder Function (The "Factory")
  # Usage: mkSystem "omen"
  mkSystem = hostname: lib.nixosSystem {
    inherit system;
    
    # Pass 'inputs', 'vars', and 'hostname' to EVERY module
    specialArgs = { inherit inputs vars hostname; };

    modules = [
      # A. The Host Specific Config (Hardware, Drivers)
      ../hosts/${hostname}/default.nix

      # B. The Shared Home Manager Config
      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        
        # Pass args to Home Manager too
        home-manager.extraSpecialArgs = { inherit inputs vars hostname; };

        # The Master User Profile
        # This loads the file at: home/linux/gui.nix
        home-manager.users.${vars.username} = import ../home/linux/gui.nix;
      }
    ];
  };

in
{
  # 4. The Output: Your Machines
  nixosConfigurations = {
    # The Current Machine
    omen = mkSystem "omen";

    # The Future Machine (Just uncomment when you buy it!)
    # g14 = mkSystem "g14"; 
  };

  # 5. Bonus: The Formatter (Run 'nix fmt' to clean your code!)
  formatter.${system} = pkgs.nixfmt-rfc-style;
}
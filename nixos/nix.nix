{ pkgs, ... }:

{
  nix.settings = {
    # Enable flakes and new 'nix' command
    experimental-features = [ "nix-command" "flakes" ];

    # Deduplicate and optimize nix store
    auto-optimise-store = true;
  };

  # Garbage Collection (Automatic Cleanup)
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
}
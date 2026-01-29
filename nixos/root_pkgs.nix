{ pkgs, ... }:

{
  # Allow unfree packages (Required for Nvidia, Steam, Chrome, etc.)
  nixpkgs.config.allowUnfree = true;

  # Install Firefox system-wide
  programs.firefox.enable = true;

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    # Core Tools
    nano
    vim
    wget
    git
    file
    tree
    lshw
    
    # Management
    home-manager
  ];
}
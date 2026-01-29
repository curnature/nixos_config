{ pkgs, username, ... }:

{
  imports = [
    # 1. Import the "Base" Hub (Everything shared)
    ./base

    # 2. Import the "Linux" Hub (Linux specifics)
    ./linux
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;
}
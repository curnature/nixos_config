{ pkgs, vars, ... }:

{
  imports = [
    # 1. Import the "Base" Hub (Everything shared)
    ./base

    # 2. Import the "Linux" Hub (Linux specifics)
    ./linux
  ];

  home = {
    username = vars.username;
    homeDirectory = "/home/${vars.username}";
    stateVersion = vars.stateVersion;
  };

  programs.home-manager.enable = true;
}
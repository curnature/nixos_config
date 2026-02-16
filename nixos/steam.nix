{ pkgs, ... }:

{
  # 1. Steam: The Platform
  programs.steam = {
    enable = true;
    
    # Open ports in the firewall for Steam Remote Play
    remotePlay.openFirewall = true; 
    # Open ports for Source Dedicated Server
    dedicatedServer.openFirewall = true; 
    
    # Fix for some Java games
    package = pkgs.steam.override {
      extraPkgs = pkgs: with pkgs; [
        xorg.libXcursor
        xorg.libXi
        xorg.libXinerama
        xorg.libXScrnSaver
        libpng
        libpulseaudio
        libvorbis
        stdenv.cc.cc.lib
        libkrb5
        keyutils
      ];
    };
  };

  # 2. Gamemode: The Optimizer
  # A daemon that optimizes Linux system performance on demand
  programs.gamemode.enable = true;

  # 3. Gamescope: The Compositor (Optional but Recommended)
  # A micro-compositor from Valve. Great for fixing resolution/scaling issues.
  programs.gamescope = {
    enable = true;
    capSysNice = true; # Give it high priority
  };
}
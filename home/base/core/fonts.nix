{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nerd-fonts.cousine
    nerd-fonts.commit-mono
  ];
}
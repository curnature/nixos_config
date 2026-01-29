{ pkgs, ... }:

{
  # Enable Zsh
  programs.zsh.enable = true;
  
  # Set Zsh as the default shell for all users
  users.defaultUserShell = pkgs.zsh;
}
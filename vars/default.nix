{ lib, ... }:

{
  username = "curvature";
  hostname = "omen"; # This needs to match your folder name in 'hosts/'
  
  # You can add other global vars here if you want
  stateVersion = "25.11"; 
  isMinimal = false; # Example of a custom flag
}
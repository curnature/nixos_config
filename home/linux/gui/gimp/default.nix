{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # 1. The Main App
    gimp-with-plugins  # Installs GIMP + common plugins (resynthesizer, etc.)

    # 2. Other useful tools we discussed
    krita              # Modern painting/editing
    inkscape           # Vector
  ];

  # 3. PhotoGIMP Setup (The "Hack")
  # Since PhotoGIMP is just a config folder, we download it and link it.
  # Note: This is a bit advanced. If you prefer a simple GIMP, skip this part.
  
  # xdg.configFile."GIMP/2.10" = {
    # source = pkgs.fetchFromGitHub {
      # owner = "Diolinux";
      # repo = "PhotoGIMP";
      # rev = "3.0"; # Check github for latest release tag if needed https://github.com/Diolinux/PhotoGIMP/
      # sha256 = "sha256-R9MMidsR2+QFX6tu+j5k2BejxZ+RGwzA0DR9GheO89M="; # Will fail first time, then we fix it
    # } + "/.var/app/org.gimp.GIMP/config/GIMP/2.10";
    # recursive = true;
    # force = true; # Overwrite default GIMP configs
  # };
}

# 1. Back up existing config (just in case)
# mv ~/.config/GIMP/2.10 ~/.config/GIMP/2.10.bak

# 2. Download and extract PhotoGIMP
# wget https://github.com/Diolinux/PhotoGIMP/releases/download/1.0/PhotoGIMP.zip
# unzip PhotoGIMP.zip

# 3. Install it (Copying the specific config folder)
# mv 3.0 ~/.config/GIMP/2.10  

# 4. Cleanup
# rm PhotoGIMP.zip
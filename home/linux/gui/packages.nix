{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # --- INTERNET ---
    qbittorrent         # The uTorrent replacement (Qt6 based)
    clash-verge-rev     # The Proxy/VPN tool (Works with Clash subscriptions)

    # --- OFFICE ---
    wpsoffice           # The "Microsoft Office" clone
    
    # --- FONTS ---
    symbola           # You already have this (Good backup)
    corefonts         # Installs Webdings, Arial, Times New Roman, etc.
    vista-fonts        # Installs Calibri, Cambria, Consolas (Fixes "weird looking" Word docs)        

    # --- PDF TOOLS ---
    kdePackages.okular  # The best PDF reader (Qt6 version)
    pdfarranger         # Tool to merge, split, and rotate PDF pages
  ];
}
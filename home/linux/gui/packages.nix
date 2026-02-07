{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # --- INTERNET ---
    qbittorrent         # The uTorrent replacement (Qt6 based)
    clash-verge-rev 
    v2rayn    # The Proxy/VPN tool (Works with Clash subscriptions)

    # --- OFFICE ---
    wpsoffice           # The "Microsoft Office" clone
    


    # --- PDF TOOLS ---
    kdePackages.okular  # The best PDF reader (Qt6 version)
    pdfarranger         # Tool to merge, split, and rotate PDF pages
  ];
}
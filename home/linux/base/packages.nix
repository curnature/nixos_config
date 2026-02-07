{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # --- FONTS ---
    symbola           # You already have this (Good backup)
    corefonts         # Installs Webdings, Arial, Times New Roman, etc.
    vista-fonts        # Installs Calibri, Cambria, Consolas (Fixes "weird looking" Word docs)        
    # SC
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
  ];
}
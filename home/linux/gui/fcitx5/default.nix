{ config, pkgs, ... }:

{
    catppuccin.fcitx5.enable = true;
    i18n.inputMethod = {
        enable = true;
        type = "fcitx5";
        fcitx5.waylandFrontend = true;

        fcitx5.addons = with pkgs; [
            qt6Packages.fcitx5-configtool # GUI for fcitx5
            # 1. The Core Languages
            qt6Packages.fcitx5-chinese-addons  # For Chinese Pinyin (standard)
            # fcitx5-rime # for flypy chinese input method
            # Japanese
            # ctrl-i / F7 - convert to takakana
            # ctrl-u / F6 - convert to hiragana
            fcitx5-mozc          # Uncomment if you need Japanese

            # 2. The Look & Feel
            fcitx5-gtk             # Crucial for compatibility with GTK apps
            libsForQt5.fcitx5-qt   # Crucial for Qt5 apps
            kdePackages.fcitx5-qt  # <--- NEW: For Qt6 (Niri, Noctalia, Plasma 6)
        ];

        # This automatically creates ~/.config/fcitx5/profile and config
        fcitx5.settings = {
           # --- A. Input Method List (Profile) ---
        inputMethod = {
          "Groups/0" = {
            "Name" = "Default";
            "Default Layout" = "us";
            "DefaultIM" = "keyboard-us";
          };
          "Groups/0/Items/0" = { "Name" = "keyboard-us"; "Layout" = ""; };
          "Groups/0/Items/1" = { "Name" = "pinyin";      "Layout" = ""; };
          "Groups/0/Items/2" = { "Name" = "mozc";        "Layout" = ""; };
          "GroupOrder" = { "0" = "Default"; };
        };

        # --- B. Global Options (Config) ---
        globalOptions = {
          # 1. Standard Options (Simple strings/bools go here)
          "Hotkey" = {
            EnumerateWithTriggerKeys = false;
            EnumerateSkipFirst = false;
          };

          # 2. Array Options (MUST be their own sections!)
          "Hotkey/ToggleInputMethod" = {
            "0" = "Control+Space";
          };

          "Hotkey/EnumerateForwardKeys" = {
            "0" = "Alt+Shift_R";
          };

          "Hotkey/EnumerateBackwardKeys" = {
            "0" = "Alt+Shift_L";
          };
          
          Behavior = {
            ActiveByDefault = false;
            ShareInputState = "All";
            DefaultPageSize = 9;
            PreeditEnabledByDefault = true;
          }; 
        }; 

        };
        
    };

    # Optional: Force Fcitx5 to be the default for everything
    home.sessionVariables = {
        GTK_IM_MODULE = "fcitx";
        QT_IM_MODULE = "fcitx";
        XMODIFIERS = "@im=fcitx";
        SDL_IM_MODULE = "fcitx"; # Helps with some games
    };
    
    

    
}
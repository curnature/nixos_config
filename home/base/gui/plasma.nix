{ pkgs, ... }:
{
  # Enable the Plasma Manager
  programs.plasma = {
    enable = true;

    # 1. The Theme
    workspace = {
      clickItemTo = "select"; # Single click select, double click open
      lookAndFeel = "Catppuccin-Mocha-Lavender";
      colorScheme = "CatppuccinMochaLavender"; 
      cursor = {
          cursorFeedback = "Bouncing";
          size = 24;
          taskManagerFeedback = true;
          theme = "catppuccin-mocha-lavender-cursors";
      };
      iconTheme = "Papirus-Dark";
      
      # Set your wallpaper automatically!
      wallpaper = "${../../../wallpapers/plana_bg4_2560_1440.png}"; 
    };

    # 2. Panels (The Taskbar)
    # This replaces your bottom panel with a declaratively defined one
    panels = [
      {
        location = "bottom";
        height = 44;
        widgets = [
          "org.kde.plasma.kickoff"          # Start Menu
          "org.kde.plasma.pager"            # Workspaces
          "org.kde.plasma.icontasks"        # Taskbar
          "org.kde.plasma.marginsseparator" # Spacer
          "org.kde.plasma.systemtray"       # Tray Icons
          "org.kde.plasma.digitalclock"     # Clock
        ];
      }
    ];
    
    # ADD THIS: The "Plasma Manager Way" to force NumLock
    # This replaces the old manual file we made earlier.
    configFile = {
      "kcminputrc"."Keyboard"."NumLock" = 0;
    };
    
    # 3. Window Rules (Optional)
    # Example: Always open Kitty transparently? 
    # (You usually do this in Kitty config, but KWin can force it too)
  };
}

{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # 1. ProtonUp-Qt: The Compatibility Manager
    # Essential for installing "GE-Proton" (GloriousEggroll).
    # This fixes 99% of games that don't run on standard Steam Proton.
    protonup-qt

    # 2. MangoHud: The Overlay
    # Shows FPS, CPU/GPU temps, and usage on top of games.
    mangohud

    # 3. Lutris / Heroic: The "Other" Stores (Optional)
    # lutris        # Good for old GOG/Itch.io games
    # heroic        # Great open-source client for Epic Games Store
    
    # 4. Steam-Run: The Magic Tool
    # Allows you to run generic linux binaries (that expect Ubuntu/Debian libs)
    # Usage: steam-run ./my-game-binary
    # (Usually included with Steam, but good to have explicit)
  ];

  # Optional: Default configuration for MangoHud
  programs.mangohud = {
    enable = true;
    settings = {
      full = true;
      # no_display = true; # Hide by default (toggle with Shift+F12)
      cpu_temp = true;
      gpu_temp = true;
      ram = true;
      vram = true;
    };
  };
}
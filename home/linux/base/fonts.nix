{ ... }:

{
  

  # 2. Configure Defaults
  fonts.fontconfig = {
    enable = true;

    defaultFonts = {
      # NOTE: We add "SC" (Simplified Chinese) to ensure it doesn't 
      # default to the Japanese (Kanji) variant of the characters.
      
      sansSerif = [ 
        "Noto Sans CJK SC" 
        "Noto Sans" 
      ];
      
      serif = [ 
        "Noto Serif CJK SC" 
        "Noto Serif" 
      ];
      
      monospace = [ 
        "CommitMono Nerd Font" 
        "Noto Sans Mono CJK SC" 
      ];
      
      emoji = [ "Noto Color Emoji" ];
    };
  };
}
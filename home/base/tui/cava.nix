{ ... }:

{
    programs.cava = {
        enable = true;
        settings = {
            general = {
            # Lock the framerate to match your Wayland compositor for buttery smooth rendering
            framerate = 60; 
      
            # '0' lets Cava automatically calculate how many bars fit in your Kitty window
            bars = 0; 
            bar_width = 2;
            bar_spacing = 1;
            };
    
            color = {
            gradient = 1;
            gradient_count = 6;
      
            # A beautiful Catppuccin gradient (from Blue up to Pink/Red)
            gradient_color_5 = "#89b4fa"; # Blue (Low frequencies)
            gradient_color_6 = "#cba6f7"; # Mauve
            gradient_color_4 = "#f5c2e7"; # Pink
            gradient_color_2 = "#fab387"; # Peach
            gradient_color_3 = "#f9e2af"; # Yellow
            gradient_color_1 = "#f38ba8"; # Red (High peaks)
            };
    
            smoothing = {
            # The "Monstercat" algorithm drastically improves the rendering curve
            # It ties the bars together so they flow like a wave rather than jumping randomly
            monstercat = 1;
            waves = 1;
      
            # Adjusts the visual "gravity" of the bars falling down
            gravity = 100;
      
            # Cuts out background static from your microphone or audio daemon
            noise_reduction = 77; 
            };
        };
    }; 
}
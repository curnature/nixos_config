{ pkgs, ... }:

{
  programs.mpv = {
    enable = true;
    
    # "PotPlayer" style configuration
    config = {
      # Use GPU decoding (smooth playback)
      hwdec = "auto"; 
      
      # Start in "floating" mode with no massive window borders
      border = "no"; 
      
      # Keep the player open after the video ends (PotPlayer behavior)
      keep-open = "yes"; 
      
      # Saves position on quit
      save-position-on-quit = "yes";
      
      # On Screen Controller (the playback bar at bottom)
      osc = "yes";
    };
    
    # Install scripts to make it smarter
    scripts = [ 
      pkgs.mpvScripts.mpris       # Allows keyboard media keys (Play/Pause) to work
      pkgs.mpvScripts.uosc        # (Optional) Makes the UI look modern/minimal
      pkgs.mpvScripts.thumbfast   # (Optional) Shows preview thumbnails on seekbar
    ];
  };
}
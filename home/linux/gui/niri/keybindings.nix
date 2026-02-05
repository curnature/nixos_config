{ config, pkgs, ... }:

{
  programs.niri.settings.binds = {
    # --- 1. System & Apps ---
    "Ctrl+Alt+Delete".action.quit = {};
    "Mod+Q".action.close-window = {};
    "Mod+Shift+P".action.power-off-monitors = {};
    # "Mod+K".action.spawn = "kitty";
   
    # "Panic Button" to fix stuck apps
    "Mod+Escape".action.toggle-keyboard-shortcuts-inhibit = {}; 

    # --- 2. Noctalia Integration ---
    # "Mod+D".action.spawn = ["noctalia-shell" "ipc" "call" "launcher" "toggle"];
    "Mod+Space".action.spawn = ["noctalia-shell" "ipc" "call" "launcher" "toggle"];
    # "XF86Search".action.spawn = ["noctalia-shell" "ipc" "call" "launcher" "toggle"];
    
    "Mod+S".action.spawn = ["noctalia-shell" "ipc" "call" "controlCenter" "toggle"];
    "Mod+E".action.spawn = ["noctalia-shell" "ipc" "call" "sessionMenu" "toggle"];
    "Mod+Shift+V".action.spawn = ["noctalia-shell" "ipc" "call" "launcher" "clipboard"];
    # "Mod+C".action.spawn = ["noctalia-shell" "ipc" "call" "launcher" "calculator"];

    # --- 3. Window Focus (Arrow Keys & HJKL) ---
    "Mod+Left".action.focus-column-left = {};
    "Mod+Down".action.focus-window-down = {};
    "Mod+Up".action.focus-window-up = {};
    "Mod+Right".action.focus-column-right = {};
    
    "Mod+H".action.focus-column-left = {};
    "Mod+J".action.focus-window-down = {};
    "Mod+K".action.focus-window-up = {};
    "Mod+L".action.focus-column-right = {};

    "Mod+Home".action.focus-column-first = {};
    "Mod+End".action.focus-column-last = {};

    # --- 4. Window Movement (Ctrl + Arrow/HJKL) ---
    "Mod+Ctrl+Left".action.move-column-left = {};
    "Mod+Ctrl+Down".action.move-window-down = {};
    "Mod+Ctrl+Up".action.move-window-up = {};
    "Mod+Ctrl+Right".action.move-column-right = {};
    
    "Mod+Ctrl+H".action.move-column-left = {};
    "Mod+Ctrl+J".action.move-window-down = {};
    "Mod+Ctrl+K".action.move-window-up = {};
    "Mod+Ctrl+L".action.move-column-right = {};

    "Mod+Ctrl+Home".action.move-column-to-first = {};
    "Mod+Ctrl+End".action.move-column-to-last = {};

    # --- 5. Monitor Navigation (Shift) ---
    "Mod+Shift+Left".action.focus-monitor-left = {};
    "Mod+Shift+Down".action.focus-monitor-down = {};
    "Mod+Shift+Up".action.focus-monitor-up = {};
    "Mod+Shift+Right".action.focus-monitor-right = {};
    
    "Mod+Shift+H".action.focus-monitor-left = {};
    "Mod+Shift+J".action.focus-monitor-down = {};
    "Mod+Shift+K".action.focus-monitor-up = {};
    "Mod+Shift+L".action.focus-monitor-right = {};

    # Move Column to Monitor (Shift + Ctrl)
    "Mod+Shift+Ctrl+Left".action.move-column-to-monitor-left = {};
    "Mod+Shift+Ctrl+Down".action.move-column-to-monitor-down = {};
    "Mod+Shift+Ctrl+Up".action.move-column-to-monitor-up = {};
    "Mod+Shift+Ctrl+Right".action.move-column-to-monitor-right = {};
    
    "Mod+Shift+Ctrl+H".action.move-column-to-monitor-left = {};
    "Mod+Shift+Ctrl+J".action.move-column-to-monitor-down = {};
    "Mod+Shift+Ctrl+K".action.move-column-to-monitor-up = {};
    "Mod+Shift+Ctrl+L".action.move-column-to-monitor-right = {};

    # --- 6. Workspace Navigation ---
    "Mod+Page_Down".action.focus-workspace-down = {};
    "Mod+Page_Up".action.focus-workspace-up = {};
    "Mod+U".action.focus-workspace-down = {};
    "Mod+I".action.focus-workspace-up = {};
    
    "Mod+Ctrl+Page_Down".action.move-column-to-workspace-down = {};
    "Mod+Ctrl+Page_Up".action.move-column-to-workspace-up = {};
    "Mod+Ctrl+U".action.move-column-to-workspace-down = {};
    "Mod+Ctrl+I".action.move-column-to-workspace-up = {};
    
    "Mod+Shift+Page_Down".action.move-workspace-down = {};
    "Mod+Shift+Page_Up".action.move-workspace-up = {};
    "Mod+Shift+U".action.move-workspace-down = {};
    "Mod+Shift+I".action.move-workspace-up = {};

    # --- 7. Named Workspaces (Matches Window Rules) ---
    "Mod+1".action.focus-workspace = "1terminal";
    "Mod+2".action.focus-workspace = "2browser";
    "Mod+3".action.focus-workspace = "3chat";
    "Mod+4".action.focus-workspace = "4music";
    "Mod+5".action.focus-workspace = "5mail";
    "Mod+6".action.focus-workspace = "6file";
    "Mod+7".action.focus-workspace = 7;
    "Mod+8".action.focus-workspace = 8;
    "Mod+9".action.focus-workspace = 9;
    "Mod+0".action.focus-workspace = "0other";

    "Mod+Ctrl+1".action.move-column-to-workspace = "1terminal";
    "Mod+Ctrl+2".action.move-column-to-workspace = "2browser";
    "Mod+Ctrl+3".action.move-column-to-workspace = "3chat";
    "Mod+Ctrl+4".action.move-column-to-workspace = "4music";
    "Mod+Ctrl+5".action.move-column-to-workspace = "5mail";
    "Mod+Ctrl+6".action.move-column-to-workspace = "6file";
    "Mod+Ctrl+7".action.move-column-to-workspace = 7;
    "Mod+Ctrl+8".action.move-column-to-workspace = 8;
    "Mod+Ctrl+9".action.move-column-to-workspace = 9;
    "Mod+Ctrl+0".action.move-column-to-workspace = "0other";

    # --- 8. Column Layout Operations ---
    "Mod+BracketLeft".action.consume-or-expel-window-left = {};
    "Mod+BracketRight".action.consume-or-expel-window-right = {};
    "Mod+Comma".action.consume-window-into-column = {};
    "Mod+Period".action.expel-window-from-column = {};

    "Mod+R".action.switch-preset-column-width = {};
    "Mod+Shift+R".action.switch-preset-window-height = {};
    "Mod+Ctrl+R".action.reset-window-height = {};
    "Mod+F".action.maximize-column = {};
    "Mod+Shift+F".action.fullscreen-window = {};
    "Mod+Ctrl+F".action.expand-column-to-available-width = {};
    "Mod+Ctrl+C".action.center-visible-columns = {};

    # Fine Adjustments
    "Mod+Minus".action.set-column-width = "-10%";
    "Mod+Equal".action.set-column-width = "+10%";
    "Mod+Shift+Minus".action.set-window-height = "-10%";
    "Mod+Shift+Equal".action.set-window-height = "+10%";

    # Window States
    "Mod+V".action.toggle-window-floating = {};
    "Mod+W".action.toggle-column-tabbed-display = {};

    # --- 9. Screenshots ---
    # Select Region to Clipboard (Mod + Shift + S)
    # Uses slurp to select an area, passes geometry to grim, then to clipboard
    "Ctrl+Print".action.screenshot = {};
    "Print".action.screenshot-screen = {};
    "Ctrl+Alt+A".action.screenshot-window = {};

    # --- 10. Volume & Brightness (Via Noctalia) ---
    # "XF86AudioRaiseVolume".action.spawn = ["noctalia-shell" "ipc" "call" "volume" "increase"];
    # "XF86AudioLowerVolume".action.spawn = ["noctalia-shell" "ipc" "call" "volume" "decrease"];
    # "XF86AudioMute".action.spawn = ["noctalia-shell" "ipc" "call" "volume" "muteOutput"];
    # "XF86AudioMicMute".action.spawn = ["noctalia-shell" "ipc" "call" "volume" "muteInput"];
    
    # "XF86MonBrightnessUp".action.spawn = ["noctalia-shell" "ipc" "call" "brightness" "increase"];
    # "XF86MonBrightnessDown".action.spawn = ["noctalia-shell" "ipc" "call" "brightness" "decrease"];
  };
}
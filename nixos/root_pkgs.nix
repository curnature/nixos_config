{ pkgs, ... }:

{
    # Allow unfree packages (Required for Nvidia, Steam, Chrome, etc.)
    nixpkgs.config.allowUnfree = true;

    # Install Firefox system-wide
    programs.firefox.enable = true;

    # List packages installed in system profile.
    environment.systemPackages = with pkgs; [
        # Core Tools
        nano
        vim
        
        wget
        git
        
        file
        tree
        lshw

        # --- AUTHENTICATION ---
        # Needed so apps can ask for "Sudo" password graphically
        kdePackages.polkit-kde-agent-1

        lm_sensors

        # You can add other Linux-only CLI tools here later, like:
        pciutils   # lspci
        usbutils   # lsusb
        powertop   # Power analysis

        # --- UTILITIES ---
        udiskie          # Auto-mounts USB sticks (Optional, good if you use USBs often)
        bluez  # Adds 'bluetoothctl' command

        # Management
        home-manager
    ];

    # Define Fonts System-Wide
    fonts.packages = with pkgs; [
        nerd-fonts.commit-mono
        nerd-fonts.cousine
    ];
}
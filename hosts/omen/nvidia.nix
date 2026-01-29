{ config, ... }:

{
  # Enable OpenGL
  hardware.graphics = {
    enable = true;
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    # Modesetting is required.
    modesetting.enable = true;

    # Power management settings
    powerManagement.enable = false;
    powerManagement.finegrained = false;

    # Use the NVidia open source kernel module (set to false for maximum stability)
    open = false;

    # Enable the Nvidia settings menu
    nvidiaSettings = true;

    # Select the driver version
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    # Nvidia Prime (Optimus) Configuration
    prime = {
      # Sync Mode (High Performance, High Power Usage)
      # Great for gaming, bad for battery life.
      sync.enable = true;
      
      # Offload Mode (Power Saving)
      # offload = {
      #   enable = true;
      #   enableOffloadCmd = true;
      # };

      # Hardware Specific Bus IDs (Check with `lshw -c display`)
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
}
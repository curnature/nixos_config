{ pkgs, ... }:
{
  home.packages = with pkgs; [
    lm_sensors
    # You can add other Linux-only CLI tools here later, like:
    pciutils   # lspci
    usbutils   # lsusb
    powertop   # Power analysis
  ];
}
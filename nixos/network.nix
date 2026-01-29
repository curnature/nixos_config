{ pkgs, ... }:

{
    # Enable networking
    networking.networkmanager.enable = true;

    # Enable dbus (Required for many system services)
    services.dbus.enable = true;

    # Enable dconf (Required for saving settings in many GTK apps)
    programs.dconf.enable = true;

    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];

    # Or disable the firewall altogether.
    # networking.firewall.enable = false;
}
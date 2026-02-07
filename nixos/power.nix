{ pkgs, ... }:

{
    # 1. Power Profiles Daemon (The "Performance/Saver" slider)
    services.power-profiles-daemon.enable = true;

    # 2. UPower (The Battery percentage reader)
    services.upower.enable = true;
}
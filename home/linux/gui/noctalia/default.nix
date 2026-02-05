{ inputs, pkgs, config, lib, ... }:

{
    imports = [
        inputs.noctalia.homeModules.default
        ./bar.nix
        ./theme.nix
        ./interaction.nix
        ./system.nix
    ];

    home.packages = [ 
        pkgs.qt6Packages.qt6ct 
    ];

    xdg.configFile."qt6ct/qt6ct.conf".source = ./qt6ct.conf; 

    programs.noctalia-shell = {
        enable = true;
        # settingsVersion = 0;
        # We don't put 'settings' here anymore; 
        # they are merged from the other files!
    };

    # We inject this variable specifically into the systemd service.
    systemd.user.services.noctalia-shell.Service.Environment = lib.mkForce [
        "QT_QPA_PLATFORMTHEME=qt6ct"
        # Optional: Fixes scaling if icons look tiny/huge
        # "QT_AUTO_SCREEN_SCALE_FACTOR=1" 
    ];
}
# Outdated v4 arguments: pkgs/config/lib were only used by the removed Qt and
# systemd overrides below. Restore this signature together with those settings.
# { inputs, pkgs, config, lib, ... }:
{ inputs, ... }:

{
    imports = [
        inputs.noctalia.homeModules.default
        ./bar.nix
        ./theme.nix
        ./interaction.nix
        ./system.nix
    ];

    # Outdated: Noctalia v4 was Qt/Quickshell based. Noctalia v5 is native and
    # does not read qt6ct, so restore these only when rolling back to v4.
    # home.packages = [
    #     pkgs.qt6Packages.qt6ct
    # ];
    # xdg.configFile."qt6ct/qt6ct.conf".source = ./qt6ct.conf;

    programs.noctalia = {
        enable = true;

        # Niri is the sole launch owner through spawn-at-startup. Enabling the
        # user service as well would start a second competing shell process.
        systemd.enable = false;

        # Keep Noctalia's build-time TOML validator enabled for every rebuild.
        checkConfig = true;

        # Outdated v4-only option; v5 configuration is validated TOML.
        # settingsVersion = 0;
    };

    # Outdated v4 Qt service override. Restore only with the Qt-based v4 shell
    # and remove the Niri spawn-at-startup entry first to keep one launch owner.
    # systemd.user.services.noctalia.Service.Environment = lib.mkForce [
    #     "QT_QPA_PLATFORMTHEME=qt6ct"
    #     # Optional: Fixes scaling if icons look tiny/huge
    #     # "QT_AUTO_SCREEN_SCALE_FACTOR=1"
    # ];
}

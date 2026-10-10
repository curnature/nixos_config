{ inputs, pkgs, ... }:

{
    # Framework 13 Pro only: hosts/fw13p/default.nix imports this module.
    # Previous selection: stock Linux 7.2 (currently 7.2.9), not the CachyOS
    # ThinLTO variant requested for the initial Framework suspend test.
    # boot.kernelPackages = pkgs.linuxPackages_7_2;

    # Despite "latest" in the attribute name, the immutable flake input pins
    # this to 7.2.8-cachyos-lto. Keep its matching kernel-module package set.
    # The reported sleep improvement is one user's result, not a guarantee.
    # Review the pin explicitly for later security/stability updates.
    # https://www.reddit.com/r/framework/comments/1wzxwl3/framework_13_pro_poor_sleep_and_browsing_battery/
    boot.kernelPackages =
        inputs.nix-cachyos-kernel.legacyPackages.${pkgs.stdenv.hostPlatform.system}.linuxPackages-cachyos-latest-lto;
}

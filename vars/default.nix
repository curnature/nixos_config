{
    # -------------------------------------------------------------------------
    # Identity Information
    # -------------------------------------------------------------------------
    username = "curvature";
    userEmail = "curnature00@gmail.com";
    
    # -------------------------------------------------------------------------
    # System Defaults
    # -------------------------------------------------------------------------
    terminal = "kitty";
    editor = "vim";

    # -------------------------------------------------------------------------
    # Software Versions vs. Compatibility Baselines
    # -------------------------------------------------------------------------
    # 1. Nixpkgs is the collection of package recipes AND NixOS system modules.
    #    flake.nix selects a branch; flake.lock pins its exact revision. That
    #    snapshot supplies package versions such as Kitty, Mesa, and Linux.
    # 2. NixOS is the operating system built from those modules and our host
    #    configuration. Its reported version comes from the primary Nixpkgs
    #    snapshot, NOT from system.stateVersion.
    # 3. Home Manager is a separate project managing user packages and settings
    #    such as Zsh and Git. Its code version is pinned separately in flake.lock.
    #    We track its master branch and share the system's Nixpkgs package set.
    #
    # To update software, update the intended flake inputs, then build, test,
    # and switch. The state versions below are NOT software update targets.
    # They preserve compatibility defaults for existing settings and data;
    # changing them is a deliberate migration, not a routine version upgrade.

    # Outdated shared setting, retained for reference only. It incorrectly
    # coupled NixOS and Home Manager compatibility baselines and had been
    # advanced beyond the original setup. Do not restore or set it to "latest".
    # stateVersion = "26.05";

    # NixOS uses a separate system.stateVersion in each host's default.nix:
    # Omen keeps "25.11"; a fresh installation uses its installer-generated value.
    # See: https://wiki.nixos.org/wiki/FAQ/When_do_I_update_stateVersion

    # This maps to home.stateVersion in home/home.nix. Keep the established
    # "24.11" baseline even while Home Manager and installed packages advance.
    # Do not use "latest" or derive this from the current Home Manager release.
    # See: https://nix-community.github.io/home-manager/options.xhtml#opt-home.stateVersion
    homeStateVersion = "24.11";
}

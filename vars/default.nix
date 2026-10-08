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
    # Home Manager Versioning
    # -------------------------------------------------------------------------
    # Outdated: one shared state version incorrectly coupled NixOS migrations
    # to Home Manager migrations and had been advanced beyond the first install.
    # stateVersion = "26.05";

    # Keep this at the Home Manager release used for the original installation.
    # See: https://nix-community.github.io/home-manager/options.xhtml#opt-home.stateVersion
    homeStateVersion = "24.11";
}

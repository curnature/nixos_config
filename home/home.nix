{ vars, ... }:

{
    # Note: We DO NOT import ./base or ./linux here.
    # The "Profile" file (linux/gui.nix) handles the imports!

    home = {
        username = vars.username;
        homeDirectory = "/home/${vars.username}";
        stateVersion = vars.stateVersion;
    };

    # Let Home Manager manage itself
    programs.home-manager.enable = true;
}